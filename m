From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 0/5] toshiba_acpi: Clean file plus some function renames
Date: Tue, 10 Feb 2015 23:43:55 -0700
Message-ID: <1423637040-6813-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:52425 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750840AbbBKGoG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 11 Feb 2015 01:44:06 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

These patches are simply "cleaning" the file, making it more readable
and in the process, make it comply according to coding style.

--->8---
Darren,

I'm sending these patches now and let you decide if you want them for
3.20 as the merge window is still open or queue them up for 3.21 :-)
---8<---

Azael Avalos (5):
  toshiba_acpi: Clean file according to coding style
  Documentation/ABI: Add file describing the sysfs entries for
    toshiba_acpi
  toshiba_acpi: Move sysfs function and struct declarations further down
  toshiba_acpi: Drop the toshiba_ prefix from sysfs function names
  toshiba_acpi: Make use of DEVICE_ATTR_{RO, RW} macros

 .../ABI/testing/sysfs-driver-toshiba_acpi          | 114 +++++++
 drivers/platform/x86/toshiba_acpi.c                | 344 ++++++++-------------
 2 files changed, 237 insertions(+), 221 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-toshiba_acpi

-- 
2.2.2
