From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 0/3] toshiba_acpi: Hotkey handling and keymap updates
Date: Thu, 26 Feb 2015 10:57:11 -0700
Message-ID: <1424973434-3032-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:37343 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753798AbbBZR53 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 Feb 2015 12:57:29 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

These patches add support to a new function that queries the supported Hotkey
Event Type, making the use of the DMI matching unnecessary and also fixes
the "Special Functions" mode on some laptops.

Azael Avalos (3):
  toshiba_acpi: Add Hotkey Event Type function and definitions
  toshiba_acpi: Use the Hotkey Event Type function for keymap choosing
  toshiba_acpi: Fix the enabling of the Special Functions

 drivers/platform/x86/toshiba_acpi.c | 97 ++++++++++++++++++++++++-------------
 1 file changed, 64 insertions(+), 33 deletions(-)

-- 
2.2.2
