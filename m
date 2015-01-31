From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 0/6] toshiba_acpi: Add new features plus some profs ports
Date: Sat, 31 Jan 2015 12:41:22 -0700
Message-ID: <1422733288-11733-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

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
