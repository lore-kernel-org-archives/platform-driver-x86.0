From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: [GIT] Updates for x86 platform drivers
Date: Mon, 20 Aug 2012 17:54:01 +0100
Message-ID: <20120820165401.GA32139@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:37690 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757403Ab2HTQyD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 20 Aug 2012 12:54:03 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: torvalds@linux-foundation.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

(Resend - you'd think I could get Linus's address right)

Hi Linus,

Some small updates for a few drivers, and some hardware enablement for 
new Ideapads and the gmux hardware in the latest Macs. This code won't 
run on older devices and has been well tested on new ones, so low risk 
of regressions.

The following changes since commit 846b99964a7f43255e816f9c5475de37dc5a0a1b:

  Merge tag 'rdma-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/roland/infiniband (2012-08-17 11:45:58 -0700)

are available in the git repository at:


  git://cavan.codon.org.uk/platform-drivers-x86.git for_linus

for you to fetch changes up to 0c7bbeb9f1373cea9e8efb43221118be2102a01c:

  ideapad: add Lenovo IdeaPad Z570 support (part 3) (2012-08-20 12:44:41 -0400)

----------------------------------------------------------------
AceLan Kao (2):
      asus-wmi: record wlan status while controlled by userapp
      dell-laptop: Fixed typo in touchpad LED quirk

Andreas Heider (1):
      apple-gmux: Add display mux support

Carlos Alberto Lopez Perez (1):
      classmate-laptop: always call input_sync() after input_report_switch()

Manoj Iyer (1):
      thinkpad-acpi: recognize latest V-Series using DMI_BIOS_VENDOR

Matthew Garrett (3):
      gmux: Add generic write32 function
      apple_gmux: Add support for newer hardware
      apple_gmux: Fix ACPI video unregister

Maxim Mikityanskiy (3):
      ideapad: add Lenovo IdeaPad Z570 support (part 1)
      ideapad: add Lenovo IdeaPad Z570 support (part 2)
      ideapad: add Lenovo IdeaPad Z570 support (part 3)

Seth Forshee (3):
      apple-gmux: Fix kconfig dependencies
      vga_switcheroo: Remove assumptions about registration/unregistration ordering
      vga_switcheroo: Don't require handler init callback

 .../ABI/testing/sysfs-platform-ideapad-laptop      |  11 +
 drivers/gpu/drm/nouveau/nouveau_acpi.c             |   6 -
 drivers/gpu/vga/vga_switcheroo.c                   |  61 +--
 drivers/platform/x86/Kconfig                       |   6 +-
 drivers/platform/x86/apple-gmux.c                  | 426 +++++++++++++++++++--
 drivers/platform/x86/asus-wmi.c                    |  21 +-
 drivers/platform/x86/asus-wmi.h                    |   1 +
 drivers/platform/x86/classmate-laptop.c            |  12 +-
 drivers/platform/x86/dell-laptop.c                 |  12 +-
 drivers/platform/x86/ideapad-laptop.c              | 110 +++++-
 drivers/platform/x86/thinkpad_acpi.c               |   7 +
 11 files changed, 606 insertions(+), 67 deletions(-)

-- 
Matthew Garrett | mjg59@srcf.ucam.org
