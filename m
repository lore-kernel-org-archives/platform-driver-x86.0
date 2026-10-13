Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC2553ED09;
	Tue, 13 Oct 2026 19:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919716; cv=pass; b=fXfvqi/dH4QTzOmqW3JgIyzNJHyGZ5S9eiuHHPvNJOvCnVJsnwE9UrzItQtmoa0pzXWUximeNzmOwJ1VKuvEZD9pFquq1Ob3eIKYx6FieriCDOWGvYreDTfMvuV3eVy0D82fIH75wgw9ke/iBSuEuTQYTE61RnQWBEnRFRg0qIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919716; c=relaxed/simple;
	bh=Z/EgMuZRht3C+mlUe6TYGGFMUH962FkYo1a5s0rK470=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FcpKXUfZYhinpFduahck5NGDSX0iEIv3xKbAP1IFfuLYnVIU0hCpjiBVtysQAIFRC5X1RXCx+LvUb0oDQ/zc2DTPRXnMjPTWe2AAI2Los+qvsxGnJnHbiWpUnqvUPtYL2C2ZuMKHEVeebiJL0GkkdGbtmcL8JIp+SBBTq9xR0ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=BqjFAx9L; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="BqjFAx9L"
ARC-Seal: i=1; a=rsa-sha256; t=1791919626; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iodHWioOYP8z/I5gre9EIQTsRSdZ1je6YSj2DQfjKAv/6ZhYoT7XRk3SaA/l4sIsQ9Dl+fzA0npGbBm3AbZRWAREqH6mkj259F2xvUaj0kYCUyCiKljBlk6gOOA/9drfgqo9f7rZZAqALDS6oVzE+L1uQXnTqazhTtTgupT2YnE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791919626; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=J+2aVV1CS5xpzWZhcOeDvxRDMUoYFasAwmzY2nS0yWE=; 
	b=J6WHVgAetwPSpWZjerqEDIrcZezFTm3qpzcnN2UDvlIT/CuxNi+T9EAfwfchAHIb1Qums90I+rPPdkBrekOsFRJU0Qfi0A9fLLau0Hfi1BVZvgHAuhBb1cVVLXfoQ+RO+sXqEbiw0eDPPMlivZ2utRzfhQ9Xoc4/dtYBGGfQlzY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791919626;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=J+2aVV1CS5xpzWZhcOeDvxRDMUoYFasAwmzY2nS0yWE=;
	b=BqjFAx9LtLoJI/zviD16FRdHYByZdaqH0tUNJPHI311T6xWhMOYb9B3fiRiqElA+
	0SrPf9iuJMMW5RU2W0FrkvS42qznynhos+JH710/h96FnvAEHAMeksx2W9Vt+J/2Pw8
	IHp9hZZo2G/aMgw3b+PXC6YtjCmjhkPVv2huU/WFGOlE9vIYfa5aO5I8Ksv1WbmpOjf
	5dmWVPcvLDWHIUHayvoJ8bOMzbzjSBUffYIAQjBWcM2ACHyid7yDlzKC9sZ9ncLk9wr
	x8wCsZ2JLSEkFICtilyc3+BB91PLweJ3JWWO0bAUH6E88N+D5rgL7DETpbXusHkQlvC
	427QYBjNvg==
Received: by smtp.zohomail.com with SMTPS id 1791919624598928.479475526039;
	Tue, 13 Oct 2026 12:27:04 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Wed, 14 Oct 2026 03:21:52 +0800
Subject: [PATCH v3 09/12] platform/x86: lenovo-wmi-capdata: Detect stubbed
 capdata device
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261014-lwmi-wmi-new-api-v3-9-e1032bed1c81@rong.moe>
References: <20261014-lwmi-wmi-new-api-v3-0-e1032bed1c81@rong.moe>
In-Reply-To: <20261014-lwmi-wmi-new-api-v3-0-e1032bed1c81@rong.moe>
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

Some devices may stub the capdata device's WMI query method because it
doesn't support the relevant interfaces at all. For example, most
ThinkBook devices doesn't support GameZone or Other Mode thermal tuning,
so capdata 01 is useless and stubbed.

Keeping the capability data list with empty data is meaningless and
causes lenovo-wmi-other to call lwmi_cd*_get_data() to retrieve
nonexistent capdata in vain.

Therefore, stub the device and release (or skip allocating) needless
resources, e.g., the capability data list and the debugfs directory.

Tested-by: Navon John Lukose <navonjohnlukose@gmail.com>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v2:
- Replace the term "poison" with "stub" (thanks Ilpo Järvinen)
---
 drivers/platform/x86/lenovo/wmi-capdata.c | 33 +++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index 71ea31482987..39fc7a52cdfe 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.c
+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
@@ -691,6 +691,7 @@ static int lwmi_cd_stub(struct lwmi_cd_priv *priv, int err)
  */
 static int __lwmi_cd_cache(struct lwmi_cd_priv *priv)
 {
+	bool got_data = false;
 	size_t size;
 	int idx;
 	void *p;
@@ -725,8 +726,31 @@ static int __lwmi_cd_cache(struct lwmi_cd_priv *priv)
 		struct capdata00 *capdata __free(kfree) = wbuf.data;
 
 		memcpy(p, capdata, size);
+
+		/*
+		 * A valid attribute always has a non-zero id. IOW, a zero id
+		 * implies a stubbed item (or the query method being stubbed).
+		 *
+		 * The stubbed item is still copied to the cache slot anyway, in
+		 * case the firmware dynamically stubs the capdata item after
+		 * switching Game Zone mode. In this manner, the previously
+		 * exposed capdata can be void.
+		 */
+		if (capdata->id)
+			got_data = true;
 	}
 
+	/*
+	 * Some devices may stub the query method because it doesn't support the
+	 * relevant interfaces at all. For example, most ThinkBook devices
+	 * doesn't support Game Zone or Other Mode thermal tuning, so capdata 01
+	 * is useless and stubbed.
+	 *
+	 * Stub the device and release needless resources.
+	 */
+	if (!got_data)
+		return lwmi_cd_stub(priv, -ENODATA);
+
 	return 0;
 }
 
@@ -767,6 +791,7 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
 static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv)
 {
 	struct wmi_buffer wbuf;
+	bool got_data = false;
 	struct cd_list *list;
 	int ret, idx;
 	u32 count;
@@ -808,13 +833,21 @@ static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv)
 	priv->list = list;
 
 	for (idx = 0; idx < count; idx++) {
+		if (!block->data[idx]) /* Ignore stub. */
+			continue;
+
 		list->cd_fan[idx] = (struct capdata_fan) {
 			.id      = block->data[idx],
 			.max_rpm = block->data[idx + count],
 			.min_rpm = block->data[idx + (2 * count)],
 		};
+
+		got_data = true;
 	}
 
+	if (!got_data)
+		return lwmi_cd_stub(priv, -ENODATA);
+
 	return 0;
 }
 

-- 
2.55.0

