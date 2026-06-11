Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229F978F59;
	Thu, 11 Jun 2026 15:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781193209; cv=none; b=Hek3nsW2nYgGurXgZNj6UV9NkK/93mZbkyGVUo0oTaNNE9IKJjXdt42j/zUohoB6wEUrnKpfn0WKOpOkKJl1XzsI4Xv9ohFYJ22vd9/NngfjYRh8FHZgRhjv3gILZojQ3DMSFkVHs3sv3JNoHhodKvnxV1GYisor01UWnMw33Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781193209; c=relaxed/simple;
	bh=xYMpn/uAnX5ECbXA/TXoeKgZyO7HP+TOXO0mox7Y3uQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WHa4wnwri8dWc/pmzrOdjaA92H9KF/l+o8/RaL1fd4SYmIZhcPkcSjPOgw9Dm4JOa8lp+sNrvJs/g78TIafhfttnzNDC8pr0SCicww0XKM6wQBGZ8xdWVzSZZTIDCVf75/ZtjzQtEXp4q5c5lkGpWtfQOME7KGrII7wnXdrIe/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=LyaXuu/G; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="LyaXuu/G"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7906126F19;
	Thu, 11 Jun 2026 17:53:25 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VIemQ5yoYDJ3; Thu, 11 Jun 2026 17:53:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1781193204; bh=xYMpn/uAnX5ECbXA/TXoeKgZyO7HP+TOXO0mox7Y3uQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LyaXuu/GEgUb48Azhz9NXjhIpuRB1e4izkG+EsBi3E1lAZBHlPl0oxLtY2EvR/CHC
	 c6KRrLIfguDCYbd14AvAC3bQgixWzLxim5ylNJoNq6gOHbDI2YWGR5SDasEr82hPRX
	 OdiT8UBIEU+08nGWvNIAq9BRhoEiFwv3mCRDfpqp7ZP817z1UO4UR3BzMouRwQMSam
	 sphFNrPO7yhwwVDSOgTL5tq0kD0hl78bbHB7KycDq2NEB7pjtM3SGlNBq4pS5SlRlP
	 JGy0wfbt0stfppcaVyr1EvOTKgpv7d4+wcMfiseoBWHxRRVKqjihryMKYXs1aAAB01
	 hEkow2n649tIw==
From: Marco Scardovi <scardracs@disroot.org>
To: "Luke D . Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>,
 Corentin Chary <corentin.chary@gmail.com>, Hans de Goede <hansg@kernel.org>,
 Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: asus-armoury: add support for G614PR
Date: Thu, 11 Jun 2026 17:53:11 +0200
Message-ID: <OhHrh4KYR76ict9IRSPksQ@disroot.org>
In-Reply-To: <178119015973.12014.6231948241278781864.b4-ty@b4>
References:
 <20260610152130.25892-1-scardracs@disroot.org>
 <178119015973.12014.6231948241278781864.b4-ty@b4>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

In data gioved=C3=AC 11 giugno 2026 17:02:39 Ora legale dell=E2=80=99Europa=
 centrale, Ilpo=20
J=C3=A4rvinen ha scritto:
> On Wed, 10 Jun 2026 17:21:30 +0200, Marco Scardovi wrote:
> > Add TDP power limits and fan curve requirements for the ASUS ROG Strix
> > G16 G614PR laptop model.
> >=20
> > The ASUS ROG Strix G16 G614PR requires specific AC/DC power limits
> > (PPT PL1/PL2/PL3, dynamic boost, and NV TGP targets) to function
> > correctly under various power profiles. Without these limits, the Asus
> > Armoury driver cannot configure the correct power envelopes or enable
> > custom fan curves, leading to suboptimal performance or noise managemen=
t.
> >=20
> > [...]
>=20
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.
>=20
> The list of commits applied:
> [1/1] platform/x86: asus-armoury: add support for G614PR
>       commit: 6b3bbe770f4ca0439710b7c42f88b9f6eeebabd0
>=20
> --
>  i.

Hi! Thank you for picking it up :) I'm not in a rush and tbf I was expectin=
g=20
it would take some time.


