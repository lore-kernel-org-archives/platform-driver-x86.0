Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA5437C0F6;
	Wed,  8 Jul 2026 09:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504799; cv=none; b=UxZqwtx8u1Hdtxz888DfMm5p0uOBt69JXOLDLTVfLTJhtB5KECbtse0EeY6WdLUyCK/cUs5iUyusnEdm2kReWy8mJxzULf+yFz9+9JeCr+BF0+0sukJQz2gXfIhtgd1u0dNrasdzshdCbMePQ6UHwgng4FxECrks2+MTCRo2rzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504799; c=relaxed/simple;
	bh=OzifGntnFTvV95kRKQRS8JoyMSEQwUNX5vz5l6sYaNc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UwhE6DzoMg7PtJwQVvNlKw32aAF6fi8exAXFSvyua7/luS0igClo08B+JjGd9VCM26nsybcEghD30OUV6V30jYX4TbPXAjzLk+982Kgk9zNlHG9xA/c+P3UCS9vPsPU2E9yjFIbxJfvxPpG9yAMy1hmPvTCqzzfahRawsdYwz1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JwHK1Kkm; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JwHK1Kkm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783504798; x=1815040798;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=OzifGntnFTvV95kRKQRS8JoyMSEQwUNX5vz5l6sYaNc=;
  b=JwHK1KkmacloKfVuoYFqkW9ZmZaEulYSLcd8K2T2H3CotNoV9l9v8PRh
   g9Wl1+qT+WqoFZPGfdkDXaauaMS74g3XDNhL+rGIyvxPw/jBDQbHEbIjr
   uj0LgiJDZwuKTGE3pDW2vh/VTKGsQiVN6SlfEs1blClUyTnqCN+yqBgRV
   iKfxQliheMtEmxN+Qu3fiS5KQwRg/as1G8zN0OVkTw8GVHj+Qu7ps2qZH
   hljfZ8kzCA4prR1mJroMMxrumIPTEfmEGTqOzbodx2I6TMDzbzX5bzxOH
   jrIg/ol+CvbY3tgc5YhWfge1E6bicTjJRKww9OTA5SZZ4GCBSxoA2zO2V
   g==;
X-CSE-ConnectionGUID: Am5u7OARQh6Xhomr9DNNqw==
X-CSE-MsgGUID: IjuIxe3sRBaDlisD1PWAbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="83140114"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83140114"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 02:59:54 -0700
X-CSE-ConnectionGUID: soRkUySDRviGABvAEXRGLw==
X-CSE-MsgGUID: 6cm02R6bQDipVAOq3qUayg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="258550507"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.169])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 02:59:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 8 Jul 2026 12:59:47 +0300 (EEST)
To: Marco Scardovi <scardracs@disroot.org>
cc: krishna.chomal108@gmail.com, eliadevito@gmail.com, emreleno@gmail.com, 
    Hans de Goede <hansg@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
    moravec@ukf.sk, platform-driver-x86@vger.kernel.org, 
    "Rafael J. Wysocki" <rafael@kernel.org>, regressions@leemhuis.info, 
    regressions@lists.linux
Subject: Re: [PATCH v2 1/1] platform/x86: hp-wmi: fix platform profile issues
 on generic HP laptops
In-Reply-To: <bYfem026T1WGSu1hPtcAtQ@disroot.org>
Message-ID: <e9b63bff-86e6-174c-3c1d-691419a35754@linux.intel.com>
References: <ajqgkq_elUlMC0Ep@archlinux> <20260623164603.10322-2-scardracs@disroot.org> <358d9315-e974-3180-8919-3451c982fc44@linux.intel.com> <bYfem026T1WGSu1hPtcAtQ@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1870850793-1783504787=:1682"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1870850793-1783504787=:1682
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 7 Jul 2026, Marco Scardovi wrote:

> In data marted=C3=AC 7 luglio 2026 18:40:39 Ora legale dell=E2=80=99Europ=
a centrale, Ilpo J=C3=A4rvinen ha scritto:
> > On Tue, 23 Jun 2026, Marco Scardovi wrote:
> > >  ...
> >=20
> > You'll need to write a better justification into the changelog if you w=
ant=20
> > to have these above included. It also looks largely unrelated to what=
=20
> > you're doing according to changelog so it might actually belong to=20
> > another patch but without proper explanation, I'm pretty much in dark=
=20
> > why you're doing these in the first place.
> >=20
> Hi Ilpo,
>=20
> I totally forgot I had this thread open.
> Please consider this patch as void: I can't assure anymore its validity i=
n
> the long run and it's better if it's taken over by HP guys instead of me
> tbh, also because I don't have a valid device to test it myself in the
> first place.

Okay. It seems Krishna is already looking at the "platform_profile:=20
Failed to get profile for handler hp-wmi" part so we've hope of getting=20
some solution from him eventually.

The other problems look unrelated to pdx86.

--=20
 i.

--8323328-1870850793-1783504787=:1682--
