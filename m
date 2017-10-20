From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v11 11/15] platform/x86: dell-smbios-smm: test for WSMT
Date: Fri, 20 Oct 2017 12:40:26 -0500
Message-ID: <4d949817a32f20f77ae9e2419f2261f806a9acc4.1508515469.git.mario.limonciello@dell.com>
References: <cover.1508515469.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1508515469.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1508515469.git.mario.limonciello@dell.com>
References: <cover.1508515469.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

WSMT is as an attestation to the OS that the platform won't
modify memory outside of pre-defined areas.

If a platform has WSMT enabled in BIOS setup, SMM calls through
dcdbas will fail.  The only way to access platform data in these
instances is through the WMI SMBIOS calling interface.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
Reviewed-by: Edward O'Callaghan <quasisec@google.com>
---
 drivers/platform/x86/dell-smbios-smm.c | 33 +++++++++++++++++++++++++++++++++
 drivers/platform/x86/dell-smbios.h     |  2 ++
 2 files changed, 35 insertions(+)

diff --git a/drivers/platform/x86/dell-smbios-smm.c b/drivers/platform/x86/dell-smbios-smm.c
index 53eabb14fb48..0c21a8adb91f 100644
--- a/drivers/platform/x86/dell-smbios-smm.c
+++ b/drivers/platform/x86/dell-smbios-smm.c
@@ -102,6 +102,32 @@ int dell_smbios_smm_call(struct calling_interface_buffer *input)
 	return 0;
 }
 
+/* When enabled this indicates that SMM won't work */
+static bool test_wsmt_enabled(void)
+{
+	struct calling_interface_token *wsmt;
+
+	/* if token doesn't exist, SMM will work */
+	wsmt = dell_smbios_find_token(WSMT_EN_TOKEN);
+	if (!wsmt)
+		return false;
+
+	/* If token exists, try to access over SMM but set a dummy return.
+	 * - If WSMT disabled it will be overwritten by SMM
+	 * - If WSMT enabled then dummy value will remain
+	 */
+	buffer->class = CLASS_TOKEN_READ;
+	buffer->select = SELECT_TOKEN_STD;
+	memset(buffer, 0, sizeof(struct calling_interface_buffer));
+	buffer->input[0] = wsmt->location;
+	buffer->output[0] = 99;
+	dell_smbios_smm_call(buffer);
+	if (buffer->output[0] == 99)
+		return true;
+
+	return false;
+}
+
 static int __init dell_smbios_smm_init(void)
 {
 	int ret;
@@ -115,6 +141,12 @@ static int __init dell_smbios_smm_init(void)
 
 	dmi_walk(find_cmd_address, NULL);
 
+	if (test_wsmt_enabled()) {
+		pr_debug("Disabling due to WSMT enabled\n");
+		ret = -ENODEV;
+		goto fail_wsmt;
+	}
+
 	platform_device = platform_device_alloc("dell-smbios", 1);
 	if (!platform_device) {
 		ret = -ENOMEM;
@@ -138,6 +170,7 @@ static int __init dell_smbios_smm_init(void)
 fail_platform_device_add:
 	platform_device_put(platform_device);
 
+fail_wsmt:
 fail_platform_device_alloc:
 	free_page((unsigned long)buffer);
 	return ret;
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/dell-smbios.h
index 079776421b46..956fe9304ed7 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -44,6 +44,8 @@
 #define KBD_LED_AUTO_100_TOKEN	0x02F6
 #define GLOBAL_MIC_MUTE_ENABLE	0x0364
 #define GLOBAL_MIC_MUTE_DISABLE	0x0365
+#define WSMT_EN_TOKEN		0x04EC
+#define WSMT_DIS_TOKEN		0x04ED
 
 struct notifier_block;
 
-- 
2.14.1
