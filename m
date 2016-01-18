From: Andy Lutomirski <luto@kernel.org>
Subject: [PATCH v2 3/3] dmi: Make dmi_walk and dmi_walk_early return real error codes
Date: Mon, 18 Jan 2016 12:59:40 -0800
Message-ID: <9d1eb8634669ef09334c7e792eb21f20b320a07b.1453150613.git.luto@kernel.org>
References: <cover.1453150613.git.luto@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1453150613.git.luto@kernel.org>
In-Reply-To: <cover.1453150613.git.luto@kernel.org>
References: <cover.1453150613.git.luto@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Cc: linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Currently they return -1 on error, which will confuse callers if
they try to interpret it as a normal negative error code.

Signed-off-by: Andy Lutomirski <luto@kernel.org>
---
 drivers/firmware/dmi_scan.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
index 0e08e665f715..451ac04ed18d 100644
--- a/drivers/firmware/dmi_scan.c
+++ b/drivers/firmware/dmi_scan.c
@@ -144,7 +144,7 @@ static int __init dmi_walk_early(void (*decode)(const struct dmi_header *,
 
 	buf = dmi_early_remap(dmi_base, orig_dmi_len);
 	if (buf == NULL)
-		return -1;
+		return -ENOMEM;
 
 	dmi_decode_table(buf, decode, NULL);
 
@@ -978,11 +978,11 @@ int dmi_walk(void (*decode)(const struct dmi_header *, void *),
 	u8 *buf;
 
 	if (!dmi_available)
-		return -1;
+		return -ENOENT;
 
 	buf = dmi_remap(dmi_base, dmi_len);
 	if (buf == NULL)
-		return -1;
+		return -ENOMEM;
 
 	dmi_decode_table(buf, decode, private_data);
 
-- 
2.5.0
