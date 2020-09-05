From: Lenny Szubowicz <lszubowi@redhat.com>
Subject: [PATCH V2 0/3] integrity: Load certs from EFI MOK config table
Date: Fri,  4 Sep 2020 21:31:04 -0400
Message-ID: <20200905013107.10457-1-lszubowi@redhat.com>
Return-path: <linux-security-module-owner@vger.kernel.org>
Sender: owner-linux-security-module@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-security-module@vger.kernel.org, andy.shevchenko@gmail.com, ardb@kernel.org, jmorris@namei.org, serge@hallyn.com, keescook@chromium.org, zohar@linux.ibm.com, bp@alien8.de, pjones@redhat.com, dhowells@redhat.com, prarit@redhat.com
List-Id: platform-driver-x86.vger.kernel.org

Because of system-specific EFI firmware limitations, EFI volatile
variables may not be capable of holding the required contents of
the Machine Owner Key (MOK) certificate store when the certificate
list grows above some size. Therefore, an EFI boot loader may pass
the MOK certs via a EFI configuration table created specifically for
this purpose to avoid this firmware limitation.

An EFI configuration table is a simpler and more robust mechanism
compared to EFI variables and is well suited for one-way passage
of static information from a pre-OS environment to the kernel.

Entries in the MOK variable configuration table are named key/value
pairs. Therefore the shim boot loader can create a MokListRT named
entry in the MOK configuration table that contains exactly the same
data as the MokListRT UEFI variable does or would otherwise contain.
As such, the kernel can load certs from the data in the MokListRT
configuration table entry data in the same way that it loads certs
from the data returned by the EFI GetVariable() runtime call for the
MokListRT variable.

This patch set does not remove the support for loading certs from the
EFI MOK variables into the platform key ring. However, if both the EFI
MOK configuration table and corresponding EFI MOK variables are present,
the MOK table is used as the source of MOK certs.

The contents of the individual named MOK config table entries are
made available to user space as individual sysfs binary files,
which are read-only to root, under:

	/sys/firmware/efi/mok-variables/

This enables an updated mokutil to provide support for:

	mokutil --list-enrolled

such that it can provide accurate information regardless of whether
the MOK configuration table or MOK EFI variables were the source
for certs. Note that all modifications of MOK related state are still
initiated by mokutil via EFI variables.

V2: Incorporate feedback from V1
  Patch 01: efi: Support for MOK variable config table
  - Minor update to change log; no code changes
  Patch 02: integrity: Move import of MokListRT certs to a separate routine
  - Clean up code flow in code moved to load_moklist_certs()
  - Remove some unnecessary initialization of variables
  Patch 03: integrity: Load certs from the EFI MOK config table
  - Update required due to changes in patch 02.
  - Remove unnecessary init of mokvar_entry in load_moklist_certs() 

V1:
  https://lore.kernel.org/lkml/20200826034455.28707-1-lszubowi@redhat.com/

Lenny Szubowicz (3):
  efi: Support for MOK variable config table
  integrity: Move import of MokListRT certs to a separate routine
  integrity: Load certs from the EFI MOK config table

 arch/x86/kernel/setup.c                       |   1 +
 arch/x86/platform/efi/efi.c                   |   3 +
 drivers/firmware/efi/Makefile                 |   1 +
 drivers/firmware/efi/arm-init.c               |   1 +
 drivers/firmware/efi/efi.c                    |   6 +
 drivers/firmware/efi/mokvar-table.c           | 360 ++++++++++++++++++
 include/linux/efi.h                           |  34 ++
 security/integrity/platform_certs/load_uefi.c |  85 ++++-
 8 files changed, 472 insertions(+), 19 deletions(-)
 create mode 100644 drivers/firmware/efi/mokvar-table.c

-- 
2.27.0
