Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEA823D28E
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Jun 2025 16:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749571977; cv=none; b=BcN40oLAafRlH5SmaLRUP35GUcelYkWo7ljOb57ndE+O0obhQBzezM0es1zCmkKE4zXvXJlm4moJ/7pRQp8jRwIXS++fct2UFssvIahlKAMnwk2utowhvp09gChXSkyLoV/pODk6EbA5MYEvh0oCWUVzr/Xx3t+xLhzZCi6djVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749571977; c=relaxed/simple;
	bh=Q9ztGLkQYZMDiJG0S/MqT649BTkOv2R9luXIGg5Pg00=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mzQHuxgXyFWcrbU5oWCvrt/waEAiiFcWTx8KT+Szxbahb7H2kL+nfzY5w3oGdxhw/qekIAz1b9FsRFdT6NX1PnFnNaaz/gWX+ETSEsOj1/p4zcH+QEoMJoamcvzs2ndrPztP0KbhSOmYtIJjLx7S2zOn0L6hhMOv/qHBsfU09Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=it2kPgTc; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="it2kPgTc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749571976; x=1781107976;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Q9ztGLkQYZMDiJG0S/MqT649BTkOv2R9luXIGg5Pg00=;
  b=it2kPgTcwwsc4utlguna6Ne55mwT0h2Hv6S7kyknE8aBpM8/9sYykQEL
   UXAxXVsaszHy4QvKb1EzUgsHb2NDeTcgbxCK5jnbOvJxu2LO/FnW791/h
   C9AoSnKBr0DyUx1LYpBbr6dtv0VPDhoINnATdFA7ADrY/SwO/VZxKKjjF
   +9EXGyVofMFMmNJOZVNJrvx6igpCqyeznfVcbqKXyOV5iVyoVwH/mDQTy
   fSb4unzOqgP64S5EJf3mX8tBGnEhvvXJGTD/3DlDdHJpV38B9tVSkyMJx
   Sfq8gO7zI71wy5h4hS15o/2hPZXfew+8I7XPLv1TC309YAMN4BvuDGmxP
   g==;
X-CSE-ConnectionGUID: N703X95KSQyAQ8PhS5vqPA==
X-CSE-MsgGUID: O0647GLWS2aM5OVsjZk2fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="62726376"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="62726376"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 09:12:55 -0700
X-CSE-ConnectionGUID: 885+NdyVTy2qQx3xpLEOnw==
X-CSE-MsgGUID: g56cm1UXTH+lFOd+Xxfkcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="151687984"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.196])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 09:12:52 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 10 Jun 2025 19:12:48 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, Yijun.Shen@dell.com
Subject: Re: [PATCH 01/10] platform/x86/amd/pmf: Add support for adjusting
 PMF PPT and PPT APU thresholds
In-Reply-To: <20250509072654.713629-2-Shyam-sundar.S-k@amd.com>
Message-ID: <5f5ab951-b948-e9d0-6ae2-d8269e4d82e1@linux.intel.com>
References: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com> <20250509072654.713629-2-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1844231520-1749571968=:949"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1844231520-1749571968=:949
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 9 May 2025, Shyam Sundar S K wrote:

> The most recent PMF Trusted Application includes enhanced features that
> allow for modifications to PMF thermal parameters such as PPT and PPT APU=
=2E
>=20
> This update introduces the necessary driver support to utilize these
> capabilities.
>=20
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/pmf.h    |  4 ++++
>  drivers/platform/x86/amd/pmf/tee-if.c | 16 ++++++++++++++++
>  2 files changed, 20 insertions(+)
>=20
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/am=
d/pmf/pmf.h
> index e6bdee68ccf3..4665e68e5c07 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -93,6 +93,8 @@ struct cookie_header {
>  #define PMF_POLICY_BIOS_OUTPUT_1=09=09=09=0910
>  #define PMF_POLICY_BIOS_OUTPUT_2=09=09=09=0911
>  #define PMF_POLICY_P3T=09=09=09=09=09=0938
> +#define PMF_POLICY_PMF_PPT=09=09=09=09=0954
> +#define PMF_POLICY_PMF_PPT_APU_ONLY=09=09=09=0955
>  #define PMF_POLICY_BIOS_OUTPUT_3=09=09=09=0957
>  #define PMF_POLICY_BIOS_OUTPUT_4=09=09=09=0958
>  #define PMF_POLICY_BIOS_OUTPUT_5=09=09=09=0959
> @@ -677,6 +679,8 @@ struct pmf_action_table {
>  =09u32 stt_skintemp_apu;=09/* in C */
>  =09u32 stt_skintemp_hs2;=09/* in C */
>  =09u32 p3t_limit;=09=09/* in mW */
> +=09u32 pmf_ppt;=09=09/* in mW */
> +=09u32 pmf_ppt_apu_only;=09/* in mW */
>  };
> =20
>  /* Input conditions */
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86=
/amd/pmf/tee-if.c
> index a1e43873a07b..679c5bf5faca 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -145,6 +145,22 @@ static void amd_pmf_apply_policies(struct amd_pmf_de=
v *dev, struct ta_pmf_enact_
>  =09=09=09}
>  =09=09=09break;
> =20
> +=09=09case PMF_POLICY_PMF_PPT:
> +=09=09=09if (dev->prev_data->pmf_ppt !=3D val) {
> +=09=09=09=09amd_pmf_send_cmd(dev, SET_PMF_PPT, false, val, NULL);
> +=09=09=09=09dev_dbg(dev->dev, "update PMF PPT: %u\n", val);
> +=09=09=09=09dev->prev_data->pmf_ppt =3D val;
> +=09=09=09}
> +=09=09=09break;
> +
> +=09=09case PMF_POLICY_PMF_PPT_APU_ONLY:
> +=09=09=09if (dev->prev_data->pmf_ppt_apu_only !=3D val) {
> +=09=09=09=09amd_pmf_send_cmd(dev, SET_PMF_PPT_APU_ONLY, false, val, NULL=
);
> +=09=09=09=09dev_dbg(dev->dev, "update PMF PPT APU ONLY: %u\n", val);
> +=09=09=09=09dev->prev_data->pmf_ppt_apu_only =3D val;
> +=09=09=09}
> +=09=09=09break;
> +

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

=2E..But with the caveat that you should start to consider something more=
=20
clever here as most of these cases are essentially just copy-paste code=20
with very minor variations in a single parameters and offset in=20
dev->prev_data so it would be nice if the similar cases could be handled=20
with once generic code fragment (I don't count dev_dbg variations).

>  =09=09case PMF_POLICY_SYSTEM_STATE:
>  =09=09=09switch (val) {
>  =09=09=09case 0:
>=20

--=20
 i.

--8323328-1844231520-1749571968=:949--
