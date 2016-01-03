From: Andy Lutomirski <luto@kernel.org>
Subject: [PATCH] intel-hid: Fix build failure when CONFIG_INTEL_HID_EVENT=m
Date: Sun,  3 Jan 2016 06:54:36 -0800
Message-ID: <8c329ffac51276860bff1911a0f257dd108ee5e8.1451832665.git.luto@kernel.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:35689 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751405AbcACOyv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 3 Jan 2016 09:54:51 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, Sedat Dilek <sedat.dilek@gmail.com>, Andy Lutomirski <luto@kernel.org>

From: Sedat Dilek <sedat.dilek@gmail.com>

When building with CONFIG_INTEL_HID_EVENT=m on Andy's luto.git#xps13
Git branch I see the following build failure:

ERROR: "sparse_keymap_setup" [drivers/platform/x86/intel-hid.ko] undefined!
ERROR: "sparse_keymap_report_event" [drivers/platform/x86/intel-hid.ko] undefined!

Looks like 'select INPUT_SPARSEKMAP' is missing.

Fixes: cd8d25841a65 ("intel-hid: new hid event driver for hotkeys")
[andy: fixed commit hash above]
CC: Alex Hung <alex.hung@canonical.com>
CC: Andy Lutomirski <luto@kernel.org>
Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
Signed-off-by: Andy Lutomirski <luto@kernel.org>
---

Hi Alex and Darren-

I'm relaying this fix from Sedat with a trivial correction.

drivers/platform/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index d0bfcf8e8b8e..9d7704e51366 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -736,6 +736,7 @@ config INTEL_HID_EVENT
 	tristate "INTEL HID Event"
 	depends on ACPI
 	depends on INPUT
+	select INPUT_SPARSEKMAP
 	help
 	  This driver provides support for the Intel HID Event hotkey interface.
 	  Some laptops require this driver for hotkey support.
-- 
2.5.0
