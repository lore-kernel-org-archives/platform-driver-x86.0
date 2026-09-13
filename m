Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901E937F00F;
	Sun, 13 Sep 2026 20:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789332682; cv=pass; b=TgUQI8opqv2BAbOuP7blXvpEApAt1m6Aq+DKwxM4aEfUHkGX7NdyyEXiQuqzujy2KV2BvBiGtErseRqkWlLIHuWuT1YHvUon5J76QshfSnH5YdvluOqdNuSmlV+dwFW+aNKIVmrRGSx7Ksz87uMb8UeNg8+cRzJh7pnBXjZ5chw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789332682; c=relaxed/simple;
	bh=NqV4g99CiI+mE+/BVC8ksJkgPBCvImucJphCyT4IBJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TIGAwEIFy+ycWHklSDwDgXQ8A2VcnG78SJ8ryze1e7iTiJvrmQqSjM5OTE03n9rbNJqXm70FJbrjPGA5A1d5tKevM3dhIwag6WxVPJxXviwaQumbuWBYngipDo9gosCOpsysco9fM551bEJVchEj/kF3BgX4vatURU0Hjg9YF0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=EYCELw9e; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="EYCELw9e"
ARC-Seal: i=1; a=rsa-sha256; t=1789332644; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UcGKL6CydZok+SnuZpj+nSxlhiSjEf90f8cffo4IQztOzML8PbTKyuXn6EBCoJw9KgMxY71RSoU00vVHpEmBicoZcNe20oDq42n1TKPUxePVVxONfUFDCWC4GMHf2ZSnxk9+AcTPxhIrceoMJjFp2y3HADwBoNzKTAAW2xs9nP8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789332644; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RQjo7v7oGsuQGQPK2lmcMvmFjsRtk6ja27lpQpQTs9w=; 
	b=OsADYDt8n94GNyrvJEhP6KFo/VjIoPi6CsJGyZslGSvHdGw8kk61E0mMci50dF8C14wZDjEkqgC3qVe6EaypcKuLAHednFaYZFtWVAV1+JdeCShxDVLFkHz0cNcxGfAAcCzSvnodibliB6+Q4xozWfco5LZlLUkJQlwl0sG2iqU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789332644;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=RQjo7v7oGsuQGQPK2lmcMvmFjsRtk6ja27lpQpQTs9w=;
	b=EYCELw9eSL5DU/K1Dpv6CRjac7vZCpHJn2n+MP6d4bG0+3Jo/YayJ+1p5Tttvfb5
	XMDPuTBjY/HGjllwKkxyf1B+8Bi4K7hjMiDUGhffQU7fnZml4ZzkugvmYt++dRjIkF+
	HNVg4sEuJBixhdVUAM2P40rwNJR7IUV01AraZV1jOX7adcD8OT3FVfIIHPm4wk6w+Gq
	wMY/ooF6H7pwef7dd/J7DChub70Qy9Jfr3qfQHklTgTMG/20N6cCg4XHp4TZf2wjMMR
	SrbHR5mkHD2892Sy85gL3cbr8HFUGt7MgffDJPE9JhI+zK97iMDnFC2dDbsxMvH/L+A
	8S/D99j9BQ==
Received: by smtp.zohomail.com with SMTPS id 1789332642647690.5731905717419;
	Sun, 13 Sep 2026 13:50:42 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 14 Sep 2026 04:50:26 +0800
Subject: [PATCH 5/9] platform/x86: lenovo-wmi-capdata: Adopt new WMI API
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-lwmi-wmi-new-api-v1-5-7a400f2f69f8@rong.moe>
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
 drivers/platform/x86/lenovo/wmi-capdata.c | 72 ++++++++++++++-----------------
 1 file changed, 33 insertions(+), 39 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index 793b5103d533..5e66e6b52720 100644
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
 
-		memcpy(p, ret_obj->buffer.pointer, size);
+		/* Capdata 01 is an extension to capdata 00. */
+		struct capdata00 *capdata __free(kfree) = wbuf.data;
+
+		memcpy(p, capdata, size);
 	}
 
 	return 0;
@@ -677,43 +679,35 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
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
-
-	union acpi_object *ret_obj __free(kfree) = wmidev_block_query(priv->wdev, 0);
-	if (!ret_obj)
-		return -ENODEV;
-
-	if (ret_obj->type == ACPI_TYPE_BUFFER) {
-		block = (struct cd_fan_block *)ret_obj->buffer.pointer;
-		size = ret_obj->buffer.length;
-
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
+	};
+
+	ret = wmidev_query_block(priv->wdev, 0, &wbuf, sizeof(struct cd_fan_block));
+	if (ret == -ENODATA) /* The block is too short, probably stubbed. */
+		return 0;
+	if (ret)
+		return ret;
+
+	struct cd_fan_block *block __free(kfree) = wbuf.data;
+
+	count = block->nr;
+
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
 

-- 
2.55.0

