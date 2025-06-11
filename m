Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907F123AB86
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jun 2025 10:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638828; cv=none; b=QyyEAVYUMJhtBMgkf8vXJ7eQF8yfXqvDl0BlRjrKeNoMDQM+feiUe95fFPkKrz46KmwyJ66B4Ebjk14h404c3waeUe0qNBdCkhDQXSKUUEdJ7vC66uSS/V3YAsEEVdKuWiVVeTS4h3kSMcrqKgvvoeADGwRT261A0Yu8bCuztt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638828; c=relaxed/simple;
	bh=R9TlHxURUnjN573yzRx32Bgm2lbsetGLhCeLLYiw+Jw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=h4w8bxaN4FUFIYAukNXJP6Kdf3ptBsB62ToSX9wFXVCGS7WQLyyR7LQVoO2VINUJfnboCbXk4vRvrG9faUQAK1ZYIYxaJptz49xjKbwdVnDlb1Cem/nJT/NHV0RmSwGxgTkTnPd4cxzxHkPwVh21r0LZkzsF0taE9xlDAZTY5wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EoCAQZwQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EoCAQZwQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749638826; x=1781174826;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=R9TlHxURUnjN573yzRx32Bgm2lbsetGLhCeLLYiw+Jw=;
  b=EoCAQZwQEqSMSFVUNcVIyB9RXP7S6PoJG9fAAUIP1/iZnbUj9A1hpLiW
   1X/wtHwAnyTa+fa5VGNT1jhClPgsl4m0ZJGyvdhVGWdid1f0Oaosr/fxo
   7dIkPbqAxKQwRpZf/dIzpN6NxoFcnDaRStVRU99EPZi8iFJFwDkbsu4f/
   JRgj+/egPgpq3H/2jzNybiPfRgLVmBD2dyXLiNQsYlTQpGpHezvEONnqE
   Lte7QK8PG6sGX5UsrEsPgb4R2cpi5pybpM9Xp53gLFZaed0aBfIUmxzR3
   dNtGb1msh0E3IMFc2XL1IErHbtMOkFzM4hSMkyFEPu9W1BjKinknn8k0d
   g==;
X-CSE-ConnectionGUID: 1kL0gzxrQ+2PSAxyPGxKHQ==
X-CSE-MsgGUID: Z6OtkaIRTgOz7NbIISpzsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="55580248"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="55580248"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 03:47:06 -0700
X-CSE-ConnectionGUID: 0AZ/IltoRTSkxMqIbF/2jQ==
X-CSE-MsgGUID: 5YGJZQ7jSO65C9hAlADBpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="147516745"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.183])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 03:47:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 11 Jun 2025 13:46:58 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hdegoede@redhat.com>, lucas.demarchi@intel.com, 
    rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
    airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com
Subject: Re: [PATCH v4 06/10] platform/x86/intel/pmt: correct types
In-Reply-To: <20250610211225.1085901-7-michael.j.ruhl@intel.com>
Message-ID: <c412f6d2-0889-1a12-133e-10e87024351a@linux.intel.com>
References: <20250610211225.1085901-1-michael.j.ruhl@intel.com> <20250610211225.1085901-7-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-233003694-1749638818=:957"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-233003694-1749638818=:957
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 10 Jun 2025, Michael J. Ruhl wrote:

> A couple of auto variables do not match the return types of some of
> the functions.
>=20
> Update the mismatched types to match.
>=20
> Reviewed-by: David E. Box <david.e.box@linux.intel.com>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform=
/x86/intel/pmt/crashlog.c
> index 3d3b72451c01..ddb05d069fc6 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -137,7 +137,7 @@ static ssize_t
>  enable_show(struct device *dev, struct device_attribute *attr, char *buf=
)
>  {
>  =09struct intel_pmt_entry *entry =3D dev_get_drvdata(dev);
> -=09int enabled =3D !pmt_crashlog_disabled(entry);
> +=09bool enabled =3D !pmt_crashlog_disabled(entry);
> =20
>  =09return sprintf(buf, "%d\n", enabled);
>  }
> @@ -168,7 +168,7 @@ static ssize_t
>  trigger_show(struct device *dev, struct device_attribute *attr, char *bu=
f)
>  {
>  =09struct intel_pmt_entry *entry;
> -=09int trigger;
> +=09bool trigger;
> =20
>  =09entry =3D dev_get_drvdata(dev);
>  =09trigger =3D pmt_crashlog_complete(entry);
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-233003694-1749638818=:957--
