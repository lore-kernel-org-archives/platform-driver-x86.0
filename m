Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464C23368B4;
	Fri, 13 Mar 2026 01:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773366744; cv=none; b=g7cO7lwKHtzV8L8NZkB+2g01asE9o4or+RgXZfs3kEPwGyW9ZXRxnumC4wqyr2RzMStDwMkRlADul/9sTt7blWef8qyDe3cunrOpynQUJI7f21iTfzSe0t38Q+TK1YMxQpSBoc3BW0DOZG4PKBJ/aVaJPH+WBJa9UI7fop4AWf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773366744; c=relaxed/simple;
	bh=ZabcyUbRxdBA5HUViTeJoUjAM565/XUWPbCRb8PlGHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ugfoGnoi7twSlakdTfd84HUlVfGB3pPsJUtKIynYrOJuemaLBLQ78+IIDTnkYnv3toZD/tvvOBaXZT0rReCfboJgT8GPVc2ctMhJC/WflOBsioXGXpYFVi1sXCFFj6SXq1Q/KRJ7RJgkQlJKTKIhpkrmNtxzR++1t/+WOsh3JzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dONeIEIG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dONeIEIG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773366743; x=1804902743;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZabcyUbRxdBA5HUViTeJoUjAM565/XUWPbCRb8PlGHk=;
  b=dONeIEIGn8NTCz9+PzsdGixH2r1WGZLlJz78r64xbSGecLg08DAPO/L+
   ZWONQB1ZXAmtggyTcXdJtfylefsk0sQg2iqmhV3S2p0d/IDFiaZ30yBKO
   oLQtUUqWXMB4swpoln2dQcdUCNQ/rM9yEyK9IIg4pEfPp3I9QnAl3/Z4g
   OrIXGnRovGtR9ytNm6av0ROkG9YBIc/kSVCBorJk354Bb/RXGcn+eys+y
   3t5NTcY3gozx9+JwQOjoxTR4xX+sQ34LP2t53iYQe034rRo+dgx68vCrX
   QyYbe8BBwjicU8FXkwHF3ekinKqYK/GnSTJ4OMVt+fYWy0ROe81CFu6BM
   Q==;
X-CSE-ConnectionGUID: hi5EpR9AS7y/tLy4quaGgw==
X-CSE-MsgGUID: XXeKE6FeS2G27iInD1shJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74354563"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="74354563"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 18:52:12 -0700
X-CSE-ConnectionGUID: 7S9QgKuTTeW8NEXwnwyRcQ==
X-CSE-MsgGUID: gYWkRIIqRY2idnw7jytamQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="220108487"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 18:52:12 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com,
	irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	xi.pardee@linux.intel.com
Cc: david.e.box@linux.intel.com,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 07/22] platform/x86/intel/pmt: Add pre/post decode hooks around header parsing
Date: Thu, 12 Mar 2026 18:51:46 -0700
Message-ID: <20260313015202.3660072-8-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313015202.3660072-1-david.e.box@linux.intel.com>
References: <20260313015202.3660072-1-david.e.box@linux.intel.com>
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

