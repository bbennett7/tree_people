# Environment -> The single file that bin/tree_people, or anything else that I'm
# loading, can require, and then THIS file will require all of ther dependencies


require_relative "./tree_people/version"
require_relative "./tree_people/cli"
