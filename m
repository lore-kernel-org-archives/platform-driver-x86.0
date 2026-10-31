Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793410189;
	b=V4jP4k7hd5bNUy0TtUyYYEqzqx1WtKszJZmEoWNufHX/vE/G20P/HjfkmFEqo6aeUIAT
	 j0sh43Llt6dOsFWbk40hiqMTDkVXnxN1QbrmDRYuvOR+kjPCBsYxsvk0S6lMlIvWSYWAA
	 6gLOlbAf1W4rWZQON9AcibjfJXvspbDLbc9OgSVCKfutMD64ys6+8HWTOeKJENzxsU1XV
	 Mj/hcMns0Gl0/uHpxax0m8ZYi/MzzlHGTKmLYTRGw/TWi3NNEd4HINOcEHHN4Bvs6eNnK
	 e8fTN0LMazys89X4ixWVLxIATg/9C4FhU/dIu61mryITCf8LR5XMix/rsFMH4oQnygw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793410189;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NNuc09Tg2UB+lGX8FstqybhVANHwm2LQPsFiKgkm9/w=;
	b=VXnT/SoO8uTKnMzSP5kq7NZSjd6hB2eFUll5V/hg/EiUeYzM4oKXU/bEgM1wm8SQqClD
	 qeXHiRaadG3T0VDhuDvMPZXfBVKh3rYujR8MdieceKuZ7nOFffW1B5eoqQiyTaVLzapDn
	 bz++V5YVF/O29piQ0vQ3wRoF8r14bIv6koqW9PxLvu36UcGKXKEzZpk2BYqHSGGHmJ9/d
	 UsVOcFbe0r7TiOHbKmpnJkEyzF+C2L/fihQId9QnfOKTv3B4RUXYs1h8yMjHzFf3XZF58
	 wiPLieM3M/NwT4sNYTicyz3jOYFysJWCatOYYRrurJyEMtdTU4iX67icoomaTF+mYtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IbnnQSuE;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C93606A325;
	Sat, 31 Oct 2026 01:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68C93606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IbnnQSuE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793410188; x=1824946188;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ttz4zN+TJ1Dcgod3T8/JZyzfYxcZRUQ//Y/ysKSOxJQ=;
  b=IbnnQSuEePCvdMDcbpjUlWie29TK8LO1nPhWegyEpmRJDKLvmxLs6Wg8
   if4OzJOZXv/ez1g27leefMKsJyckdcJlCLtLoCSKbhk0qDRPPMkIhHpP0
   w9c/ZQVpvIpaOANFg2ARAKUBcnJKEWw2S10fOASCKHdHpep6kg6pQUh7q
   Nh5hJZbbZKyZRFZyulSYkhQffkm99xRjxrmxJWgXvg7AQkzGFucPG2uPH
   d53gZtq0K85W1o+gaAVg64cR72uHi5mF7X+7A2b2HuDOvo+GqiZABuZhF
   cbDy6EVrDdwjpdVxwlmAE0/D4hezZZ3lmCeRAHFpVuKD1BeV/H50qDgod
   w==;
X-CSE-ConnectionGUID: cNbWmro8T1ebhQR2lUppcQ==
X-CSE-MsgGUID: r+ASZboiSl2rs4+yb0SlFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2213334"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2213334"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 18:29:46 -0700
X-CSE-ConnectionGUID: G9xJF6iUTFWEWRZQ5NSZ7Q==
X-CSE-MsgGUID: 1JP0cVk/T4GKmzO2PzKqZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7397957"
Received: from debox1-desk4.jf.intel.com ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 18:29:46 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] platform/x86/intel/vsec: Validate discovery table bounds against the BAR
Date: Fri, 30 Oct 2026 18:29:36 -0700
Message-ID: <20261031012939.377995-5-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031012939.377995-1-david.e.box@linux.intel.com>
References: <20261031012939.377995-1-david.e.box@linux.intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The DVSEC/VSEC table offset, entry size, and entry count are read from
device configuration space, but the resulting resource ranges were never
checked against the BAR they claim to reside in. A device reporting a
large offset could produce resources outside its BAR, pointing at unmapped
physical address gaps or MMIO belonging to other devices.

Additionally, INTEL_DVSEC_TABLE_BAR() masks the table register to three
bits, so tbir may be 6 or 7 even though only BARs 0-5 are valid. Those
values silently selected the ROM BAR or a bridge resource slot.

Reject headers whose tbir (bar index) is out of range or whose BAR is not a
populated memory BAR, and any discovery table resource that does not fit
within that BAR. These rejections cause the capability to not be
registered, so log them as warnings.

The PMT drivers also map ranges built from discovery data, but they only
receive the resolved discovery table resources and cannot tell which BAR
those came from. Record the discovery BAR index in struct
intel_vsec_device, along with whether the tables are BAR relative at all,
and export intel_vsec_check_bar_resource() to check a resource against a
given BAR.

Fixes: a3c8f906ed5f ("platform/x86/intel: Move intel_pmt from MFD to Auxili=
ary Bus")
Assisted-by: LLM
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/vsec.c | 93 +++++++++++++++++++++++++++++--
 include/linux/intel_vsec.h        |  8 +++
 2 files changed, 96 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index 380d8231549f..4395663d8edd 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -104,6 +104,76 @@ static bool intel_vsec_supported(u16 id, unsigned long=
 caps)
 	}
 }
=20
+/* Return the resource of a populated memory BAR, or NULL if there is none=
 */
+static const struct resource *intel_vsec_mem_bar(struct pci_dev *pdev,
+						 unsigned int bar)
+{
+	if (bar >=3D PCI_STD_NUM_BARS)
+		return NULL;
+
+	if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
+		return NULL;
+
+	return pci_resource_n(pdev, bar);
+}
+
+/**
+ * intel_vsec_check_bar_resource() - Check a resource lies within a PCI BAR
+ * @intel_vsec_dev: vsec device the resource was derived from
+ * @bar:            index of the BAR the device places @res in
+ * @res:            resource to check
+ *
+ * Discovery table locations and the tables they reference are read from t=
he
+ * device, so ranges built from them must be checked against the BAR they
+ * claim to live in before being mapped. For a resource in the same BAR as
+ * the discovery tables, pass @intel_vsec_dev->tbir as @bar.
+ *
+ * Return: 0 if @res is within BAR @bar or the device's tables are not BAR
+ * relative, -EINVAL if @bar is not a valid memory BAR or @res is outside =
it.
+ */
+int intel_vsec_check_bar_resource(struct intel_vsec_device *intel_vsec_dev,
+				  unsigned int bar, const struct resource *res)
+{
+	const struct resource *bar_res;
+
+	/* ACPI tables are read from _DSD, and a supplied base is not BAR relativ=
e */
+	if (!intel_vsec_dev->bar_relative)
+		return 0;
+
+	bar_res =3D intel_vsec_mem_bar(to_pci_dev(intel_vsec_dev->dev), bar);
+	if (!bar_res || !resource_contains(bar_res, res))
+		return -EINVAL;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(intel_vsec_check_bar_resource, "INTEL_VSEC");
+
+/*
+ * For DVSEC/VSEC discovery the table location is read from device config
+ * space. Check that it names a memory BAR the tables can be checked again=
st.
+ */
+static int intel_vsec_check_table_bar(struct device *dev,
+				      const struct intel_vsec_header *header,
+				      const struct intel_vsec_platform_info *info,
+				      bool *bar_relative)
+{
+	*bar_relative =3D false;
+
+	/* Not BAR relative: ACPI tables come from _DSD, or a base was supplied */
+	if (info->src =3D=3D INTEL_VSEC_DISC_ACPI || info->base_addr || !dev_is_p=
ci(dev))
+		return 0;
+
+	if (!intel_vsec_mem_bar(to_pci_dev(dev), header->tbir)) {
+		dev_warn(dev, "BAR %u is not a valid memory BAR for header id %d\n",
+			 header->tbir, header->id);
+		return -EINVAL;
+	}
+
+	*bar_relative =3D true;
+
+	return 0;
+}
+
 static void intel_vsec_remove_aux(void *data)
 {
 	auxiliary_device_delete(data);
@@ -297,7 +367,8 @@ static int intel_vsec_add_dev(struct device *dev, struc=
t intel_vsec_header *head
 	struct resource *tmp;
 	struct device *parent;
 	unsigned long quirks =3D info->quirks;
-	int i;
+	bool bar_relative;
+	int i, ret;
=20
 	if (info->parent)
 		parent =3D info->parent;
@@ -317,16 +388,23 @@ static int intel_vsec_add_dev(struct device *dev, str=
uct intel_vsec_header *head
 		return -EINVAL;
 	}
=20
+	if (quirks & VSEC_QUIRK_TABLE_SHIFT)
+		header->offset >>=3D TABLE_OFFSET_SHIFT;
+
+	ret =3D intel_vsec_check_table_bar(dev, header, info, &bar_relative);
+	if (ret)
+		return ret;
+
 	intel_vsec_dev =3D kzalloc_flex(*intel_vsec_dev, resource, header->num_en=
tries);
 	if (!intel_vsec_dev)
 		return -ENOMEM;
=20
 	intel_vsec_dev->num_resources =3D header->num_entries;
+	intel_vsec_dev->dev =3D dev;
+	intel_vsec_dev->tbir =3D header->tbir;
+	intel_vsec_dev->bar_relative =3D bar_relative;
 	res =3D intel_vsec_dev->resource;
=20
-	if (quirks & VSEC_QUIRK_TABLE_SHIFT)
-		header->offset >>=3D TABLE_OFFSET_SHIFT;
-
 	/*
 	 * The DVSEC/VSEC contains the starting offset and count for a block of
 	 * discovery tables. Create a resource array of these tables to the
@@ -344,6 +422,12 @@ static int intel_vsec_add_dev(struct device *dev, stru=
ct intel_vsec_header *head
 		tmp->end =3D tmp->start + (header->entry_size * sizeof(u32)) - 1;
 		tmp->flags =3D IORESOURCE_MEM;
=20
+		if (intel_vsec_check_bar_resource(intel_vsec_dev, header->tbir, tmp)) {
+			dev_warn(dev, "Discovery table %d for header id %d exceeds BAR %u\n",
+				 i, header->id, header->tbir);
+			return -EINVAL;
+		}
+
 		/* Check resource is not in use */
 		if (!request_mem_region(tmp->start, resource_size(tmp), ""))
 			return -EBUSY;
@@ -351,7 +435,6 @@ static int intel_vsec_add_dev(struct device *dev, struc=
t intel_vsec_header *head
 		release_mem_region(tmp->start, resource_size(tmp));
 	}
=20
-	intel_vsec_dev->dev =3D dev;
 	intel_vsec_dev->quirks =3D info->quirks;
 	intel_vsec_dev->base_addr =3D info->base_addr;
 	intel_vsec_dev->priv_data =3D info->priv_data;
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index 8686e79c4f75..feb4420617bc 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -160,6 +160,10 @@ struct intel_vsec_platform_info {
  * @quirks:        specified quirks
  * @base_addr:     base address of entries (if specified)
  * @cap_id:        the enumerated id of the vsec feature
+ * @tbir:          PCI BAR index of the discovery tables. Valid only when
+ *                 @bar_relative is set
+ * @bar_relative:  discovery tables are located in PCI BAR @tbir. Not set =
for
+ *                 ACPI discovery or a supplied base address
  * @resource:      PCI discovery resources (BAR windows), one per discovery
  *                 instance. Valid only when @src =3D=3D INTEL_VSEC_DISC_P=
CI
  */
@@ -176,6 +180,8 @@ struct intel_vsec_device {
 	unsigned long quirks;
 	u64 base_addr;
 	unsigned long cap_id;
+	u8 tbir;
+	bool bar_relative;
 	struct resource resource[] __counted_by(num_resources);
 };
=20
@@ -219,6 +225,8 @@ struct pmt_feature_group {
 int intel_vsec_add_aux(struct device *parent,
 		       struct intel_vsec_device *intel_vsec_dev,
 		       const char *name);
+int intel_vsec_check_bar_resource(struct intel_vsec_device *intel_vsec_dev,
+				  unsigned int bar, const struct resource *res);
=20
 static inline struct intel_vsec_device *dev_to_ivdev(struct device *dev)
 {
--=20
2.43.0

