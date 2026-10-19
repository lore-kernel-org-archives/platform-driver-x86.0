Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792422264;
	b=vp8M62UWYfGUMkBQPs1GTFEiqKWzFNUU3H4mSetIevomHnfAx0Y1oHkALMOW+6moVX1P
	 Sqzstoerzd4pZ+od4SSaYYdMDNElT4WZRWuEHC/yVbgGKeZyT7xusanB0+sWrONJX3EBz
	 Q8hpUARlv0MhIxDL+w4spPoum7gEsBh3br4kAtItSBfIwdwWGZgkPdUWygfzqZkimq90Z
	 o9xko/mjo63RIJJzXS2liCYmrY8V/i8p2P7iPA0aLcRogfO7inIFdBU12cb2ZEB8ZBPHu
	 fJhffSIejPCQUiwm/gdTghdsAHUesgGHIz2uhNEOciP9MqMOmLBSkIBNQQkRmcNZrsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422264;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=nh/d9YGOUnrPb5+WwUayy5FjQkM3ryZWi/UNPLivMJQ=;
	b=zPp2fXwRSGzCb/loTLOOvutirZLkcJgBDrs7C+IopyYokla7CQd0H0XZUAVoM3IwEcW8
	 KYUn3mE0BIxLto0ercSsA1oT/GNz14/0vltHiXcHdKRhZzte2W8VQIaZgRkbUrQ9JP4Qq
	 4miU5NdzI+Gx8dVxWlUyHK0VERXKALfTOGpkNZkun2NHMzXVBoW6kd4er2M5wy/KkntQU
	 2hC9bBD7FAq5lCKZP324okguHmpGY6nzAKF4gx7h2ThcN0wzTdxS5bxc8YqP9YjySEM1R
	 hhRqgss7njJ20jifbqioLm3jgBnfeYLBjacSCljhhs3qfnAtZpBULUiJs8gvE5mR8RA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=XaTRAzBh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC2F607F488;
	Mon, 19 Oct 2026 15:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEC2F607F488
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=XaTRAzBh
ARC-Seal: i=1; a=rsa-sha256; t=1792422201; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NhDO/WAYO86H0nE2NVG1aQbAPnYk03g0OgZCuTZvhtRpAq7PwPiFdMhJllYv6SpRRBOxEMGooVPRhG93ns0yDLqu46MLKO2iH/ArYaK4cy7PuDaO/2zLT3OPi/OE6DwdQqhGyLyjQlaqKctCDUoOApFIleiVJc8REsD7PvBWV2Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792422201; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nh/d9YGOUnrPb5+WwUayy5FjQkM3ryZWi/UNPLivMJQ=; 
	b=O0rnW16uJyEs+8bNaj9UvSr/NI2256PDFlJJmZmfogw74nZSF2vbI0+KQjkKjvc6IKnXHKHI+cO50gmnl4ZEQvcwBL1GSwdK5M3kc0BcgxA80BhlN/usHxK9G1Ko4ZNdeMaWm59HG9XC5/KGdw0/NWWsfzfQcz0EJQJaZXQ6Kiw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792422201;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=nh/d9YGOUnrPb5+WwUayy5FjQkM3ryZWi/UNPLivMJQ=;
	b=XaTRAzBhEungRT4Qn863L3GhnIkpNE3LrRuxluWqVCas3q3iYmqnfCs59COq+T+r
	mcqeuZMiEhplc3MQdjhHnB3Q5nUCaDrrjcUG850k0JVostpORkUhhVKvROzeIe8C/mU
	uqexktNI0/5i94gEuhM6J16kn7VpOre3i0s9HRPeHZfbnfZQmPUIcv+Ccfjbd1jizsU
	STtJfZk/YY6xMTZjYIgjQjM6fsfU4sDRlXaEGl4UL3aZ4tZcaE2NPzbPQCbzGXT4ut+
	ojgsKxOUyTjVNLSeMxCqAzCUM/lrmG3qCv6pRjrVD9x5ihUiH8JbRmiFnGGGLEbO47y
	Jswj25nMPw==
Received: by smtp.zohomail.com with SMTPS id 1792422197370674.1238567662286;
	Mon, 19 Oct 2026 08:03:17 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 19 Oct 2026 23:02:29 +0800
Subject: [PATCH v5 07/12] platform/x86: lenovo-wmi-capdata: Adopt new WMI
 API
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
Message-Id: <20261019-lwmi-wmi-new-api-v5-7-71557d28d058@rong.moe>
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
Changes in v5:
- Move the definition of struct cd_fan_block outside of
  lwmi_cd_fan_list_alloc_cache() and rename it lwmi_cd_fan_block (thanks
  Ilpo Järvinen)

Changes in v4:
- Fix typo (thanks Mark Pearson)

Changes in v3:
- Leave struct cd_fan_block's __packed attribute as is (thanks Armin
  Wolf)
---
 drivers/platform/x86/lenovo/wmi-capdata.c | 76 ++++++++++++++-----------------
 1 file changed, 34 insertions(+), 42 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index 3c09bb9e3d46..0efe37644627 100644
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
@@ -670,6 +672,11 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
 	return __lwmi_cd_cache(priv);
 }
 
+struct lwmi_cd_fan_block {
+	u32 nr;
+	u32 data[]; /* id[nr], max_rpm[nr], min_rpm[nr] */
+} __packed;
+
 /**
  * lwmi_cd_fan_list_alloc_cache() - Alloc and cache Fan Test Data list
  * @priv: lenovo-wmi-capdata driver data.
@@ -678,43 +685,29 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
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
-	struct cd_fan_block {
-		u32 nr;
-		u32 data[]; /* id[nr], max_rpm[nr], min_rpm[nr] */
-	} __packed * block;
+	ret = wmidev_query_block(priv->wdev, 0, &wbuf, sizeof(struct lwmi_cd_fan_block));
+	if (ret == -ENODATA) /* The block is too short, probably stubbed. */
+		return 0;
+	if (ret)
+		return ret;
 
-	union acpi_object *ret_obj __free(kfree) = wmidev_block_query(priv->wdev, 0);
-	if (!ret_obj)
-		return -ENODEV;
+	struct lwmi_cd_fan_block *block __free(kfree) = wbuf.data;
 
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

