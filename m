From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 0/3] toshiba_acpi: Add support for Cooling Method
Date: Mon, 25 Jan 2016 11:29:09 -0700
Message-ID: <1453746551-17496-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f193.google.com ([209.85.214.193]:34539 "EHLO
	mail-ob0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757987AbcAYS31 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 25 Jan 2016 13:29:27 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

These patches add support for the Cooling Method feature found in most
Toshiba laptops, allowing userspace to control the desired cooling method,
which are the following:
0 - Maximum Performance
1 - Peformance
2 - Battery Optimized

The Cooling Method feature basically controls the speed of the system fan,
setting the speed (and quietness) according to the selected method.

The default value at every boot is zero (Maximum Performance), on Windows,
Toshiba provides hooks to the power management system, allowing
the user to change it according to their needs and/or the AC adapter state.


Azael Avalos (3):
  toshiba_acpi: Add support for cooling method feature
  toshiba_acpi: Add sysfs entries for th Cooling Method feature
  Documentation/ABI: Update sysfs-driver-toshiba_acpi file

 .../ABI/testing/sysfs-driver-toshiba_acpi          |  16 ++++
 drivers/platform/x86/toshiba_acpi.c                | 105 +++++++++++++++++++++
 2 files changed, 121 insertions(+)

-- 
2.7.0
