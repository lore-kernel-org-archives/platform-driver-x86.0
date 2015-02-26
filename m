From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 0/3] toshiba_haps: Some misc changes plus sysfs entries documentation
Date: Thu, 26 Feb 2015 10:58:29 -0700
Message-ID: <1424973511-3090-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:52551 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751472AbbBZR6m (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 Feb 2015 12:58:42 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

These patches make some misc chanes to the driver, replacing sscanf with
kstrtoint, DEVICE_ATTR_{RW, WO} macros and adding documentation about
the sysfs entries.

Azael Avalos (3):
  toshiba_haps: Replace sscanf with kstrtoint
  toshiba_haps: Make use of DEVICE_ATTR_{RW, WO} macros
  Documentation/ABI: Add file describing the sysfs entries for
    toshiba_haps

 .../ABI/testing/sysfs-driver-toshiba_haps          | 20 ++++++++++++++
 drivers/platform/x86/toshiba_haps.c                | 32 ++++++++++++++--------
 2 files changed, 40 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-toshiba_haps

-- 
2.2.2
