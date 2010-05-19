From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [GIT PULL] thinkpad-acpi fixes for the merge window
Date: Wed, 19 May 2010 00:26:10 -0300
Message-ID: <1274239584-17743-1-git-send-email-hmh@hmh.eng.br>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:45396 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756116Ab0ESD0f (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 18 May 2010 23:26:35 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net

Matthew,

Please pull from:
  git://repo.or.cz/linux-2.6/linux-acpi-2.6/ibm-acpi-2.6.git for-upstream/platform-x86_tpacpi

To get the following changes:

Henrique de Moraes Holschuh (14):
      thinkpad-acpi: constrain IBM-era support to IBM boxes
      thinkpad-acpi: X100e quick fixes
      thinkpad-acpi: fix volume/mute hotkey poll handling
      thinkpad-acpi: move greeting messages out of the first subdriver (v2)
      thinkpad-acpi: let other subdrivers know backlight level range
      thinkpad-acpi: fix brightness hotkey poll handling
      thinkpad-acpi: update HKEY and hotkey subdriver documentation (v2)
      thinkpad-acpi: disclose usertask for ALSA callbacks
      thinkpad-acpi: detect EC node using its HID (v2)
      thinkpad-acpi: acpi_evalf fixes
      thinkpad-acpi: explain errors from acpi_install_notify_handler
      thinkpad-acpi: don't depend on led_path for led firmware type (v2)
      thinkpad-acpi: clean up ACPI handles handling
      thinkpad-acpi: document backlight level writeback at driver init

 Documentation/laptops/thinkpad-acpi.txt |   66 +++-
 drivers/platform/x86/thinkpad_acpi.c    |  600 +++++++++++++++++++------------
 2 files changed, 425 insertions(+), 241 deletions(-)

Please note that this branch contains a merge from mainline (at v2.6.34-rc7) on
top of the branch you pulled from me the last time.

If you'd prefer that I rebase the above patchset on top of 2.6.34, please say
so and I will do that.

I will also send the patchset as replies to this email.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
