From: Mattias Jacobsson <2pi@mok.nu>
Subject: [PATCH 2/3] platform/x86: wmi: add WMI support to MODULE_DEVICE_TABLE()
Date: Sat, 19 Jan 2019 12:55:54 +0100
Message-ID: <ff56fb53485ec75b5e8a81f306983aa7976574c5.1547827336.git.2pi@mok.nu>
References: <cover.1547827336.git.2pi@mok.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1547827336.git.2pi@mok.nu>
Sender: linux-kernel-owner@vger.kernel.org
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net, dvhart@infradead.org, andy@infradead.org, pali.rohar@gmail.com
Cc: 2pi@mok.nu, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Add WMI support to MODULE_DEVICE_TABLE() by adding info about struct
wmi_device_id in devicetable-offsets.c and add a WMI entry point in
file2alias.c.

The type argument for MODULE_DEVICE_TABLE(type, name) is wmi.

Signed-off-by: Mattias Jacobsson <2pi@mok.nu>
---

The idea of adding wmi support to MODULE_DEVICE_TABLE() originates from
a suggestion at [1]. However [2] states: "Please note that this tag
should not be added without the reporter's permission, especially if
the idea was not posted in a public forum." about the "Suggested-by:"
tag.
Pali Rohár: May I add a "Suggested-by:" tag?

[1]: https://lore.kernel.org/patchwork/patch/795892/#989423
[2]: Documentation/process/submitting-patches.rst

---
 scripts/mod/devicetable-offsets.c |  3 +++
 scripts/mod/file2alias.c          | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index 293004499b4d..99276a422e77 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -225,5 +225,8 @@ int main(void)
 	DEVID_FIELD(typec_device_id, svid);
 	DEVID_FIELD(typec_device_id, mode);
 
+	DEVID(wmi_device_id);
+	DEVID_FIELD(wmi_device_id, guid_string);
+
 	return 0;
 }
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index a37af7d71973..f014a2466ff7 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -1287,6 +1287,23 @@ static int do_typec_entry(const char *filename, void *symval, char *alias)
 	return 1;
 }
 
+/* Looks like: wmi:guid */
+static int do_wmi_entry(const char *filename, void *symval, char *alias)
+{
+	DEF_FIELD_ADDR(symval, wmi_device_id, guid_string);
+	if (strlen(*guid_string) != WMI_GUID_STRING_LEN) {
+		warn("Invalid WMI device id 'wmi:%s' in '%s'\n",
+				*guid_string, filename);
+		return 0;
+	}
+	if (snprintf(alias, 500, WMI_MODULE_PREFIX "%s", *guid_string) < 0) {
+		warn("Could not generate all MODULE_ALIAS's in '%s'\n",
+				filename);
+		return 0;
+	}
+	return 1;
+}
+
 /* Does namelen bytes of name exactly match the symbol? */
 static bool sym_is(const char *name, unsigned namelen, const char *symbol)
 {
@@ -1357,6 +1374,7 @@ static const struct devtable devtable[] = {
 	{"fslmc", SIZE_fsl_mc_device_id, do_fsl_mc_entry},
 	{"tbsvc", SIZE_tb_service_id, do_tbsvc_entry},
 	{"typec", SIZE_typec_device_id, do_typec_entry},
+	{"wmi", SIZE_wmi_device_id, do_wmi_entry},
 };
 
 /* Create MODULE_ALIAS() statements.
-- 
2.20.1
