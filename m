Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792422285;
	b=NCkz3hrJRTqBqr7QpjKnzVrE0mnn9GN7/x9NzXMv/h01dmkUWIOl6BwN55f4rWVxdrkc
	 UQKaJhWxMUcRTWAqvC8Rr/nu2hRx1Gk7j7aD3cjrKlkEb1+XkMiV+sdceP2G11UyntBOp
	 fzm873NP6u3/1fd8PZ5j6RQvENeMg6PtBr15WyAKal8mQzhVP83qlnHTCsYXCNdZfdFSc
	 9VE0vLOBhyaSi/Dvs1FmoGm+RNg+YHye/wZ0UQNgoYraq/r1TSuTXvYGvg75pB2nhbH8u
	 CZBUaF8d73FskFQyHzqcslHkzdEMIqH/Ig1Nt/jWsa45rNkv5eQyc7CRcU8uIhUzq+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422285;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=kLKrJjfCzoHcACnO33I+JPBo3vVugR5O9pIj/Gs+qHE=;
	b=IcI/3PEd2QdvDxRfg0b+WyforDdetyHZCIo1Zi6n/xGGnaHbtiTMw8tIpZ11AWv3fACt
	 y9pEcyIOEPU0+GqZNeN3K0RVWU0NDCME30iNaaf/nIMYUz6YMZkARSrP2h6z9v8udX6y9
	 uZ0iFeDPFTHmAqNvdwaWHyh3ZCc18eFJAyyZpZfJYh3LEEBEvcTTcjUh9doPo+589REtB
	 d7PbZhCt2ZNr63QbZmfKhvlz5kykEx4OFouTvjUiOZqRn8Y9LePSshLWJRuS7yfN2Fgx+
	 UftYMqT4jjQXKCmXR3k+TfsG4O3QvUMDAK3ZIqrB0VOUh804q0ALE3YzpWDTsyZ0/pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=DarmpvQP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC18D607F4A4;
	Mon, 19 Oct 2026 15:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC18D607F4A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=DarmpvQP
ARC-Seal: i=1; a=rsa-sha256; t=1792422211; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cSn4m9sUI5TdPRQapCJSWOZ6urEVHJe3MIt7osRi99I0YloRW7Y1l4ZOXjiQtZ+HXUYDpU148zdSSFuD12v13R6dsed//3SD5D7rrcbUAAixfxZ5rbPJboYPdolx8nA3K9P0GQfvuJV3eG56D1y9FEUpuO1GfRoGDNW8d7DLPmI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792422211; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kLKrJjfCzoHcACnO33I+JPBo3vVugR5O9pIj/Gs+qHE=; 
	b=n8OSVZ5x1sNJXGBrEs0VKOD9HHMVoeR3Xd0m3qUU3B+u5j2kLtIQyKkRaWkCUO0itYdyJW9J9/4Mc9I9jhjQdqQZqrDSQFgrqlYuMEsA+t0JE6/vCu2AhF0awZyvn5/HFNvnlgh6JUz4V/VJp4SDcBiINZpyUGueBqW4y/USCb4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792422211;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=kLKrJjfCzoHcACnO33I+JPBo3vVugR5O9pIj/Gs+qHE=;
	b=DarmpvQP3yXyxhBhyYqsBCWHF+wM6d8JE88p1CcHJ7HZmXHrDf6SJHvRCxyIdJi4
	3ynAhy2JQuI31xjxi6RjW/Y52XEETKWK7K6RLFiFld74kNAu8yndSss3Pqoh/i0iK5L
	oXcorugdipfiSP8JIjxrudCKcowVW7KsDzaMoQJQyhbu89s3z93g6aMlUafG/xUenxK
	EZ6aAVIOqdFZKYfuPTKelKBWF3XWNw2cqV8wsKLnchjNu7j59WU+w5d0OTW0+09Snrc
	E3hGQBgYIYk+SbpNc2MkDIraHlVjdPv2W8JRsALUx/hkQXd6d3WpGbTNdXGDJ8tMnrS
	sFz86Hw/4A==
Received: by smtp.zohomail.com with SMTPS id 1792422206249245.80756612073742;
	Mon, 19 Oct 2026 08:03:26 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 19 Oct 2026 23:02:31 +0800
Subject: [PATCH v5 09/12] platform/x86: lenovo-wmi-capdata: Detect stubbed
 capdata device
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261019-lwmi-wmi-new-api-v5-9-71557d28d058@rong.moe>
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
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v2:
- Replace the term "poison" with "stub" (thanks Ilpo Järvinen)
---
 drivers/platform/x86/lenovo/wmi-capdata.c | 33 +++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index 7310b72e8c2f..b86bc7a57a04 100644
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
 
@@ -772,6 +796,7 @@ struct lwmi_cd_fan_block {
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

