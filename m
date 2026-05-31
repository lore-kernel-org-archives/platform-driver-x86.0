Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF22C3033EA;
	Sun, 31 May 2026 19:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780256786; cv=none; b=IIVW4KUrGFOaeWWDqpDrgn/B5ICsPONE1pVWQ+Xefdi//+17VypJ9m2pbDuGCp0l19k+lUkHQ1QHAHGQeWRLfluU4NPluwjfhbqawFeRH6ELVMw/IlnCNYprZ7qNizk8yPFmjlKc8gBIUT0v4q589zQKiGGE+zmBaVbx4X5hj/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780256786; c=relaxed/simple;
	bh=wI0ISySzioJ8reBoXw3GppaJ0yTveO08/zV/9m3B9vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rp2iG0QWunRfzl/5SOH31MhDc0lH0kPBCEjoRveP4Y4ipVDt3Voq+irRIaZHlQa77AwFfUH88rN0+r/a+kkdUOH5jkwS4RIf6OPvvzVH2u9LukmkFDUlSth83wVey9TTysxngP0fFO8/Ed8H9FiNn+g5eAaXMVgD1DikTupfRYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IS1o+LlO; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IS1o+LlO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780256785; x=1811792785;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wI0ISySzioJ8reBoXw3GppaJ0yTveO08/zV/9m3B9vs=;
  b=IS1o+LlOdS9z7VWxWiYSKi5Q54MYpNhSXoX83YVXxZBkSqB1OYHB+Iqx
   QS4glD2cHcK1wEPzOlpYkymACsJwT0qlKhhEOdnfhL0AI9GmxUl25WQ1/
   oMZwPfF9BikUOsrAHw8sxXDTJ+g8XPaJ8OiFGsV3mai4dkGiizlBl61h8
   UJG8g1WPKHkEJx+xdi+5Df8TJTxs0VThzqQ9yhMaHC0p7HjANQqXmOxr1
   B7HtkQLkBuIZ7Tr/Ji6n4S6EZg2oBUfBFuunUIcZ6pSj0IHW/pssaBAvN
   L+dBDOONzUV1X8mV6yWLzGgfhWYqGmlFPJWbr+iXdpKM07BUZUQSXAsMI
   A==;
X-CSE-ConnectionGUID: Ddi6wL6xSBqxnsiguQPJ+w==
X-CSE-MsgGUID: TmDntpawRn+MsOZ8fTaCuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80751272"
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="80751272"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 12:46:25 -0700
X-CSE-ConnectionGUID: kQz9vE5QRq+DOwuAqMU6cw==
X-CSE-MsgGUID: k1Ykt+1CSZO1KxRTK7utYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="247363891"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 12:46:25 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	irenic.rajneesh@gmail.com
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com
Subject: [PATCH v6 01/15] platform/x86/intel/pmt: Add pre/post decode hooks around header parsing
Date: Sun, 31 May 2026 12:46:03 -0700
Message-ID: <f14384bbf5f73ad240e55e699c6dced180c49e81.1780248804.git.david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780248804.git.david.e.box@linux.intel.com>
References: <cover.1780248804.git.david.e.box@linux.intel.com>
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

