Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793410189;
	b=P5BbiGgET/XN4HQhPRq4sWgHwuEKj0wPZA5KepMu1wKJOulymJ66iCPJfkHX74w6n922
	 daa4Om1BEv08mThbMnH6buqWdrS9PKlyr7/aKDkSmS942RwJYRZGKgXAuqHvKwfITUV04
	 waWjxJHbrcvm73ORJpFr7Urb2YSzeQQJERAgOEMcQ6XkEcolD/hT3Ng8S5e3iDRFrL3SK
	 gSkKdSqVC6VwVmbJlb2j7Ab4xd03mILmmraJtEzQpyHxf7luPEQ2w++jZzTC93GnWa+oi
	 OzM5q/PLCUJN3PME1sSy9ikmwX+/xP5vA/uaUeZ7AccdvrHT44S0QtqCiQpwmBZTPOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793410189;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+tcljZ0iA1LSGlmY18zvvh3MG+/umtsbNWTEc7x4Pv8=;
	b=Mu6pnFMR7XwOHEns+wH7qUz2YePbOuSamEKBRBvGIzL70R7H4BVb0l/0Ruk2c6ysFVxO
	 6UR253UplY6sX7qIaCYtO6wx5bQ66QOSplpKlidpTRt2R5oh8rlIEBln5KTeafozz8l2X
	 bS0mFg+ynufe5O/lhDnhCFiHYb3Of8VZ3e6toFDKq6EGyEi2HgAs/onPFqYR3xtXM63dA
	 yWXJYvS1TWwuywm+1avcDdqKNpYPT6HB4tDQJloDFCplrIgbQhKalvhu/jK7rk4ysxqpi
	 Xy4rSEp22yqbfoObsNR1onRXtDJaG2X7QDsKwMlGCQIwjCdt5Mb9iIY0Ith4/rardzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gV1BG6nR;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B81606A32A;
	Sat, 31 Oct 2026 01:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5B81606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gV1BG6nR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793410189; x=1824946189;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KjH10n6BXimgCtOCEtZsl51elfPW30lUhWEJZOMtuls=;
  b=gV1BG6nRnQM27sBC9iPgRMRFnHdu69khQd5tEY/SsGHVjdtLxNTtuAwE
   rmcCcgSk/aT2mv223ZrHPvWle52VW6i+44PYhtdwDvW+GphOOfkDEqiKZ
   R5o72kOsGHmRImJTS/G5drk+YYsEfiuN5EE1amO9cEiydvZ5PxNyLPmUt
   BlLywM1sWs+X4b1OqRrXMcY/g43P30DtLXeVUBCpsC2tOjhODXW/StFIc
   BdjITM0qttB9XH+fVxJyM9XRDJT3nXMzB3uUKYDp0aW1XC5VcPTlcrSLX
   iKvoByhKwuZpMn2Yt5tduV3gGeUs2A2Xr4I9RfShO/zJJj4WqFQOpjef7
   g==;
X-CSE-ConnectionGUID: 7unI4FEzS/mfrdDdi1QRFA==
X-CSE-MsgGUID: o9BaTc5nTyOl+AoRhk5qvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2213336"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2213336"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 18:29:46 -0700
X-CSE-ConnectionGUID: 9PqHG4SUSc2fJXa5C8cgjg==
X-CSE-MsgGUID: 5OLzNLecToijlzNXOuL5uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7397958"
Received: from debox1-desk4.jf.intel.com ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 18:29:46 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] platform/x86/intel/pmt/discovery: Validate feature table against the BAR
Date: Fri, 30 Oct 2026 18:29:37 -0700
Message-ID: <20261031012939.377995-6-david.e.box@linux.intel.com>
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

For ACCESS_LOCAL features, the feature table resource is built from the
discovery table's offset and size fields, which are both read from the
device. The offset is a 32-bit value applied past the end of the discovery
region and the size is a 16-bit dword count, yet the resulting range is
never checked against the BAR the discovery table lives in. A malicious or
broken device can therefore direct the driver to map and read MMIO outside
of its BAR.

Use intel_vsec_check_bar_resource() to reject feature tables that do not
fit within the discovery BAR recorded by the vsec driver before mapping
them.

Fixes: d9a078809356 ("platform/x86/intel/pmt: Add PMT Discovery driver")
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/pmt/discovery.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/pmt/discovery.c b/drivers/platform/=
x86/intel/pmt/discovery.c
index 24ba7211e59d..6717121dc6f2 100644
--- a/drivers/platform/x86/intel/pmt/discovery.c
+++ b/drivers/platform/x86/intel/pmt/discovery.c
@@ -376,6 +376,7 @@ static int
 pmt_feature_get_feature_table(struct pmt_features_priv *priv,
 			      struct feature *feature,
 			      struct feature_discovery_table *disc_tbl,
+			      struct intel_vsec_device *ivdev,
 			      struct resource *disc_res)
 {
 	struct feature_table *feat_tbl =3D &feature->table;
@@ -404,6 +405,10 @@ pmt_feature_get_feature_table(struct pmt_features_priv=
 *priv,
 		 */
 		res =3D DEFINE_RES_MEM(disc_res->end + disc_tbl->offset + 1,
 				     disc_tbl->size * sizeof(u32));
+
+		if (intel_vsec_check_bar_resource(ivdev, ivdev->tbir, &res))
+			return dev_err_probe(priv->dev, -EINVAL,
+					     "Feature table %pR outside of BAR\n", &res);
 		break;
=20
 	default:
@@ -494,7 +499,7 @@ static int pmt_features_discovery(struct pmt_features_p=
riv *priv,
 	if (ret)
 		return ret;
=20
-	ret =3D pmt_feature_get_feature_table(priv, feature, &disc_tbl, disc_res);
+	ret =3D pmt_feature_get_feature_table(priv, feature, &disc_tbl, ivdev, di=
sc_res);
 	if (ret)
 		return ret;
=20
@@ -653,3 +658,4 @@ MODULE_AUTHOR("David E. Box <david.e.box@linux.intel.co=
m>");
 MODULE_DESCRIPTION("Intel PMT Discovery driver");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("INTEL_PMT");
+MODULE_IMPORT_NS("INTEL_VSEC");
--=20
2.43.0

