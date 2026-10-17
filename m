Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEAB3D5237;
	Sat, 17 Oct 2026 18:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792262651; cv=pass; b=XnCKzPdwPwI6+Sd8vNBXK/AIomuN/C2Fvi4itln0u6XyT8Jv3JLZvt3SumHyoqLDZAUCXbuJ/dJ5JJNBFqEKoU4b0As1AVuJgJ5/PtxPAWnQE7QoYv4Sgu/m9AdBqY5cKqrtChaRoMWdRrp5F3jfXakiNyx9Rm2hI0B7oSQNZvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792262651; c=relaxed/simple;
	bh=OoqqwRwN7oicg5KzLEcJOcF6n1vaBY4SfIR2g2/7akM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iYmOYo2qucM/VN+nvY1avkcig8PIqEm9h64nLnZi23Ik03OP9mHp9Auvtc+d/dq6viOLoqAPdRWdUSvA3FVYSmq2zZb8dkLpX0Eic4qoT0PLs6CM1jkLnzAjoVDap8A8IH9EzIaKa2TRD19i1XqlTbwiZxMbVWvo3fQf9nEmn44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=iNLtVm+a; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="iNLtVm+a"
ARC-Seal: i=1; a=rsa-sha256; t=1792262593; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XuS5VrAHLLRUli7J3sRspzRkNZWDSch72JlZLxCXXxtEnTK4d6fxrxTF1qyQ8HmVsClOTzQll1c+P+3bnnMJW1+gq+sv9PJ37AC/e+5XaMONdNAtVpxkvEYiPbNjtAHeDBjEc0bSsI5BqRGlZaE8V/Fs2V4yj574Yno6NYDhqfk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792262593; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PkIwz0qnWPuY270wEVZw6YmaGPQ4dKTlZjujDM/lzIg=; 
	b=nkJaIsTEsPkJMlqjiValmY/bsfBrzqw7HHUm95JzX+Q7im0mKk+rRzfY9KyxfFO44uMwIAv1CEzbDqEIUNUcHJL7XiebxxJ/t2hZN5YDhT9MiVnkjYbTX3LiKEreblYAQ6yRnw/wyX4/D06FoJs4w3+8y+2Mtok1Gf7xI6VUc18=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792262593;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=PkIwz0qnWPuY270wEVZw6YmaGPQ4dKTlZjujDM/lzIg=;
	b=iNLtVm+aI4eGYBBsdobpiCqL8HEij/y4XQJXh2rbTrGXIPv8dJiaHNJU7juysEjm
	VxIrEa73FEAIq5wx47adcg8EKnJ6Wqlcw3U61zhKAl1hWuLsa/nmXOEq0Sq6+mfmSvp
	SciW0k36BrZqmlEBLh2uGeed+uph7YeyphhWDJ1S336f+/2pviqaLx5OotuikK3fcfH
	zp2gmxRq7YeOuJX9jWIn/cpAGHi9VLoE/BCJB+7Ynny9oJp/OEyT2+jex3YSF4gJixO
	HIDxALSfB8+exdkyj/jo8HvLC7K/XGDgYcnxBKUmEd47XVbVwUZtS89KkLTCZdAzslZ
	jzN3RNJBcg==
Received: by smtp.zohomail.com with SMTPS id 1792262591871882.2906558486959;
	Sat, 17 Oct 2026 11:43:11 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 18 Oct 2026 02:42:37 +0800
Subject: [PATCH v4 07/12] platform/x86: lenovo-wmi-capdata: Adopt new WMI
 API
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-lwmi-wmi-new-api-v4-7-aafef7956c4a@rong.moe>
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

The new WMI API supports multiple ACPI types by converting them into a
unified buffer that satisfies alignment and size requirements.

Adopt it to make our life easier.

Note that the new WMI API only accepts a few ACPI types to conform to
the behavior of the Windows WMI-ACPI driver. By adopting the new API, we
intentionally rejects improper ACPI types instead of silently ignoring
them.

Meanwhile, considering that `struct_size(block, data, count * 3)' may
overflow when calculating `count * 3', ignore Fan Test Data with count >
U8_MAX instead of capping `count'.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Tested-by: Navon John Lukose <navonjohnlukose@gmail.com>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v4:
- Fix typo (thanks Mark Pearson)

Changes in v3:
- Leave struct cd_fan_block's __packed attribute as is (thanks Armin
  Wolf)
---
 drivers/platform/x86/lenovo/wmi-capdata.c | 70 ++++++++++++++-----------------
 1 file changed, 31 insertions(+), 39 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index 3c09bb9e3d46..abf5ffda7163 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.c
+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
@@ -626,17 +626,19 @@ static int __lwmi_cd_cache(struct lwmi_cd_priv *priv)
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
@@ -678,43 +680,34 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
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
+	} __packed;
 
-	union acpi_object *ret_obj __free(kfree) = wmidev_block_query(priv->wdev, 0);
-	if (!ret_obj)
-		return -ENODEV;
+	ret = wmidev_query_block(priv->wdev, 0, &wbuf, sizeof(struct cd_fan_block));
+	if (ret == -ENODATA) /* The block is too short, probably stubbed. */
+		return 0;
+	if (ret)
+		return ret;
 
-	if (ret_obj->type == ACPI_TYPE_BUFFER) {
-		block = (struct cd_fan_block *)ret_obj->buffer.pointer;
-		size = ret_obj->buffer.length;
+	struct cd_fan_block *block __free(kfree) = wbuf.data;
 
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
+	count = block->nr;
+
+	if (count > U8_MAX) {
+		dev_warn(&priv->wdev->dev,
+			 "too many fans reported: %u > %u, ignoring\n", count, U8_MAX);
+		count = 0;
+	} else if (wbuf.length < struct_size(block, data, count * 3)) {
+		dev_warn(&priv->wdev->dev,
+			 "incomplete fan test data block: %zu < %zu (%u fans), ignoring\n",
+			 wbuf.length, struct_size(block, data, count * 3), count);
 		count = 0;
 	}
 
@@ -729,11 +722,10 @@ static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv)
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

