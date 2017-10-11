From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v7 10/15] platform/x86: dell-smbios: add filtering capability for requests
Date: Wed, 11 Oct 2017 11:27:36 -0500
Message-ID: <83dc225624f1cde5ee1797aebc945732444ded91.1507733291.git.mario.limonciello@dell.com>
References: <cover.1507733291.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1507733291.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1507733291.git.mario.limonciello@dell.com>
References: <cover.1507733291.git.mario.limonciello@dell.com>
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
 drivers/platform/x86/dell-smbios.c | 127 +++++++++++++++++++++++++++++++++++++
 drivers/platform/x86/dell-smbios.h |   2 +
 2 files changed, 129 insertions(+)

diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
index a2afd7cb24fc..f21ec4e60e5b 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -24,6 +24,7 @@
 #include <linux/platform_device.h>
 #include "dell-smbios.h"
 
+static u32 da_supported_commands;
 static int da_num_tokens;
 static struct platform_device *platform_device;
 static struct calling_interface_token *da_tokens;
@@ -38,6 +39,57 @@ struct smbios_device {
 	int (*call_fn)(struct calling_interface_buffer *);
 };
 
+
+/* calls that should be blacklisted. may contain diagnostics,
+ * debugging information or are write once functions
+ */
+struct smbios_call {
+	int class;
+	int select;
+};
+
+static struct smbios_call call_blacklist[] = {
+	{01, 07}, /* manufacturing use */
+	{06, 05}, /* manufacturing use */
+	{11, 03}, /* write once */
+	{11, 07}, /* write once */
+	{11, 11}, /* write once */
+	{19, -1}, /* diagnostics */
+};
+
+/* tokens corresponding to diagnostics or write once locations */
+struct token_range {
+	u16 exact_value;
+	u16 min;
+	u16 max;
+};
+
+static struct token_range token_blacklist[] = {
+	{0x0000, 0x0058, 0x0059}, /* ME use */
+	{0x0000, 0x00CD, 0x00D0}, /* raid shadow copy */
+	{0x0000, 0x013A, 0x01FF}, /* sata shadow copy */
+	{0x0000, 0x0175, 0x0176}, /* write once */
+	{0x0000, 0x0195, 0x0197}, /* diagnostics */
+	{0x0000, 0x01DC, 0x01DD}, /* manufacturing use */
+	{0x0000, 0x027D, 0x0284}, /* diagnostics */
+	{0x02E3, 0x0000, 0x0000}, /* manufacturing use */
+	{0x02FF, 0x0000, 0x0000}, /* manufacturing use */
+	{0x0000, 0x0300, 0x0302}, /* manufacturing use */
+	{0x0000, 0x0325, 0x0326}, /* manufacturing use */
+	{0x0000, 0x0332, 0x0335}, /* fan control */
+	{0x0350, 0x0000, 0x0000}, /* manufacturing use */
+	{0x0363, 0x0000, 0x0000}, /* manufacturing use */
+	{0x0368, 0x0000, 0x0000}, /* manufacturing use */
+	{0x0000, 0x03F6, 0x03F7}, /* manufacturing use */
+	{0x0000, 0x049E, 0x049F}, /* manufacturing use */
+	{0x0000, 0x04A0, 0x04A3}, /* disagnostics */
+	{0x0000, 0x04E6, 0x04E7}, /* manufacturing use */
+	{0x0000, 0x4000, 0x7FFF}, /* internal BIOS use */
+	{0x0000, 0x9000, 0x9001}, /* internal BIOS use */
+	{0x0000, 0xA000, 0xBFFF}, /* write only */
+	{0x0000, 0xEFF0, 0xEFFF}, /* internal BIOS use */
+};
+
 static LIST_HEAD(smbios_device_list);
 
 int dell_smbios_error(int value)
@@ -90,6 +142,72 @@ void dell_smbios_unregister_device(struct device *d)
 }
 EXPORT_SYMBOL_GPL(dell_smbios_unregister_device);
 
+int dell_smbios_call_filter(struct device *d,
+			    struct calling_interface_buffer *buffer)
+{
+	int i;
+	u16 t = 0;
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
+	/* match against call blacklist  */
+	for (i = 0; i < ARRAY_SIZE(call_blacklist); i++) {
+		if (buffer->class != call_blacklist[i].class)
+			continue;
+		if (buffer->select != call_blacklist[i].select &&
+		    call_blacklist[i].select != -1)
+			continue;
+		dev_dbg(d, "blacklisted command: %d/%d\n",
+			buffer->class, buffer->select);
+		return -EINVAL;
+	}
+
+	/* if a token call, find token ID */
+	if ((buffer->class == 0 && buffer->select < 3) ||
+	    (buffer->class == 1 && buffer->select < 3)) {
+		for (i = 0; i < da_num_tokens; i++) {
+			/* find the matching token ID */
+			if (da_tokens[i].location != buffer->input[0])
+				continue;
+			t = da_tokens[i].tokenID;
+			break;
+		}
+	/* not a token call */
+	} else
+		return 0;
+
+	/* token call; but token didn't exist */
+	if (!t) {
+		dev_dbg(d, "token at location %u doesn't exist\n",
+			buffer->input[0]);
+		return -EINVAL;
+	}
+	/* match against token blacklist */
+	for (i = 0; i < ARRAY_SIZE(token_blacklist); i++) {
+		if (token_blacklist[i].exact_value &&
+		    t == token_blacklist[i].exact_value)
+			return -EINVAL;
+		if (!token_blacklist[i].min || !token_blacklist[i].max)
+			continue;
+		if (t >= token_blacklist[i].min && t <= token_blacklist[i].max)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dell_smbios_call_filter);
+
 int dell_smbios_call(struct calling_interface_buffer *buffer)
 {
 	int (*call_fn)(struct calling_interface_buffer *) = NULL;
@@ -113,6 +231,13 @@ int dell_smbios_call(struct calling_interface_buffer *buffer)
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
@@ -168,6 +293,8 @@ static void __init parse_da_table(const struct dmi_header *dm)
 	if (dm->length < 17)
 		return;
 
+	da_supported_commands = table->supportedCmds;
+
 	new_da_tokens = krealloc(da_tokens, (da_num_tokens + tokens) *
 				 sizeof(struct calling_interface_token),
 				 GFP_KERNEL);
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/dell-smbios.h
index 911916be73d4..98950298fc51 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -51,6 +51,8 @@ int dell_smbios_register_device(struct device *d, void *call_fn);
 void dell_smbios_unregister_device(struct device *d);
 
 int dell_smbios_error(int value);
+int dell_smbios_call_filter(struct device *d,
+			    struct calling_interface_buffer *buffer);
 int dell_smbios_call(struct calling_interface_buffer *buffer);
 
 struct calling_interface_token *dell_smbios_find_token(int tokenid);
-- 
2.14.1
