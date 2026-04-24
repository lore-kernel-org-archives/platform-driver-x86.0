Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB643BE644
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2026 11:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777031931; cv=none; b=VXSixqFpdmOHqeZDcVo58XSaY+hTnhD74FUFLFGrrR+VzShzlLZkFFpAnckaw1Y/9gxpFBGUTaMON1ichX24LsS7Zt+jKanfE1ePakxNHovv+Ynib+yXDnWymJ7hkZnobUAm2Nk81aToeX++OYCuGHkpv+pJO3KXX0nzLos1FuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777031931; c=relaxed/simple;
	bh=wR+yHreIt4DqsdaIMpBsVA+Z8ggAczYPy70bmhMDMcM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=V95HfQsmvbZ3ZBmwYQkjppdIm1UK7AdchxaCnM/AgvizR4kCNFlU+pR0M3CcdWPMgu3++Y0cIkyU+J88Vdn8IPmAXX7HjWdY6vHwMotb11t1aFs/w7yN/BMB04SxPVBv38SywhUy7JX5BNxNNnHWOClRMYYncW1wRHk508Umgoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MRvw+UtY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MRvw+UtY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777031930; x=1808567930;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=wR+yHreIt4DqsdaIMpBsVA+Z8ggAczYPy70bmhMDMcM=;
  b=MRvw+UtYXK0WKFBuLMjNjySGBNy/R5pgsM8bQKQ/ZAsGG2TkS7q9Dx0+
   02E5rUMZjOR08xxLoKiBoMj+lrUPAvaYPtgv7jmkHul/rBXKJ+3i8PUp+
   bZAhRVJW3/oozK7v620Wxak5Qon4Gqz7gAW8LDScyr32wokEA/0CPYZ2K
   O97CY7ZTb048zDQnAGB/MKJOySa+c6fH3Xv3euUXmuznK4KHnnqAtqlqd
   JeBulrlmatKlknxF9/E4EY1u7dLt6moMRanejItO9hvxRldbWaymUsuo5
   /eklQPhXEO5tRBBLIOsdlQBy0HRA1bh873Sd3Mc8Ej6EoJOH082V1AWdE
   Q==;
X-CSE-ConnectionGUID: 18B/0IIiTWKIxa5kkX33Cw==
X-CSE-MsgGUID: MHXYd/xRRV+OM/UhfE+rNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="77887592"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="77887592"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 04:58:49 -0700
X-CSE-ConnectionGUID: wQPKu61CQzGctxWXeI66Qg==
X-CSE-MsgGUID: ZAp3W5CRRjSBnwdfZgFTMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="232075630"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.120])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 04:58:47 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 24 Apr 2026 14:58:43 +0300 (EEST)
To: Ben Young <benj.n.yng@gmail.com>, 
    Krishna Chomal <krishna.chomal108@gmail.com>
cc: platform-driver-x86@vger.kernel.org
Subject: Re: hp-wmi: Fix thermal profile board classification for HP Omen
 Max 16 (8D41)
In-Reply-To: <F31E9DCA-7E18-42D9-AB70-EC6256188187@gmail.com>
Message-ID: <44b67685-ab94-ebca-e241-02b0a8d19562@linux.intel.com>
References: <4ae4d7f9-f1db-4394-b0d9-c75dc39afcf8@gmail.com> <F31E9DCA-7E18-42D9-AB70-EC6256188187@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-893301109-1777031923=:958"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-893301109-1777031923=:958
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

Hi Krishna,

Could please take a look what's going on here. It seems 8D41 was in=20
victus_s_thermal_profile_boards[] even before the dmi_system_id=20
conversion in the commit 8ca7515d3c76 ("platform/x86: hp-wmi: fix=20
platform profile values for Omen 16-wf1xxx").

On Wed, 22 Apr 2026, Ben Young wrote:

> Unfortunately - the fans do not change speed upon terminal commands. The=
=20
> HP-WMI is properly loaded and recognizes the board, but appears to not=20
> allow any level of fan change. Do you have any recommendations? This is=
=20
> important to HP laptop owners. =20
>=20
> Thank you!
>=20
> Sent from my iPhone
>=20
> > On Apr 21, 2026, at 8:18=E2=80=AFPM, Benjamin Young <benj.n.yng@gmail.c=
om> wrote:
> >=20
> > =EF=BB=BFSubject: hp-wmi: Fix thermal profile board classification for =
HP Omen Max 16 (8D41)
> >=20
> > Board 8D41 (HP Omen MAX Gaming Laptop 16t-ah000) was incorrectly added
> > to victus_s_thermal_profile_boards in kernel 7.0, causing hp-wmi probe
> > to fail with -EINVAL.
> >=20
> > The fix is to remove 8D41 from victus_s_thermal_profile_boards and add
> > it to omen_thermal_profile_boards whitelist instead.
> >=20
> > Tested on HP Omen MAX Gaming Laptop 16t-ah000, BIOS F.21, kernel
> > 7.0.0-1-cachyos-bore. After the fix, hp_wmi registers successfully as
> > a platform profile handler.
> >=20
>=20

--=20
 i.

--8323328-893301109-1777031923=:958--
