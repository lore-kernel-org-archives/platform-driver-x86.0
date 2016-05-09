From: Mario Limonciello <mario_limonciello@dell.com>
Subject: [PATCH v3 1/2] dell-smbios: Add a method for more complex SMI requests
Date: Mon,  9 May 2016 11:24:58 -0500
Message-ID: <1462811099-16897-1-git-send-email-mario_limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausc60ps301.us.dell.com ([143.166.148.206]:24323 "EHLO
	ausc60ps301.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751018AbcEIQZI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 May 2016 12:25:08 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>

More complex SMI requests can return data that exceeds the 4 32 bit
arguments that are traditionally part of a request.

To support more complex requests, the first input argument can be a
32 bit physical address with a buffer properly built in advance.

This new method prepares the buffer as the BIOS will look for
it in these requests.

Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
---
 drivers/platform/x86/dell-smbios.c | 43 ++++++++++++++++++++++++++++++++++++++
 drivers/platform/x86/dell-smbios.h |  2 ++
 2 files changed, 45 insertions(+)

diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
index d2412ab..e3bbbb3 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -33,12 +33,14 @@ struct calling_interface_structure {
 } __packed;
 
 static struct calling_interface_buffer *buffer;
+static unsigned char *extended_buffer;
 static DEFINE_MUTEX(buffer_mutex);
 
 static int da_command_address;
 static int da_command_code;
 static int da_num_tokens;
 static struct calling_interface_token *da_tokens;
+static const char extended_key[4] = {'D', 'S', 'C', 'I'};
 
 int dell_smbios_error(int value)
 {
@@ -92,6 +94,38 @@ void dell_smbios_send_request(int class, int select)
 }
 EXPORT_SYMBOL_GPL(dell_smbios_send_request);
 
+/* More complex requests are served by sending
+ * a pointer to a pre-allocated buffer
+ * Bytes 0:3 are the size of the return value
+ * Bytes 4:length are the returned value
+ *
+ * The return value is the data of the extended buffer request
+ * The value of length will be updated to the length of the actual
+ * buffer content
+ *
+ */
+unsigned char *dell_smbios_send_extended_request(int class, int select,
+						 size_t *length)
+{
+	u32 i;
+	u32 *buffer_length = (u32 *)extended_buffer;
+
+	if (*length < 5 || *length - 4 > PAGE_SIZE)
+		return NULL;
+
+	*buffer_length = *length - 4;
+	for (i = 4; i < *length; i += 4)
+		if (*length - i > 4)
+			memcpy(&extended_buffer[i], &extended_key, 4);
+
+	*length = buffer_length[0];
+	buffer->input[0] = virt_to_phys(extended_buffer);
+	dell_smbios_send_request(class, select);
+
+	return &extended_buffer[4];
+}
+EXPORT_SYMBOL_GPL(dell_smbios_send_extended_request);
+
 struct calling_interface_token *dell_smbios_find_token(int tokenid)
 {
 	int i;
@@ -170,8 +204,16 @@ static int __init dell_smbios_init(void)
 		goto fail_buffer;
 	}
 
+	extended_buffer = (void *)__get_free_page(GFP_KERNEL | GFP_DMA32);
+	if (!extended_buffer) {
+		ret = -ENOMEM;
+		goto fail_extended_buffer;
+	}
+
 	return 0;
 
+fail_extended_buffer:
+	kfree(buffer);
 fail_buffer:
 	kfree(da_tokens);
 	return ret;
@@ -181,6 +223,7 @@ static void __exit dell_smbios_exit(void)
 {
 	kfree(da_tokens);
 	free_page((unsigned long)buffer);
+	free_page((unsigned long)extended_buffer);
 }
 
 subsys_initcall(dell_smbios_init);
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/dell-smbios.h
index ec7d40a..c0f4395 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -41,6 +41,8 @@ struct calling_interface_buffer *dell_smbios_get_buffer(void);
 void dell_smbios_clear_buffer(void);
 void dell_smbios_release_buffer(void);
 void dell_smbios_send_request(int class, int select);
+unsigned char *dell_smbios_send_extended_request(int class, int select,
+						 size_t *length);
 
 struct calling_interface_token *dell_smbios_find_token(int tokenid);
 #endif
-- 
2.7.4
