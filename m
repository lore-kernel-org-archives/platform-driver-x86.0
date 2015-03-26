From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v3 0/3] toshiba_bluetooth: Clean up driver plus a bugfix
Date: Thu, 26 Mar 2015 14:56:04 -0600
Message-ID: <1427403367-18996-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:34895 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752510AbbCZU4S (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 Mar 2015 16:56:18 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

These patches introduce three new functions, cleaning up the driver
code, checking for errors and returning accordingly, and also fixes
bug 93911.

Changes since v2:
- Merged patches 2-3 into one
- Added a comment block explaining a bit why we added an extra check
  to the status of the device

Changes since v1:
- Removed pr_info calls from *_notify function
- Added checks to the status of the BT device removing the TODO
  comment and retaining the previous functionality of the driver

Azael Avalos (3):
  toshiba_bluetooth: Add three new functions to the driver
  toshiba_bluetooth: Clean up *_add function and disable BT device at
    removal
  toshiba_bluetooth: Fix enabling/disabling loop on recent devices

 drivers/platform/x86/toshiba_bluetooth.c | 133 ++++++++++++++++++++++++-------
 1 file changed, 104 insertions(+), 29 deletions(-)

-- 
2.2.2
