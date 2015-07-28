From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 0/4] toshiba_acpi: Refactor *{get, set} and *available functions
Date: Mon, 27 Jul 2015 19:22:24 -0600
Message-ID: <1438046548-3081-2-git-send-email-coproscefalo@gmail.com>
References: <1438046548-3081-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438046548-3081-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

These patches changes the *{get, set} and *available functions,
changes the printed messages of the supported features and bumps the
driver version to 0.23.

Changes since v1:
- Fixed typos in patch 01 description and use newly created
  *led_registered variables to unregister leds
- Adapt *{lcd, video}_proc functions in patch 03 to ensure we are not
  breaking userspace and updated patch description

Azael Avalos (4):
  toshiba_acpi: Change *available functions return type
  toshiba_acpi: Remove "*not supported" feature prints
  toshiba_acpi: Refactor *{get, set} functions return value
  toshiba_acpi: Bump driver version to 0.23

 drivers/platform/x86/toshiba_acpi.c | 643 ++++++++++++++++++------------------
 1 file changed, 322 insertions(+), 321 deletions(-)

-- 
2.4.6
