From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: [GIT PULL] Minor platform driver updates
Date: Mon, 16 Aug 2010 17:16:21 +0100
Message-ID: <20100816161621.GA3702@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:37347 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751823Ab0HPQQY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 16 Aug 2010 12:16:24 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

Hi Linus,

I know it's post RC1, but these are a couple of potential (if unlikely) 
crash fixers, patches to enable rfkill control on a single model of Dell 
and some Thinkpad updates that are effectively noops on current hardware 
but improve support for machines that aren't out yet. Nothing 
heartbreaking if it has to wait for .37.

The following changes since commit da5cabf80e2433131bf0ed8993abc0f7ea618c73:

  Linux 2.6.36-rc1 (2010-08-15 17:41:37 -0700)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/mjg59/platform-drivers-x86.git for_linus

Dan Carpenter (1):
      intel_ips: potential null dereference

Henrique de Moraes Holschuh (4):
      thinkpad-acpi: find ACPI video device by synthetic HID
      thinkpad-acpi: untangle ACPI/vendor backlight selection
      thinkpad-acpi: lock down size of hotkey keymap
      thinkpad-acpi: add support for model-specific keymaps

Jens Taprogge (1):
      thinkpad-acpi: Add KEY_CAMERA (Fn-F6) for Lenovo keyboards

Julia Lawall (1):
      drivers/platform/x86: Adjust confusing if indentation

Kulikov Vasiliy (1):
      x86: intel_ips: do not use PCI resources before pci_enable_device()

Victor van den Elzen (1):
      platform/x86: move rfkill for Dell Mini 1012 to compal-laptop

 Documentation/laptops/thinkpad-acpi.txt |    4 +
 drivers/platform/x86/asus_acpi.c        |    6 +-
 drivers/platform/x86/compal-laptop.c    |    9 ++
 drivers/platform/x86/dell-laptop.c      |    7 ++
 drivers/platform/x86/intel_ips.c        |   15 ++-
 drivers/platform/x86/thinkpad_acpi.c    |  171 ++++++++++++++++---------------
 6 files changed, 121 insertions(+), 91 deletions(-)

-- 
Matthew Garrett | mjg59@srcf.ucam.org
