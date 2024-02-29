Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AB57E11A
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Feb 2024 13:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709212763; cv=none; b=InQBBH138ksXulbSm7w+gU1EjwBGlKfI+nrzshR/EHliDtIF8RPUZcfNzxwFvjo88KasV2F0khBkw7FlJw/I7yilAt78w2hYsoRNPoNFId8bf32dLlkTZjjjmuuOo1PLGYLZYTdir3hdPlJg9wLqCSOk53xtbuLhhZd0/C1pY1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709212763; c=relaxed/simple;
	bh=87t1fb9VvAYLQ8BNstUxc+8E6pHT5Zzkv18ya6Cqs3c=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aaZm+oU5ymlMu9cqPqJ0IvHyTvgSV9V14ZRv4NcVno+f8a6KRjJebtSf/kU9qUykXnUH3hNbdbLaMWPRlavhKRmcXktt6+mtsNraixxc27A39BifqaPiKqhA1etU0q4rVLqy++VLVSi+tNSvVC4E3hwjprACpiVcAEQXSMlbqSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X9yxgVQo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X9yxgVQo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709212761; x=1740748761;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=87t1fb9VvAYLQ8BNstUxc+8E6pHT5Zzkv18ya6Cqs3c=;
  b=X9yxgVQoBgAXu/z1mtuo6oqSASVtbyrvOMVFg1cp0VOGZA2+J6yawrzu
   cQO2crP92ft2zRDIzdfTX6DxI18wLzP+w+zBiryB1BejQ2CcLfGcL/fZe
   uUuQtPYlymv2ntoiRkk+CiAAdxFx8wRtylA6DbTUcA0YEQjiGrpKyZEQK
   xob2gMa2+I2PdZUB29VjLFtC/BEa0EPsJnn31xkxV+FASOq684at1qx18
   vKdG8cUIcJsjIWpe5vlV8u58g6k6mOaB55woKh0Ef4nGMVaNByJmwiS7t
   SlZc399k36sQw7zvDnOCmyWuBSnJSgZThdrKHdGhYuDmwuoSF7kWOy2Fz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3551956"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3551956"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 05:19:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="31011754"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.51.250])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 05:19:19 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 29 Feb 2024 15:19:15 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com
Subject: Re: [PATCH 3/7] platform/x86/amd/pmf: Add support to get sbios
 requests in PMF driver
In-Reply-To: <74f0d344-8d4f-4a33-8862-ade4ace571d1@amd.com>
Message-ID: <47eadab7-0273-e037-dad9-5e23cfc6e1f2@linux.intel.com>
References: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com> <20240227125520.3153140-4-Shyam-sundar.S-k@amd.com> <1358d40e-5114-2d1d-c679-342cf3ca0989@linux.intel.com> <74f0d344-8d4f-4a33-8862-ade4ace571d1@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-63883218-1709212755=:1005"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-63883218-1709212755=:1005
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 28 Feb 2024, Shyam Sundar S K wrote:

>=20
>=20
> On 2/27/2024 18:58, Ilpo J=C3=A4rvinen wrote:
> > On Tue, 27 Feb 2024, Shyam Sundar S K wrote:
> >=20
> >> Update the APMF function index 2 for family 1Ah, that gets the
> >> information of  SBIOS requests (like the pending requests from BIOS,
> >=20
> > extra space.
> >=20
> >> custom notifications, updation of power limits etc).
> >>
> >> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> >> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> ---
> >>  drivers/platform/x86/amd/pmf/acpi.c |  6 ++++++
> >>  drivers/platform/x86/amd/pmf/pmf.h  | 13 +++++++++++++
> >>  2 files changed, 19 insertions(+)
> >>
> >> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x8=
6/amd/pmf/acpi.c
> >> index 1f287a147c57..1b2a099c0cef 100644
> >> --- a/drivers/platform/x86/amd/pmf/acpi.c
> >> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> >> @@ -166,6 +166,12 @@ int apmf_get_auto_mode_def(struct amd_pmf_dev *pd=
ev, struct apmf_auto_mode *data
> >>  =09return apmf_if_call_store_buffer(pdev, APMF_FUNC_AUTO_MODE, data, =
sizeof(*data));
> >>  }
> >> =20
> >> +int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_=
sbios_req_v2 *req)
> >> +{
> >> +=09return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
> >> +=09=09=09=09=09=09=09=09=09req, sizeof(*req));
> >=20
> > Fix the alignment please.
> >=20
> >> +}
> >> +
> >>  int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbi=
os_req *req)
> >>  {
> >>  =09return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
> >> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86=
/amd/pmf/pmf.h
> >> index 4364af72a7a3..f11d2a348696 100644
> >> --- a/drivers/platform/x86/amd/pmf/pmf.h
> >> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> >> @@ -116,6 +116,18 @@ struct apmf_sbios_req {
> >>  =09u8 skin_temp_hs2;
> >>  } __packed;
> >> =20
> >> +struct apmf_sbios_req_v2 {
> >> +=09u16 size;
> >> +=09u32 pending_req;
> >> +=09u8 rsvd;
> >> +=09u32 update_ppt_pmf;
> >> +=09u32 update_ppt_pmf_apu_only;
> >> +=09u32 update_stt_min;
> >> +=09u8 update_stt_apu;
> >> +=09u8 update_stt_hs2;
> >=20
> > Is it intentional that these do not match with the names in struct=20
> > apmf_sbios_req? I mean some of the fields look suspiciously close in na=
me=20
> > so is the purpose still the same and somebody just invented new names f=
or the=20
> > same field?
>=20
> The idea is to optimize certain fields in the BIOS menu that OEMs have
> to feed in while making the right choices for the power settings for
> different features.
>=20
> The entire series is targeted towards that where the interface between
> the driver and the BIOS is improvised so that:
>=20
> - Multiple features can link to one state, so OEMs doesn=E2=80=99t need t=
o
> program same parameters in multiple locations.
> - If we need to add new power controller limits , we don=E2=80=99t have t=
o
> touch APMF functions, its more expandable adding new fields in APS
> methods.
>=20
> To answers to your question of apmf_sbios_req vs apmf_sbios_req_v2:
>=20
> It calls for a new struct _v2, because:
> - AMT support has been dropped so there shall be no pending events
> from DYTC (like the CQL and AMT)
> - As per the new design, the PMFW has given control to set PPT and STT
> limits and no pending requests on updating SPL limits.
>=20
> But as per names, I don't think there is no new invention :-)

Hi again,

I'm fine with adding _v2 struct (I could see they're not identical).

What I'm still left unsure if we spoke past each other so let me state=20
the question in more concrete terms:

- apmf_sbios_req has a field called stt_min_limit
- apmf_sbios_req_v2 has a field called update_stt_min

My question is, are those just the same but only named differently for=20
some reason, or does the "limit" and/or "update" difference actually imply=
=20
there's change in how that field is used?

Similar question applies to the other fields which look close but not
identical. There's no need for you to itemize and explain each field for=20
me specifically in the reply, I just prefer the same thing called the same
in both structs if that's the case.

It could be you tried to answer this with your second bullet but I just=20
don't understand its meaning deeply enough, thus I'm asking again, please=
=20
bear with me.

> FYI, here PPT means Power Packaging Tracking, so it could be SPPT
> (Slow PPT) or FPPT (Fast PPT) and SST means Skin Temperature Tracking.


--=20
 i.

--8323328-63883218-1709212755=:1005--
