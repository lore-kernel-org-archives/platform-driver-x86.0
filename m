Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48C04E8E13;
	Wed, 16 Sep 2026 10:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554623; cv=none; b=pgcFQFMZYfbb5Tc1A8iHf+biJBEzcNX+FfbXbqPcDXJF4ilqR5LpsMC5rGa+9OycJLz/7WHtPz9tt04ushyobwUqzzFk7V/Q8juQhLNpn1hCNN111aWi7GSUToOyY26YBjmWmhEBIsYXhMu3iJrUfCB8sRh/z7shjB7sicSwnak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554623; c=relaxed/simple;
	bh=1hNWh+vmeBi6+YnEn/PERnilJw5MWJePco83DG34Skg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=K/ybebbj/LCdm7yaDnCv0nlACLKX5YUwFmAB0mmmUHQ+qds9AXEQKFbp721fBYK4TFgTF1n+Iragi0rmPunUzcu/M0VYDkdWkFFCep8k0aj/nR+gNL8I4jNU8yLtVwpGfdcD8F5lknADVLomjiCxIhey4bEvZifhRn0xh0a7b5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IsscYuN3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IsscYuN3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789554601; x=1821090601;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=1hNWh+vmeBi6+YnEn/PERnilJw5MWJePco83DG34Skg=;
  b=IsscYuN3G/NAOhwTh7ukpHFtzkUsvUQQOPTqXQIWzt+eXYXAdf5ARYyi
   SHuyThq+BlriZGqJuAB+41MIDzef3bfSDUfKIExm759W3C4ZsSaxfY4ej
   Zat/eBlIIJikWbZ25RfX2mlbx8rXZYXuEZ0uKtvQO/iddfxlZW+yvWmaV
   2+d+FckmeMw2fAKQi/Qhanoqoso/TYcvvZc1TcLGhZ78pefi8p6IRBGy8
   ec2yBXC99cQP25n05KDRu4MA9JGkHPfQRvgQG0dYq9nfPOInDWvHeCxSp
   LLG91kXEmxS3wwU9RVQVS6dGdkY3g4j96SySFwACd5p6n9FZ8YUOSMlHb
   w==;
X-CSE-ConnectionGUID: aVmfGorAS/q+dycdzCLNDQ==
X-CSE-MsgGUID: O4EIuRb2SiOUrXU+qrq9gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101445472"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101445472"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 03:29:56 -0700
X-CSE-ConnectionGUID: pYxz78ALQmuMaWDtFtG53A==
X-CSE-MsgGUID: u0hIuqo0R8SmfaVM91Nqjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="267088956"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.187])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 03:29:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 16 Sep 2026 13:29:49 +0300 (EEST)
To: Muhammad Bilal <meatuni001@gmail.com>
cc: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hansg@kernel.org>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: hp-bioscfg: zero the hex-string decode
 buffer in hp_convert_hexstr_to_str
In-Reply-To: <20260916004606.165065-1-meatuni001@gmail.com>
Message-ID: <372e11de-9835-ef04-dba8-89faafa00ea6@linux.intel.com>
References: <0380b8d6-cff5-383f-b47f-700d1d17fefa@linux.intel.com> <20260916004606.165065-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1481929546-1789554589=:2346"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1481929546-1789554589=:2346
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 16 Sep 2026, Muhammad Bilal wrote:

> hp_convert_hexstr_to_str() allocates its output buffer for the
> worst-case decoded length, then fills in only as many bytes as the
> input actually decodes to before shrinking the allocation down to
> that length with krealloc(). Well-formed input can decode to
> noticeably fewer bytes than the worst case, so the buffer is
> frequently only partially written by the time it is realloc'd and
> returned to the caller.
>=20
> Use kzalloc() instead of kmalloc() for the initial allocation, so
> any unused capacity starts out zeroed instead of holding leftover
> heap contents, rather than relying on every current and future
> caller and code path to fill the buffer exactly.
>=20
> Suggested-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
> ---
> Applies on top of "platform/x86: hp-bioscfg: fix slab-out-of-bounds
> write in hp_convert_hexstr_to_str" (the DIV_ROUND_UP sizing fix),
> which Ilpo has applied to review-ilpo-next but is not yet in
> mainline. Sent as its own patch rather than a v3 of that one, since
> the sizing fix itself was applied as-is; this is the separate change
> requested on top of it.

Thanks, applied to review-ilpo-next.

In future, please try to add parenthesis into function names in the=20
shortlog (on Subject line) as well so I don't need to manually add them=20
myself.

--
 i.

> ---
>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platf=
orm/x86/hp/hp-bioscfg/bioscfg.c
> index ff28db7..2dab9c0 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> @@ -442,7 +442,7 @@ int hp_convert_hexstr_to_str(const char *input, u32 i=
nput_len, char **str, int *
>  =09*len =3D 0;
>  =09*str =3D NULL;
> =20
> -=09new_str =3D kmalloc(2 * DIV_ROUND_UP(input_len, 5) + 1, GFP_KERNEL);
> +=09new_str =3D kzalloc(2 * DIV_ROUND_UP(input_len, 5) + 1, GFP_KERNEL);
>  =09if (!new_str)
>  =09=09return -ENOMEM;
> =20
>=20
--8323328-1481929546-1789554589=:2346--
