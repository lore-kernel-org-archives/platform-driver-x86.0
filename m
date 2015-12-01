From: Andy Lutomirski <luto@kernel.org>
Subject: [PATCH v2 0/3] dell platform driver tweaks v2
Date: Mon, 30 Nov 2015 17:01:58 -0800
Message-ID: <cover.1448931589.git.luto@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:46261 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754314AbbLABCK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 30 Nov 2015 20:02:10 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Andy Lutomirski <luto@kernel.org>

Here's v2.

I'm still hoping to hear more details about the rfkill button.
Meanwhile, let's at least wire up the WMI decoding stuff and
get the rest in.

Changes from v1:
 - The new hotkey code matches reality better.
 - Don't send key events for the new hotkeys (yet?)
 - Improve warning formatting.

Andy Lutomirski (3):
  dell-wmi: Use a C99-style array for bios_to_linux_keycode
  dell-wmi: Support new hotkeys on the XPS 13 9350 (Skylake)
  dell-wmi: Improve unknown hotkey handling

 drivers/platform/x86/dell-wmi.c | 143 +++++++++++++++++++++++++++++++---------
 1 file changed, 112 insertions(+), 31 deletions(-)

-- 
2.5.0
