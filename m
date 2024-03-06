Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8672907
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 10:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709721268; cv=none; b=WMQMq7MBYhcWp+19rzl0fPV+AANAKJshX88mRhzoGRKqWiWYgBgL4LHqsoZ+7KrnvMpoS9i1zyEGDNDeCP2iBuyNo169Bmtw4f1HeIG0s9rq4r5fm4hddsBs5gi0t7uvAcL2RzfTldlFXezgWIqhlxJvvRi4iEdvD1poqmnzczs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709721268; c=relaxed/simple;
	bh=4KwLV+548RA6iu6Wf/307mUCIyBNsmfpTJQrJoMQdNQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KtTR+iqF17z12GhCpfCeYbw4+rDNYHjDqaMfVYJSL1xCJju+dypErb0XVzQgO8rIsXd7G2S+ZI+FGjD+jka0Dxwyq4I/xbIDfOe4cS1hpAKNYEoT7mAqsf4CxWb7ok0uRdbT2ppGkFrCLdCVFztBXTEmiSxlIq5AkRcYoSnOrpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iyb81afT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iyb81afT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709721267; x=1741257267;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=4KwLV+548RA6iu6Wf/307mUCIyBNsmfpTJQrJoMQdNQ=;
  b=iyb81afTlsK0kw5LKailpZYBkU/hHMPxVQM5P5JoaKKHwh6rfb5qmF8G
   F4QEFI9AeCBXznsUyuT9/uZ6IU8i9vGHbXB4Yr287sYzfOb8URhDgKaWu
   jF/hHCl+2470m1R19Q+2dUQHnl7h0KJMocPE0GypHjbW1pKKfw8BoOmTI
   Sn+xVUpomSYCJv15KjDwt7td38csBk3TyJetT2/oqdUuX9gf5wvWcBMEY
   MBhIziMsQL53BJ0mIB6n9HrhblnnCappmyRnT3wv57IyCRhY4XHLhxRnW
   uiabW/eVuvfguF5MjFms+6zrrNJQ2Gb8S85nq3NIjusWhQi+0LI38GWv2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4496541"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="4496541"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 02:34:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="14274235"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.146])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 02:34:23 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 6 Mar 2024 12:34:18 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com
Subject: Re: [PATCH 3/7] platform/x86/amd/pmf: Add support to get sbios
 requests in PMF driver
In-Reply-To: <b8f846b8-c3b4-4d7f-b75b-a4444009a877@amd.com>
Message-ID: <6f246c52-3873-e1d2-900b-75343ae21e2b@linux.intel.com>
References: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com> <20240227125520.3153140-4-Shyam-sundar.S-k@amd.com> <1358d40e-5114-2d1d-c679-342cf3ca0989@linux.intel.com> <74f0d344-8d4f-4a33-8862-ade4ace571d1@amd.com> <47eadab7-0273-e037-dad9-5e23cfc6e1f2@linux.intel.com>
 <b8f846b8-c3b4-4d7f-b75b-a4444009a877@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1534731867-1709721258=:1022"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1534731867-1709721258=:1022
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 6 Mar 2024, Shyam Sundar S K wrote:
> On 2/29/2024 18:49, Ilpo J=C3=A4rvinen wrote:
> > On Wed, 28 Feb 2024, Shyam Sundar S K wrote:
> >> On 2/27/2024 18:58, Ilpo J=C3=A4rvinen wrote:
> >>> On Tue, 27 Feb 2024, Shyam Sundar S K wrote:
> >>>
> >>>> Update the APMF function index 2 for family 1Ah, that gets the
> >>>> information of  SBIOS requests (like the pending requests from BIOS,
> >>>
> >>> extra space.
> >>>
> >>>> custom notifications, updation of power limits etc).
> >>>>
> >>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> >>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> >>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >>>> ---
> >>>>  drivers/platform/x86/amd/pmf/acpi.c |  6 ++++++
> >>>>  drivers/platform/x86/amd/pmf/pmf.h  | 13 +++++++++++++
> >>>>  2 files changed, 19 insertions(+)
> >>>>
> >>>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/=
x86/amd/pmf/acpi.c
> >>>> index 1f287a147c57..1b2a099c0cef 100644
> >>>> --- a/drivers/platform/x86/amd/pmf/acpi.c
> >>>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> >>>> @@ -166,6 +166,12 @@ int apmf_get_auto_mode_def(struct amd_pmf_dev *=
pdev, struct apmf_auto_mode *data
> >>>>  =09return apmf_if_call_store_buffer(pdev, APMF_FUNC_AUTO_MODE, data=
, sizeof(*data));
> >>>>  }
> >>>> =20
> >>>> +int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apm=
f_sbios_req_v2 *req)
> >>>> +{
> >>>> +=09return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
> >>>> +=09=09=09=09=09=09=09=09=09req, sizeof(*req));
> >>>
> >>> Fix the alignment please.
> >>>
> >>>> +}
> >>>> +
> >>>>  int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_s=
bios_req *req)
> >>>>  {
> >>>>  =09return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
> >>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x=
86/amd/pmf/pmf.h
> >>>> index 4364af72a7a3..f11d2a348696 100644
> >>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
> >>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> >>>> @@ -116,6 +116,18 @@ struct apmf_sbios_req {
> >>>>  =09u8 skin_temp_hs2;
> >>>>  } __packed;
> >>>> =20
> >>>> +struct apmf_sbios_req_v2 {
> >>>> +=09u16 size;
> >>>> +=09u32 pending_req;
> >>>> +=09u8 rsvd;
> >>>> +=09u32 update_ppt_pmf;
> >>>> +=09u32 update_ppt_pmf_apu_only;
> >>>> +=09u32 update_stt_min;
> >>>> +=09u8 update_stt_apu;
> >>>> +=09u8 update_stt_hs2;
> >>>
> >>> Is it intentional that these do not match with the names in struct=20
> >>> apmf_sbios_req? I mean some of the fields look suspiciously close in =
name=20
> >>> so is the purpose still the same and somebody just invented new names=
 for the=20
> >>> same field?
> >>
> >> The idea is to optimize certain fields in the BIOS menu that OEMs have
> >> to feed in while making the right choices for the power settings for
> >> different features.
> >>
> >> The entire series is targeted towards that where the interface between
> >> the driver and the BIOS is improvised so that:
> >>
> >> - Multiple features can link to one state, so OEMs doesn=E2=80=99t nee=
d to
> >> program same parameters in multiple locations.
> >> - If we need to add new power controller limits , we don=E2=80=99t hav=
e to
> >> touch APMF functions, its more expandable adding new fields in APS
> >> methods.
> >>
> >> To answers to your question of apmf_sbios_req vs apmf_sbios_req_v2:
> >>
> >> It calls for a new struct _v2, because:
> >> - AMT support has been dropped so there shall be no pending events
> >> from DYTC (like the CQL and AMT)
> >> - As per the new design, the PMFW has given control to set PPT and STT
> >> limits and no pending requests on updating SPL limits.
> >>
> >> But as per names, I don't think there is no new invention :-)
> >=20
> > Hi again,
> >=20
> > I'm fine with adding _v2 struct (I could see they're not identical).
> >=20
> > What I'm still left unsure if we spoke past each other so let me state=
=20
> > the question in more concrete terms:
> >=20
> > - apmf_sbios_req has a field called stt_min_limit
> > - apmf_sbios_req_v2 has a field called update_stt_min
> >=20
> > My question is, are those just the same but only named differently for=
=20
> > some reason, or does the "limit" and/or "update" difference actually im=
ply=20
> > there's change in how that field is used?
>=20
> Hi Ilpo,
>=20
> Apologies for the long delay.
>=20
> Your question is valid and hence I had to go back to my FW
> counterparts to get my basics right before responding back.
>=20
> So the crux is, for each of the power controller within the CPU
> infrastructure, like the Slow PPT, Fast PPT, STAPM, TDC SOC, EDC VDD
> etc., all of them are guarded by two parameters:
>=20
> - one, "limit", a max threshold a software can set
> - two, "value", that can be updated to based on the changing system
> dynamics.
>=20
> So, atleast in the PMF driver context the field names can remain
> constant. The field names in apmf_sbios_req looks apt here, so in the
> next revision I will make fields in apmf_sbios_req and
> apmf_sbios_req_v2 look the same (w.r.t the naming).
>=20
> Before respin, can you have a look at the other patches and see if you
> have remarks?

Hi,

I already looked at them briefly and didn't come across other things to=20
say except that the use arrays made things cleaner. :-) So please just=20
respin.

--=20
 i.

--8323328-1534731867-1709721258=:1022--
