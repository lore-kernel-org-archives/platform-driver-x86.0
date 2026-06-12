Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A41037881E;
	Fri, 12 Jun 2026 21:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781298136; cv=none; b=h3nfXDTaNl8+AzXDxpQeEzaI8X7xtogim8fIC2PxWOwmGpXUikTDnNBmJ5PNVaHCI5IqMnFFVbl9Gnwx5hF/LTMa4GVrhtq6R5Q4GZd+rkmT90MX1mQfdU+rMSswXwxtjLNdxsfJl72Rxxg5mHsNOWxnfbQcq7DLxER5lWHIFtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781298136; c=relaxed/simple;
	bh=ryk3p1QXgvdltDJCO5wT0v7qAlVZkkgL5g+SuvOtqHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LinnDzfB5BRdLh/SbE1CE5TfKMBDnRNaZ+lkm1rednqHwWCazDbrVB2IDy8+DGkIWIVhABMbWgXy2CzXoxjqV75U1iU3w/TX30qUDg5hct2p3CPDrJSjr4ra4XzihROlssPYKDzT/ZhHj9q3aZJTEfBpIt7pk/jrPPc02luJnSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G4AtpZpV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G4AtpZpV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781298136; x=1812834136;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ryk3p1QXgvdltDJCO5wT0v7qAlVZkkgL5g+SuvOtqHw=;
  b=G4AtpZpVWWWUg/K9WUHVTRaSEiFFtkOjTtUug4eZHoPRI6Ovf2uzNUBn
   wEsDFeYT5FIoAgH2asUKxpslS0jkPQJpRK7I6HElHKWQLkWAqSTQhdbX4
   f52Xb42HiyeiFRugx6CVSa2McN8o3QlW2hKFzp6HYcwyJkrw4nGB/wXzL
   XoJ6VhFLgmo0GmSAjEwLAZvrSvlqZddI0pcLhKlJf3lZUCJ/ezYjJttKL
   YceKdGcb/dxYyA1RWfb8e0IQQ3bF+fdyiqhiDq/difRHhVzWrpOXvLFZi
   gC6QwIxeUjoEpm35EFJgKUzyNQZCTEC2ADjL780BOWGefDArM+LnfrX/l
   Q==;
X-CSE-ConnectionGUID: KR7bfJK1SZGNS/GUJSza9w==
X-CSE-MsgGUID: rl5XIgh7QBaqkmUv5s9HqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="86037970"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="86037970"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 14:02:12 -0700
X-CSE-ConnectionGUID: 2dB+7sF3QJyttPo7MARGcQ==
X-CSE-MsgGUID: Nm2lz0OeQUS2rlJKBg4Qog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="250832858"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 14:02:11 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	irenic.rajneesh@gmail.com
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com
Subject: [PATCH v8 01/15] platform/x86/intel/pmt: Add pre/post decode hooks around header parsing
Date: Fri, 12 Jun 2026 14:01:42 -0700
Message-ID: <b178a341601ca694db99c3b738fe4ed9e0c2bede.1781294741.git.david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781294741.git.david.e.box@linux.intel.com>
References: <cover.1781294741.git.david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Add optional pre- and post-decode callbacks to the PMT class so namespaces
can perform setup and cleanup steps around header parsing.

  - Add pmt_pre_decode() and pmt_post_decode() to struct
    intel_pmt_namespace.
  - Update intel_pmt_dev_create() to invoke, in order:
      pre =E2=86=92 header_decode() =E2=86=92 post.
  - Keep the existing pmt_header_decode() callback unchanged.

No functional changes. This adds flexibility for upcoming decoders while
preserving current behavior.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
---
V8 - No changes

V7 - No changes

V6 - No changes

V5 - No changes

V4 - No changes

V3 - No changes

V2 - No changes

 drivers/platform/x86/intel/pmt/class.c | 12 ++++++++++++
 drivers/platform/x86/intel/pmt/class.h |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/=
intel/pmt/class.c
index b4c9964df807..9b315334a69b 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -381,10 +381,22 @@ int intel_pmt_dev_create(struct intel_pmt_entry *entr=
y, struct intel_pmt_namespa
 	if (IS_ERR(entry->disc_table))
 		return PTR_ERR(entry->disc_table);
=20
+	if (ns->pmt_pre_decode) {
+		ret =3D ns->pmt_pre_decode(intel_vsec_dev, entry);
+		if (ret)
+			return ret;
+	}
+
 	ret =3D ns->pmt_header_decode(entry, dev);
 	if (ret)
 		return ret;
=20
+	if (ns->pmt_post_decode) {
+		ret =3D ns->pmt_post_decode(intel_vsec_dev, entry);
+		if (ret)
+			return ret;
+	}
+
 	ret =3D intel_pmt_populate_entry(entry, intel_vsec_dev, disc_res);
 	if (ret)
 		return ret;
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/=
intel/pmt/class.h
index 1ae56a5baad2..ff39014b208c 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -62,6 +62,10 @@ struct intel_pmt_namespace {
 	struct xarray *xa;
 	int (*pmt_header_decode)(struct intel_pmt_entry *entry,
 				 struct device *dev);
+	int (*pmt_pre_decode)(struct intel_vsec_device *ivdev,
+			      struct intel_pmt_entry *entry);
+	int (*pmt_post_decode)(struct intel_vsec_device *ivdev,
+			       struct intel_pmt_entry *entry);
 	int (*pmt_add_endpoint)(struct intel_vsec_device *ivdev,
 				struct intel_pmt_entry *entry);
 };
--=20
2.43.0

