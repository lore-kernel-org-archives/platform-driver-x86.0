Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575695464D
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 17:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770832762; cv=none; b=Eut3NMiPnpFmWeKs1TA4lq19qFGw619P8r8Jt4ukRXy2GTT8NVuTtW+GpPzRj8ryXKCLn8nm6s9xnzyoyeBpNY+njuuk+x5pTguXvJwtEqr0g++PLLZMhczkOFSRU+yLsztSVpPb72Msn1MGALxvqFqWHccCScpR46bHGILjp6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770832762; c=relaxed/simple;
	bh=Cibo2MPX9C4sp9CSYjPgrOS+DiRIZzJPBEKOh5G4YHc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nVwwBUG5zZhB3lUiauA8afttXMKMXaqXtMYRkp46IWNUIhF62LGXJI8V+WloD9YtGM21HeIAsJhXMXuecDeJbF2/cgEqfTFJv/dGZ6v64kdiKrt+ArEB69bu7j1f1jOzxgld8CbEhPAgD0QEJDmiL9U9whWWUQGukixV+GkPt0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VNxHnyzL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VNxHnyzL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9761C19424
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 17:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770832761;
	bh=Cibo2MPX9C4sp9CSYjPgrOS+DiRIZzJPBEKOh5G4YHc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VNxHnyzL2ozB97i8a9VeqU5O2R1n5clb6cwqn+ow+i0S6Nub1NGt4RzGF5kxj1pb0
	 IrhDBKW8jbyq86jd4tBeF4jSp1boSaSms7A2P3E62SwsCvkx39al+k/fND1pifj45z
	 wn683bANTcbS7uz28EXO15hNiZU1r+r+A9wAkx6dousfR+OaaWr9K+u48SnJ0emoCu
	 9nTYDPsjZfoHH70zXfn2NWInWH8fM4xroQpaj/FKcSAe5BW0rvdK07F5T7KIglyyV9
	 Y7/XEU2tuxmVCWpHKO+05spxKhV9bSltdL2jH9USav+xTfOOaupNWomrtSCDUIDVp6
	 aMNAEvrVIiysg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C75E8C4160E; Wed, 11 Feb 2026 17:59:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Wed, 11 Feb 2026 17:59:21 +0000
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
Message-ID: <bug-221065-215701-6zj6nF1WxY@https.bugzilla.kernel.org/>
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

--- Comment #31 from Avraham Hollander (anhollander516@gmail.com) ---
(In reply to Rong Zhang from comment #29)
> (In reply to Avraham Hollander from comment #27)
>=20
> Thanks for your test.
>=20
> > It did not. Unplugging and replugging the charger a bunch of times resu=
lts
> > in:
> > [...]
>=20
> Ahh, my fault. I meant fixing the issue that ideapad-laptop misinterprets
> the error returned by the GBMD method as a valid return value. According =
to
> your log, the patch seems correct.
>=20
> As for the issue of the mutex chaos (and hence the error logs you got), we
> can't really fix it from the kernel side. It can only be fixed by a BIOS
> update. That's why I added Mark to the CC list.
>=20
> I've seen GBMD, SALS, SBMC, and DYTC calling ECCC. I think we will have to
> add a DMI quirk disabling most (if not all) features of ideapad-laptop on
> 83DR until a BIOS update fixes the mutex bug. Doing so should make the mu=
tex
> less likely to break. As a quick test, could you test if blacklisting
> ideapad-laptop in modprobe.d (reboot required, ofc) helps?
>=20
> (In reply to Avraham Hollander from comment #28)
> > Is there anything you notice in there that could potentially cause the
> > system to take excessively long (2-6 seconds) to resume from s2idle? Th=
at's
> > another probably ACPI issue that I've always had. This is almost certai=
nly
> > unrelated to the charger bug and I don't want to go completely off topi=
c,
> > but I figure it's worth mentioning now that I have contact with the
> relevant
> > people.
>=20
> I guess this is also related to the mutex bug in DSDT, considering it has=
 a
> bunch of EC queries calling ECCC. Blacklisting ideapad-laptop may have so=
me
> help, as doing so reduces the probability of running into a race conditio=
n.
>=20
> I am not really familiar with s2idle and EC queries, so I may not be the
> best person to answer this. Armin, do you have any thoughts?

I can't get it to trigger either way now, whether ideapad_laptop is loaded =
or
not. Could the cause be that my battery is fully charged now? I'm going to
discharge it some and try it again.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
