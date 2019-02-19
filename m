From: Mattias Jacobsson <2pi@mok.nu>
Subject: [PATCH v4 2/8] platform/x86: wmi: add WMI support to MODULE_DEVICE_TABLE()
Date: Tue, 19 Feb 2019 20:59:50 +0100
Message-ID: <082d3d38b7dde6050b6b3e518ada439eade65b2c.1550603967.git.2pi@mok.nu>
References: <cover.1550603967.git.2pi@mok.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1550603967.git.2pi@mok.nu>
Sender: linux-kernel-owner@vger.kernel.org
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net, dvhart@infradead.org, andy@infradead.org, pali.rohar@gmail.com
Cc: 2pi@mok.nu, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The kernel provides the macro MODULE_DEVICE_TABLE() where driver authors
can specify their device type and their array of device_ids and thereby
trigger the generation of the appropriate MODULE_ALIAS() output. This is
opposed to having to specify one MODULE_ALIAS() for each device. The WMI
device type is currently not supported.

While using MODULE_DEVICE_TABLE() does increase the complexity as well
as spreading out the implementation across the kernel, it does come with
some benefits too;
* It makes different drivers look more similar; if you can specify the
  array of device_ids any device type specific input to MODULE_ALIAS()
  will automatically be generated for you.
* It helps each driver avoid keeping multiple versions of the same
  information in sync. That is, both the array of device_ids and the
  potential multitude of MODULE_ALIAS()'s.

Add WMI support to MODULE_DEVICE_TABLE() by adding info about struct
wmi_device_id in devicetable-offsets.c and add a WMI entry point in
file2alias.c.

The type argument for MODULE_DEVICE_TABLE(type, name) is wmi.

Suggested-by: Pali Rohár <pali.rohar@gmail.com>
Signed-off-by: Mattias Jacobsson <2pi@mok.nu>
---

What do you think about writing it this way now, pretty much the same as
before, but now using the macro ALIAS_SIZE instead of a hardcoded value?

Also, as I mentioned before, I've submitted the ALIAS_SIZE patch and
have recieved a question on which tree the patch should be go through.
See the original question on [1]. I don't mind either way, do you have a
preference on this?

[1]: https://lore.kernel.org/lkml/CAK7LNAQZ7PDZ4+uZu-FT4V8yw9oUGz6e++9xSshWJvALj3gN0Q@mail.gmail.com

--
 scripts/mod/devicetable-offsets.c |  3 +++
 scripts/mod/file2alias.c          | 23 +++++++++++++++++++++++
 2 files changed, 26 insertions(+)

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
index afe22af20d7d..6dedc31a4925 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -37,6 +37,7 @@ typedef unsigned char	__u8;
 typedef struct {
 	__u8 b[16];
 } uuid_le;
+#define	UUID_STRING_LEN		36
 
 /* Big exception to the "don't include kernel headers into userspace, which
  * even potentially has different endianness and word sizes, since
@@ -1290,6 +1291,27 @@ static int do_typec_entry(const char *filename, void *symval, char *alias)
 	return 1;
 }
 
+/* Looks like: wmi:guid */
+static int do_wmi_entry(const char *filename, void *symval, char *alias)
+{
+	int len;
+	DEF_FIELD_ADDR(symval, wmi_device_id, guid_string);
+
+	if (strlen(*guid_string) != UUID_STRING_LEN) {
+		warn("Invalid WMI device id 'wmi:%s' in '%s'\n",
+				*guid_string, filename);
+		return 0;
+	}
+
+	len = snprintf(alias, ALIAS_SIZE, WMI_MODULE_PREFIX "%s", *guid_string);
+	if (len < 0 || len >= ALIAS_SIZE) {
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
@@ -1360,6 +1382,7 @@ static const struct devtable devtable[] = {
 	{"fslmc", SIZE_fsl_mc_device_id, do_fsl_mc_entry},
 	{"tbsvc", SIZE_tb_service_id, do_tbsvc_entry},
 	{"typec", SIZE_typec_device_id, do_typec_entry},
+	{"wmi", SIZE_wmi_device_id, do_wmi_entry},
 };
 
 /* Create MODULE_ALIAS() statements.
-- 
2.20.1
