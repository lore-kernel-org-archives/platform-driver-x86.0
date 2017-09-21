From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH 02/12] platform/x86: dell-wmi: Don't match on descriptor GUID modalias
Date: Thu, 21 Sep 2017 08:57:07 -0500
Message-ID: <e095a34ec411e46a6e890f5215b1f85ee7338795.1505999739.git.mario.limonciello@dell.com>
References: <cover.1505999739.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1505999739.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1505999739.git.mario.limonciello@dell.com>
References: <cover.1505999739.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

The descriptor GUID is not used to indicate that WMI notifications
in the dell-wmi driver work properly.  As such a modalias should
not be present that causes this driver to load on systems with this
GUID.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/dell-wmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index 28d9f8696081..1fbef560ca67 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -51,7 +51,6 @@ MODULE_LICENSE("GPL");
 static bool wmi_requires_smbios_request;
 
 MODULE_ALIAS("wmi:"DELL_EVENT_GUID);
-MODULE_ALIAS("wmi:"DELL_DESCRIPTOR_GUID);
 
 struct dell_wmi_priv {
 	struct input_dev *input_dev;
-- 
2.14.1
