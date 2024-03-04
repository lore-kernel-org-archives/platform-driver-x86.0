Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E883D0D4
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Mar 2024 13:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709559526; cv=none; b=AMhJkbtmoWIDSq5SV3R8m2ZIt3FpCurIYpfA2gmRqccS2k3TM+yA8xnm1pRuh6Bjwh65BrES/Vmb2chz+9ilD/2pHF+8oJA4zy+ab1rd0VoM9ruWX/94DpGAvvePbcnfT+NlTJ9kUhhb5PtyIIVVm+/SIwu0cjS4dcIuDDqj7EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709559526; c=relaxed/simple;
	bh=X14uLVXdeRpbAevU4qwPU8I/RJYzMkfYzZ9kMoiXS0I=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VAw5Bi/2hOK9cJMlmYtd+sdBz0Iy7Xt+M4KC3Ppo+Ws3JkxgKHwzvmAK9JowVnjSb0BRXnjKcg4koi/FIgAAOzmIeqMLwXVZnrZNKf9OPULd3PBVafK8mOX6h9da9pbs8HqmVPUuMYbjTyt5abEsjaTiXJ22r/otvUXG1jpwzNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2PJxCG0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2PJxCG0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709559525; x=1741095525;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=X14uLVXdeRpbAevU4qwPU8I/RJYzMkfYzZ9kMoiXS0I=;
  b=R2PJxCG0aTdXgcz17sMze2ZXOKvfDYSWnpszRheUgWqXnP45oOpD9qMp
   2rOP1XrFWE6XeW2Zon9T44uNfZvtZW/w7hGEwoxwJ1e8ybjffJiSHQzrp
   xV+1M5G+PIkqwhSxXQPkXlSwsaAccDYi0oLHgzdWT/bEGf95P27gi3jNY
   swoT1XSw1hvqaljndT81ex9h0gCp3KK9/19tG3Wfc4Jnd71idDbtOYVOb
   BHVRuwS/ORL4Q1JlJjqHKWMjVE87J4irQ+qlCnASGVpljy4goBf7PFT+z
   KHfiE0D/kBAzapBgHj1T3xT02L6pgpVhOVh64tHwxE8FASp6hx8VRxMqL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="29472456"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="29472456"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 05:38:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="9145532"
Received: from ekohn-mobl1.ger.corp.intel.com (HELO localhost) ([10.246.49.145])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 05:38:41 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 4 Mar 2024 15:38:37 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com
Subject: Re: [PATCH RESEND v2 5/7] platform/x86/amd/pmf: Add support to get
 APTS index numbers for static slider
In-Reply-To: <20240229105901.455467-6-Shyam-sundar.S-k@amd.com>
Message-ID: <e685f63d-3e4c-b3d3-45f1-2f67ad6ff331@linux.intel.com>
References: <20240229105901.455467-1-Shyam-sundar.S-k@amd.com> <20240229105901.455467-6-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-170568694-1709559517=:986"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-170568694-1709559517=:986
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 29 Feb 2024, Shyam Sundar S K wrote:

> APMF spec has a newer section called the APTS (AMD Performance and
> Thermal State) information, where each slider/power mode is associated
> with an index number.
>=20
> Add support to get these indices for the Static Slider.
>=20
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-170568694-1709559517=:986--
