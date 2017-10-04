From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v4 10/14] platform/x86: dell-smbios-smm: test for WSMT
Date: Wed,  4 Oct 2017 17:48:36 -0500
Message-ID: <1e16313531397b43c16e147a3a5ad9e74ca3428a.1507156392.git.mario.limonciello@dell.com>
References: <cover.1507156392.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1507156392.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1507156392.git.mario.limonciello@dell.com>
References: <cover.1507156392.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

WSMT is as an attestation to the OS that the platform won't
modify memory outside of pre-defined areas.

If a platform has WSMT enabled in BIOS setup, SMM calls through
dcdbas will fail.  The only way to access platform data in these
instances is through the WMI SMBIOS calling interface.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/dell-smbios-smm.c | 36 ++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/platform/x86/dell-smbios-smm.c b/drivers/platform/x86/dell-smbios-smm.c
index 2e1c5d2dfd61..3271e9a876e9 100644
--- a/drivers/platform/x86/dell-smbios-smm.c
+++ b/drivers/platform/x86/dell-smbios-smm.c
@@ -25,6 +25,8 @@ static struct calling_interface_buffer *buffer;
 struct platform_device *platform_device;
 static DEFINE_MUTEX(smm_mutex);
 
+#define WSMT_EN_TOKEN	0x04EC
+
 static const struct dmi_system_id dell_device_table[] __initconst = {
 	{
 		.ident = "Dell laptop",
@@ -76,6 +78,32 @@ void dell_smbios_smm_call(struct calling_interface_buffer *input)
 }
 EXPORT_SYMBOL_GPL(dell_smbios_smm_call);
 
+static int test_wsmt_enabled(void)
+{
+	struct calling_interface_token *token;
+	int ret;
+
+	/* if token doesn't exist, SMM will work */
+	token = dell_smbios_find_token(WSMT_EN_TOKEN);
+	if (!token)
+		return 0;
+
+	/* if token exists, try to access over SMM */
+	buffer->class = 0;
+	buffer->select = 0;
+	memset(buffer, 0, sizeof(struct calling_interface_buffer));
+	buffer->input[0] = token->location;
+	dell_smbios_smm_call(buffer);
+
+	/* if lookup failed, we know WSMT was enabled */
+	if (buffer->output[0] != 0)
+		return 1;
+
+	/* query token status if it didn't fail */
+	ret = (buffer->output[1] == token->value);
+	return ret;
+}
+
 static int __init dell_smbios_smm_init(void)
 {
 	int ret;
@@ -88,6 +116,13 @@ static int __init dell_smbios_smm_init(void)
 		return -ENOMEM;
 	dell_smbios_get_smm_address(&da_command_address, &da_command_code);
 
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
@@ -111,6 +146,7 @@ static int __init dell_smbios_smm_init(void)
 fail_platform_device_add:
 	platform_device_put(platform_device);
 
+fail_wsmt:
 fail_platform_device_alloc:
 	free_page((unsigned long)buffer);
 	return ret;
-- 
2.14.1
