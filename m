From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 0/2] toshiba_acpi: Add WWAN support
Date: Thu, 19 Nov 2015 08:49:23 -0700
Message-ID: <1447948165-2343-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Fabian Koester <fabian.koester@bringnow.com>, Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

These two patches add WWAN support to the driver, the first adds the actual
support functions and the second adds RFKill handler functions to set the
device status according to the killswitch.

Changes since v1:
- Added missing calls to rfkill_unregister and rfkill_destroy functions

Azael Avalos (2):
  toshiba_acpi: Add support for WWAN devices
  toshiba_acpi: Add WWAN RFKill support

 drivers/platform/x86/toshiba_acpi.c | 171 ++++++++++++++++++++++++++++++++++++
 1 file changed, 171 insertions(+)

-- 
2.6.2
