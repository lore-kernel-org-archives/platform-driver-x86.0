From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH resend 0/6] toshiba_acpi: Add new features plus some procfs ports
Date: Mon,  9 Feb 2015 20:34:48 -0700
Message-ID: <1423539294-2941-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:50560 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751583AbbBJDfK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 Feb 2015 22:35:10 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

These patches add five new files to sysfs.

With the first two files we are paving the way to the (hopefully)
future removal of the (now deprecated) proc entries. The remaining
entries were not ported due to the fact that they duplicate existing
kernel functionality (eg.: lcd <-> backlight, keys <-> input).

The rest add support for new features found on recent Toshiba laptops.

And the last one simply bump up the driver version.

Azael Avalos (6):
  toshiba_acpi: Add version entry to sysfs
  toshiba_acpi: Add fan entry to sysfs
  toshiba_acpi: Add support for Keyboard functions mode
  toshiba_acpi: Add support for Panel Power ON
  toshiba_acpi: Add support to enable/disable USB 3
  toshiba_acpi: Bump version number to 0.21

 drivers/platform/x86/toshiba_acpi.c | 364 +++++++++++++++++++++++++++++++++++-
 1 file changed, 360 insertions(+), 4 deletions(-)

-- 
2.2.2
