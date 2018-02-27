From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH 1/3] platform/x86: dell-smbios: Correct some style warnings
Date: Tue, 27 Feb 2018 09:56:52 -0600
Message-ID: <1519747014-17561-1-git-send-email-mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: pali.rohar@gmail.com, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

WARNING: function definition argument 'struct calling_interface_buffer *'
should also have an identifier name
+       int (*call_fn)(struct calling_interface_buffer *);

WARNING: Block comments use * on subsequent lines
+       /* 4 bytes of table header, plus 7 bytes of Dell header,
	plus at least
+          6 bytes of entry */

WARNING: Block comments use a trailing */ on a separate line
+          6 bytes of entry */

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/dell-smbios.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
index 8541cde..4850658 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -36,7 +36,7 @@ static DEFINE_MUTEX(smbios_mutex);
 struct smbios_device {
 	struct list_head list;
 	struct device *device;
-	int (*call_fn)(struct calling_interface_buffer *);
+	int (*call_fn)(struct calling_interface_buffer *arg);
 };
 
 struct smbios_call {
@@ -353,7 +353,8 @@ static void __init parse_da_table(const struct dmi_header *dm)
 		container_of(dm, struct calling_interface_structure, header);
 
 	/* 4 bytes of table header, plus 7 bytes of Dell header, plus at least
-	   6 bytes of entry */
+	 * 6 bytes of entry
+	 */
 
 	if (dm->length < 17)
 		return;
-- 
2.7.4
