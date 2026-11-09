Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794224011;
	b=ECVoRHyq38ZPJE/l710sROw+UyfGF29gOPPzJEdUHsvmbPWmM3iJwJ6gwTqTP/QPxm7j
	 deyKp0slHpYLmvmMHR1cJveOGRGhI8ov73MZ/FZsXnNhV51nmFbV4ouHMf6msQmE34K/z
	 h2mPReXdoc0ZhmweHkTzL83yUqEriQVImRqmTDSsgzBwNfueJHTGN8jELlSzWUHJP1itx
	 Ki+NujRMJB5m405+rV3dA+/xJPZxQJ9cNjgzafIKhpfx9rheDhviswTE42HBU7j+z70Bz
	 tut5Zui3RAbP645wb7vfgTrQAhZKmrC7Fv1zq339Ium+KFsqR72iDJPpuomYYJYAjhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794224011;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=qgQbTnJe8e4biq79aB7hFRTqvYEBKEIIh6vHlroDKd8=;
	b=I49NrXecyJEQF6JMbMT63we8fvk22iD7HKGTGLJj5WhLboaRklrkPwXu7hecoyRdQ4nj
	 9V9VWjuXXG/qsyIQ7f/8Whblq1YRtyp/g0rtChZ1vOcplRnBpOKUP+6+vR1Tn6lvq+NRH
	 g/W0q50y/wEEMiBrOXnGC0bFAZ4Js4yaMKyQ+hyQSAClXgenBBTHNvz1V2xd65V5CqT1Z
	 7CuxM2O/I+hH7APJVyNv2azMGGGnk0KyIYP+70vlrXN8aUVqD85OtTdxw8wbHGwddvvqE
	 qjoM0RGcPAG0YQtashZqOGa/RDR9TB/wh7fmfQ7rWO6UoIDQtPZnCUR42BYucPSxlVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V83IIoj4;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876B0606A321
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 11:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 876B0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V83IIoj4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794224010; x=1825760010;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3/S0m0dl+fFifKMOja/0cwBGjvaJn2byKKo/bSTyjws=;
  b=V83IIoj45kDgn+7O/fWND0xrB3MrhqJJwSHqBABl/xBw1vcEALIU8+/C
   StSqqsgbKR1zw3rfjM7SknBGc2dRXz9KAgrUOgttvYVBG50CQ9rv9V7KP
   NJe9OjPf76fJjkLGQl54td7rZ6BUdKDj8sEYJJp40n+5LpaueVigyfniz
   EMye/Nlol0z30aYigLQwc/zd0ali90dY5zosnm3qZy+CwS3I4/1lSQFlx
   TLm+j2dsJ40T+keGUu+kCnL3uVoSbwc1Opd8zpq0JC/7wghlD0a/BS5ue
   g3ER2D2NDB6vxdVagDltzb5ArJcEoiN6APMs39ungBdxRRc+xAUNlTb3+
   Q==;
X-CSE-ConnectionGUID: 9P4/RiVDSWiARjd9nwObdA==
X-CSE-MsgGUID: Wet1mE84RxabloN9E6+peg==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2811525"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2811525"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 03:33:30 -0800
X-CSE-ConnectionGUID: U7LvcEcXSNm5p80PAsjr7w==
X-CSE-MsgGUID: nFCq+iOPTWGJ8iZFVD+How==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7699230"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.139])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 03:33:28 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 9 Nov 2026 13:33:23 +0200 (EET)
To: Krishna Chomal <krishna.chomal108@gmail.com>
cc: platform-driver-x86@vger.kernel.org, 
    Suryansh Singh <technosfan14@gmail.com>, Hans de Goede <hansg@kernel.org>, 
    Julien ROBIN <julien.robin28@free.fr>
Subject: Re: hp_wmi: Unknown EC layout for board 8C9C
In-Reply-To: <at9_5FMerTdcbJt7@archlinux>
Message-ID: <acca0b36-47a7-06a0-4d98-9d1002688f91@linux.intel.com>
References: <965dd816-dd66-4318-be8d-330a40209f67@free.fr> <asPy5Q5wNYaMzTqJ@archlinux> <at9_5FMerTdcbJt7@archlinux>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-933796985-1794224003=:1181"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-933796985-1794224003=:1181
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 26 Oct 2026, Krishna Chomal wrote:

> On Tue, Oct 06, 2026 at 01:30:43AM +0530, Krishna Chomal wrote:
> [...]
> > > But despite this personal opinion, for the 8C9C, playing an
> > > HPWMI_FAN_COUNT_GET_QUERY, and guessing the current mode is performan=
ce
> > > mode (0x01) when 0xAE register says 0x00, and differentiating balance=
d and
> > > low-power modes when 0xAE register value is 0x01, may probably be don=
e by
> > > looking at victus_s_gpu_thermal_profile_get(), as prepared into
> > > platform_profile_victus_s_get_ec(): I see that Krishna Chomal had thi=
s
> > > idea. As I'm a beginner into kernel development I prefer let you deci=
de
> > > whether it's reliable enough, and/or worth the effort.
> >=20
> > So, I was working on a series to fix this very issue, but now that you
> > have brought it up, I think its a good time to ask you and Ilpo J=C3=A4=
rvinen
> > if removing **ALL** EC offsets from this driver and relying on only WMI
> > queries would be a good idea.
>=20
> Hi Ilpo,
>=20
> Gentle ping on this. Can you read this thread and share your opinions on
> my proposal to make this driver EC independent?
>=20
> If we agree on removing platform_profile_victus_s_get_ec(), it would
> affect at least these patches:
> 1.
> https://lore.kernel.org/all/20261024-hp-wmi-rechargement-v1-1-45d9f8447f4=
1@arnaud-ungaro.fr
> 2. https://lore.kernel.org/all/20261025034539.4565-1-nonameblank007@gmail=
=2Ecom

What's the plan for the case where the WMI interface has issues/behaves=20
inconsistently? Are we then going to have to return back to the current=20
approach?

--=20
 i.

> > Currently, the following four EC registers have been identified in this
> > driver:
> > 1. HP_VICTUS_S_EC_THERMAL_PROFILE_OFFSET (0x59) [READ-ONLY]:
> >   Used in platform_profile_victus_s_get_ec() from params->ec_tp_offset
> >   Used to reverse map the thermal profile parameter and derive the real
> >   hardware state.
> >=20
> >   platform_profile_victus_s_get_ec() itself is used in two places:
> >   a. thermal_profile_setup() during driver init to re-apply hardware
> >      state.
> >      We can remove the call here and default to Balanced
> >      mode like Julien had done in an earlier commit. [2]
> >      I think this is fair because the official Omen Gaming Hub software
> >      on Windows does the same when re-installed.
> >   b. victus_s_powersource_event() - to derive actual_profile. This
> >      Julien needs to confirm - if we can avoid doing an EC read by
> >      directly taking active_platform_profile, since in my opinion,
> >      it should be same.
> >=20
> > 2. HP_OMEN_EC_THERMAL_PROFILE_OFFSET (0x95) [READ_ONLY]:
> >   Used in three places:
> >   a. platform_profile_victus_s_get_ec(): Already mentioned above.
> >   b. platform_profile_omen_get_ec()
> >   c. platform_profile_victus_get_ec()
> >=20
> >   (b) and (c) are both used in omen_powersource_event() for the same
> >       reason as victus_s line as mentioned above. I think here also
> >       we can fallback on the cached active_platform_profile (please
> >       let me know if otherwise).
> >=20
> > 3. HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET (0x62) [WRITE-ONLY]
> > 4. HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET (0x63) [WRITE-ONLY]
> >=20
> > (3) and (4) are both used during set_ec path of the legacy Omen line.
> > However, since I do not own this type of device, I can't comment if it
> > is entirely needed or not. Interesting though, this is used in only
> > three devices: omen_timed_thermal_profile_boards[]. But anyway, I will
> > try to contact someone who sent these patches and see if I can get thei=
r
> > acpidump for more info. I have a feeling that at least *_TIMER_OFFSET
> > can be removed since the delayed_workqueue would cover its use-case,
> > and obviously because (afaik) the official Omen Gaming Hub does not
> > document/use any EC registers and relies on WMI queries only.
> [...]
>=20
--8323328-933796985-1794224003=:1181--
