From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 0/3] platform/x86: Toshiba built-in accelerometer support
Date: Thu, 14 Aug 2014 09:53:07 -0600
Message-ID: <1408031590-2727-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:34386 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755586AbaHNPxj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 14 Aug 2014 11:53:39 -0400
Received: by mail-oi0-f46.google.com with SMTP id i138so852797oig.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Aug 2014 08:53:38 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garret <matthew.garret@nebula.com>, platform-driver-x86@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

Up for review.

The following series of patches add support for the
built-in accelerometer found on recent Toshiba laptops
with HID TOS620A.

Changes from v1 include:
- Dropped the "movement" sysfs file, now the events
  are being propagated to userspace via netlink, since
  the time between vibration/stabilization events is
  ~1 second, let us propagate the events and let
  userspace act accordingly
- Fixed some typos in toshiba_acpi.txt
- Fixed build of module, the Makefile now has propper
  build support

Azael Avalos (3):
  platform/x86: Toshiba HDD Active Protection Sensor
  Documentation: Add file about toshiba_haps module
  platform/x86: Enable build support for toshiba_haps

 Documentation/laptops/00-INDEX         |   2 +
 Documentation/laptops/toshiba_haps.txt |  76 ++++++++++
 drivers/platform/x86/Kconfig           |  19 +++
 drivers/platform/x86/Makefile          |   1 +
 drivers/platform/x86/toshiba_haps.c    | 269 +++++++++++++++++++++++++++++++++
 5 files changed, 367 insertions(+)
 create mode 100644 Documentation/laptops/toshiba_haps.txt
 create mode 100644 drivers/platform/x86/toshiba_haps.c

-- 
2.0.0
