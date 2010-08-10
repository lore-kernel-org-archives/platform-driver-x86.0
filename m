From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [GIT PATCH] thinkpad-acpi patches for merge window
Date: Mon,  9 Aug 2010 23:48:17 -0300
Message-ID: <1281408502-7757-1-git-send-email-hmh@hmh.eng.br>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:45089 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755253Ab0HJCsb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 Aug 2010 22:48:31 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net

Matthew,

This is a bit late, I hope you will still consider pushing these to Linus while
the merge window is still open.

Please pull from:
  git://repo.or.cz/linux-2.6/linux-acpi-2.6/ibm-acpi-2.6.git for-upstream/platform-x86_tpacpi

To get the following changes:

Henrique de Moraes Holschuh (4):
      thinkpad-acpi: find ACPI video device by synthetic HID
      thinkpad-acpi: untangle ACPI/vendor backlight selection
      thinkpad-acpi: lock down size of hotkey keymap
      thinkpad-acpi: add support for model-specific keymaps

Jens Taprogge (1):
      thinkpad-acpi: Add KEY_CAMERA (Fn-F6) for Lenovo keyboards

 Documentation/laptops/thinkpad-acpi.txt |    4 
 drivers/platform/x86/thinkpad_acpi.c    |  171 ++++++++++++++++----------------
 2 files changed, 92 insertions(+), 83 deletions(-)

I will also send the patchset as replies to this email.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
