From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 0/3] toshiba_acpi: Hotkey handling and keymap updates
Date: Fri, 20 Mar 2015 16:55:15 -0600
Message-ID: <1426892118-27678-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:36092 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751164AbbCTWzY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 20 Mar 2015 18:55:24 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

These patches add support to a new function that queries the supported Hotkey
Event Type, making the use of the DMI matching unnecessary and also fixes
the "Special Functions" mode on some laptops.

Changes since v1:
- Renamed HCI_HOTKEY_EVENT_TYPE to HCI_SYSTEM_INFO definition to
  better reflect what the call does, and also the HCI_HOTKEY_EVENT_*
  types
- Fixed a typo in the error description
- Added a comment block explaining a bit why we also use the "Special
  Functions" as a check for keymap selection

Azael Avalos (3):
  toshiba_acpi: Add Hotkey Event Type function and definitions
  toshiba_acpi: Use the Hotkey Event Type function for keymap choosing
  toshiba_acpi: Fix the enabling of the Special Functions

 drivers/platform/x86/toshiba_acpi.c | 118 ++++++++++++++++++++++++------------
 1 file changed, 80 insertions(+), 38 deletions(-)

-- 
2.2.2
