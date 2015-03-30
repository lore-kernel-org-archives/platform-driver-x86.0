From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 0/3] toshiba_acpi: Fix USB Sleep & Charge mode and documentation updates
Date: Sun, 29 Mar 2015 19:25:38 -0600
Message-ID: <1427678740-5459-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch fixes the USB Sleep & Charge charging mode on certain
models, fixes pr_* messages and also adds the missing entries in the
documentation file.

Changes since v1:
- Set the default supported value of sleep and charge to zero in case
  of an error and added comments.
- Updated the title and commit message of second patch to better
  reflect what the patch is doing.

Azael Avalos (3):
  toshiba_acpi: Update and fix USB Sleep and Charge modes
  toshiba_acpi: Fix pr_* messages from USB Sleep Functions
  Documentation/ABI: Update sysfs-driver-toshiba_acpi entry

 .../ABI/testing/sysfs-driver-toshiba_acpi          | 93 +++++++++++++++++++---
 drivers/platform/x86/toshiba_acpi.c                | 85 ++++++++++++++++----
 2 files changed, 148 insertions(+), 30 deletions(-)

-- 
2.2.2
