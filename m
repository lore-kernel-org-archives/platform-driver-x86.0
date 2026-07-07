Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD95A347BAF;
	Tue,  7 Jul 2026 21:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783459510; cv=none; b=kxYGd+s9HcFAIcBVjfoMQ099aHJcOIMC8xUGHatMGfH1Fs4RBgEeX34e0pObZdreK4405S1rFY5ZdMk3nkKDSXF1HH/yA78FRcbM/FuIBR5hf9frWvM+0LW++M6nuhigQOubQU0AlQqej1TDhY/x5OPVQM8IAkbHwoPK5tI0Zeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783459510; c=relaxed/simple;
	bh=0USb1rqdOrsxDukAcHjpADpVmM7L9HEJlHgfht8rhNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tpwEbSucYGwGwTaVKXTfQAAN5SQI6DTpxUtlskOGTB/q7KgIT+5bq0F0wQZ3A5B7YaDkPf3urnnSaK0js3R4kNOLNu8fX+/E6Fn9JKE5AdXbTTFmK3eZWcuXNUyUuMBUnTAp6lSufyGCnDgUG0gNv/cyjB19JfZqfpqMmINfBus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=KwjXpwft; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="KwjXpwft"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 40FD884985;
	Tue, 07 Jul 2026 23:25:00 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8YVZmwcS-o8X; Tue,  7 Jul 2026 23:24:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1783459499; bh=0USb1rqdOrsxDukAcHjpADpVmM7L9HEJlHgfht8rhNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KwjXpwftbkaFWWGusduHO2e7dqVBsh1tCN/gzz3c9CTXuEXF9gn5bMe67VZOKzHuq
	 DIJ+8WNMXPpQi+VagcK/6dHzjtyUgW8jR0mHusletTWLBwyN0Rvh6qRBGrC4ZlIbvQ
	 2WI1vpsdAQ347ErHpzwaGbdGGZia5v0M/bx4rj3jfjulKscSYX4fXGW7oCoOFiFeXf
	 rq4ExsaWN96Xeaok+Q/kV700cmnnGin8gNuEZKBdkN3bZjroSlfj7NSiXLUQqQi7V7
	 6otEucpPtDznRZKhyPiDlAUtn1Cf9m47Ca4hzjtLFMJi3O9byFOlL6o70vT1QfyjaA
	 tGGqaA55uN4ZA==
From: Marco Scardovi <scardracs@disroot.org>
To: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: krishna.chomal108@gmail.com, eliadevito@gmail.com, emreleno@gmail.com,
 Hans de Goede <hansg@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 moravec@ukf.sk, platform-driver-x86@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>, regressions@leemhuis.info,
 regressions@lists.linux
Subject:
 Re: [PATCH v2 1/1] platform/x86: hp-wmi: fix platform profile issues on
 generic HP laptops
Date: Tue, 07 Jul 2026 23:24:46 +0200
Message-ID: <bYfem026T1WGSu1hPtcAtQ@disroot.org>
In-Reply-To: <358d9315-e974-3180-8919-3451c982fc44@linux.intel.com>
References:
 <ajqgkq_elUlMC0Ep@archlinux> <20260623164603.10322-2-scardracs@disroot.org>
 <358d9315-e974-3180-8919-3451c982fc44@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

In data marted=C3=AC 7 luglio 2026 18:40:39 Ora legale dell=E2=80=99Europa =
centrale, Ilpo J=C3=A4rvinen ha scritto:
> On Tue, 23 Jun 2026, Marco Scardovi wrote:
> >  ...
>=20
> You'll need to write a better justification into the changelog if you wan=
t=20
> to have these above included. It also looks largely unrelated to what=20
> you're doing according to changelog so it might actually belong to=20
> another patch but without proper explanation, I'm pretty much in dark=20
> why you're doing these in the first place.
>=20
Hi Ilpo,

I totally forgot I had this thread open.
Please consider this patch as void: I can't assure anymore its validity in
the long run and it's better if it's taken over by HP guys instead of me
tbh, also because I don't have a valid device to test it myself in the
first place.

With best regards,
Marco


