Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE3E3D1ABA;
	Sat, 17 Oct 2026 18:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792262670; cv=pass; b=f5m3tSNmQEB6LK025oTMjAhOD9Qu2ip5SpNRAWGkePOQj7UOOJZu/VvN2ad/fEbL43vJOzOkswLDUsKUS6/5Bh8EKdbvk1COcxV8DFZnxIG0Ll+cRZC64rWXLnemQ1h9MQGTGQoWEV+x9BpQ1PTZm6zsqqPE6e3YXE7zJZsdjdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792262670; c=relaxed/simple;
	bh=ZRoyOVLlBfOM3I0J2m4wMBGTsQlcyMDXLpahCz0HgTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=txq3MBPUzsxfMBWRPjut45VGM6xcfrM0g9xOy3hbl34pRv+9X7JcnyfNcaun038zyTHCCw0YQh4K6/Hkf7x5o11EDqm/91QoiFr0vLuDpEVb+54WyEQxDATtvKUH2ga/OJrs1R7/h0bu3f6ZC8CIgZ0jDAaiXFddA1C+usLyq5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=hD1fz9Jk; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="hD1fz9Jk"
ARC-Seal: i=1; a=rsa-sha256; t=1792262599; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IKVUxH6Lu7AJSHxqo7pOYZdB6BVlIZOBmSLc+vOzYyxRPW73bwJjOgUm6YsGoQri9KjE/V88lZ+Q9aCZKbzsZfloa0iAFhu1iBO8d3vTI5xDH86xkR58Pm+bAaChytaFFFK2Zng4ygI/6btadLejjX+PBkJvtEh1pUrmidXeRj4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792262599; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HSfIAljqwUJ+OKfHr33RXHzlzEM26+DfmEmIPNFOcsw=; 
	b=Ywkqy4ZKTza8PndGtDV75QKcfo245WhdQMtfVSJ2ew+RuaR7/mk4vSa7g9kjGs2gCevEOzxBHkIrAQV/aVQ7eDA846znchye8RduiCZ7FwFffMOFLgvxMk3dS2AQdnm+1oVMju2n+pnuKyOspteNfM1hsqyZJszAKZsIBx6c6t0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792262599;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=HSfIAljqwUJ+OKfHr33RXHzlzEM26+DfmEmIPNFOcsw=;
	b=hD1fz9JkmghSUqen44wtP+DFUDHNv157HMxernrz3J/6kqWtZTJE+f7AxhCavEr7
	qQWhASZaOntU4HFrHLXTV1kj2nPAq3Qzt9WV6qqsjWGUIvo7YUHNtuW4D8pBsDEOB6/
	NkorUMJHtfHy8A65B4RuSbcnlS88CJDkG35LOT/QEni6NZpFD82JHHtvrqqs4ZP2W1R
	Cx/ehuCBEwymWQ6MwgrrLtwMuiJj2Y7la0NwAcFEGqpskamOmiz8C4Pk2WnUAdaOUo/
	Teq9iCG+xRUASp2kT+2o9FAmPxIjA888hkgjVw8ETvZWc3JzupqLcFQ3KV5WvTa7TB0
	tAB+OEx73w==
Received: by smtp.zohomail.com with SMTPS id 1792262598191509.1361423404263;
	Sat, 17 Oct 2026 11:43:18 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 18 Oct 2026 02:42:39 +0800
Subject: [PATCH v4 09/12] platform/x86: lenovo-wmi-capdata: Detect stubbed
 capdata device
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261018-lwmi-wmi-new-api-v4-9-aafef7956c4a@rong.moe>
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

