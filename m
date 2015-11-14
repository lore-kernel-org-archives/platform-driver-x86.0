From: Andy Lutomirski <luto@kernel.org>
Subject: [PATCH 0/3] dell_wmi: XPS 13 Skylake support and misc stuff
Date: Fri, 13 Nov 2015 21:49:29 -0800
Message-ID: <cover.1447479930.git.luto@kernel.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:59669 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750757AbbKNFtl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 14 Nov 2015 00:49:41 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Andy Lutomirski <luto@kernel.org>

The first patch adds three missing hotkeys.  The second and third
patches are just cleanup and future-proofing.

This is obviously rather late (I just got this laptop working at all
two days ago), but it would be nice if patch 1 could squeeze in to
4.4.  That way 4.4 would fully support this laptop.  (4.3 is needed
for graphics to work right, and 4.4 will support the wireless chip,
but as it stands, Linus' tree is missing support for the wireless
button.)

Andy Lutomirski (3):
  dell_wmi: Support new hotkeys on the XPS 13 Skylake
  dell_wmi: Use a C99-style array for bios_to_linux_keycode
  dell_wmi: Improve unknown hotkey handling

 drivers/platform/x86/dell-wmi.c | 114 ++++++++++++++++++++++++++++++----------
 1 file changed, 86 insertions(+), 28 deletions(-)

-- 
2.5.0
