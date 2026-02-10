Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996C91E4BE
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 18:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770749827; cv=none; b=j2M8W8B5Z4HuA6yvN1OBO36ptBwSxIvf+zVZlEX4dt4/ZJK7MZ27VqLVG4qqom1chYupE3GwRjepOBjzZcLNZ6pGS5kklcjHjo7Eu5WoBUZph3IJghQKfVzvWsH7OrU/l5etMTET865oV5nKaGXfxCUIJWVDx4LDoSWdC8Nw+sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770749827; c=relaxed/simple;
	bh=gAJ9TE56gxkRey7UTXSZb63uqzQNME739s7JKCBeBAM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wt5MT/3m7EqNniz2B94CbTfEoBp9bVPi6kqWb0KD7DCUwSEehfJx17GyD1j2WRYhJolEBnZ1rCuHuW9sq8Hq+iK/22MWIE0hDwi5qx6E6yd3VGfMVatV6dUQJjKslY79FmWIxJRbKe1nLw7jwoR3lrlb/fGekeo1ZujCr5ov1WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AzfTZPmj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AzfTZPmj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26D14C116C6
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 18:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770749827;
	bh=gAJ9TE56gxkRey7UTXSZb63uqzQNME739s7JKCBeBAM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AzfTZPmjgmW2MlPOu75Me1lT4VkYnPxARwSu+KiswnYSmHM6z+IuSa4vknZRo7WYr
	 AS2E2ltQAmeOd/Df0129venI0Y5lxffrgkzQf5+VWQc3dCWhcfZz01S6aQ3t0QKWqW
	 3FfY2Mi7oDboi7J7uQJ2xLNh1DiyQsnPmmNu+7FqjJxTxO181izqKNF+KrABO9KVSI
	 VIdAHYn8J2kXF+aiOcBqhZLK+3srklJQkMy7FUELQu8G4TMpJx2sRu2DTBxRy7iwJ7
	 M1r6ZXTlihur0A+U4sp8OGjgNRrNwRAGHO2DXqjOPvPW38WaoMsoQ3RCcTVfpAmmuh
	 yLgrdJBIOMraw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 17F3FC3279F; Tue, 10 Feb 2026 18:57:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 10 Feb 2026 18:57:06 +0000
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
Message-ID: <bug-221065-215701-AjOs5V9mkK@https.bugzilla.kernel.org/>
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

--- Comment #7 from Avraham Hollander (anhollander516@gmail.com) ---
(In reply to Rong Zhang from comment #6)
> Hi Avraham,
>=20
> On Tue, 2026-02-10 at 17:56 +0000, bugzilla-daemon@kernel.org wrote:
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D221065
> >=20
> > Avraham Hollander (anhollander516@gmail.com) changed:
> >=20
> >            What    |Removed                     |Added
> >
> -------------------------------------------------------------------------=
---
> >                  CC|                            |anhollander516@gmail.c=
om
> >=20
> > --- Comment #3 from Avraham Hollander (anhollander516@gmail.com) ---
> > I'm also seeing this on an IdeaPad 5 2-in-1 14AHP9 (83DR),  after upgra=
ding
> > to
> > Linux 6.19.
> >=20
> > I'll attached dmesg and acpidump, but this is not a vanilla kernel, so =
take
> > it
> > with a grain of salt. This kernel doesn't have debugfs, so I can't prov=
ide
> > that.
>=20
> Thanks for your dmesg and acpidump. I will find some time looking into
> them.
>=20
> As for debugfs, every major distribution have it enabled [1] and so do
> any sane downstream kernel. debugfs can only be accessed by the root
> user by default. Did you try with the root user (e.g., `sudo -i')?
>=20
> [1]: https://oracle.github.io/kconfigs/?config=3DUTS_RELEASE&config=3DDEB=
UG_FS
>=20
> And since you are using a downstream kernel, could you provide a link
> to its website or so? So that I can check if it's the root cause
> (though unlikely).
>=20
> > /sys/class/power_supply/BAT0/charge_types is [Fast] Standard Long_Life.
> >=20
> > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode is =
0.
> >=20
> > I'm using the BIOS default charging configuration and haven't set up any
> > weird
> > ACPI stuff, afaik.
>=20
> Thanks,
> Rong

I build my own kernel with a selection of out-of-tree patches
(https://github.com/Frogging-Family/linux-tkg) and a heavily tuned
configuration, which indeed doesn't have debugfs. I don't mind building a
vanilla kernel with debugfs; I have just been using my laptop and haven't h=
ad
the time too. Probably later today.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
