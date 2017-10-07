From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v5 10/14] platform/x86: dell-smbios: add filtering capability for requests
Date: Fri,  6 Oct 2017 23:59:54 -0500
Message-ID: <169beca316d562d00dc3dfb45248f42c9dc5d368.1507350554.git.mario.limonciello@dell.com>
References: <cover.1507350554.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1507350554.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1507350554.git.mario.limonciello@dell.com>
References: <cover.1507350554.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

There are some categories of tokens and SMBIOS calls that it makes
sense to protect userspace from accessing.  These are calls that
may write to one time use fields or activate hardware debugging
capabilities.  They are not intended for general purpose use.

This same functionality may be be later extended to also intercept
calls that may cause kernel functionality to get out of sync if
the same functions are used by other drivers.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/dell-smbios.c | 76 ++++++++++++++++++++++++++++++++++++++
 drivers/platform/x86/dell-smbios.h |  2 +
 2 files changed, 78 insertions(+)

diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
index 2f90ba5346bc..d1908f159be3 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -32,6 +32,7 @@ struct calling_interface_structure {
 	struct calling_interface_token tokens[];
 } __packed;
 
+static u32 da_supported_commands;
 static int da_command_address;
 static int da_command_code;
 static int da_num_tokens;
@@ -45,6 +46,14 @@ struct smbios_device {
 	int (*call_fn)(struct calling_interface_buffer *);
 };
 
+static u32 token_black[] = {
+	0x0175, 0x0176, 0x0195, 0x0196, 0x0197, 0x01DC, 0x01DD, 0x027D, 0x027E,
+	0x027F, 0x0280, 0x0281,	0x0282, 0x0283, 0x0284, 0x02E3, 0x02FF, 0x0300,
+	0x0301, 0x0302, 0x0325, 0x0326, 0x0332, 0x0333,	0x0334, 0x0335, 0x0350,
+	0x0363, 0x0368, 0x03F6, 0x03F7, 0x049E, 0x049F, 0x04A0, 0x04A1, 0x04A2,
+	0x04A3, 0x04E6, 0x04E7, 0x9000, 0x9001
+};
+
 static LIST_HEAD(smbios_device_list);
 
 void dell_smbios_get_smm_address(int *address, int *code)
@@ -104,6 +113,65 @@ void dell_smbios_unregister_device(struct device *d)
 }
 EXPORT_SYMBOL_GPL(dell_smbios_unregister_device);
 
+int dell_smbios_call_filter(struct device *d,
+			    struct calling_interface_buffer *buffer)
+{
+	int i;
+	int j;
+	u32 t;
+
+	/* can't make calls over 30 */
+	if (buffer->class > 30) {
+		dev_dbg(d, "buffer->class too big: %d\n", buffer->class);
+		return -EINVAL;
+	}
+
+	/* supported calls on the particular system */
+	if (!(da_supported_commands & (1 << buffer->class))) {
+		dev_dbg(d, "invalid command, supported commands: 0x%8x\n",
+			da_supported_commands);
+		return -EINVAL;
+	}
+
+	/* diagonstics, debugging information or write once  */
+	if ((buffer->class == 01 && buffer->select == 07) ||
+	    (buffer->class == 06 && buffer->select == 05) ||
+	    (buffer->class == 11 && buffer->select == 03) ||
+	    (buffer->class == 11 && buffer->select == 07) ||
+	    (buffer->class == 11 && buffer->select == 11) ||
+	     buffer->class == 19) {
+		dev_dbg(d, "blacklisted command: %d/%d\n",
+			buffer->class, buffer->select);
+		return -EINVAL;
+	}
+
+	/* reading/writing tokens*/
+	if ((buffer->class == 0 && buffer->select < 3) ||
+	    (buffer->class == 1 && buffer->select < 3)) {
+		for (i = 0; i < da_num_tokens; i++) {
+			if (da_tokens[i].location != buffer->input[0])
+				continue;
+			/*blacklist reading and writing these */
+			t = da_tokens[i].tokenID;
+			if ((t >= 0x4000 && t <= 0x7FFF) ||
+			    (t >= 0xA000 && t <= 0xBFFF) ||
+			    (t >= 0xEFF0 && t <= 0xEFFF))
+				return -EINVAL;
+			for (j = 0; j < ARRAY_SIZE(token_black); j++)
+				if (t == token_black[j])
+					return -EINVAL;
+			/* token exists and is OK */
+			return 0;
+		}
+		/* token didn't exist */
+		dev_dbg(d, "token at location %u doesn't exist\n",
+			buffer->input[0]);
+		return -EINVAL;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dell_smbios_call_filter);
+
 int dell_smbios_call(struct calling_interface_buffer *buffer)
 {
 	int (*call_fn)(struct calling_interface_buffer *) = NULL;
@@ -127,6 +195,13 @@ int dell_smbios_call(struct calling_interface_buffer *buffer)
 		goto out_smbios_call;
 	}
 
+	if (dell_smbios_call_filter(selected_dev, buffer)) {
+		ret = -EINVAL;
+		dev_err(selected_dev, "Invalid call %d/%d:%8x\n",
+			buffer->class, buffer->select, buffer->input[0]);
+		goto out_smbios_call;
+	}
+
 	ret = call_fn(buffer);
 
 out_smbios_call:
@@ -184,6 +259,7 @@ static void __init parse_da_table(const struct dmi_header *dm)
 
 	da_command_address = table->cmdIOAddress;
 	da_command_code = table->cmdIOCode;
+	da_supported_commands = table->supportedCmds;
 
 	new_da_tokens = krealloc(da_tokens, (da_num_tokens + tokens) *
 				 sizeof(struct calling_interface_token),
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/dell-smbios.h
index fe28964da499..c743c58831e5 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -45,6 +45,8 @@ void dell_smbios_unregister_device(struct device *d);
 
 void dell_smbios_get_smm_address(int *address, int *command);
 int dell_smbios_error(int value);
+int dell_smbios_call_filter(struct device *d,
+			    struct calling_interface_buffer *buffer);
 int dell_smbios_call(struct calling_interface_buffer *buffer);
 
 struct calling_interface_token *dell_smbios_find_token(int tokenid);
-- 
2.14.1
