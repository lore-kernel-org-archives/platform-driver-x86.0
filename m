Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5D923536B;
	Thu,  9 Apr 2026 12:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775737942; cv=none; b=EWArj6qnpAB7ILbQpPySvxl8Sb/YBUb3JFDp7Q1yOSu+ITER4vIhVBzrcizubcRBAS7rSS7lUuPwEzQ3V8wlSLQm3qOJQUyYAZA3T1ZSaq8NIQ9u3vx72v5VWY+SsuJdkjrWz66QVy1kRnvC4lTZT84dQ76haCZjBwukFCHWEbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775737942; c=relaxed/simple;
	bh=bf/fTJTLf42b9YRz0Y848rPIntArjL/rr8fAy4vfxi8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pUUfnyyl3p9JSb16AQq2F1759NTSiahf40Jl1pmKkZWbMqUfNtYkXFMJDpGzSAtW7TQOtz2SCgT/tUDjxR+LHGEGK87aNkaG4g2rgEfqxFLFyaz/SCgkfTv6yos0x5FPqCfOrPyCM1e6M1UOqwPowPB0Bxj60QEGHd/LhD7i4sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MSXSGc5+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MSXSGc5+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775737941; x=1807273941;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=bf/fTJTLf42b9YRz0Y848rPIntArjL/rr8fAy4vfxi8=;
  b=MSXSGc5+aK1dchuwiVq1jmaQJVMf+gJ021qO4WGFik0NkKAuwxLSF+w8
   iux0CwcfKYqtaoJE8xDgkAn2uj88VKvpsLyAWx3alXIX0pAL4IH8HEwZd
   ydSJpB2zPfe34gaLIajyN25ASd4UujcU7TFJLB/2thy6iygGvGNwtDVsB
   sraLjowt2727bMC/E0kxw8SNZ9FvGxl3C4872wn7CChspTfD0uzPXrnoK
   P+hg58FC76W9DJZoChf3y1m4AEXv5etPWVFPR6gvvjMWt+Mc3MtN2yGd5
   OGdeCGqX2fST+66mDgvna2dwfohr366MFO/v1Ii/VQfs8t/OV90DJORd0
   A==;
X-CSE-ConnectionGUID: 5fIbLMuKTfC+6vUH6Kx6vg==
X-CSE-MsgGUID: UxOV/NeARCqJm6jlat0/1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76812275"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="76812275"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 05:32:20 -0700
X-CSE-ConnectionGUID: 6pf938EHQgi/jludPsza6w==
X-CSE-MsgGUID: zURT8er0R6KgBPLicLbFYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="252092525"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.197])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 05:32:17 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 9 Apr 2026 15:32:13 +0300 (EEST)
To: Rong Zhang <i@rong.moe>
cc: "Derek J . Clark" <derekjohn.clark@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>, 
    Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH 3/3] platform/x86: lenovo-wmi-other: Balance component
 bind and unbind
In-Reply-To: <20260401190221.1595264-3-i@rong.moe>
Message-ID: <e305f001-645b-0d90-f2df-ef6f1d44e00e@linux.intel.com>
References: <499fa3efd5be054ffdda77dd00ad4d8d3391e073.camel@rong.moe> <20260401190221.1595264-3-i@rong.moe>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-587754840-1775737933=:968"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-587754840-1775737933=:968
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 2 Apr 2026, Rong Zhang wrote:

> When lwmi_om_master_bind() fails, the master device's components are
> left bound, with the aggregate device destroyed due to the failure
> (found by sashiko.dev [1]).
>=20
> Balance calls to component_bind_all() and component_unbind_all() when an
> error is propagated to the component framework.
>=20
> No functional change intended.
>=20
> Fixes: edc4b183b794 ("platform/x86: Add Lenovo Other Mode WMI Driver")
> Cc: stable@vger.kernel.org
> Link: https://sashiko.dev/#/patchset/20260331181208.421552-1-derekjohn.cl=
ark%40gmail.com [1]
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>  drivers/platform/x86/lenovo/wmi-other.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index b47418df099f..4b47b5886e33 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -1068,8 +1068,11 @@ static int lwmi_om_master_bind(struct device *dev)
> =20
>  =09priv->cd00_list =3D binder.cd00_list;
>  =09priv->cd01_list =3D binder.cd01_list;
> -=09if (!priv->cd00_list || !priv->cd01_list)
> +=09if (!priv->cd00_list || !priv->cd01_list) {
> +=09=09component_unbind_all(dev, NULL);
> +
>  =09=09return -ENODEV;
> +=09}
> =20
>  =09lwmi_om_fan_info_collect_cd00(priv);
> =20
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-587754840-1775737933=:968--
