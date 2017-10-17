From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v9 16/17] platform/x86: shuffle headers to export for userspace
Date: Tue, 17 Oct 2017 13:22:00 -0500
Message-ID: <e89eca29a958f70ea2f7a6c7b3022d7e5a1ef7d4.1508259916.git.mario.limonciello@dell.com>
References: <cover.1508259916.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1508259916.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1508259916.git.mario.limonciello@dell.com>
References: <cover.1508259916.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

All whitelisted commands and tokens should be shared out to userspace so
applications don't need to define them in their own headers.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/dell-smbios.h | 19 -------------------
 include/uapi/linux/wmi.h           | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/dell-smbios.h
index edb9ece06451..db4b22731c7b 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -20,21 +20,8 @@
 #include <uapi/linux/wmi.h>
 
 /* Common classes and selects*/
-#define CLASS_TOKEN_READ 0
-#define CLASS_TOKEN_WRITE 1
-#define SELECT_TOKEN_STD 0
-#define SELECT_TOKEN_BAT 1
-#define SELECT_TOKEN_AC 2
 #define CLASS_KBD_BACKLIGHT 4
 #define SELECT_KBD_BACKLIGHT 11
-#define CLASS_FLASH_INTERFACE 7
-#define SELECT_FLASH_INTERFACE 3
-#define CLASS_ADMIN_PROP 10
-#define SELECT_ADMIN_PROP 3
-#define CLASS_INFO 17
-#define SELECT_RFKILL 11
-#define SELECT_APP_REGISTRATION	3
-#define SELECT_DOCK 22
 
 /* Tokens used in kernel drivers, any of these
  * should be filtered from userspace access
@@ -51,12 +38,6 @@
 #define GLOBAL_MIC_MUTE_ENABLE	0x0364
 #define GLOBAL_MIC_MUTE_DISABLE	0x0365
 
-/* tokens whitelisted to userspace use */
-#define CAPSULE_EN_TOKEN	0x0461
-#define CAPSULE_DIS_TOKEN	0x0462
-#define WSMT_EN_TOKEN		0x04EC
-#define WSMT_DIS_TOKEN		0x04ED
-
 struct notifier_block;
 
 struct calling_interface_token {
diff --git a/include/uapi/linux/wmi.h b/include/uapi/linux/wmi.h
index 622e4004bcfc..5ff61f2d37ba 100644
--- a/include/uapi/linux/wmi.h
+++ b/include/uapi/linux/wmi.h
@@ -46,6 +46,27 @@ struct dell_wmi_smbios_buffer {
 	struct dell_wmi_extensions	ext;
 } __packed;
 
+/* Whitelisted smbios class/select commands */
+#define CLASS_TOKEN_READ	0
+#define CLASS_TOKEN_WRITE	1
+#define SELECT_TOKEN_STD	0
+#define SELECT_TOKEN_BAT	1
+#define SELECT_TOKEN_AC		2
+#define CLASS_FLASH_INTERFACE	7
+#define SELECT_FLASH_INTERFACE	3
+#define CLASS_ADMIN_PROP	10
+#define SELECT_ADMIN_PROP	3
+#define CLASS_INFO		17
+#define SELECT_RFKILL		11
+#define SELECT_APP_REGISTRATION	3
+#define SELECT_DOCK		22
+
+/* whitelisted tokens */
+#define CAPSULE_EN_TOKEN	0x0461
+#define CAPSULE_DIS_TOKEN	0x0462
+#define WSMT_EN_TOKEN		0x04EC
+#define WSMT_DIS_TOKEN		0x04ED
+
 /* Dell SMBIOS calling IOCTL command used by dell-smbios-wmi */
 #define DELL_WMI_SMBIOS_CMD	_IOWR(WMI_IOC, 0, struct dell_wmi_smbios_buffer)
 
-- 
2.14.1
