namespace
   ├──status
   ├    ├──compute_nodes
   ├    ├     ├──online
   ├    ├     ├     ├──${your_instance_ip_a}@${your_instance_port_x}
   ├    ├     ├     ├──${your_instance_ip_b}@${your_instance_port_y}
   ├    ├     ├     ├──....
   ├    ├     ├──circuit_breaker
   ├    ├     ├     ├──${your_instance_ip_c}@${your_instance_port_v}
   ├    ├     ├     ├──${your_instance_ip_d}@${your_instance_port_w}
   ├    ├     ├     ├──....
   ├    ├──storage_nodes
   ├    ├     ├──disable
   ├    ├     ├      ├──${schema_1.ds_0}
   ├    ├     ├      ├──${schema_1.ds_1}
   ├    ├     ├      ├──....
   ├    ├     ├──primary
   ├    ├     ├      ├──${schema_2.ds_0}
   ├    ├     ├      ├──${schema_2.ds_1}
   ├    ├     ├      ├──....
