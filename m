From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: [GIT] pull request for x86 platform drivers tree
Date: Mon, 31 Oct 2011 13:24:38 +0000
Message-ID: <20111031132438.GA2824@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:44219 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754783Ab1JaNYn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 31 Oct 2011 09:24:43 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: torvalds@linux-foundation.org
Cc: platform-driver-x86@vger.kernel.org

Hi Linus,

Misc set of updates for the x86 platform driver tree. Nothing terribly 
exciting here this time around, but some nice fixes for various things 
and support for a wider range of Toshibas.

The following changes since commit c3b92c8787367a8bb53d57d9789b558f1295cc96:

  Linux 3.1 (2011-10-24 09:10:05 +0200)

are available in the git repository at:
  git://cavan.codon.org.uk/platform-drivers-x86.git for_linus

AceLan Kao (1):
      dell-laptop: support Synaptics/Alps touchpad led

Andy Ross (4):
      asus-laptop: Platform detection for Pegatron Lucid
      asus-laptop: Pegatron Lucid ALS sensor
      asus-laptop: allow boot time control of Pegatron ALS sensor
      asus-laptop: Pegatron Lucid accelerometer

Anisse Astier (2):
      asus-laptop: pega_accel - Report accelerometer orientation change through udev
      asus-laptop: Add rfkill support for Pegatron Lucid tablet

Axel Lin (3):
      platform-drivers-x86: eeepc-laptop: fix wrong test for successful registered led_classdev
      platform-drivers-x86: asus-wmi: fix resource leak in asus_wmi_led_exit
      platform-drivers-x86: asus-laptop: fix wrong test for successful registered led_classdev

Corentin Chary (2):
      asus-laptop: hide leds on Pegatron Lucid
      asus-laptop: fix module description

David Herrmann (1):
      Platform: Fix error path in samsung-laptop init

Dmitry Torokhov (1):
      WMI: properly cleanup devices to avoid crashes

Ike Panhc (6):
      MAINTAINERS: add new entry for ideapad-laptop
      ideapad: define vpc commands
      ideapad: change parameter of ideapad_sync_rfk_state
      ideapad: add event for Novo key
      ideapad: add debugfs support
      ideapad: remove sysfs node for cfg

Jason Stubbs (3):
      platform: samsung_laptop: fix samsung brightness min/max calculations
      Platform: Brightness quirk for samsung laptop driver
      Platform: Samsung laptop DMI info for NC210/NC110

John Serock (1):
      Platform: Detect samsung laptop quirk when initial level is zero

Kirill A. Shutemov (1):
      intel_scu_ipcutil: fix major device number handling

Lee, Chun-Yi (4):
      acer-wmi: check wireless capability flag before register rfkill
      acer-wmi: add ACER_WMID_v2 interface flag to represent new notebooks
      acer-wmi: check the existence of internal wireless device when set capability
      acer-wmi: replaced the hard coded bitmap by the communication devices bitmap from SMBIOS

Manuel Lauss (1):
      topstar-latop: ignore 0x82 event

Raul Gutierrez Segales (1):
      Platform: fix samsung-laptop DMI identification for N220 model

Rene Bollford (1):
      ideapad: Check if acpi already handle backlight power to avoid a page fault

Seth Forshee (7):
      toshiba_acpi: Convert to use acpi_driver
      toshiba_acpi: Fix up return codes
      toshiba_acpi: Use handle for HCI calls
      toshiba_acpi: Support SPFC as an HCI method
      toshiba_acpi: Don't add devices for unsupported features
      toshiba_acpi: Initialize brightness in backlight device
      acer-wmi: Add wireless quirk for Lenovo 3000 N200

Smelov Andrey (1):
      Platform: samsung_laptop: samsung backlight for R528/R728

Stefan Beller (1):
      platform: samsung_laptop: add dmi information for Samsung R700 laptops

Takashi Iwai (2):
      hp_accel: Add a new PNP id
      hp_accel: Add axis-mapping for HP ProBook / EliteBook

Tommaso Massimi (1):
      Platform: samsung_laptop: add support for X520 machines.

Yong Zhang (1):
      sony-laptop:irq: Remove IRQF_DISABLED

 Documentation/ABI/testing/debugfs-ideapad          |   19 +
 .../ABI/testing/sysfs-platform-ideapad-laptop      |   15 -
 MAINTAINERS                                        |    7 +
 drivers/platform/x86/Kconfig                       |   19 +-
 drivers/platform/x86/acer-wmi.c                    |  488 ++++++++-------
 drivers/platform/x86/asus-laptop.c                 |  378 +++++++++++-
 drivers/platform/x86/asus-wmi.c                    |    4 +-
 drivers/platform/x86/dell-laptop.c                 |   84 +++
 drivers/platform/x86/eeepc-laptop.c                |    2 +-
 drivers/platform/x86/hp_accel.c                    |    5 +
 drivers/platform/x86/ideapad-laptop.c              |  251 +++++++-
 drivers/platform/x86/intel_scu_ipcutil.c           |    8 +-
 drivers/platform/x86/samsung-laptop.c              |  107 +++-
 drivers/platform/x86/sony-laptop.c                 |    2 +-
 drivers/platform/x86/topstar-laptop.c              |    1 +
 drivers/platform/x86/toshiba_acpi.c                |  641 +++++++++++---------
 drivers/platform/x86/wmi.c                         |    6 +-
 17 files changed, 1422 insertions(+), 615 deletions(-)
 create mode 100644 Documentation/ABI/testing/debugfs-ideapad

-- 
Matthew Garrett | mjg59@srcf.ucam.org
