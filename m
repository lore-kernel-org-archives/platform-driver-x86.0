From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 0/3] toshiba_acpi: Fix USB Sleep & Charge mode and documentation updates
Date: Fri, 27 Mar 2015 15:09:23 -0600
Message-ID: <1427490565-6363-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch fixes the USB Sleep & Charge charging mode on certain
models, fixes some typos in pr_* messages and also adds the missing
entries in the documentation file.

Azael Avalos (3):
  toshiba_acpi: Update and fix USB Sleep and Charge modes
  toshiba_acpi: Fix typos in pr_* messages from USB Fleep Functions
  Documentation/ABI: Update sysfs-driver-toshiba_acpi entry

 .../ABI/testing/sysfs-driver-toshiba_acpi          | 93 +++++++++++++++++++---
 drivers/platform/x86/toshiba_acpi.c                | 77 ++++++++++++++----
 2 files changed, 140 insertions(+), 30 deletions(-)

-- 
2.2.2
