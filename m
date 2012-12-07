From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH v3 08/12] msi-wmi: Avoid repeating constants
Date: Fri,  7 Dec 2012 15:49:18 +0200
Message-ID: <1354888162-12109-9-git-send-email-maxtram95@gmail.com>
References: <1354888162-12109-1-git-send-email-maxtram95@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:62343 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030475Ab2LGNuI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 7 Dec 2012 08:50:08 -0500
Received: by mail-ee0-f46.google.com with SMTP id e53so289080eek.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Dec 2012 05:50:07 -0800 (PST)
In-Reply-To: <1354888162-12109-1-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, jlee@suse.com, anisse@astier.eu
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>

Use GUID defines in MODULE_ALIAS strings to avoid repeating strings.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
---
 drivers/platform/x86/msi-wmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
index b96766b..4db0c55 100644
--- a/drivers/platform/x86/msi-wmi.c
+++ b/drivers/platform/x86/msi-wmi.c
@@ -34,14 +34,14 @@ MODULE_AUTHOR("Thomas Renninger <trenn@suse.de>");
 MODULE_DESCRIPTION("MSI laptop WMI hotkeys driver");
 MODULE_LICENSE("GPL");
 
-MODULE_ALIAS("wmi:551A1F84-FBDD-4125-91DB-3EA8F44F1D45");
-MODULE_ALIAS("wmi:B6F3EEF2-3D2F-49DC-9DE3-85BCE18C62F2");
-
 #define DRV_NAME "msi-wmi"
 
 #define MSIWMI_BIOS_GUID "551A1F84-FBDD-4125-91DB-3EA8F44F1D45"
 #define MSIWMI_EVENT_GUID "B6F3EEF2-3D2F-49DC-9DE3-85BCE18C62F2"
 
+MODULE_ALIAS("wmi:" MSIWMI_BIOS_GUID);
+MODULE_ALIAS("wmi:" MSIWMI_EVENT_GUID);
+
 #define SCANCODE_BASE 0xD0
 #define MSI_WMI_BRIGHTNESSUP   SCANCODE_BASE
 #define MSI_WMI_BRIGHTNESSDOWN (SCANCODE_BASE + 1)
-- 
1.8.0.1
