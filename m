Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793410188;
	b=SoS52kDc4S6NmFmcItusF209d7i1rHo2g0Tl/DrKajv2S2oFI4hEdN1vo89l98CxVo+M
	 5mOm4cMoWmdJmTvbm2fDBESHaSCrnsXYY/0TzzzVLOLlcMW8rS5wzTeN4q6HEReFqorqf
	 GTM9Df9dAjTKIVJewNgzF2+TWs4AmumSyi05tv6tXyJYpSfT9nZ374Ffa37NtU2RX+ZjH
	 flHXWiIP4oDPR4XTbYx7gjBvtxFa58PhYqlhbZXrvJjzdQrQZcwzWnl42mB8Np08IM2/x
	 IYXfpLjdnJAadzFAK8IdG5/dFe8GlpOLfdBbu/q2X1dfThrJm0kcLmAt8VVjxpjgaew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793410188;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bYcLPh7ddNGIgYWjiRJmv2zfk0z9OUzXHQBnzK65jXc=;
	b=xsJnkwUVNARF9HWGQHXKM4ze2v7dUs2mbv42UsmmCNXnVbSLlulYi5WHHKYMVt9cw4MN
	 Pe6dubirvsavO3VsBeoOYcAKrsfGzh9cHE6X0Krc6wAq9LXCpkqs1MDxKtbs22rWM/wEK
	 pU3GXw9zImLAvhG0dmmy/xxdxuE05NjGVTIRFd+cW+EFpnyLbMDNz8jqC63xtTIwBrxHu
	 tqYhXeDHRiwsN7BCE1HJ46F8TT+i1YkpbevD8OpOSSTUnAs4qfp1eahNlauISgWzYGuEm
	 EsSJIFMR3xx0d9GVUW5ZtuT2MTMhJ7biwyqNkbbLqgn2wiHF0W8LT6T3q3LrmW8adog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NVLJ6S48;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD58606A31F;
	Sat, 31 Oct 2026 01:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABD58606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NVLJ6S48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793410188; x=1824946188;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nRWR7gKeYAWHlXE/fi9YQrS8IWwLowFiiE07j24IiuY=;
  b=NVLJ6S48UPnqss2pdptZ/c97f1fnJK08kMM02CfRMorp1otiSN8qg7B7
   8qx96JSvzZwh0oy4ZlSfUU2mG1S/wooIBRnczeuP+K4Jnf1alfHfVAYWP
   MzjFlUavJw8DmYISFNVpWEHFQChqNzgONkgb3UFFce8nDtO0nZ5I4u69h
   4rOEAJKMeXd2vv6obcex7g3o7JmHlsVYq9a9JI829Up8QOHdHXyyib5x2
   IFsj6sZWYRyLW2UUPrey/fvh6TGgtcndhRiqVLKdD0Z6+4zuv1XKyrgD6
   ueXiYwnGE5LzmKxd1R4RLdkp7hnbDmQutke1NRnLMW0ZOAMMESaN0etce
   g==;
X-CSE-ConnectionGUID: GPBH7JaMT7mZ+WZHojKeEA==
X-CSE-MsgGUID: E/EN5R4zSzu2rlaEcmh/Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2213330"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2213330"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 18:29:45 -0700
X-CSE-ConnectionGUID: G/mvpSurTl2ClWSg3T+5JA==
X-CSE-MsgGUID: 740ZLtJLSeaU2x/n8PFMmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7397955"
Received: from debox1-desk4.jf.intel.com ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 18:29:45 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] platform/x86/intel/pmt/discovery: Avoid WARN for malformed tables
Date: Fri, 30 Oct 2026 18:29:34 -0700
Message-ID: <20261031012939.377995-3-david.e.box@linux.intel.com>
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

The feature table contents are supplied by the device, so an invalid table
size is an expected probe error. WARN() is not appropriate for malformed
device data because systems with panic_on_warn set will panic.

Use dev_err_probe() instead. This preserves the diagnostic and -EINVAL
return while being a better fit for the probe failure path.

Fixes: d9a078809356 ("platform/x86/intel/pmt: Add PMT Discovery driver")
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/pmt/discovery.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/discovery.c b/drivers/platform/=
x86/intel/pmt/discovery.c
index 47a4def6e6b9..143d2b3be562 100644
--- a/drivers/platform/x86/intel/pmt/discovery.c
+++ b/drivers/platform/x86/intel/pmt/discovery.c
@@ -440,8 +440,9 @@ pmt_feature_get_feature_table(struct pmt_features_priv =
*priv,
 	size =3D sizeof(*header) + FEAT_ATTR_SIZE(header->attr_size) +
 	       PMT_GUID_SIZE(header->num_guids);
 	res_size =3D resource_size(&res);
-	if (WARN(size > res_size, "Bad table size %zu > %pa", size, &res_size))
-		return -EINVAL;
+	if (size > res_size)
+		return dev_err_probe(priv->dev, -EINVAL,
+				     "Bad table size %zu > %pa\n", size, &res_size);
=20
 	/* Get the feature attributes, including capability fields */
 	tbl_offset +=3D sizeof(*header);
--=20
2.43.0

