Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498553A1D01
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 17:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763485724; cv=none; b=cRIewEsfNzAgvbQ/6nG2Pzlofk/zMf1Kt2wvqJu4QTv4gz2SGqfaibrZSe1SLCI3ycIS4DAjpSvD5ySdWVTbZAxHzHI12XttL+SYwL2R+9K+DDuJoOfGZcB5oW/tRkjCWt2MSTHlAzjFzD8HLorZ8eyC0blFTeCcOJh5rlcUlNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763485724; c=relaxed/simple;
	bh=7exhRZlER2O5PiidZ/W2LThfb7Ie6l5YTGCBMd1eTic=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=M48aNzqrI/DhKcW880qWgYasbsbq3J9VWvJhqBq+JxaDK7Jw5nZekyYO6tWUP968dplfpGHB1DFf5gQddBnT9Oz+E0nEP89XS8z/l7yu/EsvFYUlstYx3Ys7yvfQGgbZfLhiZNAoWSy5DRiWMv+qr5nojF2jQCu2VqU91MwNMLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nCPIycyo; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nCPIycyo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763485722; x=1795021722;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=7exhRZlER2O5PiidZ/W2LThfb7Ie6l5YTGCBMd1eTic=;
  b=nCPIycyoNTr5H64cabH52wMQHE7hr7ff52KS8/PAf44T78rj7Y1MZAbu
   rp4gyPolgmKZApMEhNbF4WpEe78Y1s2MG5G22NlQUuZHemnhZJN4YjN13
   kldzomze3yOJ0U29KQPhMJQxhmod22XMHJB1ow4j2DUhnYR1cEnQx0AVU
   v8yvJoFIpiBWM5LBtDmfb9C8jKohI+2yzA2zKEcTm+Tyh4qGFnKu60qrJ
   roHpg5YZvAL7qXJciHEuSiMWHTcBr4Vxz/6gi0vw/SI9g0EScB3HshR5+
   kXFgtEyOhSR+Z1m+MRk/XIfZZhRPGSmIgctWN3vnBh/OJD1VHBC/C+YNT
   w==;
X-CSE-ConnectionGUID: q0NECM5FQ8ScDLiGAdxlPQ==
X-CSE-MsgGUID: lYYESW7YQQyAofPK7jzkmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65395742"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65395742"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 09:08:41 -0800
X-CSE-ConnectionGUID: vE8KqocQSkCstUSPi2vm8w==
X-CSE-MsgGUID: Iar93UZuSbyUx6hjTzMXXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190073341"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.74])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 09:08:39 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 18 Nov 2025 19:08:35 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, lizhi.hou@amd.com
Subject: Re: [PATCH v2 2/5] platform/x86/amd/pmf: Use explicit SET_CMD/GET_CMD
 flags in amd_pmf_send_cmd()
In-Reply-To: <1eef31c8-bd50-4ad7-aabe-539992ae3719@amd.com>
Message-ID: <33a8d8c0-be1d-fd6c-68e7-5244635136af@linux.intel.com>
References: <20251111063737.4156385-1-Shyam-sundar.S-k@amd.com> <20251111063737.4156385-3-Shyam-sundar.S-k@amd.com> <2e640a82-eb91-14dc-3f34-5e862df14e59@linux.intel.com> <1eef31c8-bd50-4ad7-aabe-539992ae3719@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-431272473-1763485715=:1205"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-431272473-1763485715=:1205
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 18 Nov 2025, Shyam Sundar S K wrote:

>=20
>=20
> On 11/18/2025 21:11, Ilpo J=C3=A4rvinen wrote:
> > On Tue, 11 Nov 2025, Shyam Sundar S K wrote:
> >=20
> >> Add SET_CMD and GET_CMD constants and replace boolean values passed as=
 the
> >> get/set argument to amd_pmf_send_cmd() with the new explicit flags. Th=
is
> >> improves readability, avoids ambiguity around true/false and 0/1 usage=
=2E
> >> There is no functional change.
> >>
> >> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> >> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> >> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> ---
> >>  drivers/platform/x86/amd/pmf/auto-mode.c | 14 ++++-----
> >>  drivers/platform/x86/amd/pmf/cnqf.c      | 14 ++++-----
> >>  drivers/platform/x86/amd/pmf/core.c      |  6 ++--
> >>  drivers/platform/x86/amd/pmf/pmf.h       |  3 ++
> >>  drivers/platform/x86/amd/pmf/spc.c       |  2 +-
> >>  drivers/platform/x86/amd/pmf/sps.c       | 38 ++++++++++++-----------=
-
> >>  drivers/platform/x86/amd/pmf/tee-if.c    | 20 ++++++-------
> >>  7 files changed, 50 insertions(+), 47 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platfo=
rm/x86/amd/pmf/auto-mode.c
> >> index a184922bba8d..faf15a8f74bb 100644
> >> --- a/drivers/platform/x86/amd/pmf/auto-mode.c
> >> +++ b/drivers/platform/x86/amd/pmf/auto-mode.c
> >> @@ -114,14 +114,14 @@ static void amd_pmf_set_automode(struct amd_pmf_=
dev *dev, int idx,
> >>  {
> >>  =09struct power_table_control *pwr_ctrl =3D &config_store.mode_set[id=
x].power_control;
> >> =20
> >> -=09amd_pmf_send_cmd(dev, SET_SPL, false, pwr_ctrl->spl, NULL);
> >> -=09amd_pmf_send_cmd(dev, SET_FPPT, false, pwr_ctrl->fppt, NULL);
> >> -=09amd_pmf_send_cmd(dev, SET_SPPT, false, pwr_ctrl->sppt, NULL);
> >> -=09amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, pwr_ctrl->sppt_apu=
_only, NULL);
> >> -=09amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, pwr_ctrl->stt_min,=
 NULL);
> >> -=09amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
> >> +=09amd_pmf_send_cmd(dev, SET_SPL, SET_CMD, pwr_ctrl->spl, NULL);
> >> +=09amd_pmf_send_cmd(dev, SET_FPPT, SET_CMD, pwr_ctrl->fppt, NULL);
> >> +=09amd_pmf_send_cmd(dev, SET_SPPT, SET_CMD, pwr_ctrl->sppt, NULL);
> >> +=09amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, SET_CMD, pwr_ctrl->sppt_a=
pu_only, NULL);
> >> +=09amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, SET_CMD, pwr_ctrl->stt_mi=
n, NULL);
> >> +=09amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, SET_CMD,
> >>  =09=09=09 fixp_q88_fromint(pwr_ctrl->stt_skin_temp[STT_TEMP_APU]), NU=
LL);
> >> -=09amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
> >> +=09amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, SET_CMD,
> >>  =09=09=09 fixp_q88_fromint(pwr_ctrl->stt_skin_temp[STT_TEMP_HS2]), NU=
LL);
> >> =20
> >>  =09if (is_apmf_func_supported(dev, APMF_FUNC_SET_FAN_IDX))
> >> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x8=
6/amd/pmf/cnqf.c
> >> index 207a0b33d8d3..5469fefb6001 100644
> >> --- a/drivers/platform/x86/amd/pmf/cnqf.c
> >> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
> >> @@ -76,14 +76,14 @@ static int amd_pmf_set_cnqf(struct amd_pmf_dev *de=
v, int src, int idx,
> >> =20
> >>  =09pc =3D &config_store.mode_set[src][idx].power_control;
> >> =20
> >> -=09amd_pmf_send_cmd(dev, SET_SPL, false, pc->spl, NULL);
> >> -=09amd_pmf_send_cmd(dev, SET_FPPT, false, pc->fppt, NULL);
> >> -=09amd_pmf_send_cmd(dev, SET_SPPT, false, pc->sppt, NULL);
> >> -=09amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, pc->sppt_apu_only,=
 NULL);
> >> -=09amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, pc->stt_min, NULL)=
;
> >> -=09amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
> >> +=09amd_pmf_send_cmd(dev, SET_SPL, SET_CMD, pc->spl, NULL);
> >> +=09amd_pmf_send_cmd(dev, SET_FPPT, SET_CMD, pc->fppt, NULL);
> >> +=09amd_pmf_send_cmd(dev, SET_SPPT, SET_CMD, pc->sppt, NULL);
> >> +=09amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, SET_CMD, pc->sppt_apu_onl=
y, NULL);
> >> +=09amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, SET_CMD, pc->stt_min, NUL=
L);
> >> +=09amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, SET_CMD,
> >>  =09=09=09 fixp_q88_fromint(pc->stt_skin_temp[STT_TEMP_APU]), NULL);
> >> -=09amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
> >> +=09amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, SET_CMD,
> >>  =09=09=09 fixp_q88_fromint(pc->stt_skin_temp[STT_TEMP_HS2]), NULL);
> >> =20
> >>  =09if (is_apmf_func_supported(dev, APMF_FUNC_SET_FAN_IDX))
> >> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x8=
6/amd/pmf/core.c
> >> index bc544a4a5266..a659cedc4533 100644
> >> --- a/drivers/platform/x86/amd/pmf/core.c
> >> +++ b/drivers/platform/x86/amd/pmf/core.c
> >> @@ -131,7 +131,7 @@ static void amd_pmf_get_metrics(struct work_struct=
 *work)
> >> =20
> >>  =09/* Transfer table contents */
> >>  =09memset(dev->buf, 0, sizeof(dev->m_table));
> >> -=09amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
> >> +=09amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, 7, NULL);
> >>  =09memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
> >> =20
> >>  =09time_elapsed_ms =3D ktime_to_ms(ktime_get()) - dev->start_time;
> >> @@ -289,8 +289,8 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev,=
 bool alloc_buffer)
> >>  =09hi =3D phys_addr >> 32;
> >>  =09low =3D phys_addr & GENMASK(31, 0);
> >> =20
> >> -=09amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, 0, hi, NULL);
> >> -=09amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, 0, low, NULL);
> >> +=09amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, SET_CMD, hi, NULL);
> >> +=09amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, SET_CMD, low, NULL);
> >> =20
> >>  =09return 0;
> >>  }
> >> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86=
/amd/pmf/pmf.h
> >> index 6ea5380f3b23..19e413bd89bc 100644
> >> --- a/drivers/platform/x86/amd/pmf/pmf.h
> >> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> >> @@ -120,6 +120,9 @@ struct cookie_header {
> >>  #define APTS_MAX_STATES=09=0916
> >>  #define CUSTOM_BIOS_INPUT_BITS=09GENMASK(16, 7)
> >> =20
> >> +#define SET_CMD=09=090
> >> +#define GET_CMD=09=091
> >=20
> > amd_pmf_send_cmd() takes bool so I don't know why these are defined as=
=20
> > numbers?
>=20
> The signature of amd_pmf_send_cmd() is:
>=20
> amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32
> arg, u32 *data);
>=20
> However, in the code it=E2=80=99s called with mixed values for the get pa=
rameter:
>=20
> amd_pmf_send_cmd(=E2=80=A6, =E2=80=A6, true, =E2=80=A6, =E2=80=A6);
> amd_pmf_send_cmd(=E2=80=A6, =E2=80=A6, false, =E2=80=A6, =E2=80=A6);
> amd_pmf_send_cmd(=E2=80=A6, =E2=80=A6, 0, =E2=80=A6, =E2=80=A6);
>=20
> That inconsistency makes it harder to read. So, I think adding those
> two macros  would be useful so callers can use explicit names instead
> of 0/1/true/false, which should improve clarity.
>=20
> If you don=E2=80=99t think this is worth doing, I=E2=80=99m fine dropping=
 the change
> from this series.

No, no no. This is very good change, please don't drop it. I just didn't=20
understand why those defines don't have:

/* amd_pmf_send_cmd() get/set */
#define SET_CMD           false
#define GET_CMD           true


--=20
 i.

--8323328-431272473-1763485715=:1205--
