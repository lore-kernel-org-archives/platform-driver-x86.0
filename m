Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793410188;
	b=r5QPQVkUcOkXDzQNLwySBq+gtovoZNAAHOzFJNTcDefXZ7otgmzjK8KC05k6T6UpqS4v
	 GxgDgM9yJH8ZJESv5Sy6PZGWA2dv3xXIDpGykjHJ92R/E8t30tu6g26mQDlS5sJv8rHHn
	 +7mT6kdY40XZl4itb0Lwzp+KKHBrJpotdRJSGZreA/P1LWALV0Xt/qwAzwfVGfQiGAIcZ
	 rm06O19iLVIPzK2rawt/ytncBVoseUvMXmubiWFtzpnpQVmQoZ10C3wwpFKpr2utqa8TW
	 TTU8y8sAR4DoKkmbJYXyzqGIT0Z/StDEhR4vTNFXZOACHf3Ww8QnlNv6Sgk8UuGr7zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793410188;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CJddQ+s355PNKpHonQ0ce14+Dd6Ql+qJf+1c+ofgd/E=;
	b=Kdz69X7nVkRQ+LCyGgMHhhl/C7HW3rGEBw2TIunHkFAt+zrudZgyxHE++znY0An5CgIV
	 iCnx1yhlwi6f0OLl9xlfqBpvCwNanIXGj26Yl0XYYuB2XA/Q06gYzbvXiEbx7q54UmJiW
	 KjgzHJqthzQ1/6L5i35AwnGfhBMaDPdhlGAm7vIubsIxMjLWSR1p0k8elh6J3K4gx/pm1
	 ymdIWC7NtChxC75OOhRzlrrZ6DB2y8S2es9gPNhH1jKhd+3YA3x9JIWhRUOHxHjgkx7e0
	 0sE4BgdI2Hp6G9OtqPuN32A2K9ORwRHESMYGl9+7gbTC+CPCXwu0Mn3iikRzxAuRwcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KGNf7Uzi;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5520E606A31E;
	Sat, 31 Oct 2026 01:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5520E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KGNf7Uzi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793410187; x=1824946187;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Do6mVNbdYF/c/0fJoh2yqNpxVl6iIbFw2upRunJhGwQ=;
  b=KGNf7UziPEkDhxdr0NYW8/lcxp0vxJoU8sw9MBUONvIeRDvzPfbtWY3K
   C3phkY1ZlpKr61yRCE6Z5t2mRFzOMqRaRkODbgWc3YVQ4nzNJHLVfMwY7
   ypI3u+K3h7f6YoCWdbnbtH023m/MVvEYJPluijYTe3F67mb1WLly/qp4o
   DUYINZmVpZkTSP5yC8Ek8DHDyiiVF2pTQUHCreAqjSpF/ZNsKmBrGsGFG
   KJRrFRHzZj4w4nVN3ondRHWU+LssC3m6AFQPZLNetVqxf7R+vGSmuoYH+
   DkYD4Y6i1YC2uizKL75mpnAAvW/CEsTLrexPjM0fee5N16yFkV1JJHNL8
   Q==;
X-CSE-ConnectionGUID: d2UVpBFTTk24cgE1beroyQ==
X-CSE-MsgGUID: UFZq8saBTgaDf8WszTC8GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2213328"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2213328"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 18:29:45 -0700
X-CSE-ConnectionGUID: Kwh4oLo6RL2NQNf/wMVgJg==
X-CSE-MsgGUID: 9eoyjfFiTDaC6KaOSH0TRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7397954"
Received: from debox1-desk4.jf.intel.com ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 18:29:45 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] platform/x86/intel/pmt/discovery: Bound attr_size against feature_table capacity
Date: Fri, 30 Oct 2026 18:29:33 -0700
Message-ID: <20261031012939.377995-2-david.e.box@linux.intel.com>
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

The feature header's attr_size field is fully device-controlled (8 bits,
up to 255) and is used to compute the length passed to memcpy_fromio()
when copying attribute fields into struct feature_table. The only
existing bounds check validates this length against the mapped MMIO
source resource (res_size), which is itself sized from another
device-controlled field (disc_tbl->size) and has no relationship to
the fixed destination struct's actual capacity.

A malicious or compromised PMT endpoint can report a large enough
disc_tbl->size (to satisfy the source-side check) together with
attr_size =3D 0xff, causing memcpy_fromio() to write up to 1020 bytes
into struct feature_table's 16-byte caps/union region, corrupting
adjacent fields (guids, kobj, priv, list, attr_group, id) and
neighboring heap allocations.

Check the attribute payload size against the space from the end of the
header to the end of the union before the copy occurs. Skip a feature
that fails the check rather than failing probe, so one malformed table
does not take down the features that were described correctly.

Fixes: d9a078809356 ("platform/x86/intel/pmt: Add PMT Discovery driver")
Assisted-by: LLM
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/pmt/discovery.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/platform/x86/intel/pmt/discovery.c b/drivers/platform/=
x86/intel/pmt/discovery.c
index f4203d240f54..47a4def6e6b9 100644
--- a/drivers/platform/x86/intel/pmt/discovery.c
+++ b/drivers/platform/x86/intel/pmt/discovery.c
@@ -24,6 +24,7 @@
 #include <linux/overflow.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
+#include <linux/stddef.h>
 #include <linux/string_choices.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
@@ -38,6 +39,9 @@
 #define DT_TBIR			GENMASK(2, 0)
 #define FEAT_ATTR_SIZE(x)	((x) * sizeof(u32))
 #define PMT_GUID_SIZE(x)	((x) * sizeof(u32))
+/* Space for attribute fields between the header and the guids pointer */
+#define FEAT_ATTR_CAPACITY	(offsetofend(struct feature_table, rmid) - \
+				 sizeof(struct feature_header))
 #define PMT_ACCESS_TYPE_RSVD	0xF
 #define SKIP_FEATURE		1
=20
@@ -420,6 +424,18 @@ pmt_feature_get_feature_table(struct pmt_features_priv=
 *priv,
 	header =3D &feat_tbl->header;
 	memcpy_fromio(header, feat_offset, sizeof(*header));
=20
+	/*
+	 * The attribute fields are copied into the fixed caps and union
+	 * fields following the header. Skip, rather than fail on, a feature
+	 * whose attributes don't fit so the remaining features still probe.
+	 */
+	if (FEAT_ATTR_SIZE(header->attr_size) > FEAT_ATTR_CAPACITY) {
+		dev_warn(priv->dev, "Skipping feature %s: bad attr_size %u\n",
+			 pmt_feature_names[feature->id], header->attr_size);
+		devm_iounmap(priv->dev, feat_base);
+		return SKIP_FEATURE;
+	}
+
 	/* Validate fields fit within mapped resource */
 	size =3D sizeof(*header) + FEAT_ATTR_SIZE(header->attr_size) +
 	       PMT_GUID_SIZE(header->num_guids);
--=20
2.43.0

