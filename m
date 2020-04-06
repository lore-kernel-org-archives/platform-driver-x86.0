From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [GIT PULL] More power management updates for v5.7-rc1
Date: Mon, 6 Apr 2020 17:11:39 +0200
Message-ID: <CAJZ5v0ji9p4_whgcJbh6mm8cdYpruHEzOsTqje7JedD45wH5Dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux PM <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Linus,

Please pull from the tag

 git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
 pm-5.7-rc1-2

with top-most commit 54032b863b56b0e5313bfcd6ef0818943c59c4f4

 Merge branches 'pm-sleep' and 'pm-cpufreq'

on top of commit 2ce94bc4e056d3e48291aac87a95ebd2a86348ba

 Merge tag 'pnp-5.7-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm

to receive additional power management updates for 5.7-rc1.

These fix a corner-case suspend-to-idle wakeup issue on systems
where the ACPI SCI is shared with another wakeup source, add a
kernel command line option to set pm_debug_messages via the kernel
command line, add a document desctibing system-wide suspend and
resume code flows, modify cpufreq Kconfig to choose schedutil as
the preferred governor by default in a couple of cases and do some
assorted cleanups.

Specifics:

 - Fix corner-case suspend-to-idle wakeup issue on systems where
   the ACPI SCI is shared with another wakeup source (Hans de Goede).

 - Add document describing system-wide suspend and resume code flows
   to the admin guide (Rafael Wysocki).

 - Add kernel command line option to set pm_debug_messages (Chen Yu).

 - Choose schedutil as the preferred scaling governor by default on
   ARM big.LITTLE systems and on x86 systems using the intel_pstate
   driver in the passive mode (Linus Walleij, Rafael Wysocki).

 - Drop racy and redundant checks from the PM core's device_prepare()
   routine (Rafael Wysocki).

 - Make resume from hibernation take the hibernation_restore() return
   value into account (Dexuan Cui).

Thanks!


---------------

Chen Yu (1):
      PM: sleep: Add pm_debug_messages kernel command line option

Dexuan Cui (1):
      PM: hibernate: Propagate the return value of hibernation_restore()

Hans de Goede (2):
      ACPI: PM: Add acpi_[un]register_wakeup_handler()
      platform/x86: intel_int0002_vgpio: Use acpi_register_wakeup_handler()

Linus Walleij (1):
      cpufreq: Select schedutil when using big.LITTLE

Rafael J. Wysocki (3):
      cpufreq: intel_pstate: Select schedutil as the default governor
      PM: sleep: core: Drop racy and redundant checks from device_prepare()
      Documentation: PM: sleep: Document system-wide suspend code flows

---------------

 Documentation/admin-guide/kernel-parameters.txt |   3 +
 Documentation/admin-guide/pm/suspend-flows.rst  | 270 ++++++++++++++++++++++++
 Documentation/admin-guide/pm/system-wide.rst    |   1 +
 drivers/acpi/sleep.c                            |   4 +
 drivers/acpi/sleep.h                            |   1 +
 drivers/acpi/wakeup.c                           |  81 +++++++
 drivers/base/power/main.c                       |   7 +-
 drivers/cpufreq/Kconfig                         |   4 +-
 drivers/cpufreq/Kconfig.x86                     |   2 +
 drivers/platform/x86/intel_int0002_vgpio.c      |  10 +
 include/linux/acpi.h                            |   5 +
 kernel/power/hibernate.c                        |   2 +-
 kernel/power/main.c                             |   7 +
 13 files changed, 389 insertions(+), 8 deletions(-)
