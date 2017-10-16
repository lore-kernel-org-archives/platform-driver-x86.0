From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: [PATCH v4 00/12] Intel(R) SGX Driver
Date: Mon, 16 Oct 2017 22:18:43 +0300
Message-ID: <20171016191855.16964-1-jarkko.sakkinen@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: intel-sgx-kernel-dev@lists.01.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Intel(R) SGX is a set of CPU instructions that can be used by applications to
set aside private regions of code and data. The code outside the enclave is
disallowed to access the memory inside the enclave by the CPU access control.
In a way you can think that SGX provides inverted sandbox. It protects the
application from a malicious host.

There is a new hardware unit in the processor called Memory Encryption Engine
(MEE) starting from the Skylake microachitecture. BIOS can define one or many
MEE regions that can hold enclave data by configuring them with PRMRR registers.

The MEE automatically encrypts the data leaving the processor package to the MEE
regions. The data is encrypted using a random key whose life-time is exactly one
power cycle.

You can tell if your CPU supports SGX by looking into ``/proc/cpuinfo``:

	``cat /proc/cpuinfo  | grep ' sgx '``

The GIT repositoy for SGX driver resides in

	https://github.com/jsakkine-intel/linux-sgx.git

'le' branch contains the upstream candidate patches.

'master' branch contains the same patches with the following differences:

* top-level patch modifies the ioctl API to be SDK compatible
* does not use flexible launch control but instead relies on SDK provided
  Intel launch enclave.

'master' is just maintained to allow people to test the code.

v4:
* Tied life-cycle of the sgx_le_proxy process to /dev/sgx.
* Removed __exit annotation from sgx_drv_subsys_exit().
* Fixed a leak of a backing page in sgx_process_add_page_req() in the
  case when vm_insert_pfn() fails.
* Removed unused symbol exports for sgx_page_cache.c.
* Updated sgx_alloc_page() to require encl parameter and documented the
  behavior(Sean Christopherson).
* Refactored a more lean API for sgx_encl_find() and documented the behavior.
* Moved #PF handler to sgx_fault.c.
* Replaced subsys_system_register() with plain bus_register().
* Retry EINIT 2nd time only if MSRs are not locked.

v3:
* Check that FEATURE_CONTROL_LOCKED and FEATURE_CONTROL_SGX_ENABLE are set.
* Return -ERESTARTSYS in __sgx_encl_add_page() when sgx_alloc_page() fails.
* Use unused bits in epc_page->pa to store the bank number.
* Removed #ifdef for WQ_NONREENTRANT.
* If mmu_notifier_register() fails with -EINTR, return -ERESTARTSYS.
* Added --remove-section=.got.plt to objcopy flags in order to prevent a
  dummy .got.plt, which will cause an inconsistent size for the LE.
* Documented sgx_encl_* functions.
* Added remark about AES implementation used inside the LE.
* Removed redundant sgx_sys_exit() from le/main.c.
* Fixed struct sgx_secinfo alignment from 128 to 64 bytes.
* Validate miscselect in sgx_encl_create().
* Fixed SSA frame size calculation to take the misc region into account.
* Implemented consistent exception handling to __encls() and __encls_ret().
* Implemented a proper device model in order to allow sysfs attributes
  and in-kernel API.
* Cleaned up various "find enclave" implementations to the unified
  sgx_encl_find().
* Validate that vm_pgoff is zero.
* Discard backing pages with shmem_truncate_range() after EADD.
* Added missing EEXTEND operations to LE signing and launch.
* Fixed SSA size for GPRS region from 168 to 184 bytes.
* Fixed the checks for TCS flags. Now DBGOPTIN is allowed.
* Check that TCS addresses are in ELRANGE and not just page aligned.
* Require kernel to be compiled with X64_64 and CPU_SUP_INTEL.
* Fixed an incorrect value for SGX_ATTR_DEBUG from 0x01 to 0x02.

v2:
* get_rand_uint32() changed the value of the pointer instead of value
  where it is pointing at.
* Launch enclave incorrectly used sigstruct attributes-field instead of
  enclave attributes-field.
* Removed unused struct sgx_add_page_req from sgx_ioctl.c
* Removed unused sgx_has_sgx2.
* Updated arch/x86/include/asm/sgx.h so that it provides stub
  implementations when sgx in not enabled.
* Removed cruft rdmsr-calls from sgx_set_pubkeyhash_msrs().
* return -ENOMEM in sgx_alloc_page() when VA pages consume too much space
* removed unused global sgx_nr_pids
* moved sgx_encl_release to sgx_encl.c
* return -ERESTARTSYS instead of -EINTR in sgx_encl_init()

Haim Cohen (1):
  x86: add SGX MSRs to msr-index.h

Jarkko Sakkinen (9):
  intel_sgx: updated MAINTAINERS
  x86: define the feature control MSR's SGX launch control bit
  fs/pipe.c: export create_pipe_files() and replace_fd()
  intel_sgx: driver for Intel Software Guard Extensions
  intel_sgx: ptrace() support
  intel_sgx: driver documentation
  intel_sgx: in-kernel launch enclave
  intel_sgx: glue code for in-kernel LE
  intel_sgx: update IA32_SGXLEPUBKEYHASH* MSRs

Kai Huang (1):
  x86: add SGX definition to cpufeature

Sean Christopherson (1):
  x86: define the feature control MSR's SGX enable bit

 Documentation/index.rst                            |    1 +
 Documentation/x86/intel_sgx.rst                    |  131 +++
 MAINTAINERS                                        |    5 +
 arch/x86/include/asm/cpufeatures.h                 |    2 +
 arch/x86/include/asm/msr-index.h                   |    8 +
 arch/x86/include/asm/sgx.h                         |  233 +++++
 arch/x86/include/asm/sgx_arch.h                    |  268 ++++++
 arch/x86/include/uapi/asm/sgx.h                    |  147 +++
 drivers/platform/x86/Kconfig                       |    2 +
 drivers/platform/x86/Makefile                      |    1 +
 drivers/platform/x86/intel_sgx/Kconfig             |   34 +
 drivers/platform/x86/intel_sgx/Makefile            |   32 +
 drivers/platform/x86/intel_sgx/le/Makefile         |   26 +
 drivers/platform/x86/intel_sgx/le/enclave/Makefile |   46 +
 .../x86/intel_sgx/le/enclave/aes_encrypt.c         |  191 ++++
 .../platform/x86/intel_sgx/le/enclave/cmac_mode.c  |  254 +++++
 .../x86/intel_sgx/le/enclave/encl_bootstrap.S      |  163 ++++
 .../intel_sgx/le/enclave/include/tinycrypt/aes.h   |  133 +++
 .../le/enclave/include/tinycrypt/cmac_mode.h       |  194 ++++
 .../le/enclave/include/tinycrypt/constants.h       |   59 ++
 .../intel_sgx/le/enclave/include/tinycrypt/utils.h |   95 ++
 drivers/platform/x86/intel_sgx/le/enclave/main.c   |  203 ++++
 .../platform/x86/intel_sgx/le/enclave/sgx_le.lds   |   28 +
 .../platform/x86/intel_sgx/le/enclave/sgxsign.c    |  537 +++++++++++
 drivers/platform/x86/intel_sgx/le/enclave/utils.c  |   78 ++
 drivers/platform/x86/intel_sgx/le/entry.S          |  117 +++
 .../platform/x86/intel_sgx/le/include/sgx_asm.h    |   64 ++
 .../platform/x86/intel_sgx/le/include/sgx_encl.h   |  105 ++
 drivers/platform/x86/intel_sgx/le/main.c           |  219 +++++
 drivers/platform/x86/intel_sgx/le/sgx_le_piggy.S   |   15 +
 drivers/platform/x86/intel_sgx/sgx.h               |  271 ++++++
 drivers/platform/x86/intel_sgx/sgx_encl.c          | 1007 ++++++++++++++++++++
 drivers/platform/x86/intel_sgx/sgx_ioctl.c         |  282 ++++++
 drivers/platform/x86/intel_sgx/sgx_le.c            |  313 ++++++
 .../platform/x86/intel_sgx/sgx_le_proxy_piggy.S    |   15 +
 drivers/platform/x86/intel_sgx/sgx_main.c          |  506 ++++++++++
 drivers/platform/x86/intel_sgx/sgx_page_cache.c    |  568 +++++++++++
 drivers/platform/x86/intel_sgx/sgx_util.c          |  397 ++++++++
 drivers/platform/x86/intel_sgx/sgx_vma.c           |  232 +++++
 fs/file.c                                          |    1 +
 fs/pipe.c                                          |    1 +
 41 files changed, 6984 insertions(+)
 create mode 100644 Documentation/x86/intel_sgx.rst
 create mode 100644 arch/x86/include/asm/sgx.h
 create mode 100644 arch/x86/include/asm/sgx_arch.h
 create mode 100644 arch/x86/include/uapi/asm/sgx.h
 create mode 100644 drivers/platform/x86/intel_sgx/Kconfig
 create mode 100644 drivers/platform/x86/intel_sgx/Makefile
 create mode 100644 drivers/platform/x86/intel_sgx/le/Makefile
 create mode 100644 drivers/platform/x86/intel_sgx/le/enclave/Makefile
 create mode 100644 drivers/platform/x86/intel_sgx/le/enclave/aes_encrypt.c
 create mode 100644 drivers/platform/x86/intel_sgx/le/enclave/cmac_mode.c
 create mode 100644 drivers/platform/x86/intel_sgx/le/enclave/encl_bootstrap.S
 create mode 100644 drivers/platform/x86/intel_sgx/le/enclave/include/tinycrypt/aes.h
 create mode 100644 drivers/platform/x86/intel_sgx/le/enclave/include/tinycrypt/cmac_mode.h
 create mode 100644 drivers/platform/x86/intel_sgx/le/enclave/include/tinycrypt/constants.h
 create mode 100644 drivers/platform/x86/intel_sgx/le/enclave/include/tinycrypt/utils.h
 create mode 100644 drivers/platform/x86/intel_sgx/le/enclave/main.c
 create mode 100644 drivers/platform/x86/intel_sgx/le/enclave/sgx_le.lds
 create mode 100644 drivers/platform/x86/intel_sgx/le/enclave/sgxsign.c
 create mode 100644 drivers/platform/x86/intel_sgx/le/enclave/utils.c
 create mode 100644 drivers/platform/x86/intel_sgx/le/entry.S
 create mode 100644 drivers/platform/x86/intel_sgx/le/include/sgx_asm.h
 create mode 100644 drivers/platform/x86/intel_sgx/le/include/sgx_encl.h
 create mode 100644 drivers/platform/x86/intel_sgx/le/main.c
 create mode 100644 drivers/platform/x86/intel_sgx/le/sgx_le_piggy.S
 create mode 100644 drivers/platform/x86/intel_sgx/sgx.h
 create mode 100644 drivers/platform/x86/intel_sgx/sgx_encl.c
 create mode 100644 drivers/platform/x86/intel_sgx/sgx_ioctl.c
 create mode 100644 drivers/platform/x86/intel_sgx/sgx_le.c
 create mode 100644 drivers/platform/x86/intel_sgx/sgx_le_proxy_piggy.S
 create mode 100644 drivers/platform/x86/intel_sgx/sgx_main.c
 create mode 100644 drivers/platform/x86/intel_sgx/sgx_page_cache.c
 create mode 100644 drivers/platform/x86/intel_sgx/sgx_util.c
 create mode 100644 drivers/platform/x86/intel_sgx/sgx_vma.c

-- 
2.14.1
