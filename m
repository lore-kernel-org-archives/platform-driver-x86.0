Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805213BFE41
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 12:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773750208; cv=none; b=lFcbTwd9YOXIX4Xh8lS/5ZTf4JX95e0/5m4msssXkRS9khk4vWN49lELex4QWI6RMVk7cHoTWwq9NexKZt3LFQwk2CJRK3cM8dCoF6h4TqPCsuIR9IKrQKlrakJta/CbvdhbFuUKURzfICJZ51doVcaVFxAfE42tEwuVjt/L2eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773750208; c=relaxed/simple;
	bh=Gk7MWqie6ZcGsS5uUkDqKROiYRykGv10PT8OT/vc84g=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=htreOYVpao2+AFlGfRYh3NJV9/RmtQUZwldjqgCPm+ryrjUKsy6FUhtvWtfUwOBIjxZDJx1Q3OZHDHWYJ/UQIyvgBhPeiQtpmp1HTUuCO1VqOQQO5If4UB5K2VA22KAl/CfJXE3C3VdgwKyHIztW9cuKsuleyEZFoydASqUK/ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hXeW+fXZ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hXeW+fXZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773750208; x=1805286208;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Gk7MWqie6ZcGsS5uUkDqKROiYRykGv10PT8OT/vc84g=;
  b=hXeW+fXZtCr38d5c45TFMU6gdGzoxQVRYOXLHDc4Tgr4Ah+HZ+oE27+J
   4dDlxB0N80fCIZfJMOxoslH2i/jADhVbTephem+OtAt2vwOWtU8QFFBwV
   UKq9vZwt85MO8jHOplfxPRjHT3ChLw7woF1deOyZuvxF5osWhLQtrYuDc
   Cn5f3DxC0Uk10gv6lV7IQJCXGiAePGX49lqWmfdJevHscIcApZ04nPWDr
   MMMhpOjj18wxoWKqqLUjlTbl1dgoGOiPTgQ76+PWBAcJuVwfzNogbC1qV
   L8jmIAa9zQVATZJTRMiyvNfEQediCa0Mpv2ULtSqx6AsBoHxj+rj11Ctl
   Q==;
X-CSE-ConnectionGUID: p5fTiZU1QX24WX4/6mlkIg==
X-CSE-MsgGUID: HZvSCCriRgCOrXYv1vOuWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="86253036"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="86253036"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 05:23:27 -0700
X-CSE-ConnectionGUID: BRl+CLGqTA6UeC1QX3xAbg==
X-CSE-MsgGUID: 7NTmA2cIR2yg+5N2ja3jvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="260157916"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.161])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 05:23:26 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 17 Mar 2026 14:23:22 +0200 (EET)
To: =?KOI8-R?B?68/Oxc7LzyDhzsTSxcog98nL1M/Sz9fJ3g==?= <admin@aquinas.su>
cc: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] support for thermal profile Omen 16 laptops with board
 8902
In-Reply-To: <1948971.tdWV9SEqCh@woolf.localdomain>
Message-ID: <a5a33593-43be-ba1f-4b6a-a9579e83a97b@linux.intel.com>
References: <1948971.tdWV9SEqCh@woolf.localdomain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1736699978-1773750202=:968"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1736699978-1773750202=:968
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 3 Mar 2026, =D0=9A=D0=BE=D0=BD=D0=B5=D0=BD=D0=BA=D0=BE =D0=90=D0=BD=
=D0=B4=D1=80=D0=B5=D0=B9 =D0=92=D0=B8=D0=BA=D1=82=D0=BE=D1=80=D0=BE=D0=B2=
=D0=B8=D1=87 wrote:

>=20
> The HP Omen 16 with bioard ID 8902 has the same WMI interface as
> other Victus S boards, but requires quirks for correctly switching
> thermal profile.
>=20
> Add the DMI board name to victus_s_thermal_profile_boards[] table and
> map it to omen_v1_thermal_params.
>=20
> Testing on HP Omen 16-c0004ur confirmed that platform profile is
> registered successfully and fan RPMs are readable and controllable.
>=20
>=20

Hi,

As is, I cannot take this patch. Please go through the information in
Documentation/process/submitting-patches.rst and resubmit. Especially pay=
=20
attention on formatting the changelog and DCoO.

You can also check existing, similar commits to this same file for=20
examples.

--=20
 i.

> ---=20
> drivers/platform/x86/hp/hp-wmi.c | 4 ++++=20
> 1 file changed, 4 insertions(+)=20
>=20
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/h=
p-
> wmi.c=20
> index 304d9ac63c8a..f60a48b97c36 100644=20
> --- a/drivers/platform/x86/hp/hp-wmi.c=20
> +++ b/drivers/platform/x86/hp/hp-wmi.c=20
> @@ -189,6 +189,10 @@ static const struct dmi_system_id=20
> victus_s_thermal_profile_boards[] __initconst=20
>                .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8C78") },=20
>                .driver_data =3D (void *)&omen_v1_thermal_params,=20
>        },=20
> +       {=20
> +               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8902") },=20
> +               .driver_data =3D (void *)&omen_v1_thermal_params,=20
> +       },=20
>        {=20
>                .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8C99") },=20
>                .driver_data =3D (void *)&victus_s_thermal_params,=20
> -- =20
> 2.53.0
>=20
>=20
>=20
>=20
>=20
--8323328-1736699978-1773750202=:968--
