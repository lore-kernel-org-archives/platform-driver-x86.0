From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH 0/3] Enable ASUS ET2012 All-in-One platform
Date: Fri,  9 Mar 2012 10:17:06 +0800
Message-ID: <1331259429-6216-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:38248 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757812Ab2CICRP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 8 Mar 2012 21:17:15 -0500
Received: by yenl12 with SMTP id l12so658108yen.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Mar 2012 18:17:14 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

Enable ASUS ET2012 all-in-one series PCs.

AceLan Kao (3):
  asus-wmi: add scalar board brightness adj. support
  asus-wmi: report brightness key events
  asus-wmi: store backlight power status for AIO machine

 drivers/platform/x86/asus-wmi.c  |   55 ++++++++++++++++++++++++++++++-------
 drivers/platform/x86/asus-wmi.h  |    4 +++
 drivers/platform/x86/eeepc-wmi.c |   24 ++++++++++++++++
 3 files changed, 72 insertions(+), 11 deletions(-)

-- 
1.7.9
