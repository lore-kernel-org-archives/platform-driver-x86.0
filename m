From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v8 11/15] platform/x86: dell-smbios-smm: test for WSMT
Date: Sat, 14 Oct 2017 00:32:49 -0500
Message-ID: <652a47850d3bd966845ffeec7e49efdd03da1e80.1507958847.git.mario.limonciello@dell.com>
References: <cover.1507958847.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1507958847.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1507958847.git.mario.limonciello@dell.com>
References: <cover.1507958847.git.mario.limonciello@dell.com>
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
---
 drivers/platform/x86/dell-smbios-smm.c | 33 +++++++++++++++++++++++++++++++++
 drivers/platform/x86/dell-smbios.h     |  2 ++
 2 files changed, 35 insertions(+)

diff --git a/drivers/platform/x86/dell-smbios-smm.c b/drivers/platform/x86/dell-smbios-smm.c
index bd5a63a4aa15..5a03a3ea51e0 100644
--- a/drivers/platform/x86/dell-smbios-smm.c
+++ b/drivers/platform/x86/dell-smbios-smm.c
@@ -101,6 +101,31 @@ int dell_smbios_smm_call(struct calling_interface_buffer *input)
 	return 0;
 }
 
+/* When enabled this indicates that SMM won't work */
+static int test_wsmt_enabled(void)
+{
+	struct calling_interface_token *token;
+
+	/* if token doesn't exist, SMM will work */
+	token = dell_smbios_find_token(WSMT_EN_TOKEN);
+	if (!token)
+		return 0;
+
+	/* if token exists, try to access over SMM */
+	buffer->class = CLASS_TOKEN_READ;
+	buffer->select = SELECT_TOKEN_STD;
+	memset(buffer, 0, sizeof(struct calling_interface_buffer));
+	buffer->input[0] = token->location;
+	dell_smbios_smm_call(buffer);
+
+	/* if lookup failed, we know WSMT was enabled */
+	if (buffer->output[0] != 0)
+		return 1;
+
+	/* query token status if it didn't fail */
+	return (buffer->output[1] == token->value);
+}
+
 static int __init dell_smbios_smm_init(void)
 {
 	int ret;
@@ -114,6 +139,13 @@ static int __init dell_smbios_smm_init(void)
 
 	dmi_walk(find_cmd_address, NULL);
 
+	ret = test_wsmt_enabled();
+	pr_debug("WSMT enable test: %d\n", ret);
+	if (ret) {
+		ret = -ENODEV;
+		goto fail_wsmt;
+	}
+
 	platform_device = platform_device_alloc("dell-smbios", 1);
 	if (!platform_device) {
 		ret = -ENOMEM;
@@ -137,6 +169,7 @@ static int __init dell_smbios_smm_init(void)
 fail_platform_device_add:
 	platform_device_put(platform_device);
 
+fail_wsmt:
 fail_platform_device_alloc:
 	free_page((unsigned long)buffer);
 	return ret;
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/dell-smbios.h
index 8df330abeb5d..db6a16e5f87c 100644
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
