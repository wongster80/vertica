for i in `/opt/vertica/bin/vsql -At  -c "Select get_node_dependencies();" | grep 'cnt\: 1$\|cnt\: 2$\|cnd\: 3$' | cut -d' ' -f1`; do /opt/vertica/bin/vsql -At -c "Select get_node_dependencies('${i}');" >> low_projection_dependencies.out; done
