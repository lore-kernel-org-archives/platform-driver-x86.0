From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v6 12/14] platform/x86: dell-smbios-smm: test for WSMT
Date: Mon,  9 Oct 2017 17:51:50 -0500
Message-ID: <ab0790382693e8fabe191bcaed5c572bdab47ebd.1507589249.git.mario.limonciello@dell.com>
References: <cover.1507589249.git.mario.limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa6.dell-outbound.iphmx.com ([68.232.149.229]:32812 "EHLO
        esa6.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1755460AbdJIWv7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2017 18:51:59 -0400
In-Reply-To: <cover.1507589249.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1507589249.git.mario.limonciello@dell.com>
References: <cover.1507589249.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Mario Limonciello <mario.limonciello@dell.com>

WSMT is as an attestation to the OS that the platform won't
modify memory outside of pre-defined areas.

If a platform has WSMT enabled in BIOS setup, SMM calls through
dcdbas will fail.  The only way to access platform data in these
instances is through the WMI SMBIOS calling interface.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/dell-smbios-smm.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/platform/x86/dell-smbios-smm.c b/drivers/platform/x86/dell-smbios-smm.c
index 223531e43fea..ba315753e847 100644
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
@@ -76,6 +78,30 @@ int dell_smbios_smm_call(struct calling_interface_buffer *input)
 	return 0;
 }
 
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
+	return (buffer->output[1] == token->value);
+}
+
 static int __init dell_smbios_smm_init(void)
 {
 	int ret;
@@ -88,6 +114,13 @@ static int __init dell_smbios_smm_init(void)
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
@@ -111,6 +144,7 @@ static int __init dell_smbios_smm_init(void)
 fail_platform_device_add:
 	platform_device_put(platform_device);
 
+fail_wsmt:
 fail_platform_device_alloc:
 	free_page((unsigned long)buffer);
 	return ret;
-- 
2.14.1
