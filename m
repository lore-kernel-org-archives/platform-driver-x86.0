Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBEF3D649A;
	Sat, 17 Oct 2026 18:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792262678; cv=pass; b=JNsKF6E49dkEa8ti5wJ8kkkPzyw1dg3veuCzjN2vS24VaI4+p6rwS5qMl52BxBTcJgiVdLOdo5g8nobaWLHocR4QGu5t9DKXPRprfT222n5vn0tfZ8U1xxUAy2nfVfs1s134OsexAFjcWFJhRcAAxjZHl9TelZbFS3KPd9cGcHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792262678; c=relaxed/simple;
	bh=GVRKK7wIVEkv+ISV/xqUuo3JiSmbY344W9YijI8bHiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CPy5otwI0hP94RgxuTLt79SPMWDBidDiNaxxx2yrfIqRbeHIDrRaoOrFQN5jW1BPENQEOc0cqkT8/x5VQCrshGG1aJFn/CPBda/xqYQOtX+MQiLr/oC8X6+Qnl8jv2xU6wokl75zsCuNFlzagQ3wnMJkbSpuTzGAY793dY7BPyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=QTwm5pIw; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="QTwm5pIw"
ARC-Seal: i=1; a=rsa-sha256; t=1792262603; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aj2xcQwPX0fnshIpRQCI03J/AIKsU+TW4JeN5a6dKV6n3mQuj7LgvY3Nl8QikhQwDtDDGYh+rzOqRYL3ZjHIlyt3V6tZFi6+G0D6VzE+z+4IEGLWA6iHMSGaAd4iwab1JRmJ5CznuDPI1JEySmxiOSJR7cy5kGlmplE0UMyJbdQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792262603; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=v3KKP25RBNqCM5rP3/ngKy/EaDOjyiINSh7w7QP/mzw=; 
	b=m8Y0P63YirKYFCVYlALk55xa2AiM/MjSK4fjaJTloD4oaxJjVZUHIT9yFKAaBpNCjLs7J+bCnwAHX9LRTk07i9WPKTZYBy2u0LJ4Q+RZS6h8epnQ9ndiW2yXUet7YKkxdCWzkBBFNcSMORiqaZwGm6p0w2xlcWCBek/+J7mjkBA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792262603;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=v3KKP25RBNqCM5rP3/ngKy/EaDOjyiINSh7w7QP/mzw=;
	b=QTwm5pIwZB7N4xH2qpfk/Kp/Bs9kmQoPqbKVKUULarJcoFUfMsqkVOY5AvsjlqFd
	WGdbVAXsIw6wxrBusq+SGUJIYbZtYkOhNp+nmcvOZ0S18StAI5XSeeoRCFp3RhdqM1f
	a/uWMY2c25kZuC/LB/7EzhVMqhkk+1JHG3BIF+TDsYi6brFIoJElfhem7oLlFfZvdzv
	8M3BRLyW9oROILiNfo7zpjRTEBjPZ/NnTe4O+FY43eEdo146pPpBYYKmZIvLz6GVhca
	CnqtlzRHyb/MKI+2aV4rwmMQu/XWUn/2KzK3XiuIVD4sIo7id2mtE10qrGaf6C2c+TN
	w5LGWjXAig==
Received: by smtp.zohomail.com with SMTPS id 1792262601252638.2155144773533;
	Sat, 17 Oct 2026 11:43:21 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 18 Oct 2026 02:42:40 +0800
Subject: [PATCH v4 10/12] platform/x86: lenovo-wmi-capdata: Do not match
 missing components
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-lwmi-wmi-new-api-v4-10-aafef7956c4a@rong.moe>
References: <20261018-lwmi-wmi-new-api-v4-0-aafef7956c4a@rong.moe>
In-Reply-To: <20261018-lwmi-wmi-new-api-v4-0-aafef7956c4a@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Charles <hanker007@gmail.com>, 
 Navon John Lukose <navonjohnlukose@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-73bef
X-ZohoMailClient: External

Some devices do not support LENOVO_CAPABILITY_DATA_01. They either do
not have the corresponding WMI GUID, or do not implement the query
method.

In both cases, the WMI core does not create the corresponding WMI
device, leaving the component master (i.e., lenovo-wmi-other) waits for
the missing component forever.

Identify missing components using the new wmidev_exists() interface, and
skip adding them to the match list, so that all components in the list
must present, fulfilling the binding requirement.

Reported-by: Navon John Lukose <navonjohnlukose@gmail.com>
Closes: https://msgid.link/20260928190901.1369497-1-navonjohnlukose@gmail.com
Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Link: https://msgid.link/9789f452-d7eb-4f1e-8a13-7335332193a7@app.fastmail.com
Tested-by: Navon John Lukose <navonjohnlukose@gmail.com>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v4:
- Pass the error from guid_parse() to matchptr

Changes in v2:
- New patch in the series to solve the report made by Navon
---
 drivers/platform/x86/lenovo/wmi-capdata.c | 41 +++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index 39fc7a52cdfe..fe2ea1b40955 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.c
+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
@@ -49,6 +49,7 @@
 #include <linux/stddef.h>
 #include <linux/string.h>
 #include <linux/types.h>
+#include <linux/uuid.h>
 #include <linux/wmi.h>
 
 #include <asm/barrier.h>
@@ -75,14 +76,19 @@ enum lwmi_cd_type {
 	CD_TYPE_NONE = -1,
 };
 
-#define LWMI_CD_TABLE_ITEM(_type)		\
-	[_type] = {				\
-		.name = #_type,			\
-		.type = _type,			\
+static const struct wmi_device_id lwmi_cd_id_table[];
+
+/* Save some .rodata space by reusing the GUID strings from the id table. */
+#define LWMI_CD_TABLE_ITEM(_type)					\
+	[_type] = {							\
+		.name = #_type,						\
+		.guid_string = lwmi_cd_id_table[_type].guid_string,	\
+		.type = _type,						\
 	}
 
 static const struct lwmi_cd_info {
 	const char *name;
+	const char *guid_string;
 	enum lwmi_cd_type type;
 } lwmi_cd_table[] = {
 	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_00),
@@ -153,24 +159,49 @@ static int lwmi_cd_match(struct device *dev, void *type)
  *
  * Adds all component matches to the list stored in @matchptr for the @master
  * device. @matchptr must be initialized to NULL.
+ *
+ * Missing components are not added to the match list, or else the master waits
+ * for them forever. For some components, their existence can be determined by
+ * querying other components, so they are handled as sub-components and thus not
+ * matched here. For components with no existence declaration, wmidev_exists()
+ * is used to determine their existence.
+ *
+ * If all components are missing, ERR_PTR(-ENXIO) is returned through @matchptr.
  */
 void lwmi_cd_match_add_all(struct device *master, struct component_match **matchptr)
 {
-	int i;
+	bool matched = false;
+	int ret, i;
 
 	if (WARN_ON(*matchptr))
 		return;
 
 	for (i = 0; i < ARRAY_SIZE(lwmi_cd_table); i++) {
+		guid_t guid;
+
 		/* Skip sub-components. */
 		if (lwmi_cd_table[i].type == LENOVO_FAN_TEST_DATA)
 			continue;
 
+		ret = guid_parse(lwmi_cd_table[i].guid_string, &guid);
+		if (ret < 0) {
+			*matchptr = ERR_PTR(ret);
+			return;
+		}
+
+		if (!wmidev_exists(&guid))
+			continue;
+
 		component_match_add(master, matchptr, lwmi_cd_match,
 				    (void *)&lwmi_cd_table[i].type);
 		if (IS_ERR(*matchptr))
 			return;
+
+		matched = true;
 	}
+
+	if (!matched)
+		*matchptr = ERR_PTR(-ENXIO);
 }
 EXPORT_SYMBOL_NS_GPL(lwmi_cd_match_add_all, "LENOVO_WMI_CAPDATA");
 

-- 
2.55.0

