From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: Read EC information on newer models
Date: Fri,  8 Mar 2019 21:14:26 +0800
Message-ID: <20190308131426.10254-1-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ibm-acpi@hmh.eng.br
Cc: dvhart@infradead.org, andy@infradead.org, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
List-Id: platform-driver-x86.vger.kernel.org

Newer ThinkPads have a totally different EC program information DMI
table. And thermal subdriver can't work without correct EC version.

Read from this entry if the old method failed to get EC information.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 62 ++++++++++++++++++++++------
 1 file changed, 49 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 2e24ee42a3c6..17fd2065000b 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9959,6 +9959,37 @@ static char __init tpacpi_parse_fw_id(const char * const s,
 	return '\0';
 }
 
+static void find_new_ec_fwstr(const struct dmi_header *dm, void *private)
+{
+	char *ec_fw_string = (char *) private;
+	const char *dmi_data = (const char *)dm;
+	/*
+	 * ThinkPad Embedded Controller Program Table on newer models
+	 *
+	 * Offset |  Name                | Width  | Description
+	 * ----------------------------------------------------
+	 *  0x00  | Type                 | BYTE   | 0x8C
+	 *  0x01  | Length               | BYTE   |
+	 *  0x02  | Handle               | WORD   | Varies
+	 *  0x04  | Signature            | BYTEx6 | ASCII for "LENOVO"
+	 *  0x0A  | OEM struct offset    | BYTE   | 0x0B
+	 *  0x0B  | OEM struct number    | BYTE   | 0x07, for this structure
+	 *  0x0C  | OEM struct revision  | BYTE   | 0x01, for this format
+	 *  0x0D  | ECP version ID       | STR ID |
+	 *  0x0E  | ECP release date     | STR ID |
+	 */
+
+	/* Return if data structure not match */
+	if (dm->type != 140 || dm->length < 0x0F ||
+	memcmp(dmi_data + 4, "LENOVO", 6) != 0 ||
+	dmi_data[0x0A] != 0x0B || dmi_data[0x0B] != 0x07 ||
+	dmi_data[0x0C] != 0x01)
+		return;
+
+	/* fwstr is the first 8byte string  */
+	strncpy(ec_fw_string, dmi_data + 0x0F, 8);
+}
+
 /* returns 0 - probe ok, or < 0 - probe error.
  * Probe ok doesn't mean thinkpad found.
  * On error, kfree() cleanup on tp->* is not performed, caller must do it */
@@ -9966,7 +9997,7 @@ static int __must_check __init get_thinkpad_model_data(
 						struct thinkpad_id_data *tp)
 {
 	const struct dmi_device *dev = NULL;
-	char ec_fw_string[18];
+	char ec_fw_string[18] = {0};
 	char const *s;
 	char t;
 
@@ -10006,20 +10037,25 @@ static int __must_check __init get_thinkpad_model_data(
 			   ec_fw_string) == 1) {
 			ec_fw_string[sizeof(ec_fw_string) - 1] = 0;
 			ec_fw_string[strcspn(ec_fw_string, " ]")] = 0;
+			break;
+		}
+	}
 
-			tp->ec_version_str = kstrdup(ec_fw_string, GFP_KERNEL);
-			if (!tp->ec_version_str)
-				return -ENOMEM;
+	/* Newer ThinkPads have different EC program info table */
+	if (!ec_fw_string[0])
+		dmi_walk(find_new_ec_fwstr, &ec_fw_string);
 
-			t = tpacpi_parse_fw_id(ec_fw_string,
-					       &tp->ec_model, &tp->ec_release);
-			if (t != 'H') {
-				pr_notice("ThinkPad firmware release %s doesn't match the known patterns\n",
-					  ec_fw_string);
-				pr_notice("please report this to %s\n",
-					  TPACPI_MAIL);
-			}
-			break;
+	if (ec_fw_string[0]) {
+		tp->ec_version_str = kstrdup(ec_fw_string, GFP_KERNEL);
+		if (!tp->ec_version_str)
+			return -ENOMEM;
+
+		t = tpacpi_parse_fw_id(ec_fw_string,
+			 &tp->ec_model, &tp->ec_release);
+		if (t != 'H') {
+			pr_notice("ThinkPad firmware release %s doesn't match the known patterns\n",
+				  ec_fw_string);
+			pr_notice("please report this to %s\n", TPACPI_MAIL);
 		}
 	}
 
-- 
2.20.1
