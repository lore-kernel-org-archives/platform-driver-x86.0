From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v5 0/5] Process Dell Instant Launch hotkey on Vostro V131 and Inspiron M5110
Date: Fri,  4 Mar 2016 14:09:05 +0100
Message-ID: <1457096950-29838-1-git-send-email-kernel@kempniu.pl>
References: <1456298416-29683-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f195.google.com ([209.85.217.195]:32840 "EHLO
	mail-lb0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750932AbcCDNIJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 4 Mar 2016 08:08:09 -0500
Received: by mail-lb0-f195.google.com with SMTP id bc4so4874727lbc.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 04 Mar 2016 05:08:08 -0800 (PST)
In-Reply-To: <1456298416-29683-1-git-send-email-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

This patch series makes use of the API exported by dell-smbios, so it
should be applied to either testing or dell-smbios.

Pali, I added your Reviewed-by/Acked-by tags to all patches except 4/5;
it is the last one awaiting your approval.

Changes from v4:

  - Filter Dell Instant Launch hotkey based on reported keycode instead
    of mapped keycode (patch 4/5)

  - Added further explanations to the commit message for patch 4/5

Changes from v3:

  - Extract code issuing the WMI-controlling SMBIOS request into a
    separate function

  - Document the SMBIOS request used

  - Split keymap section "Shortcut and audio panel keys" into two
    separate sections

Changes from v2:

  - Use a static variable instead of a quirk structure

  - Use API exported by dell-smbios to issue the SMBIOS request required
    for generating WMI events, returning with error from dell_wmi_init()
    if it fails

  - Move dell_smi_error() from dell-laptop to dell-smbios and use it to
    determine error code for returning from dell_wmi_init() when
    enabling WMI fails

  - Support Dell Inspiron M5110

Changes from v1:

  - Use DMI matching instead of a module parameter
  - Change flag name to improve readability

 drivers/platform/x86/Kconfig       |    1 +
 drivers/platform/x86/dell-laptop.c |   30 ++++---------
 drivers/platform/x86/dell-smbios.c |   16 +++++++
 drivers/platform/x86/dell-smbios.h |    2 +
 drivers/platform/x86/dell-wmi.c    |   84 +++++++++++++++++++++++++++++++++++-
 5 files changed, 109 insertions(+), 24 deletions(-)

-- 
1.7.10.4
