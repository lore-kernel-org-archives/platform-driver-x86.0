Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC4F369D7C;
	Sun, 13 Sep 2026 20:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789332697; cv=pass; b=azy39i+8N/2tVzywI7HtV7BS3jM4v6GOBZfAfoYipYGeBugYSAEeWDO4V3n9jOdYU+dknH0lCmnTSA6vp07kc84MWhTAroGKcOdZQ3tGJeXPBGDwyFsNrk7GLlTATSdDhBgRoMNyqfCTtXunB/EIGrLQ8Hdz1Ywycluy9XeCrMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789332697; c=relaxed/simple;
	bh=1cxWUIl3gEBMBYtY6zbUEKh6sjmVvjyj56/yOY20qC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oMbEQP911B6G/a7QKvXOlSf/B228KecDdWVUsvVTtssiZIawjoyeNK/oqapPpzBy33wYmpjMtvxvR7UbLTij7GrG9ufDVZR1HXMnhkJfkqvPnEhveu6+tcj1SdnUXnE9Hl2fSkSGaWaZNzUkvfTqjY7aCZUIZM8xNk/O9oKkFjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=V8FzNDjB; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="V8FzNDjB"
ARC-Seal: i=1; a=rsa-sha256; t=1789332648; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lUBFkPgQqQNE+fWlfvpyns1CImTm9LLvjmdz5o36GUE7b0+FP6ZGfrJPU2Wwn+/B8Rxf4HHOL4yWXEeywSGK7XK/6oqg2ss/M2L+Q1w11avoWuGdvg0dS0YhyIUONBsy8smOlXUMTkVnNmmCepG+gXak8VFI3B1cBNmxoByiZGI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789332648; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WoM0RDYPbOOrHvqbcNM+hqNOrg7RITsWO+B3vvVx5dQ=; 
	b=Qv64qe+FarsMjqKxYwMcOgdHxrohu8TyIVkPa5yQiOc1abrQoXmRbhTLWN40rJmwg87fPHdkA5eQglLjz8siqScxifY6eXepVue6qXcVqbiYMJ21nSgBY6BCLFVOgfBI9a2+12ETaNfB9TERtvCyBYOGt+Bet4mZ9eQS5HaMk9w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789332648;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=WoM0RDYPbOOrHvqbcNM+hqNOrg7RITsWO+B3vvVx5dQ=;
	b=V8FzNDjBmtJGWAJi6PPLpNuBUh3M0LyPEZc+IWjUhhmIZl5taWcds+mVlxXN6dK8
	H0OilSRWwfc21DKy203+8jkc2M/bbjiFkuyC6pO+czdHvSRxi4ER9uGeaUzaSrxOjVL
	KVC5tx/n282jhkuRSSwmSha9BaIgRZ64+Qgf+jBBAFAgUvFSK/Uot/fsbyqU0y9i3nY
	IsG1KEMWJIlEvXKzfbv6unh+QnBDDVw9OEHOV+7MaLBCiz0uStOWalkgYRcfhheTC4i
	7T/yTbuvn73jO9J0HOD/Cp9TlVsfv/yLODvGB7ToufR81i6Wy+OYwb5NUwY+6/Avgk3
	t154aBg/yA==
Received: by smtp.zohomail.com with SMTPS id 1789332647952883.7879633296424;
	Sun, 13 Sep 2026 13:50:47 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 14 Sep 2026 04:50:28 +0800
Subject: [PATCH 7/9] platform/x86: lenovo-wmi-capdata: Detect stubbed
 capdata device
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-lwmi-wmi-new-api-v1-7-7a400f2f69f8@rong.moe>
References: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe>
In-Reply-To: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Charles <hanker007@gmail.com>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-1f2f7
X-ZohoMailClient: External

Some devices may stub the capdata device's WMI query method because it
doesn't support the relevant interfaces at all. For example, most
ThinkBook devices doesn't support GameZone or Other Mode thermal tuning,
so capdata 01 is useless and stubbed.

Keeping the capability data list with empty data is meaningless and
causes lenovo-wmi-other to call lwmi_cd*_get_data() to retrieve
nonexistent capdata in vain.

Therefore, poison the device and release (or skip allocating) needless
resources, e.g., the capability data list and the debugfs directory.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/wmi-capdata.c | 33 +++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index d4d5e8c97ddb..805e36ef7f31 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.c
+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
@@ -668,6 +668,7 @@ static int lwmi_cd_poison(struct lwmi_cd_priv *priv, int err)
  */
 static int __lwmi_cd_cache(struct lwmi_cd_priv *priv)
 {
+	bool got_data = false;
 	size_t size;
 	int idx;
 	void *p;
@@ -702,8 +703,31 @@ static int __lwmi_cd_cache(struct lwmi_cd_priv *priv)
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
+	 * Poison the device and release needless resources.
+	 */
+	if (!got_data)
+		return lwmi_cd_poison(priv, -ENODATA);
+
 	return 0;
 }
 
@@ -743,6 +767,7 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
 static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv)
 {
 	struct wmi_buffer wbuf;
+	bool got_data = false;
 	struct cd_list *list;
 	int ret, idx;
 	u32 count;
@@ -785,14 +810,22 @@ static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv)
 	priv->list = list;
 
 	for (idx = 0; idx < count; idx++) {
+		if (!block->data[idx]) /* Ignore stub. */
+			continue;
+
 		/* Do not calculate array index using count, as it may be truncated. */
 		list->cd_fan[idx] = (struct capdata_fan) {
 			.id      = block->data[idx],
 			.max_rpm = block->data[idx + block->nr],
 			.min_rpm = block->data[idx + (2 * block->nr)],
 		};
+
+		got_data = true;
 	}
 
+	if (!got_data)
+		return lwmi_cd_poison(priv, -ENODATA);
+
 	return 0;
 }
 

-- 
2.55.0

