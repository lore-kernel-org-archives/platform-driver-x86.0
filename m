From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH 0/2] platform: x86: ChromeOS ACPI
Date: Mon, 31 Jul 2017 15:03:16 +0200
Message-ID: <20170731130318.22976-1-enric.balletbo@collabora.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49825 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751997AbdGaND3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 Jul 2017 09:03:29 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Benson Leung <bleung@chromium.org>, Olof Johansson <olof@lixom.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

Dear all,

The following series adds a ChromeOS ACPI device and export some values
reported by the ACPI in a sysfs directory. The patches comes from the
ChromeOS kernel and were originally created by Olof Johansson. These
are just a squashed version with few modifications.

One doubt that I have is that I'm not sure if the chromeos_acpi driver
should reside in drivers/platform/x86/ or in drivers/platform/chrome.
Any preference on this?

Best regards,
  Enric

Oloi Johansson (2):
  platform: chrome: add ChromeOS specific platform functions
  platform: x86: add ACPI driver for ChromeOS.

 drivers/platform/chrome/Kconfig      |   8 +
 drivers/platform/chrome/Makefile     |   2 +-
 drivers/platform/chrome/chromeos.c   |  28 ++
 drivers/platform/chrome/chromeos.h   |  49 +++
 drivers/platform/x86/Kconfig         |   9 +
 drivers/platform/x86/Makefile        |   1 +
 drivers/platform/x86/chromeos_acpi.c | 792 +++++++++++++++++++++++++++++++++++
 7 files changed, 888 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/chrome/chromeos.c
 create mode 100644 drivers/platform/chrome/chromeos.h
 create mode 100644 drivers/platform/x86/chromeos_acpi.c

-- 
2.9.3
