From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: [GIT PULL] x86 platform driver updates
Date: Mon, 21 Feb 2011 22:11:10 +0000
Message-ID: <20110221221110.GA25537@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Linus,

Small updates to the x86 platform driver tree - fix a trivial bogosity 
that led to acer-wmi failing to bind on some hardware, some build 
fixups, some IRQ code rework on the (new for .38) Medfield interrupt 
driver from Thomas and an attempt to fix up the Dell rfkill handling 
that's breaking some newer machines. I'm still working on this last one, 
and we may end up having to just pull the functionality from the driver 
to make this work well.

The following changes since commit 6f576d57f1fa0d6026b495d8746d56d949989161:

  Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound-2.6 (2011-02-20 10:15:57 -0800)

are available in the git repository at:

  ssh://master.kernel.org/pub/scm/linux/kernel/git/mjg59/platform-drivers-x86.git for_linus

Keng-Yu Lin (1):
      dell-laptop: Toggle the unsupported hardware killswitch

Matthew Garrett (1):
      acer-wmi: Fix capitalisation of GUID

Randy Dunlap (1):
      platform/x86: ideapad-laptop depends on INPUT

Seth Forshee (1):
      thinkpad_acpi: Always report scancodes for hotkeys

Thomas Gleixner (4):
      platform-drivers: x86: pmic: Fix up bogus irq hackery
      platform-drivers: x86: Convert pmic to new irq_chip functions
      platform-drivers: x86: pmic: Use irq_chip buslock mechanism
      platform-drivers: x86: pmic: Use request_irq instead of chained handler

Vasiliy Kulikov (3):
      platform: x86: tc1100-wmi: world-writable sysfs wireless and jogdial files
      platform: x86: asus_acpi: world-writable procfs files
      platform: x86: acer-wmi: world-writable sysfs threeg file

 drivers/platform/x86/Kconfig           |    2 +-
 drivers/platform/x86/acer-wmi.c        |    4 +-
 drivers/platform/x86/asus_acpi.c       |    8 +--
 drivers/platform/x86/dell-laptop.c     |   24 ++++++-
 drivers/platform/x86/intel_pmic_gpio.c |  116 +++++++++-----------------------
 drivers/platform/x86/tc1100-wmi.c      |    2 +-
 drivers/platform/x86/thinkpad_acpi.c   |    8 +--
 7 files changed, 61 insertions(+), 103 deletions(-)

-- 
Matthew Garrett | mjg59@srcf.ucam.org
