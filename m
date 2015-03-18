From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 0/4] toshiba_bluetooth: Clean up driver plus a bugfix
Date: Wed, 18 Mar 2015 13:12:54 -0600
Message-ID: <1426705979-11880-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:33810 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751074AbbCRTNS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 18 Mar 2015 15:13:18 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

These patches introduce three new functions, cleaning up the driver
code, checking for errors and returning accordingly, and also fixes
bug 93911.

Azael Avalos (4):
  toshiba_bluetooth: Add three new functions to the driver
  toshiba_bluetooth: Clean up *_add function and disable BT device at
    removal
  toshiba_bluetooth: Clean toshiba_bluetooth_enable function
  toshiba_bluetooth: Remove BT enable code from *_notify function

 drivers/platform/x86/toshiba_bluetooth.c | 133 ++++++++++++++++++++++---------
 1 file changed, 97 insertions(+), 36 deletions(-)

-- 
2.2.2
