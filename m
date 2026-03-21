Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B9838B145;
	Sat, 21 Mar 2026 11:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774094165; cv=none; b=ARWQ9Qv3cyiHLVx8Ya062lwvvSVfR+IoXqnpsf53hD/0kcU6ABTdxGrOSjTDuL8JS66FuFKfQDqX//gLZSNgRXrFrpo5UkQdkswWlJ1eEOeiC9NlrjLj/gljUkEzRldjivs4KF1WabWS2CRxQTkyvk9k0dYbk5tSGchNHQdmYSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774094165; c=relaxed/simple;
	bh=8GHCIszmWc/x9qKDXcmd/xZnbgZeKdHnV5irkUrfisU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4cNZWl8HQuxIIMxhgjD2wy+X/eEBT6Bn96iZtQZw9xyXO1WyhKks1vOSt7pJjrNkuDQIA+IepirODzrVxwnZNhFGpM+3b43qAEV9EUdL+0BzMu2KTAyeRt+JLEnrXipVzu8EA4QpV+a+o6XgM3F8gcakrmkuc/BjcRqJNWuvQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=HGYPFcX9 reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="HGYPFcX9"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D4C3340E0295;
	Sat, 21 Mar 2026 11:56:00 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id l00uFVHnrnOJ; Sat, 21 Mar 2026 11:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1774094156; bh=V8L49odpIjS0nz3lKeK22T+nlIAOK5Th23NLHuI5tM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HGYPFcX9iE8BOUGGMlN8BI/MFPhc448d1ehzd0PPRsELPkHag7ocIuGDvBDuqEGci
	 iEVight/2g1nVNKNjkz6QXLYV/PIDqQxzjRuv8c3nPaQsoPhhbsrp6Vv1YYMTzA7aK
	 KLzjNFGJfCb9GzlM5B5wcIBbtG1/e6c/dlZjagZcmIFs86biO2GlYnYpk9vGI7ZaNn
	 englthr/JjrHBdMfavdnZoVF36BUUhD3v3lu6wiTkWFCik6v3rEWJr/wyIoVMYnG2i
	 nu80gt0y9nvdZpwfTn1o6PkqNQ9+QRn0TeHlXOmO/IuzEJ/FAehjMc9Tn57XVHUrCa
	 Ey5Av9ZUO/U2HMbI/YX5SpCClNoWq+JwXmFbxhWYtGA8NrexgdDkyt5LIOBZSVAMhA
	 52RvPxPpFj/Ufvu+T9vstZVJWWUJ/a+mwrmP7wL1Vtag2NS0ivFd8l0YZDQy+NB41t
	 5Ie5wGl82hnNIhhMJ6hXdArKCGbYTVG6eVV4Geu42TWFu8pkoNUdFpXN91I1F+O4E2
	 koUDSjLsE7NqJ75e/VsggvsJ4rOS14EJrJ20Ym0dUpzD5pg6MJFAiVxJ3bIM2Yu1Sw
	 G4QRVLFpxHQUXhMSyZUSzFS66pi3XlTkCOtC9nSQfVUSA5LpIQiEC++cg9JYwOH+/0
	 wdqQx/FRvLF6goZ+1Bxb296A=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id C12BB40E0174;
	Sat, 21 Mar 2026 11:55:48 +0000 (UTC)
Date: Sat, 21 Mar 2026 12:55:47 +0100
From: Borislav Petkov <bp@alien8.de>
To: aros@gmx.com
Cc: bugzilla-daemon@kernel.org, Hans de Goede <hansg@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Krishna Chomal <krishna.chomal108@gmail.com>,
	Edip Hazuri <edip@medip.dev>, platform-driver-x86@vger.kernel.org,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [Bug 221181] Kernel warning "hp_wmi: Unknown key code -
 0x36421aa"
Message-ID: <20260321115547.GBab6HQ8ZAo2OXxwkx@fat_crate.local>
References: <bug-221181-6385@https.bugzilla.kernel.org/>
 <bug-221181-6385-bppD5Qfxft@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bug-221181-6385-bppD5Qfxft@https.bugzilla.kernel.org/>
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 21, 2026 at 10:31:34AM +0000, bugzilla-daemon@kernel.org wrot=
e:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221181
>=20
> --- Comment #5 from Artem S. Tashkinov (aros@gmx.com) ---
> I've emailed Krishna Chomal privately a couple of times, he's unrespons=
ive.
>=20
> There's seemingly no one else to CC:

Why?

> scripts/get_maintainer.pl -f drivers/platform/x86/hp/hp-wmi.c=20
> Hans de Goede (maintainer:X86 PLATFORM DRIVERS)
> Ilpo J=C3=A4rvinen (maintainer:X86 PLATFORM DRIVERS)
> platform-driver-x86 vger (open list:X86 PLATFORM DRIVERS)
> linux-kernel vger(open list)

You got at least 4?!

Newly CCed folks, pls have a look at this bug.

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
