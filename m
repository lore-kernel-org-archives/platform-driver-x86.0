Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BE631F994;
	Fri,  1 May 2026 23:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777677062; cv=none; b=Awh2uiOBTqlQxVD3/rc3BmUbzy4jSEiAwkq6wTFkTlojmaNev4DRGeCibdQs7W+P2bzOhDqp2asIQW3UmVIUfrts6HDQiZSoOJWH7lsp3w7OrNWyT3HfVqAOr4j69+bjdcOYx+xKSPrkdISTb2vR45vgoQvUuAgsOsq+Csh+5Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777677062; c=relaxed/simple;
	bh=ubY/XWZlOHfTJW90L7fba+s0HJTKS9MJY0sISv2Kvd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AXvk7+Glq9ZtpBbjSa0vuV/gyYksB61xpP77JHr27fDVEZyA4nAv//myQ+FztvhdsIS4G90p0QoWi79Q6izFANZpygmp7gICpoF+Dt01fztO825ZNdLk0Imde30f/Jzyvxtiu3al7R7LzSgPVpwoUwsH4Ez7IPpab/LbwEbLSTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gQ3XI16R; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gQ3XI16R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777677061; x=1809213061;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ubY/XWZlOHfTJW90L7fba+s0HJTKS9MJY0sISv2Kvd8=;
  b=gQ3XI16Rhm9r3uspyklAX+VVYoBKks9EfCeJChePQ/xFehXsLy74Nhlm
   qzCFhMs8kiASQb5R7WJqmM90Am2rgVdanE3HXjxGHLWbnd9CLfRQSbQdm
   dfcb59RfdQb0bUkVVL04ZmZ3ULUVttz2FaRqCQ67phRpILSXowjhYSqjC
   HFjLmJjo+xpyBvraZ0NFRaviaWRbjHV/swiQ+aPuEgoswsoN7yqkoHnZe
   VgQ58hR0r+VwcaWWcNlwM005K9A+XAPjHlRw6yhnATTwAhRnLUAJ7p83z
   aNgDT1BrYM8y/PRKAQD/pK4ruUyg7qbWAm+aC2NN1D5o6kRuLRfhw2tsY
   w==;
X-CSE-ConnectionGUID: HmNK8C+JTwmGMwaF28pASA==
X-CSE-MsgGUID: HBSjVie0S8Wp8xbT7UFfnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78740116"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="78740116"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 16:11:00 -0700
X-CSE-ConnectionGUID: oCTqXDkuRjOduW4AvyesTQ==
X-CSE-MsgGUID: AXU6FP5MT4iHeviQZPjUFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="238948953"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 16:11:00 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com,
	david.e.box@linux.intel.com
Cc: hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH V3 01/16] platform/x86/intel/pmt: Add pre/post decode hooks around header parsing
Date: Fri,  1 May 2026 16:10:38 -0700
Message-ID: <20260501231054.3890305-2-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260501231054.3890305-1-david.e.box@linux.intel.com>
References: <20260501231054.3890305-1-david.e.box@linux.intel.com>
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

