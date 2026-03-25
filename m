Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC601EDA2C;
	Wed, 25 Mar 2026 01:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774403308; cv=none; b=X98RinOcMZN9tLiV22dnMhZXsz+EvhtmPCP7efAVAnskgkJQR5YfgiGyFQmp7B3vBlAXyth4uGzoLUT25whPz6Dbd0PPtldQRcn9IfvjBKQ28RTxYa+d6n5MwYD4BPz26RuI7THhCREd1TZNtGwEUSPUoakdKNaWwWGxACUAEjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774403308; c=relaxed/simple;
	bh=esySUl71PKPiQ5rlztA6Tfpvu1vzLlTV4KLeCs1Dyeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p8vY3fzuMr/Y6FzN9cvTwm2o8r/5QcXO01HI1/TL/7n27rQFaF5VK61NwmN0AmBz2N0pd1dmv2DHjVPvLY8OxVQkL43fvQBtbUuY4obhVXKMpGNdpoYRPa1O4Fxw4ohBl7FmOpusruL3UyfE7hgDzKuB/TQdl5LYdDxZSKbARtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=InCaE0q5; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="InCaE0q5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774403307; x=1805939307;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=esySUl71PKPiQ5rlztA6Tfpvu1vzLlTV4KLeCs1Dyeo=;
  b=InCaE0q5QwvNdJcxDqYxuGVC3ZdPDBb4GBggweI7h/QPjeWQlbuMIm71
   mHmSdYkjBoYnN1IKAFuvEHyWT30vn8Y/sVJsXF5Ba7KhaitMcj5YWCZ8J
   5X3ih4Hb0sHdtaGxxvX/Ni6TBqrn+K7QVNVOnTggS+fIWDxBGMNc9Mj74
   1YtYUnRduQHalnlN/gSOBMNaZb2YMIcAN68P0iK8wGVq1/Dl/ITijHZZe
   eIhkKDtBezAu1VKj09/zeNYCZMWgND40IHEPC8EyUuGtCcfNkT3rHkb8N
   FNoHp/rMopSLvFbozmFjl4QIg8ClWujjORSR2m2lxC/hb2ns7Y087z+3q
   w==;
X-CSE-ConnectionGUID: drcxEPkcRgGcrPeWLZeFoA==
X-CSE-MsgGUID: lWnDdq0vRXuSQRCG1Vu0Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75317486"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75317486"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 18:48:25 -0700
X-CSE-ConnectionGUID: DXD3/5+jS7eMIzegTQ3ZkA==
X-CSE-MsgGUID: 9BxuK2AzSgOKSfifOttVIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="221190776"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 18:48:25 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com,
	david.e.box@linux.intel.com
Cc: hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH V2 01/17] platform/x86/intel/pmt: Add pre/post decode hooks around header parsing
Date: Tue, 24 Mar 2026 18:48:03 -0700
Message-ID: <20260325014819.1283566-2-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325014819.1283566-1-david.e.box@linux.intel.com>
References: <20260325014819.1283566-1-david.e.box@linux.intel.com>
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
---

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

