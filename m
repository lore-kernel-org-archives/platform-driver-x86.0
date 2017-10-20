From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v11 12/15] platform/x86: dell-smbios: Add filtering support
Date: Fri, 20 Oct 2017 12:40:27 -0500
Message-ID: <e8a28fccb7993117bd29306947be93e13a9c6c04.1508515469.git.mario.limonciello@dell.com>
References: <cover.1508515469.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1508515469.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1508515469.git.mario.limonciello@dell.com>
References: <cover.1508515469.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

When a userspace interface is introduced to dell-smbios filtering
support will be used to make sure that userspace doesn't make calls
deemed unsafe or that can cause the kernel drivers to get out of
sync.

A blacklist is provided for the following:
- Items that are in use by other kernel drivers
- Items that are deemed unsafe (diagnostics, write-once, etc)
- Any items in the blacklist will be rejected.

Following that a whitelist is provided as follows:
- Each item has an associated capability.  If a userspace interface
  accesses this item, that capability will be tested to filter
  the request.
- If the process provides CAP_SYS_RAWIO the whitelist will be
  overridden.

When an item is not in the blacklist, or whitelist and the process
is run with insufficient capabilities the call will be rejected.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
Reviewed-by: Edward O'Callaghan <quasisec@google.com>
---
 drivers/platform/x86/dell-smbios.c | 190 +++++++++++++++++++++++++++++++++++++
 drivers/platform/x86/dell-smbios.h |  11 +++
 2 files changed, 201 insertions(+)

diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
index b540cd4605f7..b2aeb740c04b 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -24,6 +24,7 @@
 #include <linux/slab.h>
 #include "dell-smbios.h"
 
+static u32 da_supported_commands;
 static int da_num_tokens;
 static struct platform_device *platform_device;
 static struct calling_interface_token *da_tokens;
@@ -38,6 +39,91 @@ struct smbios_device {
 	int (*call_fn)(struct calling_interface_buffer *);
 };
 
+struct smbios_call {
+	u32 need_capability;
+	int class;
+	int select;
+};
+
+/* calls that are whitelisted for given capabilities */
+static struct smbios_call call_whitelist[] = {
+	/* generally tokens are allowed, but may be further filtered or
+	 * restricted by token blacklist or whitelist
+	 */
+	{CAP_SYS_ADMIN,	CLASS_TOKEN_READ,	SELECT_TOKEN_STD},
+	{CAP_SYS_ADMIN,	CLASS_TOKEN_READ,	SELECT_TOKEN_AC},
+	{CAP_SYS_ADMIN,	CLASS_TOKEN_READ,	SELECT_TOKEN_BAT},
+	{CAP_SYS_ADMIN,	CLASS_TOKEN_WRITE,	SELECT_TOKEN_STD},
+	{CAP_SYS_ADMIN,	CLASS_TOKEN_WRITE,	SELECT_TOKEN_AC},
+	{CAP_SYS_ADMIN,	CLASS_TOKEN_WRITE,	SELECT_TOKEN_BAT},
+	/* used by userspace: fwupdate */
+	{CAP_SYS_ADMIN, CLASS_ADMIN_PROP,	SELECT_ADMIN_PROP},
+	/* used by userspace: fwupd */
+	{CAP_SYS_ADMIN,	CLASS_INFO,		SELECT_DOCK},
+	{CAP_SYS_ADMIN,	CLASS_FLASH_INTERFACE,	SELECT_FLASH_INTERFACE},
+};
+
+/* calls that are explicitly blacklisted */
+static struct smbios_call call_blacklist[] = {
+	{0x0000, 01, 07}, /* manufacturing use */
+	{0x0000, 06, 05}, /* manufacturing use */
+	{0x0000, 11, 03}, /* write once */
+	{0x0000, 11, 07}, /* write once */
+	{0x0000, 11, 11}, /* write once */
+	{0x0000, 19, -1}, /* diagnostics */
+	/* handled by kernel: dell-laptop */
+	{0x0000, CLASS_INFO, SELECT_RFKILL},
+	{0x0000, CLASS_KBD_BACKLIGHT, SELECT_KBD_BACKLIGHT},
+};
+
+struct token_range {
+	u32 need_capability;
+	u16 min;
+	u16 max;
+};
+
+/* tokens that are whitelisted for given capabilities */
+static struct token_range token_whitelist[] = {
+	/* used by userspace: fwupdate */
+	{CAP_SYS_ADMIN,	CAPSULE_EN_TOKEN,	CAPSULE_DIS_TOKEN},
+	/* can indicate to userspace that WMI is needed */
+	{0x0000,	WSMT_EN_TOKEN,		WSMT_DIS_TOKEN}
+};
+
+/* tokens that are explicitly blacklisted */
+static struct token_range token_blacklist[] = {
+	{0x0000, 0x0058, 0x0059}, /* ME use */
+	{0x0000, 0x00CD, 0x00D0}, /* raid shadow copy */
+	{0x0000, 0x013A, 0x01FF}, /* sata shadow copy */
+	{0x0000, 0x0175, 0x0176}, /* write once */
+	{0x0000, 0x0195, 0x0197}, /* diagnostics */
+	{0x0000, 0x01DC, 0x01DD}, /* manufacturing use */
+	{0x0000, 0x027D, 0x0284}, /* diagnostics */
+	{0x0000, 0x02E3, 0x02E3}, /* manufacturing use */
+	{0x0000, 0x02FF, 0x02FF}, /* manufacturing use */
+	{0x0000, 0x0300, 0x0302}, /* manufacturing use */
+	{0x0000, 0x0325, 0x0326}, /* manufacturing use */
+	{0x0000, 0x0332, 0x0335}, /* fan control */
+	{0x0000, 0x0350, 0x0350}, /* manufacturing use */
+	{0x0000, 0x0363, 0x0363}, /* manufacturing use */
+	{0x0000, 0x0368, 0x0368}, /* manufacturing use */
+	{0x0000, 0x03F6, 0x03F7}, /* manufacturing use */
+	{0x0000, 0x049E, 0x049F}, /* manufacturing use */
+	{0x0000, 0x04A0, 0x04A3}, /* disagnostics */
+	{0x0000, 0x04E6, 0x04E7}, /* manufacturing use */
+	{0x0000, 0x4000, 0x7FFF}, /* internal BIOS use */
+	{0x0000, 0x9000, 0x9001}, /* internal BIOS use */
+	{0x0000, 0xA000, 0xBFFF}, /* write only */
+	{0x0000, 0xEFF0, 0xEFFF}, /* internal BIOS use */
+	/* handled by kernel: dell-laptop */
+	{0x0000, BRIGHTNESS_TOKEN,	BRIGHTNESS_TOKEN},
+	{0x0000, KBD_LED_OFF_TOKEN,	KBD_LED_AUTO_TOKEN},
+	{0x0000, KBD_LED_AC_TOKEN,	KBD_LED_AC_TOKEN},
+	{0x0000, KBD_LED_AUTO_25_TOKEN,	KBD_LED_AUTO_75_TOKEN},
+	{0x0000, KBD_LED_AUTO_100_TOKEN,	KBD_LED_AUTO_100_TOKEN},
+	{0x0000, GLOBAL_MIC_MUTE_ENABLE,	GLOBAL_MIC_MUTE_DISABLE},
+};
+
 static LIST_HEAD(smbios_device_list);
 
 int dell_smbios_error(int value)
@@ -90,6 +176,108 @@ void dell_smbios_unregister_device(struct device *d)
 }
 EXPORT_SYMBOL_GPL(dell_smbios_unregister_device);
 
+int dell_smbios_call_filter(struct device *d,
+			    struct calling_interface_buffer *buffer)
+{
+	u16 t = 0;
+	int i;
+
+	/* can't make calls over 30 */
+	if (buffer->class > 30) {
+		dev_dbg(d, "class too big: %u\n", buffer->class);
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
+		dev_dbg(d, "blacklisted command: %u/%u\n",
+			buffer->class, buffer->select);
+		return -EINVAL;
+	}
+
+	/* if a token call, find token ID */
+	if ((buffer->class == CLASS_TOKEN_READ && buffer->select < 3) ||
+	    (buffer->class == CLASS_TOKEN_WRITE && buffer->select < 3)) {
+		/* find the matching token ID */
+		for (i = 0; i < da_num_tokens; i++) {
+			if (da_tokens[i].location != buffer->input[0])
+				continue;
+			t = da_tokens[i].tokenID;
+			break;
+		}
+
+		/* token call; but token didn't exist */
+		if (!t) {
+			dev_dbg(d, "token at location %04x doesn't exist\n",
+				buffer->input[0]);
+			return -EINVAL;
+		}
+
+		/* match against token blacklist */
+		for (i = 0; i < ARRAY_SIZE(token_blacklist); i++) {
+			if (!token_blacklist[i].min || !token_blacklist[i].max)
+				continue;
+			if (t >= token_blacklist[i].min &&
+			    t <= token_blacklist[i].max)
+				return -EINVAL;
+		}
+
+		/* match against token whitelist */
+		for (i = 0; i < ARRAY_SIZE(token_whitelist); i++) {
+			if (!token_whitelist[i].min || !token_whitelist[i].max)
+				continue;
+			if (t < token_whitelist[i].min ||
+			    t > token_whitelist[i].max)
+				continue;
+			if (!token_whitelist[i].need_capability ||
+			    capable(token_whitelist[i].need_capability)) {
+				dev_dbg(d, "whitelisted token: %x\n", t);
+				return 0;
+			}
+
+		}
+	}
+	/* match against call whitelist */
+	for (i = 0; i < ARRAY_SIZE(call_whitelist); i++) {
+		if (buffer->class != call_whitelist[i].class)
+			continue;
+		if (buffer->select != call_whitelist[i].select)
+			continue;
+		if (!call_whitelist[i].need_capability ||
+		    capable(call_whitelist[i].need_capability)) {
+			dev_dbg(d, "whitelisted capable command: %u/%u\n",
+			buffer->class, buffer->select);
+			return 0;
+		}
+		dev_dbg(d, "missing capability %d for %u/%u\n",
+			call_whitelist[i].need_capability,
+			buffer->class, buffer->select);
+
+	}
+
+	/* not in a whitelist, only allow processes with capabilities */
+	if (capable(CAP_SYS_RAWIO)) {
+		dev_dbg(d, "Allowing %u/%u due to CAP_SYS_RAWIO\n",
+			buffer->class, buffer->select);
+		return 0;
+	}
+
+	return -EACCES;
+}
+EXPORT_SYMBOL_GPL(dell_smbios_call_filter);
+
 int dell_smbios_call(struct calling_interface_buffer *buffer)
 {
 	int (*call_fn)(struct calling_interface_buffer *) = NULL;
@@ -168,6 +356,8 @@ static void __init parse_da_table(const struct dmi_header *dm)
 	if (dm->length < 17)
 		return;
 
+	da_supported_commands = table->supportedCmds;
+
 	new_da_tokens = krealloc(da_tokens, (da_num_tokens + tokens) *
 				 sizeof(struct calling_interface_token),
 				 GFP_KERNEL);
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/dell-smbios.h
index 956fe9304ed7..23256f79a4b8 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -26,9 +26,14 @@
 #define SELECT_TOKEN_AC 2
 #define CLASS_KBD_BACKLIGHT 4
 #define SELECT_KBD_BACKLIGHT 11
+#define CLASS_FLASH_INTERFACE 7
+#define SELECT_FLASH_INTERFACE 3
+#define CLASS_ADMIN_PROP 10
+#define SELECT_ADMIN_PROP 3
 #define CLASS_INFO 17
 #define SELECT_RFKILL 11
 #define SELECT_APP_REGISTRATION	3
+#define SELECT_DOCK 22
 
 /* Tokens used in kernel drivers, any of these
  * should be filtered from userspace access
@@ -44,6 +49,10 @@
 #define KBD_LED_AUTO_100_TOKEN	0x02F6
 #define GLOBAL_MIC_MUTE_ENABLE	0x0364
 #define GLOBAL_MIC_MUTE_DISABLE	0x0365
+
+/* tokens whitelisted to userspace use */
+#define CAPSULE_EN_TOKEN	0x0461
+#define CAPSULE_DIS_TOKEN	0x0462
 #define WSMT_EN_TOKEN		0x04EC
 #define WSMT_DIS_TOKEN		0x04ED
 
@@ -80,6 +89,8 @@ int dell_smbios_register_device(struct device *d, void *call_fn);
 void dell_smbios_unregister_device(struct device *d);
 
 int dell_smbios_error(int value);
+int dell_smbios_call_filter(struct device *d,
+	struct calling_interface_buffer *buffer);
 int dell_smbios_call(struct calling_interface_buffer *buffer);
 
 struct calling_interface_token *dell_smbios_find_token(int tokenid);
-- 
2.14.1
