From: =?UTF-8?q?Miguel=20G=C3=B3mez?= <magomez@igalia.com>
Subject: [PATCH] classmate-laptop: Fix extra keys hardware id.
Date: Tue, 24 Jul 2012 15:05:25 +0200
Message-ID: <1343135125-18733-1-git-send-email-magomez@igalia.com>
References: <20120724030946.GA2742@nautilus.holoscopio.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp3.mundo-r.com ([212.51.32.191]:16304 "EHLO
	smtp4.mundo-r.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753726Ab2GXNF7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 Jul 2012 09:05:59 -0400
In-Reply-To: <20120724030946.GA2742@nautilus.holoscopio.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: cascardo@holoscopio.com, don@syst.com.br, mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Miguel=20G=C3=B3mez?= <magomez@igalia.com>

Since ACPI devices ids were changed to use always upper-case letters, t=
he ACPI
id of the extra keys (FNBT0000) was not maching the one defined in the =
driver
(FnBT0000), causing the extra keys not to work.

The patch replaces the driver id with the one reported by ACPI, fixing =
the
problem.

Signed-off-by: Miguel G=C3=B3mez <magomez@igalia.com>
---
 drivers/platform/x86/classmate-laptop.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/classmate-laptop.c b/drivers/platform=
/x86/classmate-laptop.c
index e2230a2..43e6e54 100644
--- a/drivers/platform/x86/classmate-laptop.c
+++ b/drivers/platform/x86/classmate-laptop.c
@@ -39,7 +39,7 @@ struct cmpc_accel {
 #define CMPC_ACCEL_HID		"ACCE0000"
 #define CMPC_TABLET_HID		"TBLT0000"
 #define CMPC_IPML_HID	"IPML200"
-#define CMPC_KEYS_HID		"FnBT0000"
+#define CMPC_KEYS_HID		"FNBT0000"
=20
 /*
  * Generic input device code.
--=20
1.7.9.5
