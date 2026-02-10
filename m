Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6D631B803
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 18:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770749371; cv=none; b=sfaKM0F0vqzC15M+REK/iRr6RifJbztDHrLbUrjHdLiWp1yxq4s6a6u95ffyyJnnYHZeQihGqOm8hX9X6GlpUyYZwO8INNGnLPRc98wGSG1iO3XuQ9+aXqiuKglnwmIMeq9nAPTfsIfM0SJ85FMtZhA03wP17d+RpPlUiPuKCRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770749371; c=relaxed/simple;
	bh=9GvS8HeRCtTlv5n5pAMNXvD2EJqn2WMjSDH87LVW04g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RgjSnrmlE7+RSyZeAolQhfnl6NJ352TIRx41CPmSzGTgxl1rM4b7w3CbCWHEKfsJxxf+kNQwrmUIXbUrFPy6eorJTtCJ1amz0Bga4dRPCtTVHPRMKaActYHr5BZZPqBTG+gEgDYWjKfFSjdjOpcKa3/guIU2/0InGN0sX8hFnWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uEadrHu0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uEadrHu0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64869C19421
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 18:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770749371;
	bh=9GvS8HeRCtTlv5n5pAMNXvD2EJqn2WMjSDH87LVW04g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uEadrHu0IJAw9pDd7Gn8B/W9NMks2m44GdRq98iai2W+5HC8470WuHgKRadmpkfPA
	 nRQXZOHdYW23jtulqKLyYZV7J6xJM2BUQUP5GYwPI3JBeNLSscc8tx+3Z9RfYVHCU0
	 k05WrdCxjrEAE1RWxtH/CKwwlotXjEXTlylRjsi4ChloHlIuZ5sv7G2BCM6Gaqw+ux
	 dFMRoTYol/P6g4uLSwh7a39Bim7tJIhW+CL1D+9V747xBtQR4Av6zR3iXSTQON7YO5
	 MtZIQfNPbFv9yPKqnZYRHFqRFeerQew+Y7ytVJzibtIXukJHF5A82a/NbI/BVSgv2O
	 6WF+w7aHqxxIw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 55F6EC41616; Tue, 10 Feb 2026 18:49:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 10 Feb 2026 18:49:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-QX9gWu2hqT@https.bugzilla.kernel.org/>
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

--- Comment #6 from Rong Zhang (i@rong.moe) ---
Hi Avraham,

On Tue, 2026-02-10 at 17:56 +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221065
>=20
> Avraham Hollander (anhollander516@gmail.com) changed:
>=20
>            What    |Removed                     |Added
> -------------------------------------------------------------------------=
---
>                  CC|                            |anhollander516@gmail.com
>=20
> --- Comment #3 from Avraham Hollander (anhollander516@gmail.com) ---
> I'm also seeing this on an IdeaPad 5 2-in-1 14AHP9 (83DR),  after upgradi=
ng
> to
> Linux 6.19.
>=20
> I'll attached dmesg and acpidump, but this is not a vanilla kernel, so ta=
ke
> it
> with a grain of salt. This kernel doesn't have debugfs, so I can't provide
> that.

Thanks for your dmesg and acpidump. I will find some time looking into
them.

As for debugfs, every major distribution have it enabled [1] and so do
any sane downstream kernel. debugfs can only be accessed by the root
user by default. Did you try with the root user (e.g., `sudo -i')?

[1]: https://oracle.github.io/kconfigs/?config=3DUTS_RELEASE&config=3DDEBUG=
_FS

And since you are using a downstream kernel, could you provide a link
to its website or so? So that I can check if it's the root cause
(though unlikely).

> /sys/class/power_supply/BAT0/charge_types is [Fast] Standard Long_Life.
>=20
> /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode is 0.
>=20
> I'm using the BIOS default charging configuration and haven't set up any
> weird
> ACPI stuff, afaik.

Thanks,
Rong

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
