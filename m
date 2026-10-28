Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793215563;
	b=c44lFWMDw5v6bN/+uvfNZ9AKMKEIwKmF/L7cQG4/iBP9jFQRaUY6N3NqlnuweaSkro12
	 oVLbNaz4K1mtU4O7ob6yu+EGZgPo2lznUDZEMrR+BKfwYM0+YHYERsQh6aq7d7QtIv5ZB
	 8uzEcFbTFLLYx5ZSZ96/b7VmKyrSjMPpzl+6SVJCWSgBu6wpm6MP4YpFwPfmIwMLbOZxD
	 eYHyxlu5ny/DX+4duHwFRrXXbt0LMJG7ETobdEj1POvNXirAaZYpJBb/ORtC0X8EOMkbS
	 78z90cLDBzkzARA8cjixwCrWgUQpNCkGl/Ra5BbWYJt54424emI4AahVxMvD1myVr7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793215563;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type:
	 Content-ID;
	bh=x40zcwNsOo99UMks8dPee79Xtw7w7m5iS/T+vZL8Cjo=;
	b=cADCpS1+rr2/bRKXZpZUElJwJ5qs4muQj5zvuu6eAHfdwN4hi+Ge84+3h25iCI1COtNV
	 84d4P+H3EvnAFdLHnE70qWihxy0ujTN2pzefvpxABtrenFepOWyx4agIDuyvuSPUPTBF8
	 vm/M+o55/DudSWGK7HBrPvUizj91wfvO+roaCtWuKR1LqFxuE/JFykuqQ7w+8M7wo3Xig
	 SXbtGdN4ivJ3xNGUA07PGHouvpSDvZh3T4Sr4Acn6M7ykslD3X9m5+AyGYLX/eXBWSiFE
	 1sfNToiT+pR2a1+srwMo29/HlbSiKXJKb5tbxrmZVRX2HNeM4Kal9kamU3rbxhZjSMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I7vADVV1;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F06606A31F;
	Wed, 28 Oct 2026 19:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6F06606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I7vADVV1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793215563; x=1824751563;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=0vmobdU3Bgl+1bOq1yR5rUg/eZZZm3tYqjKeGLnaHQQ=;
  b=I7vADVV1tI2NFfX09SCntxieKuS/0j+6PN70WSDiWtEsvnbA05P9G2SK
   5NuZ3gdE7tdZWBR102pLXSjXTuM77bjsKyA5WAj1bpa/G9KmGqDoO+3Me
   g22+/4dBc9tHCcNmmlz5GZWtKzakbvPCE5vSGldT4CNg2k3SYpI5X0ik+
   xl0cN4h/d2HDhaNel6eJAgmbt/oAF40S83DnmVJSSxbVvGu57SV6D33x0
   HTwsOJuv8z3bLMkaqF5h1lqfB/5M0VDuvkff9Vmy5rlpH0F5j/82tk6M1
   j/1Yz5dNwzDfVFG8bl6utzOkr39pTYUf6T/IGLhhFmN6D9yWvnnDTLCur
   A==;
X-CSE-ConnectionGUID: aVSZK0Y1TAeqxQ8z+M0ALQ==
X-CSE-MsgGUID: ifSe74UFRZu4UF6zo24kxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1828989"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1828989"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 12:26:02 -0700
X-CSE-ConnectionGUID: FWlL+jMMRVKtxSG7KlBmtg==
X-CSE-MsgGUID: fyNB0DwFTCaARC+vMjq4Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="4859075"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.156])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 12:26:00 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 28 Oct 2026 21:25:56 +0200 (EET)
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: LKML <linux-kernel@vger.kernel.org>, 
    PDx86 <platform-driver-x86@vger.kernel.org>, 
    Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
    Armin Wolf <W_Armin@gmx.de>
Subject: Re: [GIT PULL] platform-drivers-x86 for v7.4-1
In-Reply-To: <CAHk-=wjk2f+Vu656fEa7FOyHHaFe+-M-GEwUQPXykaYoor6A7g@mail.gmail.com>
Message-ID: <112173bf-15bb-5a6f-e3d9-73c7675de537@linux.intel.com>
References: <pdx86-pr-20261028113441-148823082@linux.intel.com> <CAHk-=wjk2f+Vu656fEa7FOyHHaFe+-M-GEwUQPXykaYoor6A7g@mail.gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1097250158-1793214583=:1157"
Content-ID: <5b3108f2-7ff5-0f91-1683-502b3eaa9b22@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1097250158-1793214583=:1157
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <830ee9eb-6bcf-22f9-da91-f801ec466447@linux.intel.com>

On Wed, 28 Oct 2026, Linus Torvalds wrote:

> On Tue, 27 Oct 2026 at 23:59, Ilpo J=E4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > Highlights:
>=20
> Please, people - give a *summary*.
>=20
> Not 150 lines that just re-organizes the shortlog with some editing.
>=20
> It's not a "Highlight" if it just repeats every small detail. That's
> just a "list". And it certainly isn't informative.
>=20
> I - and others who read merge commits - want to know the big picture.
> Not every driver detail. If I wanted to know the exact details of what
> happened in some particular driver, I would be reading the commits for
> that driver. That's not what the merge is about. The merge is about
> bigger issues than to see things like this:
>=20
>     - intel/pmt:
>        - Block mmap when read_telem() callback is present
>=20
> and that's just one example of a *lot* of "this is not a big picture
> issue, it's a small detail in one particular driver".
>=20
> I suspect one thing that is actually a "bigger picture" issue is that
>=20
>  - ACPI: video: Remove CONFIG_X86 dependency as WMI now supports non-X86
>                archs
>=20
> which is something that people might find interesting in general.
>=20
> On the whole, I think 90% of that list should have been written along
> the lines of
>=20
>  "Usual updates for laptop quirks from HP, ASUS, Acer and Dell:
>     - new model names and recent CPU support
>     - more special button / function key handling
>     - battery and hardware monitoring quirks"
>=20
> or something.
>=20
> Please *help* me write usable merge messages that are actually
> informative and not just a "data dump". For the data dump, we have the
> details in the git history.

Okay, thanks for the feedback. I'll try to leave more out the next time
and/or write it more directly to you specifically.

So far I've mainly written these from the perspective if one has the=20
relevant HW or is using a driver, whether the change might be of interest=
=20
to such an user or not (it certainly didn't have everything even if I=20
can believe you can easily get that feeling).

I understand in platform drivers case many of those changes would be of=20
zero interested to you, and same could be said of anyone else. HP owner=20
won't be interested in any Dell changes, nor even those HP changes not=20
relevant for one's device, etc.

=2E..But I don't *have to* keep doing it like that. :-)

--=20
 i.
--8323328-1097250158-1793214583=:1157--
