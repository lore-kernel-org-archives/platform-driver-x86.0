Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134FF501F27;
	Fri, 18 Sep 2026 15:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745143; cv=none; b=g5lF9de9+ufR3y9hX12C2lryekZfgJy/cIkhP1vS7ykGsDFTAIGrp55PkICIdRI+0DCjn+Oi0A5pnKlkjAU6uBKippzsyE09jU8ZsqOGRzzuAPCUolRrugsWu6HfvyBt0pCw4RYcNihuXaRRqo43MrhDylNEwVcyXhbwXKNlw2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745143; c=relaxed/simple;
	bh=ZIUKz5YLX0dZKovTWpgV/pR/9RReZkXNWjNltpenNJ8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=b9SBC9geUNsW2m+whaR0Vh7MSZi3Wr1ckotFLiPjlsfe1VblrdJz91Sh1hbwtm9P18qCqa63sveY0bpv+Ne9vkfRo/mINsUS1k3n3zBrMWJv7pKcfxR6HkcGvv/mDYbkN/3nM9XV3HolNnhr0yRt2q4zET4kToWPI/f/jyRQ4Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQdcj/Ya; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQdcj/Ya"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789745142; x=1821281142;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ZIUKz5YLX0dZKovTWpgV/pR/9RReZkXNWjNltpenNJ8=;
  b=MQdcj/YacyKxIqIavVl3bp5bQpGIyzRUJrdNg5aI+a1bJdIkGI9o8D6V
   eFil4fQluZWpVwqGbxwz+/f/gLj8QlhcHCPoLOLwoLNlllCSOJ6HDTyKZ
   lBTWFy/bYr0UFTDOfUwUaS3pMz2dNMjFF+PobZFMkOeHcNHpvV1Gnjznm
   Bz2YfvJnVSguSyW1uyaMx54SMv3OCPV0oGzalFUPb+tdmEnYcDhDe5+KH
   g5SCX4ZvXt8UZe8fUgUNlyix01nP0TGJGeDfpGXl9qtyplg66mD4ApcO/
   i8lzhhnCcPoVd6WhkldciJ6tz9OhEiRpPiKJc7Pz80i4+1VLgMlOq5hLw
   g==;
X-CSE-ConnectionGUID: apY68eVZTpWVnxBnX5VhqA==
X-CSE-MsgGUID: koJFgZg9QrGvSj0sEQhFWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="766263"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="766263"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 08:25:41 -0700
X-CSE-ConnectionGUID: KbTEuaoxQHep9jxhnsyIeA==
X-CSE-MsgGUID: wlNDtn/1Rw63H7donxBnzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2681767"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 08:25:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 18 Sep 2026 18:25:35 +0300 (EEST)
To: Aaron Erhardt <aer@tuxedocomputers.com>
cc: wse@tuxedocomputers.com, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 5/6] platform/x86/tuxedo: Update and extend
 documentation
In-Reply-To: <7d7b5d84-e358-4745-8db1-69beb281c4d9@tuxedocomputers.com>
Message-ID: <c5855c8d-6540-fe07-04e0-9e4173a6c27e@linux.intel.com>
References: <20260826081149.235487-1-aer@tuxedocomputers.com> <20260826081149.235487-6-aer@tuxedocomputers.com> <7533530b-1d13-e977-df13-f7ebf4e92a29@linux.intel.com> <7d7b5d84-e358-4745-8db1-69beb281c4d9@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1709566627-1789745135=:17235"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1709566627-1789745135=:17235
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 15 Sep 2026, Aaron Erhardt wrote:

> Am 15.09.26 um 15:08 schrieb Ilpo J=C3=A4rvinen:
> > On Wed, 26 Aug 2026, Aaron Erhardt wrote:
> >=20
> >> Remove an incorrect comment about the Microsoft MacroPad reference
> >> implementation allegedly deviating from the spec and add more
> >> information about the module and some other minor improvements.
> >=20
> > Was it "incorrect" or was the spec clarified in a later version? If the=
=20
> > latter, that would be worth to mention instead of claiming the original=
=20
> > comment was "incorrect".
> >=20
> > This is a honest question, I don't know the answer but I'm kind trying =
to=20
> > read in between lines here how we ended up in this situation so my=20
> > impression could be entirely wrong. ...Thus, please don't assume I know=
=20
> > much about the content of these specs (despite me briefly looking into=
=20
> > what I could find around this feature was introduced).
> >=20
>=20
> The MacroPad reference implementation never deviated from the spec in thi=
s
> area, at least not in the way the comment suggests. The comment removed h=
ere
> references another comment, which is removed alongside the code that was
> touched in patch 3/6 and assumed that intensities should allow multiple v=
alues
> to be assigned (e.g. 256 levels), but that was never required in the spec=
=2E Even
> version 1.4 (the initial driver had 1.5 as a basis) of the spec already
> suggests using only two intensities for on and off while everything else =
is
> done through the RGB channels unless the device has some sort of global
> brightness control in its hardware.
>
> I think the reason for this misconception might come from an actual bug i=
n the
> reference implementation (which is fixed now:
> https://github.com/microsoft/RP2040MacropadHidSample/commit/cfc29120a3910=
c5772976da29ecd57392dfd44d6)
> and the natural assumption, that intensity should, similar to the RGB cha=
nnels,
> have 8 bit. Therefore, the driver initially implemented brightness exactl=
y that
> way with 256 levels, scaling the RGB intensities with integer arithmetic.=
 But=20
> since the hardware doesn't scale the brightness and the spec doesn't requ=
ire
> this, there is no good reason to do this.

Okay, thanks for the explanation. No further action required then for=20
this patch.

--=20
 i.

--8323328-1709566627-1789745135=:17235--
