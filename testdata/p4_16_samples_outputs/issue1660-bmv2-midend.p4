#include <core.p4>
#include <v1model.p4>

struct HasBool {
    bool x;
}

struct parsed_packet_t {
}

struct local_metadata_t {
}

parser parse(packet_in pk, out parsed_packet_t h, inout local_metadata_t local_metadata, inout standard_metadata_t standard_metadata) {
    state start {
        transition accept;
    }
}

control ingress(inout parsed_packet_t h, inout local_metadata_t local_metadata, inout standard_metadata_t standard_metadata) {
    HasBool b_0;
    @hidden action issue1660bmv2l21() {
        b_0.x = true;
        clone3<HasBool>(CloneType.I2E, 32w0, b_0);
    }
    @hidden table tbl_issue1660bmv2l21 {
        actions = {
            issue1660bmv2l21();
        }
        const default_action = issue1660bmv2l21();
    }
    apply {
        tbl_issue1660bmv2l21.apply();
    }
}

control egress(inout parsed_packet_t hdr, inout local_metadata_t local_metadata, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control deparser(packet_out b, in parsed_packet_t h) {
    apply {
    }
}

control verifyChecksum(inout parsed_packet_t hdr, inout local_metadata_t local_metadata) {
    apply {
    }
}

control compute_checksum(inout parsed_packet_t hdr, inout local_metadata_t local_metadata) {
    apply {
    }
}

V1Switch<parsed_packet_t, local_metadata_t>(parse(), verifyChecksum(), ingress(), egress(), compute_checksum(), deparser()) main;

