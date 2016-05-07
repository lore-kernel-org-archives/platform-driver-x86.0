From: Mario Limonciello <mario_limonciello@dell.com>
Subject: [PATCH v2 1/2] dell-smbios: Add a helper function for complex SMI requests
Date: Sat,  7 May 2016 10:52:43 -0500
Message-ID: <1462636364-25644-1-git-send-email-mario_limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausxipps301.us.dell.com ([143.166.148.223]:63245 "EHLO
	ausxipps301.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750727AbcEGPwv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 7 May 2016 11:52:51 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>

More complex SMI requests can return data that exceeds the 4 32 byte
arguments that are traditionally part of a request.

To support more complex requests, the first input argument can be a
32 bit physical address with a buffer properly built in advance.

This helper function prepares the buffer as the BIOS will look for
it in these requests.

Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
---
 drivers/platform/x86/dell-smbios.c | 28 ++++++++++++++++++++++++++++
 drivers/platform/x86/dell-smbios.h |  1 +
 2 files changed, 29 insertions(+)

diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
index d2412ab..00b29df 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -92,6 +92,34 @@ void dell_smbios_send_request(int class, int select)
 }
 EXPORT_SYMBOL_GPL(dell_smbios_send_request);
 
+/* More complex requests are served by sending
+ * a pointer to a pre-allocated buffer
+ * Bytes 0:3 are the size of the return value
+ * Bytes 4:length are the returned value
+ *
+ * This helper function prepares it properly
+ * with the size length to be provided
+ *
+ * caller still needs to pre-allocate and clear
+ * the input buffer
+ */
+void dell_smbios_prepare_v2_call(u8 *input, size_t length)
+{
+	u32 i;
+	u32 *data = (u32 *) input;
+
+	data[0] = length - 4;
+	for (i = 4; i < length; i += 4) {
+		if (length - i > 4) {
+			input[i]   = 'D';
+			input[i+1] = 'S';
+			input[i+2] = 'C';
+			input[i+3] = 'I';
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(dell_smbios_prepare_v2_call);
+
 struct calling_interface_token *dell_smbios_find_token(int tokenid)
 {
 	int i;
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/dell-smbios.h
index ec7d40a..5d4184c 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -41,6 +41,7 @@ struct calling_interface_buffer *dell_smbios_get_buffer(void);
 void dell_smbios_clear_buffer(void);
 void dell_smbios_release_buffer(void);
 void dell_smbios_send_request(int class, int select);
+void dell_smbios_prepare_v2_call(u8 *input, size_t length);
 
 struct calling_interface_token *dell_smbios_find_token(int tokenid);
 #endif
-- 
2.7.4
