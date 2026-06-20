Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AEB185B48
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 07:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781942085; cv=none; b=idrriC3BdFHuqhRKSDtefjzdU78quAHH3MdceYM602uNyZ41sBMIGaSdXKbGxLMX7mEH0SYUfOPMx0GK2rXmRA13RF+Rlw/z3qCqt0If+U5uTLhnOttZ41lb7J2MFrkak0fXTVi+WIas7/IdGkbT0AXxTu+ZTCUPqOL0r3VCGS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781942085; c=relaxed/simple;
	bh=gtQ2ig/e+sHa+hXzZZHGE4Ltun3Ha2G9Aurqy/VxCok=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SSiXp0Bs5gEZWvMHnXwKszJ3m6eDcMbALfuUdO/5RUpuclZux/0zKCr/g7JWVbvLO3AI4EfyIHaFX2/k6oWnnEZDz++xGZvt6zqv3DDnfLlMlU4BNG1FHnggeIaRHh8d1ubCcnCPXtoixj2VKKuxr/N1k7aQnnEMIWG2JdsA748=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f5Iuz22S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f5Iuz22S"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73516C2BCB8
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 07:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781942082;
	bh=gtQ2ig/e+sHa+hXzZZHGE4Ltun3Ha2G9Aurqy/VxCok=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=f5Iuz22Sjc8Gr/IJIzkUMEUP8TzYwb+A/iJ5Ks42g29N9ScOtE400kmytEBy9JKZm
	 W2CH81+2zuupBcix9lduyi7cwHK52shXc9pVERCpqRM8zHfb2lRQNBZJV01KK96F0S
	 6jv1IV586N4SBxtrSanoD2Qy6B12be3d3wvpcJL6mbhTVvl3tIiT2rWqcGHq0bdf0a
	 z0J+vkwXEu8j0740zJCeWKsDOBQChXhaFRpG6dh68kTPBVYdVn/u/5foJdAZD7rgmT
	 5E7NcYHToz6zeF+bKjXbqlc95dn/6XswkwTU5wV6Qa4GEkrZpM1L2Hu7dZSZUgmbYz
	 Zxquy/xhhEIPQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4F67BC4160E; Sat, 20 Jun 2026 07:54:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Sat, 20 Jun 2026 07:54:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-alcF0yNUrB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #25 from Milan Oravec (moravec@ukf.sk) ---
OK, kernel is not complaining about platform_profile: Failed to get profile=
 for
handler hp-wmi anymore when switching power profiles.

But I cant resume from hibernation now :( migo-HP kernel: Hibernate
inconsistent memory map detected!=20

removing swap, recreating it doesn't helped. :(


j=C3=BAn 20 09:43:03 migo-HP kernel: [drm] Initialized amdgpu 3.64.0 for
0000:63:00.0 on minor 1
j=C3=BAn 20 09:43:03 migo-HP kernel: fbcon: amdgpudrmfb (fb0) is primary de=
vice
j=C3=BAn 20 09:43:03 migo-HP kernel: [drm] pre_validate_dsc:1667 MST_DSC dsc
precompute is not needed
j=C3=BAn 20 09:43:03 migo-HP kernel: Console: switching to colour frame buf=
fer
device 180x56
j=C3=BAn 20 09:43:03 migo-HP kernel: amdgpu 0000:63:00.0: [drm] fb0: amdgpu=
drmfb
frame buffer device
j=C3=BAn 20 09:43:03 migo-HP kernel: PM: Image signature found, resuming
j=C3=BAn 20 09:43:03 migo-HP kernel: PM: hibernation: resume from hibernati=
on
j=C3=BAn 20 09:43:03 migo-HP kernel: random: crng reseeded on system resump=
tion
j=C3=BAn 20 09:43:03 migo-HP kernel: Freezing user space processes
j=C3=BAn 20 09:43:03 migo-HP kernel: Freezing user space processes completed
(elapsed 0.000 seconds)
j=C3=BAn 20 09:43:03 migo-HP kernel: OOM killer disabled.
j=C3=BAn 20 09:43:03 migo-HP kernel: Freezing remaining freezable tasks
j=C3=BAn 20 09:43:03 migo-HP kernel: Freezing remaining freezable tasks com=
pleted
(elapsed 0.000 seconds)
j=C3=BAn 20 09:43:03 migo-HP kernel: PM: hibernation: Marking nosave pages:=
 [mem
0x00000000-0x00000fff]
j=C3=BAn 20 09:43:03 migo-HP kernel: PM: hibernation: Marking nosave pages:=
 [mem
0x0009f000-0x000fffff]
j=C3=BAn 20 09:43:03 migo-HP kernel: PM: hibernation: Marking nosave pages:=
 [mem
0x09b00000-0x09dfffff]
j=C3=BAn 20 09:43:03 migo-HP kernel: PM: hibernation: Marking nosave pages:=
 [mem
0x09f00000-0x09f3bfff]
j=C3=BAn 20 09:43:03 migo-HP kernel: PM: hibernation: Marking nosave pages:=
 [mem
0x65b05000-0x65b0ffff]
j=C3=BAn 20 09:43:03 migo-HP kernel: PM: hibernation: Marking nosave pages:=
 [mem
0x67a48000-0x67a4cfff]
j=C3=BAn 20 09:43:03 migo-HP kernel: PM: hibernation: Marking nosave pages:=
 [mem
0x6a3a9000-0x6a3a9fff]
j=C3=BAn 20 09:43:03 migo-HP kernel: PM: hibernation: Marking nosave pages:=
 [mem
0x6a482000-0x6a5acfff]
j=C3=BAn 20 09:43:03 migo-HP kernel: PM: hibernation: Marking nosave pages:=
 [mem
0x73c5f000-0x79ffefff]
j=C3=BAn 20 09:43:03 migo-HP kernel: PM: hibernation: Marking nosave pages:=
 [mem
0x7a000000-0xffffffff]
j=C3=BAn 20 09:43:03 migo-HP kernel: PM: hibernation: Basic memory bitmaps =
created
j=C3=BAn 20 09:43:03 migo-HP kernel: PM: Using 3 thread(s) for lz4 decompre=
ssion
j=C3=BAn 20 09:43:03 migo-HP kernel: PM: Loading and decompressing image da=
ta
(2889654 pages)...
j=C3=BAn 20 09:43:03 migo-HP kernel: Hibernate inconsistent memory map dete=
cted!
j=C3=BAn 20 09:43:03 migo-HP kernel: PM: hibernation: Image mismatch: archi=
tecture
specific data
j=C3=BAn 20 09:43:03 migo-HP kernel: PM: hibernation: Read 11558616 kbytes =
in 0.01
seconds (1155861.60 MB/s)
j=C3=BAn 20 09:43:03 migo-HP kernel: PM: Error -1 resuming
j=C3=BAn 20 09:43:03 migo-HP kernel: PM: hibernation: Failed to load image,
recovering.
j=C3=BAn 20 09:43:03 migo-HP kernel: PM: hibernation: Basic memory bitmaps =
freed
j=C3=BAn 20 09:43:03 migo-HP kernel: OOM killer enabled.
j=C3=BAn 20 09:43:03 migo-HP kernel: Restarting tasks: Starting
j=C3=BAn 20 09:43:03 migo-HP kernel: Restarting tasks: Done
j=C3=BAn 20 09:43:03 migo-HP kernel: efivarfs: resyncing variable state
j=C3=BAn 20 09:43:03 migo-HP kernel: efivarfs: finished resyncing variable =
state
j=C3=BAn 20 09:43:03 migo-HP kernel: PM: hibernation: resume failed (-1)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
