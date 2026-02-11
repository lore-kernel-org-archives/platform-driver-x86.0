Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6C12F362A
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 18:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770833085; cv=none; b=oOgzX9Fol6r1m70kYVqG/5d7LcAyZPepxlv4YPrefrgGMZ5m+YqRP02xZKcvvuq7hBM8GcI1KbviXP5bGF5zEwykR+gvsHyZYRoXfVnRanaUewQk8/el8amkjjdsbfcQ3mEkoGlUEJPV5utnvSr6tL3zMVasCKC9+uU0MZ0cOl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770833085; c=relaxed/simple;
	bh=SMoqprAY/rlNIQ4IoWeJfsEt/Y3FBwtdrLsxo/y6KS8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ldTK/WJ4XS7XbPglBZ4y1iFYF3WxniOz6sdSeLA4gII7THXes/xLYFlj0DhfoOGq76v3gEojGf48Dv6bxj+88ddo/YTdZ8FCtG9V0pyWcGpxQPxfhKTUbePFRbBxAoooNTEBT8fB26a4zrvaqeKUiPH99UxP8v7UUdv4ElogvMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VpgpXnw+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VpgpXnw+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21D46C19423
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 18:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770833085;
	bh=SMoqprAY/rlNIQ4IoWeJfsEt/Y3FBwtdrLsxo/y6KS8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VpgpXnw+E0/nei8IvV+bCR6v+7QeQY2EkCeH54pWrGvJlJ3/EzriuUw0qjpQ1kX6l
	 xYWfZJI6DqTQ0Y3F3TF8oHnfOscfr8tItYSpCJEBwqmK8gy0z1qmLzzgN48j2+Lrbd
	 0PCWVKdkCoQqaBDxbMtQegcsKpnCsOdKF9oauV3hL2cdAtrqHC5/Pj/09HgrjMgTdp
	 yD7idvlQId+axa2VOh8TdjpdeZbHolVx0fzh40JpJ/4EvE8o00N1DnW3HpZfvEsrHP
	 W+QXr9o0t8llmOjQZICUo0R40RLwVW01SpVTnLAfviueT7SGynqgpE0AQ+KZ/6x8E5
	 xZsbB9KO9rxaQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0D3B5C4160E; Wed, 11 Feb 2026 18:04:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Wed, 11 Feb 2026 18:04:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: anhollander516@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-GkWYbIyKoi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #32 from Avraham Hollander (anhollander516@gmail.com) ---
(In reply to Avraham Hollander from comment #31)
> (In reply to Rong Zhang from comment #29)
> > (In reply to Avraham Hollander from comment #27)
> >=20
> > Thanks for your test.
> >=20
> > > It did not. Unplugging and replugging the charger a bunch of times
> results
> > > in:
> > > [...]
> >=20
> > Ahh, my fault. I meant fixing the issue that ideapad-laptop misinterpre=
ts
> > the error returned by the GBMD method as a valid return value. Accordin=
g to
> > your log, the patch seems correct.
> >=20
> > As for the issue of the mutex chaos (and hence the error logs you got),=
 we
> > can't really fix it from the kernel side. It can only be fixed by a BIOS
> > update. That's why I added Mark to the CC list.
> >=20
> > I've seen GBMD, SALS, SBMC, and DYTC calling ECCC. I think we will have=
 to
> > add a DMI quirk disabling most (if not all) features of ideapad-laptop =
on
> > 83DR until a BIOS update fixes the mutex bug. Doing so should make the
> mutex
> > less likely to break. As a quick test, could you test if blacklisting
> > ideapad-laptop in modprobe.d (reboot required, ofc) helps?
> >=20
> > (In reply to Avraham Hollander from comment #28)
> > > Is there anything you notice in there that could potentially cause the
> > > system to take excessively long (2-6 seconds) to resume from s2idle?
> That's
> > > another probably ACPI issue that I've always had. This is almost
> certainly
> > > unrelated to the charger bug and I don't want to go completely off to=
pic,
> > > but I figure it's worth mentioning now that I have contact with the
> > relevant
> > > people.
> >=20
> > I guess this is also related to the mutex bug in DSDT, considering it h=
as a
> > bunch of EC queries calling ECCC. Blacklisting ideapad-laptop may have =
some
> > help, as doing so reduces the probability of running into a race condit=
ion.
> >=20
> > I am not really familiar with s2idle and EC queries, so I may not be the
> > best person to answer this. Armin, do you have any thoughts?
>=20
> I can't get it to trigger either way now, whether ideapad_laptop is loaded
> or not. Could the cause be that my battery is fully charged now? I'm going
> to discharge it some and try it again.

Actually, it just seems to be really intermittent. Now I'm getting the erro=
rs
from ucsi_acpi but not the mutex error, with ideapad_laptop loaded. It's ha=
rd
to say for sure whether blacklisting the module helps or not.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
