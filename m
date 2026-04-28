Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606093F2117
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 15:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777391937; cv=none; b=P1iUVEYMt6fGUrfEjHar4Et1FyExYb04KF5+fqvNDAnPI1QhB1Zf8OJZC0niUuHFsL35hald/JfvxkokzbYk9E2JFruJ6NZIVymmIzUo/fkGEbrsEamBw3cb1khdrAiNMxX37UCGsuVXiu0tq8917iHXfjw62vc20UcV0KSBk04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777391937; c=relaxed/simple;
	bh=EqlAx1PSEB2EuDxpfvcBcfkiAeNoeb//tIpO0rGCMTc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=a2SUjAZh0FMO9haER1aXytrtQvKra41wss8eizL977iw55yhjExyu/ox/5JXE26qzWjTEBB4jKgOG4c9u74Pri1RYPRAFrMixuNEeVJj9fAjwhQY4qUtyv3sC8gLjWDNHikUK0Nl4PpyUpvhD6ui42FsYIHpYYDJKKwKA/cIA2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LoEuUD3q; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LoEuUD3q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777391936; x=1808927936;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=EqlAx1PSEB2EuDxpfvcBcfkiAeNoeb//tIpO0rGCMTc=;
  b=LoEuUD3qG2M3uK8oWtqx/Weqy/dDA7lZ0dpmAL/htChimAov0beNX+h4
   entoVZHYMdusxAycIWm0g8dEcKVcfXbcgAL1n37zBt9tsqpu+IdWcWORA
   xwszbCLVnaqWndjT5hCoGEHrELShxPrKHJ1j/JCo99DQ4F2vYYD4nfgm7
   envkoegZMKOvbJsgtXUoor0LV2LzAtsunfNOJ40bcSREosp5zyzjsX4tD
   KbSRNM4giWLyd3Hk6MwfmVKS9SFV7TbN8DGGyuhTmjWywRLReTXO4Q+5Q
   d+KPYnWJuIEITs4s3mfUOdmgWh8s3236a1so1bevQ9FyBqrXqmiSqjT64
   g==;
X-CSE-ConnectionGUID: g00kqQJ6QyO+qoOdW7AJeA==
X-CSE-MsgGUID: 7xzgy9AHTuWNEXexqI1BNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="89003187"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="89003187"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 08:58:56 -0700
X-CSE-ConnectionGUID: M9dnyjbbSaqnopy58GdNKQ==
X-CSE-MsgGUID: hwB8D/X6RMOne7q2+nvclA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="229631498"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.1])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 08:58:54 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 28 Apr 2026 18:58:51 +0300 (EEST)
To: Krishna Chomal <krishna.chomal108@gmail.com>
cc: Ben Young <benj.n.yng@gmail.com>, platform-driver-x86@vger.kernel.org
Subject: Re: hp-wmi: Fix thermal profile board classification for HP Omen
 Max 16 (8D41)
In-Reply-To: <afDTImx7bAcjU8Sp@archlinux>
Message-ID: <990047d8-2aa3-62f1-e2af-fcdc1f88d1e1@linux.intel.com>
References: <4ae4d7f9-f1db-4394-b0d9-c75dc39afcf8@gmail.com> <F31E9DCA-7E18-42D9-AB70-EC6256188187@gmail.com> <44b67685-ab94-ebca-e241-02b0a8d19562@linux.intel.com> <afDTImx7bAcjU8Sp@archlinux>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-618089880-1777391931=:1128"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-618089880-1777391931=:1128
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 28 Apr 2026, Krishna Chomal wrote:

> Hi Ilpo,
>=20
> Sorry for the delay in response, I forgot to update you but I was
> working with Benjamin Young to get more information about this issue. It
> turns out this is related to a failure in fan table parsing. Luckily this
> was detected for a similar HP Omen Max device earlier and I had submitted
> a fix for it [1]. It has been merged into the mainline kernel in 7.1-rc1,
> so the issue should be automatically resolved for Benjamin whenever the
> said kernel is released.

Thanks for the update and nice to hear it has been fixed already.

It actually did cross my mind if that fix might be relevant but for some=20
reason I didn't suggest it but directed reporter to you.

> Meanwhile I have taken this opportunity to determine EC offsets for
> board 8D41 in order to remove the "Unknown EC layout for board 8D41.
> Thermal profile readback will be disabled. Please report this to
> platform-driver-x86@vger.kernel.org" warning in their dmesg. I will send
> a fix patch for this soon.

Great.

Thanks.

> [1]
> https://lore.kernel.org/all/20260410191039.125659-2-krishna.chomal108@gma=
il.com/

--=20
 i.
=20
> On Fri, Apr 24, 2026 at 02:58:43PM +0300, Ilpo J=C3=A4rvinen wrote:
> > Hi Krishna,
> >=20
> > Could please take a look what's going on here. It seems 8D41 was in
> > victus_s_thermal_profile_boards[] even before the dmi_system_id
> > conversion in the commit 8ca7515d3c76 ("platform/x86: hp-wmi: fix
> > platform profile values for Omen 16-wf1xxx").
> >=20
> > On Wed, 22 Apr 2026, Ben Young wrote:
> >=20
> > > Unfortunately - the fans do not change speed upon terminal commands. =
The
> > > HP-WMI is properly loaded and recognizes the board, but appears to no=
t
> > > allow any level of fan change. Do you have any recommendations? This =
is
> > > important to HP laptop owners.
> > >=20
> > > Thank you!
> > >=20
> > > Sent from my iPhone
> > >=20
> > > > On Apr 21, 2026, at 8:18=E2=80=AFPM, Benjamin Young <benj.n.yng@gma=
il.com>
> > > wrote:
> > > >
> > > > =EF=BB=BFSubject: hp-wmi: Fix thermal profile board classification =
for HP Omen
> > > Max 16 (8D41)
> > > >
> > > > Board 8D41 (HP Omen MAX Gaming Laptop 16t-ah000) was incorrectly ad=
ded
> > > > to victus_s_thermal_profile_boards in kernel 7.0, causing hp-wmi pr=
obe
> > > > to fail with -EINVAL.
> > > >
> > > > The fix is to remove 8D41 from victus_s_thermal_profile_boards and =
add
> > > > it to omen_thermal_profile_boards whitelist instead.
> > > >
> > > > Tested on HP Omen MAX Gaming Laptop 16t-ah000, BIOS F.21, kernel
> > > > 7.0.0-1-cachyos-bore. After the fix, hp_wmi registers successfully =
as
> > > > a platform profile handler.
> > > >
> > >=20
> >=20
> > --=20
> > i.
>=20
--8323328-618089880-1777391931=:1128--
