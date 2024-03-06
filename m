Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E08605B6
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 10:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709722200; cv=none; b=nmxH+ECfIlyL97e0wwopeVW1YEtTBWsiTMuBSAUOAhtTuIoyuCFRadvfoa6SAjS+aDmhPQyWrbMaD4bQlnd8WCXa/NgqlhIDe3gRgnxVbXvsqUVOHtgriNwmVlbq0dlWcfBKpXapZTXt4BCKMFShm2PVoVpeRw8JkRqsaVTGobc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709722200; c=relaxed/simple;
	bh=qCw81EApwd+Y+NjGc/9Vh1uL+YjLi8j0W0Tm3K+jNJY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JPqgIWKLgZTfY02CmLE2id/Z37nTDwdqeWdn9EHvssowkk48Hy9+wfjsIRBvsvBZv6ehJT5YfaEy2HBdCxYZXR9qnBhN3MCjlBefKRH6DnPhiqVSp1FD62lY0XHi1Pw6Xut+tWoP36F+5UokS588fhZI3xiHO7yuUqAoFb1RF8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SqYmlz8B; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SqYmlz8B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709722198; x=1741258198;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=qCw81EApwd+Y+NjGc/9Vh1uL+YjLi8j0W0Tm3K+jNJY=;
  b=SqYmlz8BEeGic58iyRhKK3eYSjCSBZ3sXjrgVsKgl5vxW9gOOjwi+i8R
   WGS3DXhbnN6pRDkwXhenUTmdzngoJRz0FlbmHGHRgNHjoeYTOmhKuOlCI
   XBWlGAdSZIsdj7xVboJzxaeWJ+w1gBFN8JWGnqEp0rtHHdah4uca1DTcH
   AUOGUn5WeYj64JRg5v13lfDRVi8fawz+3uqvDbViPlUs79/nMXMlUbVgb
   R0p6GRAXJyQqGEERxLTYm9kfXqcl31kFRRl78hysUpXjAYjJJeAVZ/XPx
   wkNicN51Ko7x0sQkpg4tpqkBV+6iptaC6702xEw78ld+rkHj7PfAPWcXB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="8143209"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="8143209"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 02:49:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="14394575"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.146])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 02:49:56 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 6 Mar 2024 12:49:51 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com
Subject: Re: [PATCH 3/7] platform/x86/amd/pmf: Add support to get sbios
 requests in PMF driver
In-Reply-To: <11321de3-204f-40af-8cc5-f8c2f6dceddf@amd.com>
Message-ID: <191ffc46-d330-cfd4-7094-f34ea2a7fe33@linux.intel.com>
References: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com> <20240227125520.3153140-4-Shyam-sundar.S-k@amd.com> <1358d40e-5114-2d1d-c679-342cf3ca0989@linux.intel.com> <74f0d344-8d4f-4a33-8862-ade4ace571d1@amd.com> <47eadab7-0273-e037-dad9-5e23cfc6e1f2@linux.intel.com>
 <b8f846b8-c3b4-4d7f-b75b-a4444009a877@amd.com> <6f246c52-3873-e1d2-900b-75343ae21e2b@linux.intel.com> <11321de3-204f-40af-8cc5-f8c2f6dceddf@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-177249139-1709722191=:1022"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-177249139-1709722191=:1022
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 6 Mar 2024, Shyam Sundar S K wrote:
> On 3/6/2024 16:04, Ilpo J=C3=A4rvinen wrote:
> > On Wed, 6 Mar 2024, Shyam Sundar S K wrote:
> >> On 2/29/2024 18:49, Ilpo J=C3=A4rvinen wrote:
> >>> On Wed, 28 Feb 2024, Shyam Sundar S K wrote:
> >>>> On 2/27/2024 18:58, Ilpo J=C3=A4rvinen wrote:
> >>>>> On Tue, 27 Feb 2024, Shyam Sundar S K wrote:
> >>>>>
> >>>>>> Update the APMF function index 2 for family 1Ah, that gets the
> >>>>>> information of  SBIOS requests (like the pending requests from BIO=
S,
> >>>>>
> >>>>> extra space.
> >>>>>
> >>>>>> custom notifications, updation of power limits etc).
> >>>>>>
> >>>>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> >>>>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> >>>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >>>>>> ---
> >>>>>>  drivers/platform/x86/amd/pmf/acpi.c |  6 ++++++
> >>>>>>  drivers/platform/x86/amd/pmf/pmf.h  | 13 +++++++++++++
> >>>>>>  2 files changed, 19 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platfor=
m/x86/amd/pmf/acpi.c
> >>>>>> index 1f287a147c57..1b2a099c0cef 100644
> >>>>>> --- a/drivers/platform/x86/amd/pmf/acpi.c
> >>>>>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> >>>>>> @@ -166,6 +166,12 @@ int apmf_get_auto_mode_def(struct amd_pmf_dev=
 *pdev, struct apmf_auto_mode *data
> >>>>>>  =09return apmf_if_call_store_buffer(pdev, APMF_FUNC_AUTO_MODE, da=
ta, sizeof(*data));
> >>>>>>  }
> >>>>>> =20
> >>>>>> +int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct a=
pmf_sbios_req_v2 *req)
> >>>>>> +{
> >>>>>> +=09return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUEST=
S,
> >>>>>> +=09=09=09=09=09=09=09=09=09req, sizeof(*req));
> >>>>>
> >>>>> Fix the alignment please.
> >>>>>
> >>>>>> +}
> >>>>>> +
> >>>>>>  int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf=
_sbios_req *req)
> >>>>>>  {
> >>>>>>  =09return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUEST=
S,
> >>>>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform=
/x86/amd/pmf/pmf.h
> >>>>>> index 4364af72a7a3..f11d2a348696 100644
> >>>>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
> >>>>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> >>>>>> @@ -116,6 +116,18 @@ struct apmf_sbios_req {
> >>>>>>  =09u8 skin_temp_hs2;
> >>>>>>  } __packed;
> >>>>>> =20
> >>>>>> +struct apmf_sbios_req_v2 {
> >>>>>> +=09u16 size;
> >>>>>> +=09u32 pending_req;
> >>>>>> +=09u8 rsvd;
> >>>>>> +=09u32 update_ppt_pmf;
> >>>>>> +=09u32 update_ppt_pmf_apu_only;
> >>>>>> +=09u32 update_stt_min;
> >>>>>> +=09u8 update_stt_apu;
> >>>>>> +=09u8 update_stt_hs2;
> >>>>>
> >>>>> Is it intentional that these do not match with the names in struct=
=20
> >>>>> apmf_sbios_req? I mean some of the fields look suspiciously close i=
n name=20
> >>>>> so is the purpose still the same and somebody just invented new nam=
es for the=20
> >>>>> same field?
> >>>>
> >>>> The idea is to optimize certain fields in the BIOS menu that OEMs ha=
ve
> >>>> to feed in while making the right choices for the power settings for
> >>>> different features.
> >>>>
> >>>> The entire series is targeted towards that where the interface betwe=
en
> >>>> the driver and the BIOS is improvised so that:
> >>>>
> >>>> - Multiple features can link to one state, so OEMs doesn=E2=80=99t n=
eed to
> >>>> program same parameters in multiple locations.
> >>>> - If we need to add new power controller limits , we don=E2=80=99t h=
ave to
> >>>> touch APMF functions, its more expandable adding new fields in APS
> >>>> methods.
> >>>>
> >>>> To answers to your question of apmf_sbios_req vs apmf_sbios_req_v2:
> >>>>
> >>>> It calls for a new struct _v2, because:
> >>>> - AMT support has been dropped so there shall be no pending events
> >>>> from DYTC (like the CQL and AMT)
> >>>> - As per the new design, the PMFW has given control to set PPT and S=
TT
> >>>> limits and no pending requests on updating SPL limits.
> >>>>
> >>>> But as per names, I don't think there is no new invention :-)
> >>>
> >>> Hi again,
> >>>
> >>> I'm fine with adding _v2 struct (I could see they're not identical).
> >>>
> >>> What I'm still left unsure if we spoke past each other so let me stat=
e=20
> >>> the question in more concrete terms:
> >>>
> >>> - apmf_sbios_req has a field called stt_min_limit
> >>> - apmf_sbios_req_v2 has a field called update_stt_min
> >>>
> >>> My question is, are those just the same but only named differently fo=
r=20
> >>> some reason, or does the "limit" and/or "update" difference actually =
imply=20
> >>> there's change in how that field is used?
> >>
> >> Hi Ilpo,
> >>
> >> Apologies for the long delay.
> >>
> >> Your question is valid and hence I had to go back to my FW
> >> counterparts to get my basics right before responding back.
> >>
> >> So the crux is, for each of the power controller within the CPU
> >> infrastructure, like the Slow PPT, Fast PPT, STAPM, TDC SOC, EDC VDD
> >> etc., all of them are guarded by two parameters:
> >>
> >> - one, "limit", a max threshold a software can set
> >> - two, "value", that can be updated to based on the changing system
> >> dynamics.
> >>
> >> So, atleast in the PMF driver context the field names can remain
> >> constant. The field names in apmf_sbios_req looks apt here, so in the
> >> next revision I will make fields in apmf_sbios_req and
> >> apmf_sbios_req_v2 look the same (w.r.t the naming).
> >>
> >> Before respin, can you have a look at the other patches and see if you
> >> have remarks?
> >=20
> > Hi,
> >=20
> > I already looked at them briefly and didn't come across other things to=
=20
> > say except that the use arrays made things cleaner. :-) So please just=
=20
> > respin.
>=20
> Sure. You want this to be rebased to review-hans or review-ilpo tree?

I'm handling for-next for this cycle so review-ilpo.

--=20
 i.

--8323328-177249139-1709722191=:1022--
