From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 0/4] toshiba_bluetooth: Clean up driver plus a bugfix
Date: Wed, 25 Mar 2015 14:19:13 -0600
Message-ID: <1427314757-18232-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:33998 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752301AbbCYUTX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 Mar 2015 16:19:23 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

These patches introduce three new functions, cleaning up the driver
code, checking for errors and returning accordingly, and also fixes
bug 93911.

Changes since v1:
- Removed pr_info calls from *_notify function
- Added checks to the status of the BT device removing the TODO
  comment and retaining the previous functionality of the driver

Azael Avalos (4):
  toshiba_bluetooth: Add three new functions to the driver
  toshiba_bluetooth: Clean up *_add function and disable BT device at
    removal
  toshiba_bluetooth: Clean toshiba_bluetooth_enable function
  toshiba_bluetooth: Remove BT enable code from *_notify function

 drivers/platform/x86/toshiba_bluetooth.c | 139 +++++++++++++++++++++++--------
 1 file changed, 103 insertions(+), 36 deletions(-)

-- 
2.2.2
