From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 0/4] toshiba_bluetooth: Add rfkill code to driver
Date: Sun,  3 May 2015 17:44:27 -0600
Message-ID: <1430696667-12385-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:32830 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751160AbbECXoc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 3 May 2015 19:44:32 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

These patches add support to use the rfkill core functionality to the
Toshiba bluetooth driver and adapting the existing code to it.

Changes since v1:
- Merged patches two and six to avoid a broken dependency
- Merged patches three and four
- The debug message is now printed in one line instead of three
- Typos in comments

Azael Avalos (4):
  toshiba_bluetooth: Add a container struct named toshiba_bluetooth_dev
  toshiba_bluetooth: Add RFKill handler functions
  toshiba_bluetooth: Adapt *_enable, *_notify and *_resume functions to
    rfkill
  toshiba_bluetooth: Change BT status message to debug

 drivers/platform/x86/Kconfig             |   1 +
 drivers/platform/x86/toshiba_bluetooth.c | 174 ++++++++++++++++++++++++-------
 2 files changed, 135 insertions(+), 40 deletions(-)

-- 
2.3.6
