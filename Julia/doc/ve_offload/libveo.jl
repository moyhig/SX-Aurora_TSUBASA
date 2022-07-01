using CEnum

function veo_is_ve_addr(arg1)
    ccall((:veo_is_ve_addr, libveo), Cint, (Ptr{Cvoid},), arg1)
end

function veo_get_hmem_addr(arg1)
    ccall((:veo_get_hmem_addr, libveo), Ptr{Cvoid}, (Ptr{Cvoid},), arg1)
end

@cenum veo_context_state::UInt32 begin
    VEO_STATE_UNKNOWN = 0
    VEO_STATE_RUNNING = 1
    VEO_STATE_SYSCALL = 2
    VEO_STATE_BLOCKED = 3
    VEO_STATE_EXIT = 4
end

@cenum veo_command_state::UInt32 begin
    VEO_COMMAND_OK = 0
    VEO_COMMAND_EXCEPTION = 1
    VEO_COMMAND_ERROR = 2
    VEO_COMMAND_UNFINISHED = 3
end

@cenum veo_queue_state::UInt32 begin
    VEO_QUEUE_READY = 0
    VEO_QUEUE_CLOSED = 1
end

@cenum veo_args_intent::UInt32 begin
    VEO_INTENT_IN = 0
    VEO_INTENT_INOUT = 1
    VEO_INTENT_OUT = 2
end

mutable struct veo_args end

mutable struct veo_proc_handle end

mutable struct veo_thr_ctxt end

mutable struct veo_thr_ctxt_attr end

function veo_proc_create(arg1)
    ccall((:veo_proc_create, libveo), Ptr{veo_proc_handle}, (Cint,), arg1)
end

function veo_proc_create_static(arg1, arg2)
    ccall((:veo_proc_create_static, libveo), Ptr{veo_proc_handle}, (Cint, Ptr{Cchar}), arg1, arg2)
end

function veo_proc_destroy(arg1)
    ccall((:veo_proc_destroy, libveo), Cint, (Ptr{veo_proc_handle},), arg1)
end

function veo_proc_identifier(arg1)
    ccall((:veo_proc_identifier, libveo), Cint, (Ptr{veo_proc_handle},), arg1)
end

function veo_set_proc_identifier(addr, proc_ident)
    ccall((:veo_set_proc_identifier, libveo), Ptr{Cvoid}, (Ptr{Cvoid}, Cint), addr, proc_ident)
end

function veo_load_library(arg1, arg2)
    ccall((:veo_load_library, libveo), UInt64, (Ptr{veo_proc_handle}, Ptr{Cchar}), arg1, arg2)
end

function veo_unload_library(arg1, arg2)
    ccall((:veo_unload_library, libveo), Cint, (Ptr{veo_proc_handle}, UInt64), arg1, arg2)
end

function veo_get_sym(arg1, arg2, arg3)
    ccall((:veo_get_sym, libveo), UInt64, (Ptr{veo_proc_handle}, UInt64, Ptr{Cchar}), arg1, arg2, arg3)
end

function veo_alloc_mem(arg1, arg2, arg3)
    ccall((:veo_alloc_mem, libveo), Cint, (Ptr{veo_proc_handle}, Ptr{UInt64}, Csize_t), arg1, arg2, arg3)
end

function veo_free_mem(arg1, arg2)
    ccall((:veo_free_mem, libveo), Cint, (Ptr{veo_proc_handle}, UInt64), arg1, arg2)
end

function veo_read_mem(arg1, arg2, arg3, arg4)
    ccall((:veo_read_mem, libveo), Cint, (Ptr{veo_proc_handle}, Ptr{Cvoid}, UInt64, Csize_t), arg1, arg2, arg3, arg4)
end

function veo_write_mem(arg1, arg2, arg3, arg4)
    ccall((:veo_write_mem, libveo), Cint, (Ptr{veo_proc_handle}, UInt64, Ptr{Cvoid}, Csize_t), arg1, arg2, arg3, arg4)
end

function veo_num_contexts(arg1)
    ccall((:veo_num_contexts, libveo), Cint, (Ptr{veo_proc_handle},), arg1)
end

function veo_get_context(arg1, arg2)
    ccall((:veo_get_context, libveo), Ptr{veo_thr_ctxt}, (Ptr{veo_proc_handle}, Cint), arg1, arg2)
end

function veo_context_open(arg1)
    ccall((:veo_context_open, libveo), Ptr{veo_thr_ctxt}, (Ptr{veo_proc_handle},), arg1)
end

function veo_context_close(arg1)
    ccall((:veo_context_close, libveo), Cint, (Ptr{veo_thr_ctxt},), arg1)
end

function veo_get_context_state(arg1)
    ccall((:veo_get_context_state, libveo), Cint, (Ptr{veo_thr_ctxt},), arg1)
end

function veo_context_sync(arg1)
    ccall((:veo_context_sync, libveo), Cvoid, (Ptr{veo_thr_ctxt},), arg1)
end

function veo_args_alloc()
    ccall((:veo_args_alloc, libveo), Ptr{veo_args}, ())
end

function veo_args_set_i64(arg1, arg2, arg3)
    ccall((:veo_args_set_i64, libveo), Cint, (Ptr{veo_args}, Cint, Int64), arg1, arg2, arg3)
end

function veo_args_set_u64(arg1, arg2, arg3)
    ccall((:veo_args_set_u64, libveo), Cint, (Ptr{veo_args}, Cint, UInt64), arg1, arg2, arg3)
end

function veo_args_set_i32(arg1, arg2, arg3)
    ccall((:veo_args_set_i32, libveo), Cint, (Ptr{veo_args}, Cint, Int32), arg1, arg2, arg3)
end

function veo_args_set_u32(arg1, arg2, arg3)
    ccall((:veo_args_set_u32, libveo), Cint, (Ptr{veo_args}, Cint, UInt32), arg1, arg2, arg3)
end

function veo_args_set_i16(arg1, arg2, arg3)
    ccall((:veo_args_set_i16, libveo), Cint, (Ptr{veo_args}, Cint, Int16), arg1, arg2, arg3)
end

function veo_args_set_u16(arg1, arg2, arg3)
    ccall((:veo_args_set_u16, libveo), Cint, (Ptr{veo_args}, Cint, UInt16), arg1, arg2, arg3)
end

function veo_args_set_i8(arg1, arg2, arg3)
    ccall((:veo_args_set_i8, libveo), Cint, (Ptr{veo_args}, Cint, Int8), arg1, arg2, arg3)
end

function veo_args_set_u8(arg1, arg2, arg3)
    ccall((:veo_args_set_u8, libveo), Cint, (Ptr{veo_args}, Cint, UInt8), arg1, arg2, arg3)
end

function veo_args_set_double(arg1, arg2, arg3)
    ccall((:veo_args_set_double, libveo), Cint, (Ptr{veo_args}, Cint, Cdouble), arg1, arg2, arg3)
end

function veo_args_set_float(arg1, arg2, arg3)
    ccall((:veo_args_set_float, libveo), Cint, (Ptr{veo_args}, Cint, Cfloat), arg1, arg2, arg3)
end

function veo_args_set_stack(arg1, arg2, arg3, arg4, arg5)
    ccall((:veo_args_set_stack, libveo), Cint, (Ptr{veo_args}, veo_args_intent, Cint, Ptr{Cchar}, Csize_t), arg1, arg2, arg3, arg4, arg5)
end

function veo_args_clear(arg1)
    ccall((:veo_args_clear, libveo), Cvoid, (Ptr{veo_args},), arg1)
end

function veo_args_free(arg1)
    ccall((:veo_args_free, libveo), Cvoid, (Ptr{veo_args},), arg1)
end

function veo_call_sync(h, addr, ca, result)
    ccall((:veo_call_sync, libveo), Cint, (Ptr{veo_proc_handle}, UInt64, Ptr{veo_args}, Ptr{UInt64}), h, addr, ca, result)
end

function veo_call_async(arg1, arg2, arg3)
    ccall((:veo_call_async, libveo), UInt64, (Ptr{veo_thr_ctxt}, UInt64, Ptr{veo_args}), arg1, arg2, arg3)
end

function veo_call_async_by_name(arg1, arg2, arg3, arg4)
    ccall((:veo_call_async_by_name, libveo), UInt64, (Ptr{veo_thr_ctxt}, UInt64, Ptr{Cchar}, Ptr{veo_args}), arg1, arg2, arg3, arg4)
end

function veo_call_async_vh(arg1, arg2, arg3)
    ccall((:veo_call_async_vh, libveo), UInt64, (Ptr{veo_thr_ctxt}, Ptr{Cvoid}, Ptr{Cvoid}), arg1, arg2, arg3)
end

function veo_call_peek_result(arg1, arg2, arg3)
    ccall((:veo_call_peek_result, libveo), Cint, (Ptr{veo_thr_ctxt}, UInt64, Ptr{UInt64}), arg1, arg2, arg3)
end

function veo_call_wait_result(arg1, arg2, arg3)
    ccall((:veo_call_wait_result, libveo), Cint, (Ptr{veo_thr_ctxt}, UInt64, Ptr{UInt64}), arg1, arg2, arg3)
end

function veo_async_read_mem(arg1, arg2, arg3, arg4)
    ccall((:veo_async_read_mem, libveo), UInt64, (Ptr{veo_thr_ctxt}, Ptr{Cvoid}, UInt64, Csize_t), arg1, arg2, arg3, arg4)
end

function veo_async_write_mem(arg1, arg2, arg3, arg4)
    ccall((:veo_async_write_mem, libveo), UInt64, (Ptr{veo_thr_ctxt}, UInt64, Ptr{Cvoid}, Csize_t), arg1, arg2, arg3, arg4)
end

function veo_context_open_with_attr(arg1, arg2)
    ccall((:veo_context_open_with_attr, libveo), Ptr{veo_thr_ctxt}, (Ptr{veo_proc_handle}, Ptr{veo_thr_ctxt_attr}), arg1, arg2)
end

function veo_alloc_thr_ctxt_attr()
    ccall((:veo_alloc_thr_ctxt_attr, libveo), Ptr{veo_thr_ctxt_attr}, ())
end

function veo_free_thr_ctxt_attr(arg1)
    ccall((:veo_free_thr_ctxt_attr, libveo), Cint, (Ptr{veo_thr_ctxt_attr},), arg1)
end

function veo_set_thr_ctxt_stacksize(arg1, arg2)
    ccall((:veo_set_thr_ctxt_stacksize, libveo), Cint, (Ptr{veo_thr_ctxt_attr}, Csize_t), arg1, arg2)
end

function veo_get_thr_ctxt_stacksize(arg1, arg2)
    ccall((:veo_get_thr_ctxt_stacksize, libveo), Cint, (Ptr{veo_thr_ctxt_attr}, Ptr{Csize_t}), arg1, arg2)
end

function veo_version_string()
    ccall((:veo_version_string, libveo), Ptr{Cchar}, ())
end

function veo_api_version()
    ccall((:veo_api_version, libveo), Cint, ())
end

function veo_alloc_hmem(arg1, arg2, arg3)
    ccall((:veo_alloc_hmem, libveo), Cint, (Ptr{veo_proc_handle}, Ptr{Ptr{Cvoid}}, Csize_t), arg1, arg2, arg3)
end

function veo_free_hmem(arg1)
    ccall((:veo_free_hmem, libveo), Cint, (Ptr{Cvoid},), arg1)
end

function veo_hmemcpy(arg1, arg2, arg3)
    ccall((:veo_hmemcpy, libveo), Cint, (Ptr{Cvoid}, Ptr{Cvoid}, Csize_t), arg1, arg2, arg3)
end

function veo_args_set_hmem(arg1, arg2, arg3)
    ccall((:veo_args_set_hmem, libveo), Cint, (Ptr{veo_args}, Cint, Ptr{Cvoid}), arg1, arg2, arg3)
end

const VEO_API_VERSION = 12

const VEO_SYMNAME_LEN_MAX = 255

const VEO_LOG_CATEGORY = "veos.veo.veo"

const VEO_MAX_NUM_ARGS = 256

const VEO_REQUEST_ID_INVALID = ~(Culong(0))

const CMD_VEGDB = "/opt/nec/ve/bin/gdb"

const CMD_XTERM = "/usr/bin/xterm"

