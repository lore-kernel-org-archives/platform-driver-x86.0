From: Andy Lutomirski <luto@kernel.org>
Subject: [PATCH v3] dmi: Make dmi_walk and dmi_walk_early return real error codes
Date: Tue, 19 Jan 2016 15:54:46 -0800
Message-ID: <0e75e48f9944d14ed914342a4780c199095ad747.1453247603.git.luto@kernel.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:43999 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757993AbcASXyu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 19 Jan 2016 18:54:50 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Cc: linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>

Currently they return -1 on error, which will confuse callers if
they try to interpret it as a normal negative error code.

Signed-off-by: Andy Lutomirski <luto@kernel.org>
---

Changes from v3:
 - Split out from the series it was in.
 - Use -ENXIO for "there's no DMI".
 - Also fix docs and !DMI case.

Changes from v2:
 - Total rewrite.

drivers/firmware/dmi_scan.c | 9 +++++----
 include/linux/dmi.h         | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
index 0e08e665f715..0418fed261bb 100644
--- a/drivers/firmware/dmi_scan.c
+++ b/drivers/firmware/dmi_scan.c
@@ -144,7 +144,7 @@ static int __init dmi_walk_early(void (*decode)(const struct dmi_header *,
 
 	buf = dmi_early_remap(dmi_base, orig_dmi_len);
 	if (buf == NULL)
-		return -1;
+		return -ENOMEM;
 
 	dmi_decode_table(buf, decode, NULL);
 
@@ -970,7 +970,8 @@ EXPORT_SYMBOL(dmi_get_date);
  *	@decode: Callback function
  *	@private_data: Private data to be passed to the callback function
  *
- *	Returns -1 when the DMI table can't be reached, 0 on success.
+ *	Returns 0 on success, -ENXIO if DMI is not selected or not present,
+ *	or a different negative error code if DMI walking fails.
  */
 int dmi_walk(void (*decode)(const struct dmi_header *, void *),
 	     void *private_data)
@@ -978,11 +979,11 @@ int dmi_walk(void (*decode)(const struct dmi_header *, void *),
 	u8 *buf;
 
 	if (!dmi_available)
-		return -1;
+		return -ENOENT;
 
 	buf = dmi_remap(dmi_base, dmi_len);
 	if (buf == NULL)
-		return -1;
+		return -ENOMEM;
 
 	dmi_decode_table(buf, decode, private_data);
 
diff --git a/include/linux/dmi.h b/include/linux/dmi.h
index 5055ac34142d..770d548e9a9d 100644
--- a/include/linux/dmi.h
+++ b/include/linux/dmi.h
@@ -135,7 +135,7 @@ static inline int dmi_name_in_vendors(const char *s) { return 0; }
 static inline int dmi_name_in_serial(const char *s) { return 0; }
 #define dmi_available 0
 static inline int dmi_walk(void (*decode)(const struct dmi_header *, void *),
-	void *private_data) { return -1; }
+	void *private_data) { return -ENXIO; }
 static inline bool dmi_match(enum dmi_field f, const char *str)
 	{ return false; }
 static inline void dmi_memdev_name(u16 handle, const char **bank,
-- 
2.5.0
