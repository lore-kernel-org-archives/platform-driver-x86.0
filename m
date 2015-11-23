From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v3 0/2] toshiba_acpi: Add WWAN support
Date: Mon, 23 Nov 2015 10:49:09 -0700
Message-ID: <1448300951-5492-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

These two patches add WWAN support to the driver, the first adds the actual
support functions and the second adds RFKill handler functions to set the
device status according to the killswitch.

Changes since v2:
- Changed code according to review comments

Changes since v1:
- Added missing calls to rfkill_unregister and rfkill_destroy functions

Azael Avalos (2):
  toshiba_acpi: Add support for WWAN devices
  toshiba_acpi: Add WWAN RFKill support

 drivers/platform/x86/toshiba_acpi.c | 188 +++++++++++++++++++++++++++++++++++-
 1 file changed, 185 insertions(+), 3 deletions(-)

-- 
2.6.3
