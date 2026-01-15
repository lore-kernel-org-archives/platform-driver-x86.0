Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D3A39E6E5;
	Thu, 15 Jan 2026 13:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768482597; cv=none; b=Q1Hb8toVD63Ya6J0re4i43EOcEjynefpkD/63vZSluT0e1+lu0w7k1WY0OutepKK1rSHPAQTh/LPRCNrya6wlMtWn1vsDR+BLN94Bk/3TZUz0fAWq2Z5MkMyf0FK2fHcvmPjZGdCMCuZ1dxblonIWHsy4cErDROGVq1J8+5LIrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768482597; c=relaxed/simple;
	bh=BIoZF2I3vLrEjrCUlhiCCI21F/oNWrL567DQHu3op14=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tiZn3uiLRBWms7C4m1Os2xBayc+UyCMlSNa6HpYKmAgXFIIRUZIfxGqcLIdiJX9rU2uRT7Fu1SjIKMFfj8HiJpcgScRNBWqNZLUCDsjw+fRHx3uum+Y/ZNaD5aI8Yi0qCQXOaG5WUZmrmeQVltY23XpXq7uKCldycIUXQt+rRlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VxOx8mqi; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VxOx8mqi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768482597; x=1800018597;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=BIoZF2I3vLrEjrCUlhiCCI21F/oNWrL567DQHu3op14=;
  b=VxOx8mqiOe0lbMhyNfJBwYvWDLmOfYmslmRnkGxfRox6k9eanEoLo3hw
   OUte6U+yCxMwAz7JslKLAS1jKCGTXbkcDDNqnIcNfPC9TzhZzRF5VXBX7
   RckAeZdy4C5UOqPgvKzWC9N9BYIRkceQF5Kd7CqYqdRCQs/y5Mp0Wywyf
   ANnBjCQ8in3LPoBW/GpwQj4eRMDtiBc8Fd7/mDnnZPFwHTDnEnNtR931z
   FRmFJXS8ZodeWx1+XYvXG19nm16WE89IgsL6uNajElJph89IXqnDjKcB2
   DE64B0dfxwOfnfSYck5n6cbTalfffKd2SvIalJgZ6YUljOuSlxDfxuQje
   g==;
X-CSE-ConnectionGUID: 8kqaRCbyQ5uJ3DUuk7kVdA==
X-CSE-MsgGUID: +hLekw21RHKHYIzt2d+YOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80509192"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="80509192"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 05:09:56 -0800
X-CSE-ConnectionGUID: qjjYCUKcS1yd4FBxmX3xWg==
X-CSE-MsgGUID: iu+lCmgkS/+hABqthpSVLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="205362164"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.248])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 05:09:53 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 15 Jan 2026 15:09:49 +0200 (EET)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, 
    irenic.rajneesh@gmail.com, srinivas.pandruvada@linux.intel.com, 
    intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
    xi.pardee@linux.intel.comn, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 3/4] platform/x86/intel/vsec: Return real error codes
 from registration path
In-Reply-To: <20260107002153.63830-4-david.e.box@linux.intel.com>
Message-ID: <417b4ba4-c0a5-1250-8099-e18142fe61ff@linux.intel.com>
References: <20260107002153.63830-1-david.e.box@linux.intel.com> <20260107002153.63830-4-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-633248259-1768482589=:968"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-633248259-1768482589=:968
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 6 Jan 2026, David E. Box wrote:

> Stop collapsing registration results into booleans. Make
> intel_vsec_walk_header() return int and propagate the first non-zero erro=
r
> from intel_vsec_register_device(). intel_vsec_register() now returns that
> error directly and 0 on success.
>=20
> This preserves success behavior while surfacing meaningful errors instead
> of hiding them behind a bool/-ENODEV, which makes debugging and probe
> ordering issues clearer.
>=20
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  drivers/platform/x86/intel/vsec.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/int=
el/vsec.c
> index b84bb92624ef..42471fd609b1 100644
> --- a/drivers/platform/x86/intel/vsec.c
> +++ b/drivers/platform/x86/intel/vsec.c
> @@ -461,20 +461,19 @@ static int intel_vsec_register_device(struct device=
 *dev,
>  =09return -EAGAIN;
>  }
> =20
> -static bool intel_vsec_walk_header(struct device *dev,
> -=09=09=09=09   struct intel_vsec_platform_info *info)
> +static int intel_vsec_walk_header(struct device *dev,
> +=09=09=09=09  struct intel_vsec_platform_info *info)
>  {
>  =09struct intel_vsec_header **header =3D info->headers;
> -=09bool have_devices =3D false;
>  =09int ret;
> =20
>  =09for ( ; *header; header++) {
>  =09=09ret =3D intel_vsec_register_device(dev, *header, info);
> -=09=09if (!ret)
> -=09=09=09have_devices =3D true;
> +=09=09if (ret)
> +=09=09=09return ret;
>  =09}
> =20
> -=09return have_devices;
> +=09return 0;
>  }
> =20
>  static bool intel_vsec_walk_dvsec(struct pci_dev *pdev,
> @@ -582,10 +581,7 @@ int intel_vsec_register(struct device *dev,
>  =09if (!dev || !info || !info->headers)
>  =09=09return -EINVAL;
> =20
> -=09if (!intel_vsec_walk_header(dev, info))
> -=09=09return -ENODEV;
> -=09else
> -=09=09return 0;
> +=09return intel_vsec_walk_header(dev, info);
>  }
>  EXPORT_SYMBOL_NS_GPL(intel_vsec_register, "INTEL_VSEC");
> =20
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-633248259-1768482589=:968--
