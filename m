From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [GIT PULL] More ACPI updates for v5.7-rc1
Date: Mon, 6 Apr 2020 17:13:55 +0200
Message-ID: <CAJZ5v0j8rEiD0uv+LQoAQyfdXORF+joz-vLVH4ryH9_xvZebOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-acpi-owner@vger.kernel.org>
Sender: linux-acpi-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: ACPI Devel Maling List <linux-acpi@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Linus,

Please pull from the tag

 git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
 acpi-5.7-rc1-2

with top-most commit 33ae7f715e30a674599c7f57dce0512b6051edbf

 Merge branches 'acpi-cppc', 'acpi-video' and 'acpi-drivers'

on top of commit 2ce94bc4e056d3e48291aac87a95ebd2a86348ba

 Merge tag 'pnp-5.7-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm

to receive additional ACPI updates for 5.7-rc1.

These update the ACPICA code in the kernel to the 20200326 upstream
revision, fix an ACPI-related CPU hotplug deadlock on x86, update
Intel Tiger Lake device IDs in some places, add a new ACPI backlight
blacklist entry, update the "acpi_backlight" kernel command line
switch documentation and clean up a CPPC library routine.

Specifics:

 - Update the ACPICA code in the kernel to upstream revision 20200326
   including:

   * Fix for a typo in a comment field (Bob Moore).
   * acpiExec namespace init file fixes (Bob Moore).
   * Addition of NHLT to the known tables list (Cezary Rojewski).
   * Conversion of PlatformCommChannel ASL keyword to PCC (Erik
     Kaneda).
   * acpiexec cleanup (Erik Kaneda).
   * WSMT-related typo fix (Erik Kaneda).
   * sprintf() utility function fix (John Levon).
   * IVRS IVHD type 11h parsing implementation (Michał Żygowski).
   * IVRS IVHD type 10h reserved field name fix (Michał Żygowski).

 - Fix ACPI-related CPU hotplug deadlock on x86 (Qian Cai).

 - Fix Intel Tiger Lake ACPI device IDs in several places (Gayatri
   Kammela).

 - Add ACPI backlight blacklist entry for Acer Aspire 5783z (Hans
   de Goede).

 - Fix documentation of the "acpi_backlight" kernel command line
   switch (Randy Dunlap).

 - Clean up the acpi_get_psd_map() CPPC library routine (Liguang
   Zhang).

Thanks!


---------------

Bob Moore (3):
      ACPICA: Fix a typo in a comment field
      ACPICA: Fixes for acpiExec namespace init file
      ACPICA: Update version 20200326

Cezary Rojewski (1):
      ACPICA: Add NHLT table signature

Erik Kaneda (3):
      ACPICA: Change PlatformCommChannel ASL keyword to PCC
      ACPICA: acpiexec: remove redeclaration of
acpi_gbl_db_opt_no_region_support
      ACPICA: WSMT: Fix typo, no functional change

Gayatri Kammela (3):
      ACPI: Update Tiger Lake ACPI device IDs
      platform/x86: intel-hid: fix: Update Tiger Lake ACPI device ID
      thermal: int340x_thermal: fix: Update Tiger Lake ACPI device IDs

Hans de Goede (1):
      ACPI: video: Use native backlight on Acer Aspire 5783z

John Levon (1):
      ACPICA: utilities: fix sprintf()

Liguang Zhang (1):
      ACPI: CPPC: clean up acpi_get_psd_map()

Michał Żygowski (2):
      ACPICA: Implement IVRS IVHD type 11h parsing
      ACPICA: Fix IVRS IVHD type 10h reserved field name

Qian Cai (1):
      x86: ACPI: fix CPU hotplug deadlock

Randy Dunlap (1):
      ACPI: video: Docs update for "acpi_backlight" kernel parameter options

---------------

 Documentation/admin-guide/kernel-parameters.txt    |  8 +++--
 arch/x86/kernel/acpi/cstate.c                      |  3 +-
 drivers/acpi/acpica/acnamesp.h                     |  2 ++
 drivers/acpi/acpica/dbinput.c                      | 16 +++++-----
 drivers/acpi/acpica/dbxface.c                      |  1 +
 drivers/acpi/acpica/dswexec.c                      | 33 ++++++++++++++++++++
 drivers/acpi/acpica/dswload.c                      |  2 --
 drivers/acpi/acpica/dswload2.c                     | 35 ++++++++++++++++++++++
 drivers/acpi/acpica/nsnames.c                      |  6 +---
 drivers/acpi/acpica/utdecode.c                     |  2 +-
 drivers/acpi/acpica/utdelete.c                     |  9 +++---
 drivers/acpi/acpica/utprint.c                      |  7 ++++-
 drivers/acpi/cppc_acpi.c                           | 33 +++++---------------
 drivers/acpi/device_pm.c                           |  2 +-
 drivers/acpi/dptf/dptf_power.c                     |  2 +-
 drivers/acpi/dptf/int340x_thermal.c                |  8 ++---
 drivers/acpi/processor_throttling.c                |  7 -----
 drivers/acpi/tables.c                              |  2 +-
 drivers/acpi/video_detect.c                        |  9 ++++++
 drivers/platform/x86/intel-hid.c                   |  2 +-
 .../intel/int340x_thermal/int3400_thermal.c        |  2 +-
 .../intel/int340x_thermal/int3403_thermal.c        |  2 +-
 include/acpi/acpixf.h                              |  2 +-
 include/acpi/actbl2.h                              | 21 +++++++++++--
 include/acpi/actbl3.h                              |  6 ++--
 include/acpi/acuuid.h                              |  2 +-
 include/acpi/processor.h                           |  8 +++++
 27 files changed, 155 insertions(+), 77 deletions(-)
