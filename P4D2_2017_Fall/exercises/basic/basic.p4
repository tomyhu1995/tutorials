/* -*- P4_16 -*- */
#include <core.p4>
#include <v1model.p4>

header {
    
}

parser MyParser(packet_in packet, out headers hdr, inout metadata meta, inout standard_metadata_t standard_metadata) {
    state start {
        /* TODO: add parser logic */
        transition accept;
    }
}

control MyVerifyChecksum(inout headers hdr, inout metadata meta) {   
    apply {  }
}

control MyIngress(inout headers hdr, inout metadata meta, inout standard_metadata_t standard_metadata) {
    action some_action{
    }
    
    table some_table {
        key = {
            match_key: match_type;
        }
        actions = {
            some;
	    actions;
        }
        size = 1024;
        default_action = NoAction();
    }
    
    apply {
        some_table.apply();
    }
}

control MyEgress(inout headers hdr, inout metadata meta, inout standard_metadata_t standard_metadata) {
    apply {  }
}

control MyComputeChecksum(inout headers hdr, inout metadata meta) {
     apply {
	
    }
}

control MyDeparser(packet_out packet, in headers hdr) {
    apply {
        /* TODO: add deparser logic */
    }
}

V1Switch(
MyParser(),
MyVerifyChecksum(),
MyIngress(),
MyEgress(),
MyComputeChecksum(),
MyDeparser()
) main;
