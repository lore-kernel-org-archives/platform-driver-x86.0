From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 0/4] platform/x86: Fix check for method instance number
Date: Sat, 12 Aug 2017 09:44:14 +0200
Message-ID: <1502523858-25716-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33561 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750975AbdHLHph (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 12 Aug 2017 03:45:37 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>

This patch series fixes remaining mxm-wmi and asus-wmi drivers to evaluate
WMI methods with correct and available instance number. Now all WMI drivers
should call WMI functions with correct instance number and last patch fixes
WMI check for invalid instances. Patch for paeq-wmi is optional as machine
has 10 instances but instance number is ignored at all. But for consistency
with other drivers first instance would be used (instead of second).

Pali Rohár (4):
  platform/x86: mxm-wmi: Evaluate wmi method with instance number 0x0
  platform/x86: asus-wmi: Evaluate wmi method with instance number 0x0
  platform/x86: peaq-wmi: Evaluate wmi method with instance number 0x0
  platform/x86: wmi: Fix check for method instance number

 drivers/platform/x86/asus-wmi.c |    4 ++--
 drivers/platform/x86/mxm-wmi.c  |    4 ++--
 drivers/platform/x86/peaq-wmi.c |    2 +-
 drivers/platform/x86/wmi.c      |    6 +++---
 4 files changed, 8 insertions(+), 8 deletions(-)

-- 
1.7.9.5
