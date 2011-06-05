From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [GIT PATCH] thinkpad-acpi patches for 3.0-rc
Date: Sun,  5 Jun 2011 16:22:33 -0300
Message-ID: <1307301755-13742-1-git-send-email-hmh@hmh.eng.br>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:59367 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753715Ab1FETWo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 5 Jun 2011 15:22:44 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net


Matthew,

Please consider sending these two patches to Linus for 3.0-rc, as they
cause the driver to be a lot less annoying for many users.

I have not included the LED/MIC mute patches, because they are not
low-impact, *and* I am trying to get some answers from Lenovo first.
Please hold them for a while, I am back to a more active maintenance of
thinkpad-acpi.

Please pull from:
  git://repo.or.cz/linux-2.6/linux-acpi-2.6/ibm-acpi-2.6.git for-upstream/platform-x86

To get the following changes:

Henrique de Moraes Holschuh (2):
      thinkpad-acpi: handle some new HKEY 0x60xx events
      thinkpad-acpi: handle HKEY 0x4010, 0x4011 events

I will also send the patchset as replies to this email.

I will handle requesting that they get added to -stable/-longterm (plus an
extra detail required for 2.6.32) after they'be been in mainline for a
small while.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
