Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317DE59B40
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Apr 2024 07:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712215635; cv=none; b=YjC9PdDek6bbQxNhGBcDzuWARoUsTtx9F3IEYv8QlmtwVWgtYnXPg2AdisMAw5jlMm3zcyWTzb7pqfv9CRxlbf5uKYJQzR+LkyvrjGe/WoGK7Fmze+xSZKuSv0wk8YbKKheTYJzq+IuVIsV2bxYZCfHPRiaw9Geg/VsMo+NFsDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712215635; c=relaxed/simple;
	bh=ODjwOVF2Ek6QJTtQ51zjS8Yf6VSLCSnZh7p/guZ3IJA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mj/TTDPECFskDKWoGtLgaHhna74+EIfKzs3HhWauROB0wdIxVmkkMtgrQd5WqFbZVoqzyvgoaiyXNz213Os+jN3NQjZe1SQoirIqUiXeo8ajrIN6Tp0jkhdCav3Ep4RUwkkkYSh0xSQlemW/ArsMJgUd4JAAMob7dgmBbXMFouM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jKCB7EMd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jKCB7EMd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B734AC43141
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Apr 2024 07:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712215634;
	bh=ODjwOVF2Ek6QJTtQ51zjS8Yf6VSLCSnZh7p/guZ3IJA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jKCB7EMdiSEzPKD70mA/Jm3agzNeoeF+FgFs0X6EFZ5puosSamN5acAuituhUztGY
	 U7gaQ6uZK3p+thusT9cIFPr1jktct+L5LuMtv+EpvbYy8tp9jGzwSJbLSgwuhcg7Tx
	 uiyBgcuhJ6/N5m2nysQthSeRsgAPk34V7ymRMwrkHgjkJaL1oihrppxSNleNxL+Zr8
	 OXUPTyhzFmCO5hL3FH1AyUmA2/5/BImz/y/JW8kPJayORettDpPuPz3IehwsYAhEze
	 COvi7T1lwXSvqBv/fiTHPHHdko2prAMmLVcY8gPbBGN2H47o0BfmC5wUXbp7clFqgx
	 +AQxyQd40MLeQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B3A96C53BD7; Thu,  4 Apr 2024 07:27:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date: Thu, 04 Apr 2024 07:27:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: felix.schmidtpeter@yahoo.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-PGgeDsvUrA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

zerofixgiven (felix.schmidtpeter@yahoo.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |felix.schmidtpeter@yahoo.de

--- Comment #335 from zerofixgiven (felix.schmidtpeter@yahoo.de) ---
(In reply to Denis Pauk from comment #265)
> (In reply to zykr.caswell from comment #264)
> > Created attachment 303116 [details]
> > DSDT - X99-E-WS-USB3 - Decompiled
> >=20
> > Same or similar issue with X99-E WS/USB 3.1:
> >=20
> > nct6775: Found NCT6791D or compatible chip at 0x2e:0x290
> > ACPI Warning: SystemIO range 0x0000000000000295-0x0000000000000296
> conflicts
> > with OpRegion 0x0000000000000290-0x0000000000000299 (\_GPE.HWM)
> > (20200925/utaddress-204)
> >=20
> > I've been trying to make sense of the DSDT by reading the ACPI spec, but
> I'm
> > not having a lot success. Built kernels 5.10, 5.19, 6.0.2, 6.03, and
> several
> > different versions of nct6775 driver for each including "Asus WMI for
> > nct6775 v5.20 base (2022.10.20)", both in tree and as a custom DKMS mod=
ule
> > to no effect.
> >=20
> > I'm rather reluctant to actually try using acpi_enforce_resourses=3Dlax=
, so I
> > don't know for sure if that would make it work or not. I've attached my
> DSDT
> > as pulled from the latest BIOS update for my board from ASUS. Could som=
eone
> > take a look and confirm for me that I likely have this same problem?
>=20
> Could you please apply patch and add line with you board and recheck? Cha=
nge
> should be like "DMI_MATCH_ASUS_WMI_BOARD("<You board name>",
> &acpi_board_LPCB_MUTEX)," near "MAXIMUS VII HERO" definition.
>=20
> Name board should be from /sys/class/dmi/id/board_name.

I would like to ask if the support for the board "MAXIMUS VII HERO" will be
merged to the kernel in the future?
If any assistance for testing is needed I am happy to help to get this adde=
d.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
