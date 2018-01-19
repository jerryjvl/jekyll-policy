require 'pathname'

module DocumentNav
    # This plugin generates hierarchical cross-linking between pages, identifying:
    # - page.parent: the page directly "above" in the hierarchy (see definition below)
    # - page.peers: list of pages "adjacent"
    # - page.children: list of pages direclty "below"
    # - page.descendants: list of pages nested any level "below"
    #
    # For a page to be a parent, its data file must sit alongside a directory of
    # the same name, excluding the extension; for example:
    #   /parent.md
    #   /parent/...other files ane paths below here...
    #
    # Furthermore, two pages have a parent-child relationship when the child page
    # is contained underneath the parent directory with no other eligible parents
    # inbetween; for example:
    #   /parent.md
    #   /parent/child-1.md
    #   /parent/xxx/child-2.md
    #   /parent/yyy.md
    #   /parent/yyy/not-a-child.md
    #
    # Both "child-1.md" and "child2.md" are children of "parent.md", but not
    # "not-a-child.md", because that page has a more direct parent "yyy.md".
    #
    # The list of descendants consists of all direct children of a page, plus the
    # children of those children, and so on all the way down to the bottom of the
    # page tree.
    #
    # The list of peers consists of all pages that share the same parent as the
    # current page. Sharing "not having a parent" doesn't make pages peers.

    class Generator < Jekyll::Generator
        def node_to_path(node)
            # return a full path that excludes extensions so it is easy to use to establish parentage
            File.split(File.realpath(node.path))[0] + File::SEPARATOR + File.basename(node.path, ".*") + File::SEPARATOR
        end

        def generate(site)
            node_basepath = Hash.new
            traversal = site.pages.sort_by { |page| page.path }

            last_node = nil
            above_node = []
            traversal.each do |node|
                # Make sure this node has all the lists so that the later logic to
                # populate them doesn't have to check if they already exist. Also
                # makes unconditional access in Liquid more convenient.
                node.data['children'] = Array.new
                node.data['descendants'] = Array.new
                node.data['peers'] = Array.new

                # adjust above_node based on where 'node' is relative to 'last_node'
                node_basepath[node] = node_to_path(node)
                unless last_node.nil? || !node_basepath[node].start_with?(node_basepath[last_node])
                    # current node is nested deeper than the last node, so consider it part of the parent hierarchy
                    above_node.push(last_node)
                end
                while above_node.length != 0 && !node_basepath[node].start_with?(node_basepath[above_node.last])
                    # last node in the parent hierarchy is deeper than the current node, so trim the hierarchy
                    completed_parent = above_node.pop

                    # now we can resolve the peers for all the children of this completed parent node
                    completed_parent.data['children'].each do |child|
                        child.data['peers'] = completed_parent.data['children'].select { |x| !x.equal?(child) }
                    end
                end

                unless above_node.last.nil?
                    node.data['parent'] = above_node.last
                    node.data['parent'].data['children'].push(node)
                end
                above_node.each do |above|
                    above.data['descendants'].push(node)
                end

                last_node = node
            end
        end
    end
end