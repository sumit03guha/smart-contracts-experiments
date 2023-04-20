
/// @use-src 0:"contracts/Counter.sol"
object "Counter_60" {
    code {
        /// @src 0:64:480  "contract Counter {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        constructor_Counter_60()

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("Counter_60_deployed"), datasize("Counter_60_deployed"))

        return(_1, datasize("Counter_60_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @src 0:64:480  "contract Counter {..."
        function constructor_Counter_60() {

            /// @src 0:64:480  "contract Counter {..."

        }
        /// @src 0:64:480  "contract Counter {..."

    }
    /// @use-src 0:"contracts/Counter.sol"
    object "Counter_60_deployed" {
        code {
            /// @src 0:64:480  "contract Counter {..."
            mstore(64, memoryguard(128))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x31845f7d
                {
                    // setPublic(uint256)

                    external_fun_setPublic_23()
                }

                case 0x46bfc03b
                {
                    // setExternal(uint256)

                    external_fun_setExternal_13()
                }

                case 0x8381f58a
                {
                    // number()

                    external_fun_number_3()
                }

                case 0xa89edd59
                {
                    // loop2()

                    external_fun_loop2_59()
                }

                case 0xf5fb1bf8
                {
                    // loop1()

                    external_fun_loop1_41()
                }

                default {}
            }

            revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74()

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function allocate_unbounded() -> memPtr {
                memPtr := mload(64)
            }

            function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
                revert(0, 0)
            }

            function revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() {
                revert(0, 0)
            }

            function revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() {
                revert(0, 0)
            }

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function external_fun_setPublic_23() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                fun_setPublic_23(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_setExternal_13() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                fun_setExternal_13(param_0)
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

            }

            function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

            }

            function cleanup_from_storage_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

            }

            /// @ast-id 3
            /// @src 0:84:105  "uint256 public number"
            function getter_fun_number_3() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }
            /// @src 0:64:480  "contract Counter {..."

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            function external_fun_number_3() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                let ret_0 :=  getter_fun_number_3()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_loop2_59() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                fun_loop2_59()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function external_fun_loop1_41() {

                if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                abi_decode_tuple_(4, calldatasize())
                fun_loop1_41()
                let memPos := allocate_unbounded()
                let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                return(memPos, sub(memEnd, memPos))

            }

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                revert(0, 0)
            }

            function shift_left_0(value) -> newValue {
                newValue :=

                shl(0, value)

            }

            function update_byte_slice_32_shift_0(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function identity(value) -> ret {
                ret := value
            }

            function convert_t_uint256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_uint256(value)))
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

            /// @ast-id 13
            /// @src 0:122:193  "function setExternal(uint256 _number) external {..."
            function fun_setExternal_13(var__number_5) {

                /// @src 0:182:189  "_number"
                let _1 := var__number_5
                let expr_9 := _1
                /// @src 0:173:189  "number = _number"
                update_storage_value_offset_0t_uint256_to_t_uint256(0x00, expr_9)
                let expr_10 := expr_9

            }
            /// @src 0:64:480  "contract Counter {..."

            /// @ast-id 23
            /// @src 0:207:274  "function setPublic(uint256 _number) public {..."
            function fun_setPublic_23(var__number_15) {

                /// @src 0:263:270  "_number"
                let _2 := var__number_15
                let expr_19 := _2
                /// @src 0:254:270  "number = _number"
                update_storage_value_offset_0t_uint256_to_t_uint256(0x00, expr_19)
                let expr_20 := expr_19

            }
            /// @src 0:64:480  "contract Counter {..."

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

            function panic_error_0x11() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x11)
                revert(0, 0x24)
            }

            function increment_t_uint256(value) -> ret {
                value := cleanup_t_uint256(value)
                if eq(value, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) { panic_error_0x11() }
                ret := add(value, 1)
            }

            function cleanup_t_rational_10_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_10_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_10_by_1(value)))
            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

            }

            /// @ast-id 41
            /// @src 0:298:376  "function loop1() public {..."
            function fun_loop1_41() {

                /// @src 0:326:373  "for (uint256 i; i < 10; i++) {..."
                for {
                    /// @src 0:331:340  "uint256 i"
                    let var_i_27
                    let zero_t_uint256_3 := zero_value_for_split_t_uint256()
                    var_i_27 := zero_t_uint256_3
                    } 1 {
                    /// @src 0:350:353  "i++"
                    let _5 := var_i_27
                    let _4 := increment_t_uint256(_5)
                    var_i_27 := _4
                    let expr_33 := _5
                }
                {
                    /// @src 0:342:343  "i"
                    let _6 := var_i_27
                    let expr_29 := _6
                    /// @src 0:346:348  "10"
                    let expr_30 := 0x0a
                    /// @src 0:342:348  "i < 10"
                    let expr_31 := lt(cleanup_t_uint256(expr_29), convert_t_rational_10_by_1_to_t_uint256(expr_30))
                    if iszero(expr_31) { break }
                    /// @src 0:360:368  "number++"
                    let _8 := read_from_storage_split_offset_0_t_uint256(0x00)
                    let _7 := increment_t_uint256(_8)
                    update_storage_value_offset_0t_uint256_to_t_uint256(0x00, _7)
                    let expr_36 := _8
                }

            }
            /// @src 0:64:480  "contract Counter {..."

            /// @ast-id 59
            /// @src 0:400:478  "function loop2() public {..."
            function fun_loop2_59() {

                /// @src 0:428:475  "for (uint256 i; i < 10; ++i) {..."
                for {
                    /// @src 0:433:442  "uint256 i"
                    let var_i_45
                    let zero_t_uint256_9 := zero_value_for_split_t_uint256()
                    var_i_45 := zero_t_uint256_9
                    } 1 {
                    /// @src 0:452:455  "++i"
                    let _11 := var_i_45
                    let _10 := increment_t_uint256(_11)
                    var_i_45 := _10
                    let expr_51 := _10
                }
                {
                    /// @src 0:444:445  "i"
                    let _12 := var_i_45
                    let expr_47 := _12
                    /// @src 0:448:450  "10"
                    let expr_48 := 0x0a
                    /// @src 0:444:450  "i < 10"
                    let expr_49 := lt(cleanup_t_uint256(expr_47), convert_t_rational_10_by_1_to_t_uint256(expr_48))
                    if iszero(expr_49) { break }
                    /// @src 0:462:470  "number++"
                    let _14 := read_from_storage_split_offset_0_t_uint256(0x00)
                    let _13 := increment_t_uint256(_14)
                    update_storage_value_offset_0t_uint256_to_t_uint256(0x00, _13)
                    let expr_54 := _14
                }

            }
            /// @src 0:64:480  "contract Counter {..."

        }

        data ".metadata" hex"a264697066735822122039216566a4a4118d3ad904b2db7e88be66917829c6de8b89032dfbd41fd7edc064736f6c63430008130033"
    }

}

