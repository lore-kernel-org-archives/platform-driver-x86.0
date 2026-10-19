Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792422295;
	b=qhtqRKytf/6G35Jh7rtl6zp6HispEREc4ZD+3L4JIsX2XWWgQ2FUkL6YTUaSFtPRhvUA
	 Ztz60EU2uw67hkmvpVco5W+A1w7Kd8IwRopu7oyoxNu9IafR7fx2vQVScyV8kpZgweFr2
	 wf4z5ziU+pbL/kNhP+0p+SMuRxL+wVYKmA/gY6onUsDQU8ZxwdSilG/OZuSyyr5u3TK/D
	 joe/NmDyK0mIGzj44iEW17seRRWr+COAqmsxHzNKjg187A43QrgibT8nJEkGDN9LkT1eN
	 HRAvFbPLMI/MWmYN9nV3Fwm/WAB/k4TzP9p8UntD1Z8aZQ4YP1OSDgH9T1Idma2hn4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422295;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=tVy0gnupGubIpiytEwQub+oESnTSCskkEVD4mfSWPhA=;
	b=QEskkCTL4uWmTZgUQWIk0PqydRvzY5ZSjK5QCrg4Ls5/Gv28YHUXMxETWpgZRGC/NMCd
	 0+w7VUA4kZvHxrL1CM/O/uOWzhUP06CqTjBDXfowG0/ajgDMivg+wjMtC8uYiZ1PNtE4D
	 62js6GFc30VZgXBI4AsbKS640B9lhOTDilWeN+x7zeh1VegYpsIq430ReSUQcxveOVSae
	 lui5KdEUXao79/NnqhaVx+FR4/VEOFMxeon8WbHcNfrNmLuiJLZi7QL4VxKGDAx3UqKAe
	 Ga9BJVvdN2P7nJ2NvD7yNF60mFOICm9mAEGdQP/mj/8V/jnPLMXRxzBqEYjaHxyppKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=o+Ar1s16;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC1C607F4AE;
	Mon, 19 Oct 2026 15:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BC1C607F4AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=o+Ar1s16
ARC-Seal: i=1; a=rsa-sha256; t=1792422216; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SRBhQdbbf41+MA4nVKXNDcU8Lo1M5bZxrIVOacjUsOk/vgzh51a2Xa0UPksamOw6ifzeoUjmmri/ATlY4elg9e8MUl/AgDChCr8oH9fVQ4YKO3hq/lQ1W2qJflIEGhDDx865F2MQ6Ah/sJyK3cBnMwXTgJsdQMkwaktJc2VfjhI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792422216; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tVy0gnupGubIpiytEwQub+oESnTSCskkEVD4mfSWPhA=; 
	b=IA/QVZK8K9pvJEPtNDXbiT+IXDGO07AWP4CrWLHKrFmwqxd+foxy3NuuGbjubwwPSglVFH605kLZaH5y3BSKuJ0+Jk9TU7IgENVrCLMFTj2+ui8rVXLYcUKSGUSOANFy3F/Re99XyXDhfHIYjdSZZH9NRZy78aoxt3QFk28JqP0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792422216;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=tVy0gnupGubIpiytEwQub+oESnTSCskkEVD4mfSWPhA=;
	b=o+Ar1s16pzwXQA1lJIw7bFsimyN/eYqpvCZJpMr2PD+H87gUARx/88CyfUl8SCYW
	+WGp22wuPg2mCCyy8LbGY+gLbz3mk/Iegr3MM+sH/x/hke/o/1JXEujIuQjB4+FenIT
	MYfmygJtjpPO2iXaNdhoGhruwsokfb/2Ug/x2HyWhwuva/Gkxmya7Upppf6PWKPke/W
	ejSEQpVQSQruhiWpDUMTVJGuKle5DoWP3+2onWwn0MqLA1rnPiLrJZfkPsJyOc3fZR+
	Ge4cZB38AlVGXIooKWJaTu5Ur0Q0M86xwDSFZNTiiOGMJKxGwTg3duYyqWsnXYB9twg
	Frwly9Mp5Q==
Received: by smtp.zohomail.com with SMTPS id 1792422210683726.0108029779062;
	Mon, 19 Oct 2026 08:03:30 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 19 Oct 2026 23:02:32 +0800
Subject: [PATCH v5 10/12] platform/x86: lenovo-wmi-capdata: Do not match
 missing components
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-lwmi-wmi-new-api-v5-10-71557d28d058@rong.moe>
References: <20261019-lwmi-wmi-new-api-v5-0-71557d28d058@rong.moe>
In-Reply-To: <20261019-lwmi-wmi-new-api-v5-0-71557d28d058@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Charles <hanker007@gmail.com>, 
 Navon John Lukose <navonjohnlukose@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-6be7c
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
index b86bc7a57a04..1d44ff83e157 100644
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

