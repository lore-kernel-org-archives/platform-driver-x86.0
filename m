Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6183230507E
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Aug 2025 12:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755606017; cv=none; b=o0J4uaRUiC5v+pshCG/v0uP8rD5fqSlBT2mOAFfUjnl6GXgNVbGutXYrc/ykB9JpfD7FUK3Dbl0TXxDSJB5/F182KQCIDcufxk9SNIpORmf0lLQuShbQDFjGKJmL8wQUZbcK6a2mlTEWyXQptLWzUeIYa5m9MBclKACgcSh2rrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755606017; c=relaxed/simple;
	bh=2IWkT/SkfxbjvhgxPPCMfp83ip4jlpg34PIK66mK1Y0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Cq2QUB7QAosFT2UpuUL5G81DZ/uY4CvXWTdEIAQYLNFKIRDVosXuf2VTIcBIhBwf+pTkX8Mqd8V3ZikuUMZM/PXyD7sIxrybPbo368g3iektxNd09j8D+YIJp5/kBJvubQxXB9hbdi9FJE++YWnP7MH3X2mLP1hP3ElavqGZ/qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cEPR0Nzw; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cEPR0Nzw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755606016; x=1787142016;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=2IWkT/SkfxbjvhgxPPCMfp83ip4jlpg34PIK66mK1Y0=;
  b=cEPR0NzwtuOq7cpayeUA2IA4hzsluo1IMdQUOTgiA1wilo1U00bzB7mo
   i42rVK3+JDOx2BSSQ6XyAUZrGTzbNzIB1OMXj+kzWZwcWhyU5tyrIuHyd
   zoHeuhllXgOm9a0Nsov+C1+Lu0IvYjJqZYyRU0V/nIDO6YNfR/Uw/BM3u
   0ALNZSTW/xXpzdsEcyRHQ+QFjkxSMoP/dUG+IEfRlIbijfxCbJXvEiDY7
   CrUyYRUVcee3OthP+baVSfoTInDM+aIsdZf7P8j7BtPyICV8RTshdrlHq
   eEbg2ZTt2GSHl2pWTsZjMxr5BPEamB4l4saEYwaLuHuuWHWrw5HWwmDMK
   Q==;
X-CSE-ConnectionGUID: 2gOAGWn+SOSqpxDFmJJjKg==
X-CSE-MsgGUID: OUzFKixsRkG6eeqiQaDk2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="83272659"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="83272659"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 05:20:16 -0700
X-CSE-ConnectionGUID: 0dkXGbO7Tt+lGEG1XgH6jA==
X-CSE-MsgGUID: obX3/1BrS0WGLssdRwlJ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="172074795"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.120])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 05:20:13 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 19 Aug 2025 15:20:09 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, Yijun.Shen@dell.com
Subject: Re: [PATCH v3 4/9] platform/x86/amd/pmf: Update ta_pmf_action
 structure member
In-Reply-To: <3d800301-526a-40fc-be67-ae067de03bfe@amd.com>
Message-ID: <4a3310d1-0da5-e31f-f25d-5d255fec3d98@linux.intel.com>
References: <20250723064121.2051232-1-Shyam-sundar.S-k@amd.com> <20250723064121.2051232-5-Shyam-sundar.S-k@amd.com> <0c6a6c0d-9abe-eb64-7902-b9f1045835f5@linux.intel.com> <3d800301-526a-40fc-be67-ae067de03bfe@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-91822349-1755605792=:949"
Content-ID: <3409b1bd-23a1-0757-b1d9-6456bc834819@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-91822349-1755605792=:949
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <e16d79cd-aa11-f29a-1ec8-b80ed4a6f008@linux.intel.com>

On Tue, 19 Aug 2025, Shyam Sundar S K wrote:
> On 8/19/2025 16:44, Ilpo J=E4rvinen wrote:
> > On Wed, 23 Jul 2025, Shyam Sundar S K wrote:
> >=20
> >> The latest PMF TA has been updated with the additional structure membe=
rs
> >> for internal evaluation. Since this same structure is utilized in the
> >> driver, it also needs to be updated on the driver side. Otherwise, the=
re
> >> will be a mismatch in the byte sizes when copying data from shared mem=
ory.
> >=20
> > How is it known if "latest" is in use or not?
>=20
> it is based on the GUID
> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
drivers/platform/x86/amd/pmf/tee-if.c?h=3Dv6.17-rc2#n30)
>=20
> We start of with the latest TA and do a fallback to older TA; if the
> TA load fails.

Yes but how is that reflected to handle the mismatch in sizes "latest" vs=
=20
"older" TA? I don't see anything to that effect in the patch.

Is this patch causing breakage with the older TA?

--=20
 i.
--8323328-91822349-1755605792=:949--
