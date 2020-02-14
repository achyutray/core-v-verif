// Copyright 2020 OpenHW Group
// Copyright 2020 Datum Technology Corporation
// 
// Licensed under the Solderpad Hardware Licence, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     https://solderpad.org/licenses/
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


`ifndef __UVME_CV32_VSQR_SV__
`define __UVME_CV32_VSQR_SV__


/**
 * Component on which all CV32 virtual sequences are run.
 */
class uvme_cv32_vsqr_c extends uvm_sequencer#(
   .REQ(uvm_sequence_item),
   .RSP(uvm_sequence_item)
);
   
   // Objects
   uvme_cv32_cfg_c    cfg;
   uvme_cv32_cntxt_c  cntxt;
   
   // Sub-environments (virtual) sequencer handles
   uvme_${sub_env_name}_vsqr_c  ${sub_env_name}_vsequencer;
   
   // Sequencer handles
   uvma_debug_sqr_c  debug_sequencer;
   uvma_reset_sqr_c  reset_sequencer;
   // TODO Add sequencer handles
   
   
   `uvm_component_utils_begin(uvme_cv32_vsqr_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_cv32_sqr", uvm_component parent=null);
   
   /**
    * Ensures cfg & cntxt handles are not null.
    */
   extern virtual function void build_phase(uvm_phase phase);
   
endclass : uvme_cv32_vsqr_c


`pragma protect begin


function uvme_cv32_vsqr_c::new(string name="uvme_cv32_sqr", uvm_component parent=null);
   
   super.new(name, parent);
   
endfunction : new


function void uvme_cv32_vsqr_c::build_phase(uvm_phase phase);
   
   super.build_phase(phase);
   
   void'(uvm_config_db#(uvme_cv32_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("CFG", "Configuration handle is null")
   end
   
   void'(uvm_config_db#(uvme_cv32_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (!cntxt) begin
      `uvm_fatal("CNTXT", "Context handle is null")
   end
   
endfunction : build_phase


`pragma protect end


`endif // __UVME_CV32_VSQR_SV__