From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH v2 00/18] eeepc-wmi updates
Date: Sun,  6 Feb 2011 13:28:25 +0100
Message-ID: <1296995324-5462-1-git-send-email-corentincj@iksaif.net>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>
Cc: Corentin Chary <corentincj@iksaif.net>, Randy Dunlap <rdunlap@xenotime.net>, Chris Bagwell <chris@cnpbagwell.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Matthew,

Thanks to a generous donator, I was able to buy an Eeepc 1000H. It really
easier to make patch when you have the hardware :).

These patches add some features to eeepc-wmi that where already available in
eeepc-laptop (wimax, camera, cardr, wlan hotplug) and some new features
(backlight power).

You may want to take a look at "eeepc-wmi: add hotplug code for Eeepc 1000H"
and "eeepc-wmi: serialize access to wmi method" since you wrote the original
patch for eeepc-laptop.

It's probably way to late for 2.6.38, so let's queue them for 2.6.39. Anyway
if disitribution want to backport some patches, it should be easy to do with
any kernel >= 2.6.34.

Thanks,

Since v1:
* Fixed "eeepc-wmi: support backlight power (bl_power) attribute"
* Added 4 new patchs

Corentin Chary (18):
  eeepc-wmi: reorder keymap
  eeepc-wmi: add wlan key found on 1015P
  eeepc-wmi: add hotplug code for Eeepc 1000H
  eeepc-wmi: serialize access to wmi method
  eeepc-wmi: return proper error code in eeepc_rfkill_set()
  eeepc-wmi: add an helper using simple return codes
  eeepc-wmi: add hibernate/resume callbacks
  eeepc-wmi: switch to platform_create_bundle()
  eeepc-wmi: reorder defines
  eeepc-wmi: use the presence bit correctly
  eeepc-wmi: add camera and card reader support
  eeepc-wmi: add wimax support
  eeepc-wmi: set the right key code for 0xe9
  eeepc-wmi: support backlight power (bl_power) attribute
  eeepc-wmi: respect wireless_hotplug setting
  eeepc-wmi: real touchpad led device id is 0x001000012
  eeepc-wmi: add touchpad sysfs file
  eeepc-wmi: reorder device ids

 Documentation/ABI/testing/sysfs-platform-eeepc-wmi |   21 +
 drivers/platform/x86/eeepc-wmi.c                   |  771 ++++++++++++++++----
 2 files changed, 663 insertions(+), 129 deletions(-)

-- 
1.7.4.rc3

