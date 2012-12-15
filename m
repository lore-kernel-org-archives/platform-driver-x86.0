From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH v4 08/12] msi-wmi: Avoid repeating constants
Date: Sat, 15 Dec 2012 19:31:32 +0200
Message-ID: <1355592696-15454-9-git-send-email-maxtram95@gmail.com>
References: <1355592696-15454-1-git-send-email-maxtram95@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:41104 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750795Ab2LORdH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 15 Dec 2012 12:33:07 -0500
Received: by mail-ea0-f174.google.com with SMTP id e13so1774034eaa.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Dec 2012 09:33:06 -0800 (PST)
In-Reply-To: <1355592696-15454-1-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, jlee@suse.com, anisse@astier.eu
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>

Use UUID defines in MODULE_ALIAS strings to avoid repeating strings.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
Acked-by: Lee, Chun-Yi <jlee@suse.com>
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
