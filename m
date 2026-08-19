Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB13F3C5DBA
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 19:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787168714; cv=none; b=Abto2Cw9gtq8bYB6mb96AyNyzn79xxrP0ySghmTcnnR1XsNDrsbS134BrkoAB4BuGuuSJxbLuOITMhDMPmLaLSXcsEWm6c/tdb2VGbWpfw0aTMovQRp+fepltIEVJkdCMlcOpRfp7ttuGp1Cri7nYabTsiKV8feRAjJE/VFpmPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787168714; c=relaxed/simple;
	bh=mnXuUMOpesBUiBjCGo96HKyUBx5rUmPPlcCWp7SQzKw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A4tRWB2B5yi2z16BDPkGXV10HljYtncxEDLYJGQebS7aDhHUxQgnhk5ojydXzOvuoH4QoXeVOzrcI4ZY0k2hYpqc7fAfoBuzsXbBAml+c1lQvcaW1ej1WEwcHFHjypIvcfheTdSq299BPXSzzDlpvht0cJjdhQFVK3cAUyRRgAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lsEOXDOR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lsEOXDOR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57580C19425
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 19:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787168714;
	bh=mnXuUMOpesBUiBjCGo96HKyUBx5rUmPPlcCWp7SQzKw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lsEOXDORpkdTmqGO/cbArvMLCkAIpexxXvMU52dz+0pwTx486vG84vZ2HmNueP/kS
	 26SxQ2LwPLaAEaSrrNjcouqglgJoWSbrftgC4RBwgBxtXCaNS1yIKY2KiS57yn9Pau
	 iGBd90JdieAgYHhnfIABOxiY+fJnjAlr2QM1omYEZnGwdtyaMq6h9V1PtY42g2bJzy
	 4VcOD7yj4FX3SBW/R3xP3PIKAXVnpvjZERu+tYP3prsom5imHWpqQv4ERLT/4i5dEh
	 cPU3McrFTkmT1P4oeVA9Xi3XSvsf6e+GWIQQhcQUBN187Mepf6rWtMzahUVRNHZPNp
	 EBz1Fg6fl5kkw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2E166C4160E; Wed, 19 Aug 2026 19:45:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220926] HP ENVY 16-h1xxx (Hayden): hp_wmi platform_profile
 fails to read/write
Date: Wed, 19 Aug 2026 19:45:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gibs23@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220926-215701-HCZ91O5lin@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220926-215701@https.bugzilla.kernel.org/>
References: <bug-220926-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D220926

--- Comment #3 from Gibs (gibs23@proton.me) ---
(In reply to Suryansh Singh from comment #2)
> (In reply to Gibs from comment #1)
> > I have the same problem on same platform on kernel 7.1.8.
> > Changing profiles does change fan behavior, but RPM reads 0 with hp-wmi.
> >=20
> > Package power also seems to max at 40W no matter the profile. On Window=
s I
> > have peaks of 115W and then drops at 55W after a short while.
> >=20
> > I also tried mapping my board ID to Omen or Victus configs but doesn't =
work,
> > the ENVY seems to be different.
>=20
> Hi,
>=20
> Could you please provide your board ID, or clarify if it is the same as
> Andres?
>=20
>=20
> Are you sure you've tried out all Omen or Victus configs? The latest bran=
ch
> for the platforms/x86 subsystem (pdx86/for-next) has an expanded driver
> scope compared to the current upstream version of the kernel you're runni=
ng,
> so consider using the code on that branch for mapping your board ID to
> specific driver data in hp_wmi_feature_boards[]
>=20
>=20
> In case none of the existing parameters apply to your ENVY laptop, the EC
> behavior and specific quirks required to get it working will have to be
> reverse engineered and patched into the code, rather than the regular pat=
ch
> of mapping the board ID under predefined parameters.
> You may contact me at my mail if that happens to be true, I'll be glad to
> help in the whole process if it gets that complex.

Hello, thank you for offering to help!

It is the same board:
cat /sys/class/dmi/id/board_name
8BE5

I had a look on the motherboard and I found a ENE KB9542GF chip, this seems=
 to
be the EC. It may be present on a few Dell laptops, may have found it on an
Alienware. There's also a different package for this chip, still marked KB9=
542
but different suffix and QFP package, which is also present on some other
laptops, like ENVY x360 by the results of some searches.

I will have a look at the latest branch as you suggested, will report back
after testing.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
