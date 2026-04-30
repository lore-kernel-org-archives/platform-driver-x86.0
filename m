Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F34D3382CD
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Apr 2026 22:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777589010; cv=none; b=cZ7lOlFQ5jUWlIUbbkTC4kFT2Xl/BCdqoWx5cD/ixFo5BKRxvJrVHZbBegXkmlhD6BbjwiUw3vkJWPlbkJXRyFjKBslz6r+qxesYYJuzR1TpFFhGapYeMewlY23M4MfG3yJaI3cKzq27szEZFtCUBLg7Uo5Ya9n1aFtf6qqLrc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777589010; c=relaxed/simple;
	bh=h4bUXydaGYb5msBkanLLxkTCv1bN3AZGvRH3q8dXQX8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qqd8axCWaNixGG+ARv59OO2kWMXkW6igEwkOK4G56u6ZIN0dgNt3j+ISgh41dL8Ap86F1PLq63wrKwkmPaIdUjexcefTboiq7hdP7eDJ7mbdOwveP7ST78+2V1cShznjEk0fHEVwomvv0/yeq/GeW9qxcSLxmE2wQ8Q5xd6dMb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHqjT6t9; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHqjT6t9"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-506a7bbe9d0so10405741cf.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 Apr 2026 15:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777589007; x=1778193807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cpto9+Ej84DfwIPoSsQI6Rk7NM+GmRUDZZqbBkQ1LtE=;
        b=VHqjT6t9Z3LHYL6SmnAz6CTB5SPj79BzK9T26RHJUklky/lr9cvjPls/CncDz3D0Nh
         YD5wQVTgVMuwWXOWgD+MKMTd7NeY4HoIjJU+aIISarWhddVZRnd+VHGmhwI1kGYOXCak
         cg0DG4ZeM2z/Dxw4myTw/0OsDp0uDlahLKoV/TgtEOnp1Pv2PPugjYg0ZctuRodlK83s
         R8zvTK2EPtWMck2DTt3YTXLSEGG97OscQj4WNGR7OMSi5C7HzNWNP4cIMAdBvJTuCloA
         rJjkPCAUELDur2EtZ5dbKCeEBWfWa3sunfgdhatkqSzN5GVX9v4d2G5YQ2Z0Kxm9atc8
         TUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777589007; x=1778193807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpto9+Ej84DfwIPoSsQI6Rk7NM+GmRUDZZqbBkQ1LtE=;
        b=mldgH8GiKt1dxi2S/phmaXRnMSGgi8j1+dPIWs+2obfTV7XzPOEB1FXonU2MJSQmSn
         fgDF6vsuT6RPArZWMUUEl4Qi9aFAHoLoz+w02xrFA/g0QjfrpyiEd6wSQxX8lDsjHB1K
         lSrK6uOaPzfrW9g42ftXKYBPVFTShDDRh57R73bdTzZuJSg595Hm69aalwSVj9zTOGWO
         M7zarvU6emqTR0M63uyFA7gnclSUHTc1Gkkdam6Tv0p9BjWLSfUgkxVP5jIfBTEsThiq
         AEPTBP3ogILRGwl52JiSPHFkwQQIO6Kg/MjTIx4b2QnuotBabMmJ/QO4Xv7RQf/+PwT1
         oaFw==
X-Gm-Message-State: AOJu0YzDQg/e6ZDu/xn+0MxYUIy136zMGu0XU48Tg7GXxT4M6td+9m3N
	wXFdr8DmNVbmSj99y4ezidXcr63Fla0lDehVIHth/rYLfTDPWoM5S4A3Z/ZTn7Gf
X-Gm-Gg: AeBDieskem5/4mKjtmiB2FW7gKMPfdoUlX75rEVf73Qh+3ZSfkgg/gh2nJ9tdifC9aY
	s38O7ZVtZ/MEK0KJrgjRSfwXWVaSSShf+cslbLqFiSljO9f/ryag/AW3Lfp0MTOCgRYwhYBEMfK
	U+Eu0r/ExI66QnMGzR1FBG2JKvdqgJg6G4Iu7bLiXsnoaCr48HZJy0D1t9SaV+fxFaa4epxngyO
	r3BqctqXPB0cm9sUDhi6rA96kVS354tHikfxVC0y9x/uaLOPtcaNbP68CZJq2J7R6rgmnxUSEAH
	or9z0HcvVjULrQWH1d2cPP5gPJ83rIvgeRXUUbSalKQxnEdGhL+c+9ttMWfl7a24XamF+mlRIPh
	BuCUnqXF2DVKqU8U7H/jHwJXsvCVN0L1qmUm1q8GASxJ4rxwSF42AVCM/j19KcpFhnY1mlwNiq8
	ngLaxXWzRFt2lzfzEVAEtzEPMAA2HnnAs0DF30ogaCXF3VLPKXWhHlPNSqWTExrJBAi6rm0x+n0
	eaBjlr3pxPMk1Ohm+MDnNcXneOXP0pPKbynW7u/7GG7tQ==
X-Received: by 2002:ac8:5e52:0:b0:50f:c36a:381a with SMTP id d75a77b69052e-5103e97ae32mr7037151cf.55.1777589007135;
        Thu, 30 Apr 2026 15:43:27 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5103e5cc890sm3307341cf.30.2026.04.30.15.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 15:43:26 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] platform/x86/intel/vsec: allocate res with intel_vsec_dev
Date: Thu, 30 Apr 2026 15:43:07 -0700
Message-ID: <20260430224307.109311-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member to combine allocations. Avoids having to
free separately.

Add __counted_by for extra runtime analysis.

Move counting variable assignment to after allocations as is already
done by kzalloc_flex for GCC 15 and above.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/intel/vsec.c      | 14 ++++----------
 drivers/platform/x86/intel/vsec_tpmi.c | 13 ++++---------
 include/linux/intel_vsec.h             |  6 +++---
 3 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
index 7d5dbc1c1d05..9ef0f043bbee 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -112,7 +112,6 @@ static void intel_vsec_dev_release(struct device *dev)
 	ida_free(intel_vsec_dev->ida, intel_vsec_dev->auxdev.id);
 
 	kfree(intel_vsec_dev->acpi_disc);
-	kfree(intel_vsec_dev->resource);
 	kfree(intel_vsec_dev);
 }
 
@@ -225,7 +224,6 @@ int intel_vsec_add_aux(struct device *parent,
 	ret = xa_alloc(&auxdev_array, &intel_vsec_dev->id, intel_vsec_dev,
 		       PMT_XA_LIMIT, GFP_KERNEL);
 	if (ret < 0) {
-		kfree(intel_vsec_dev->resource);
 		kfree(intel_vsec_dev);
 		return ret;
 	}
@@ -233,7 +231,6 @@ int intel_vsec_add_aux(struct device *parent,
 	id = ida_alloc(intel_vsec_dev->ida, GFP_KERNEL);
 	if (id < 0) {
 		xa_erase(&auxdev_array, intel_vsec_dev->id);
-		kfree(intel_vsec_dev->resource);
 		kfree(intel_vsec_dev);
 		return id;
 	}
@@ -282,7 +279,7 @@ static int intel_vsec_add_dev(struct device *dev, struct intel_vsec_header *head
 			      unsigned long cap_id, u64 base_addr)
 {
 	struct intel_vsec_device __free(kfree) *intel_vsec_dev = NULL;
-	struct resource __free(kfree) *res = NULL;
+	struct resource *res;
 	struct resource *tmp;
 	struct device *parent;
 	unsigned long quirks = info->quirks;
@@ -306,13 +303,12 @@ static int intel_vsec_add_dev(struct device *dev, struct intel_vsec_header *head
 		return -EINVAL;
 	}
 
-	intel_vsec_dev = kzalloc_obj(*intel_vsec_dev);
+	intel_vsec_dev = kzalloc_flex(*intel_vsec_dev, resource, header->num_entries);
 	if (!intel_vsec_dev)
 		return -ENOMEM;
 
-	res = kzalloc_objs(*res, header->num_entries);
-	if (!res)
-		return -ENOMEM;
+	intel_vsec_dev->num_resources = header->num_entries;
+	res = intel_vsec_dev->resource;
 
 	if (quirks & VSEC_QUIRK_TABLE_SHIFT)
 		header->offset >>= TABLE_OFFSET_SHIFT;
@@ -342,8 +338,6 @@ static int intel_vsec_add_dev(struct device *dev, struct intel_vsec_header *head
 	}
 
 	intel_vsec_dev->dev = dev;
-	intel_vsec_dev->resource = no_free_ptr(res);
-	intel_vsec_dev->num_resources = header->num_entries;
 	intel_vsec_dev->quirks = info->quirks;
 	intel_vsec_dev->base_addr = info->base_addr;
 	intel_vsec_dev->priv_data = info->priv_data;
diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/intel/vsec_tpmi.c
index 79c0cbea2dee..908f3377b05a 100644
--- a/drivers/platform/x86/intel/vsec_tpmi.c
+++ b/drivers/platform/x86/intel/vsec_tpmi.c
@@ -626,15 +626,12 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
 	if (!name)
 		return -EOPNOTSUPP;
 
-	res = kzalloc_objs(*res, pfs->pfs_header.num_entries);
-	if (!res)
+	feature_vsec_dev = kzalloc_flex(*feature_vsec_dev, resource, pfs->pfs_header.num_entries);
+	if (!feature_vsec_dev)
 		return -ENOMEM;
 
-	feature_vsec_dev = kzalloc_obj(*feature_vsec_dev);
-	if (!feature_vsec_dev) {
-		kfree(res);
-		return -ENOMEM;
-	}
+	feature_vsec_dev->num_resources = pfs->pfs_header.num_entries;
+	res = feature_vsec_dev->resource;
 
 	snprintf(feature_id_name, sizeof(feature_id_name), "tpmi-%s", name);
 
@@ -647,8 +644,6 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
 	}
 
 	feature_vsec_dev->dev = vsec_dev->dev;
-	feature_vsec_dev->resource = res;
-	feature_vsec_dev->num_resources = pfs->pfs_header.num_entries;
 	feature_vsec_dev->priv_data = &tpmi_info->plat_info;
 	feature_vsec_dev->priv_data_size = sizeof(tpmi_info->plat_info);
 	feature_vsec_dev->ida = &intel_vsec_tpmi_ida;
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index 1fe5665a9d02..07ea563f524e 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -135,8 +135,6 @@ struct intel_vsec_platform_info {
  * struct intel_vsec_device - Auxbus specific device information
  * @auxdev:        auxbus device struct for auxbus access
  * @dev:           struct device associated with the device
- * @resource:      PCI discovery resources (BAR windows), one per discovery
- *                 instance. Valid only when @src == INTEL_VSEC_DISC_PCI
  * @acpi_disc:     ACPI discovery tables, each entry is two QWORDs
  *                 in little-endian format as defined by the PMT ACPI spec.
  *                 Valid only when @src == INTEL_VSEC_DISC_ACPI.
@@ -149,11 +147,12 @@ struct intel_vsec_platform_info {
  * @quirks:        specified quirks
  * @base_addr:     base address of entries (if specified)
  * @cap_id:        the enumerated id of the vsec feature
+ * @resource:      PCI discovery resources (BAR windows), one per discovery
+ *                 instance. Valid only when @src == INTEL_VSEC_DISC_PCI
  */
 struct intel_vsec_device {
 	struct auxiliary_device auxdev;
 	struct device *dev;
-	struct resource *resource;
 	u32 (*acpi_disc)[4];
 	enum intel_vsec_disc_source src;
 	struct ida *ida;
@@ -164,6 +163,7 @@ struct intel_vsec_device {
 	unsigned long quirks;
 	u64 base_addr;
 	unsigned long cap_id;
+	struct resource resource[] __counted_by(num_resources);
 };
 
 /**
-- 
2.54.0

