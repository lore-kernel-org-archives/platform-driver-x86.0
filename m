From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v3 0/3] toshiba_acpi: Fix USB Sleep & Charge mode and documentation updates
Date: Thu,  2 Apr 2015 19:26:19 -0600
Message-ID: <1428024381-3823-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:36617 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753041AbbDCB02 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 2 Apr 2015 21:26:28 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch fixes the USB Sleep & Charge charging mode on certain
models, fixes pr_* messages and also adds the missing entries in the
documentation file.

Changes since v2:
- Check for TOS_SUCCESS to initialize and flag as supported on first
  patch

Changes since v1:
- Set the default supported value of sleep and charge to zero in case
  of an error and added comments.
- Updated the title and commit message of second patch to better
  reflect what the patch is doing.

Azael Avalos (3):
  toshiba_acpi: Update and fix USB Sleep and Charge modes
  toshiba_acpi: Fix pr_* messages from USB Sleep Functions
  Documentation/ABI: Update sysfs-driver-toshiba_acpi entry

 .../ABI/testing/sysfs-driver-toshiba_acpi          | 93 +++++++++++++++++++---
 drivers/platform/x86/toshiba_acpi.c                | 87 ++++++++++++++++----
 2 files changed, 150 insertions(+), 30 deletions(-)

-- 
2.3.4
