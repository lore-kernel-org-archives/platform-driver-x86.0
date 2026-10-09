Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24644503EF;
	Fri,  9 Oct 2026 12:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791550544; cv=pass; b=qpmnu82zU795vxCnB3WeTdKQrzSz6cfROhotISJ895Fy5Yq4a8q9knoc2MJvJ0QsVpoQxefOtHZU6L1lqxLQp1w0OirJL0UfXYYk/N6mS+9Ley3uA3c9nB4O1pWXCmAivIHywhyb+RiGkujHMHRsjLT2M7fOzPMVxRDHWQZ8tbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791550544; c=relaxed/simple;
	bh=JvEZpXxeCCAwKQfigQ6uGGrSgUpJw5Mq71WeHQrvmcE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WsjUthFTkU2TIS5o/SQSobYp0CqNgA1fBxh+AWV2u7QuZYKMiJZ27ah4xt3b9kTARE5US2kJPp7KnNKlszsDSY6lZHrDjqqwYWqzZeAMVunolGjOfKiKaBuc1W/oKZfYcuFU1utEhUtVmO6ANhutoPVjT9+eD+rBhRbZ5f7JU7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=DYzfSA1k; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="DYzfSA1k"
ARC-Seal: i=1; a=rsa-sha256; t=1791550479; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=oFPePVjziyDMo3CVpim12aZWc41X/p9iQCB110zXispkaLEBIYvKGoaPbrIiLPA9v2apeNaQMjPgQ/8xbFKzje3MdliXjQwkSr4RL83iRMR3f8M4dluPTaI2Isy0e1mFprT+ej6pkWCcLLuL8DGuJmIgaLrwoPjO+l2AJ1PdGNs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791550479; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mkfzBYJNKr4P55/Yamu7AIjc7Fx7kASf87GAVzxcTKU=; 
	b=UtdwmjEyqG8BqrX9pNYURZcQh9DRuMjktL3bScjHcb9rvFzr3TE9mGVdtQvd0B7r+3nsto7Dp/jN1y4KMp6ze/alrkFxDn9Ze7xMMbauP9zYta5PlspnXjFfnRxTBNS7ut7HGPXa/NM1lBRI6+Dx/6/ZhaYYeIqJsyaE1Ubzpgk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791550479;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=mkfzBYJNKr4P55/Yamu7AIjc7Fx7kASf87GAVzxcTKU=;
	b=DYzfSA1k5OjQts7ztKnR43K5DMTz8hUv9mjRkxOeBu1nsgOVeNuPcPYT8uihFS97
	yiWPzXC5fmaVIPm8c6y+K5vMwmHJNWdCyoBuSDZNMLMa2nIdkwdzDifBuIUoCshXQXY
	Az74CsoCCmMzSnRcHX8ZbzjjgK88cLqpGQN48PSHEPfTcwwKH58Agrv7wg6p3trE3yq
	81ofQMP8fAcCeNPLwLM0veSSzLMIY975rcgA6xJLUUjwRKpDouyWXl0fK/ZAxR7yjKI
	BuT8tFoKJXGb9u0HQYbsWSMtS0uvDygMr0Y5+lqEe3sL8b2szaY1PkTC7r4Qetzksh0
	Q5baiB2j7A==
Received: by smtp.zohomail.com with SMTPS id 1791550478769583.7346636002634;
	Fri, 9 Oct 2026 05:54:38 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Fri, 09 Oct 2026 20:53:49 +0800
Subject: [PATCH v2 07/12] platform/x86: lenovo-wmi-capdata: Adopt new WMI
 API
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-lwmi-wmi-new-api-v2-7-402828382679@rong.moe>
References: <20261009-lwmi-wmi-new-api-v2-0-402828382679@rong.moe>
In-Reply-To: <20261009-lwmi-wmi-new-api-v2-0-402828382679@rong.moe>
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

The new WMI API supports multiple ACPI types by converting them into a
unified buffer that satisfies alignment and size requirements.

Adopt it to make our life easier.

Note that the new WMI API only accepts a few ACPI types to conform to
the behavior of the Windows WMI-ACPI driver. By adopting the new API, we
intentionally rejects improper ACPI types instead of silently ignoring
them.

Meanwhile, considering that `struct_size(block, data, count * 3)' may
overflow when calculating `count * 3', ignore Fan Test Data with count >
U8_MAX instead of caping `count'.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/wmi-capdata.c | 71 ++++++++++++++-----------------
 1 file changed, 32 insertions(+), 39 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index de8044ef68b8..d70fe4504fc5 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.c
+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
@@ -628,17 +628,19 @@ static int __lwmi_cd_cache(struct lwmi_cd_priv *priv)
 	}
 
 	for (idx = 0; idx < priv->list->count; idx++, p += size) {
-		union acpi_object *ret_obj __free(kfree) = NULL;
+		struct wmi_buffer wbuf;
+		int ret;
 
-		ret_obj = wmidev_block_query(priv->wdev, idx);
-		if (!ret_obj)
-			return -ENODEV;
-
-		if (ret_obj->type != ACPI_TYPE_BUFFER ||
-		    ret_obj->buffer.length < size)
+		ret = wmidev_query_block(priv->wdev, idx, &wbuf, size);
+		if (ret == -ENODATA) /* The block is too short, probably stubbed. */
 			continue;
+		if (ret)
+			return ret;
+
+		/* Capdata 01 is an extension to capdata 00. */
+		struct capdata00 *capdata __free(kfree) = wbuf.data;
 
-		memcpy(p, ret_obj->buffer.pointer, size);
+		memcpy(p, capdata, size);
 	}
 
 	return 0;
@@ -680,43 +682,35 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
  */
 static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv)
 {
+	struct wmi_buffer wbuf;
 	struct cd_list *list;
-	size_t size;
+	int ret, idx;
 	u32 count;
-	int idx;
 
-	/* Emit unaligned access to u8 buffer with __packed. */
 	struct cd_fan_block {
 		u32 nr;
 		u32 data[]; /* id[nr], max_rpm[nr], min_rpm[nr] */
-	} __packed * block;
+	};
+
+	ret = wmidev_query_block(priv->wdev, 0, &wbuf, sizeof(struct cd_fan_block));
+	if (ret == -ENODATA) /* The block is too short, probably stubbed. */
+		return 0;
+	if (ret)
+		return ret;
 
-	union acpi_object *ret_obj __free(kfree) = wmidev_block_query(priv->wdev, 0);
-	if (!ret_obj)
-		return -ENODEV;
+	struct cd_fan_block *block __free(kfree) = wbuf.data;
 
-	if (ret_obj->type == ACPI_TYPE_BUFFER) {
-		block = (struct cd_fan_block *)ret_obj->buffer.pointer;
-		size = ret_obj->buffer.length;
+	count = block->nr;
 
-		count = size >= sizeof(*block) ? block->nr : 0;
-		if (size < struct_size(block, data, count * 3)) {
-			dev_warn(&priv->wdev->dev,
-				 "incomplete fan test data block: %zu < %zu, ignoring\n",
-				 size, struct_size(block, data, count * 3));
-			count = 0;
-		} else if (count > U8_MAX) {
-			dev_warn(&priv->wdev->dev,
-				 "too many fans reported: %u > %u, truncating\n",
-				 count, U8_MAX);
-			count = U8_MAX;
-		}
-	} else {
-		/*
-		 * This is usually caused by a dummy ACPI method. Do not return an error
-		 * as failing to probe this device will result in sub-master device being
-		 * unbound. This behavior aligns with lwmi_cd_cache().
-		 */
+	if (count > U8_MAX) {
+		dev_warn(&priv->wdev->dev,
+			 "too many fans reported: %u > %u, ignoring\n", count,
+			 U8_MAX);
+		count = 0;
+	} else if (wbuf.length < struct_size(block, data, count * 3)) {
+		dev_warn(&priv->wdev->dev,
+			 "incomplete fan test data block: %zu < %zu (%u fans), ignoring\n",
+			 wbuf.length, struct_size(block, data, count * 3), count);
 		count = 0;
 	}
 
@@ -731,11 +725,10 @@ static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv)
 	priv->list = list;
 
 	for (idx = 0; idx < count; idx++) {
-		/* Do not calculate array index using count, as it may be truncated. */
 		list->cd_fan[idx] = (struct capdata_fan) {
 			.id      = block->data[idx],
-			.max_rpm = block->data[idx + block->nr],
-			.min_rpm = block->data[idx + (2 * block->nr)],
+			.max_rpm = block->data[idx + count],
+			.min_rpm = block->data[idx + (2 * count)],
 		};
 	}
 

-- 
2.55.0

