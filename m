Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793410188;
	b=Bg+uu+6Pav96vwqQ898t1VaYlZr5V02yYc6b1lQA2kW9GGT1u+mkowMIeFyeReGKgyt5
	 pQiOYjfZZAMa/NFtQPwQw6ayVXHvFPD3qzQ3o5jzjG9s5FtHOG+aXQrFmnNu0tLbsPfWK
	 MhnP+FT5JfXp1q9cKw+7D54I+sAo/yXueoI0OnK3UNFhfuvcHNRpXgidj/qLW2Hv4vc0D
	 k5xWb0BL1mpEtyosp6e5HYq3RJ6vsOqSCM6bdCgQ/MSEhgtsaikhe+3l+jYc3y2h17acq
	 mMh+uMsaU0AM3M/dh4jwaryaoplFHl4GXwg5Tn6RvdsAFjp7WEpeZKytArhVFPydNMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793410188;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fZZHPYvlTuG1T9eMNZaNLDKdnPPmwXSZn2K4//OVaAU=;
	b=lmTOTJf9v5iQ3nQ/YiVlSXx7QHOu1/4Fh9oMd1xgxB/jDfSCYOIdO+MnNW0kI7jeZkay
	 V6QMYACtWRciqhNwdE7Em/pL+Oeql0JzYHJQgy6xfL8YI8wSyRYFB6Hdb5wlnuMv45Dzt
	 JMo3bFvmNhcvaHpinM7imJDMM8d+9+PS6UARlLxsis8joq2a1bVWbSt8Wmhfeiuq/zmT7
	 squQ9X6NepH6SocEU3RSwJQILb5FMN2jGHjk0RFLBeBXHou3fvy7Wc5QResAIvbUoIdpP
	 /m4o50Alzzp0Wg05k/5pegBB06xhFaZXoYtB+Vn48prAS7wtfUKFfdHU+LhPKux8Yqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JK7MDyE6;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6A1606A322;
	Sat, 31 Oct 2026 01:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C6A1606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JK7MDyE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793410188; x=1824946188;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ydn0BsX84LiVZrg26VBL8iPzHHuMm5l/y2ghvqhyxrg=;
  b=JK7MDyE6rP7vkyEOOrIF3V4mjjTWJGvvXNbFP+rw+phvorc30s0FtuYC
   bM1i2zvmqhQlUJUl/jS99lNVRIXQOAwRwNQt2wOIOKKQ+3pHd4mFUWLsw
   Va1XckzcFusSfdASGQ31jxw/FDc3MdBsqzbq8jKM4dciUzL71WPg27VJq
   EZ8BWD1ZiFycyLa2zcxt4Z5mVhbC+TKvrE2ToZ7R/w4xDnqoxF1vTRwlj
   EEM0Dx6/jMQgmh9BLfs2XjB+uJ7wZnfgFQ+jL925fiS53xbqfCbSeUBbm
   uC3LyOQYa6iFdJ6iTKa+lZ2Tned9Gw+4dlvSeeRh1W1PirvRZsPTnG1ge
   w==;
X-CSE-ConnectionGUID: 7c+NzNogRz6ykq3s/LvF0g==
X-CSE-MsgGUID: 1yomWFeaQneyobS1a8jMow==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2213332"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2213332"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 18:29:46 -0700
X-CSE-ConnectionGUID: tZECDw48REmvw6ddNCxthg==
X-CSE-MsgGUID: 36Ez0htGQMaT8LEdq67FAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7397956"
Received: from debox1-desk4.jf.intel.com ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 18:29:46 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] platform/x86/intel/pmt/discovery: Validate feature id before use
Date: Fri, 30 Oct 2026 18:29:35 -0700
Message-ID: <20261031012939.377995-4-david.e.box@linux.intel.com>
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

pmt_feature_get_disc_table() reads the feature id from device MMIO and
uses it in the duplicate check, as BIT(disc_tbl->id) and as an index
into pmt_feature_names[], before pmt_feature_id_is_valid() is called.

The id is a 32-bit field, so a malformed table can supply a shift count of
BITS_PER_LONG or more, which is undefined. Validate the id before it is
used.

Fixes: d9a078809356 ("platform/x86/intel/pmt: Add PMT Discovery driver")
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/pmt/discovery.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/discovery.c b/drivers/platform/=
x86/intel/pmt/discovery.c
index 143d2b3be562..24ba7211e59d 100644
--- a/drivers/platform/x86/intel/pmt/discovery.c
+++ b/drivers/platform/x86/intel/pmt/discovery.c
@@ -348,6 +348,10 @@ pmt_feature_get_disc_table(struct pmt_features_priv *p=
riv,
=20
 	devm_iounmap(priv->dev, disc_base);
=20
+	/* The id is used as a bit position and array index below */
+	if (!pmt_feature_id_is_valid(disc_tbl->id))
+		return SKIP_FEATURE;
+
 	if (priv->mask & BIT(disc_tbl->id))
 		return dev_err_probe(priv->dev, -EINVAL, "Duplicate feature: %s\n",
 				     pmt_feature_names[disc_tbl->id]);
@@ -363,9 +367,6 @@ pmt_feature_get_disc_table(struct pmt_features_priv *pr=
iv,
 	if (disc_tbl->version > MAX_FEATURE_VERSION)
 		return SKIP_FEATURE;
=20
-	if (!pmt_feature_id_is_valid(disc_tbl->id))
-		return SKIP_FEATURE;
-
 	priv->mask |=3D BIT(disc_tbl->id);
=20
 	return 0;
--=20
2.43.0

