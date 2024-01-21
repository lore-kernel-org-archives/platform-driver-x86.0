Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590DD3771A
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Jan 2024 18:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705860335; cv=none; b=kx6orgZ6GUMneTzOe3SaL6VDO+UtFyv2Xt0JC6+0D2nQFYvMVz5+jTRFYkuJZmbPWhhJ1+f54q1elTxtTppn89dcJLclE0FYdhXpkLFSwsyvntKNCysqqpmiYkKZFF9Or4YvClGYsC5nsGp7E8pR63xrx0psirgjL8TM6cXi1TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705860335; c=relaxed/simple;
	bh=fbtC6Q16yM39i9qziLFDX3U6yQJwSbW2aeMEiMg3xXA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h+M9H0Q08HMbTKlxogy/Ppk6wsN+GqPl0nYlefZWk/vz3mUEy9hnctP2NVuSMAKSiP77lLXS4UkdRZLfTeBLmd7jdVEgfnnldeFAGr07qmGeS+DLTkEPWGHF2thyT9frhLLHQzZOQlffJeiJJO/zZ5qeuOuJtwpI647GvCeAo+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TVp5vly0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TVp5vly0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C64A5C433F1
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Jan 2024 18:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705860334;
	bh=fbtC6Q16yM39i9qziLFDX3U6yQJwSbW2aeMEiMg3xXA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TVp5vly0wMBliZyLsFj/AgBfeS8JKWfUzcA1zY2Fk8CgYD4lNwdmZDS+8n/+N3As8
	 7iX1d4RPTzZIqOc+Ab3NbdoSpw6POnjTNrhQutCzseQ4fGjd+J/+fqf+QGle2rcms+
	 rFI6FvWoZA+Hnc75DnFfdw7/OTfl4/FRiPRIftJijXtj/1FV/P6CqF/Q9w2G3AuefL
	 DAmJ/YTn5UKHHVrici9nlrpyrDIM1afuPj44OUqNrQ7VZgMLdaDsKSGG9obxe443Da
	 S3xVSDDoj5TvkbM3OR2FvSRPj/Qz3K1lD/tM6RvMh6kfEpgbg/dgpWqip2YI04EcW2
	 gJivcuOeTTksA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A8B79C4332E; Sun, 21 Jan 2024 18:05:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Sun, 21 Jan 2024 18:05:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: dan.martins@zoho.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-g8K8bzxpN0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #21 from Dan Martins (dan.martins@zoho.com) ---
(In reply to Mario Limonciello (AMD) from comment #19)
> Can you please dump teh values from all of these MSR's from userspace whi=
le
> in a reproduced state?
>=20
> #define MSR_AMD_CPPC_CAP1             0xc00102b0
> #define MSR_AMD_CPPC_ENABLE           0xc00102b1
> #define MSR_AMD_CPPC_CAP2             0xc00102b2
> #define MSR_AMD_CPPC_REQ              0xc00102b3
> #define MSR_AMD_CPPC_STATUS           0xc00102b4

Hi Mario,

Thank you for looking into this. I'll try your kernel patch when I have a b=
it
more time. For now, here are the MSRs:

Good state (from a boot when no cores were limited):
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
MSR_AMD_CPPC_CAP1=20=20
d08a2c10=20=20
d08a2c10d08a2c10=20=20
dc8a2c10=20=20
dc8a2c10dc8a2c10=20=20
ca8a2c10=20=20
ca8a2c10ca8a2c10=20=20
dc8a2c10=20=20
dc8a2c10dc8a2c10=20=20
c48a2c10=20=20
c48a2c10c48a2c10=20=20
d68a2c10=20=20
d68a2c10d68a2c10=20=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=20=20
MSR_AMD_CPPC_ENABLE=20=20
1=20=20
1=20=20
1=20=20
1=20=20
1=20=20
1=20=20
1=20=20
1=20=20
1=20=20
1=20=20
1=20=20
1=20=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=20=20
MSR_AMD_CPPC_CAP2=20=20
0=20=20
0=20=20
0=20=20
0=20=20
0=20=20
0=20=20
0=20=20
0=20=20
0=20=20
0=20=20
0=20=20
0=20=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=20=20
MSR_AMD_CPPC_REQ=20=20
10d0=20=20
10d0=20=20
10dc=20=20
10dc=20=20
10ca=20=20
10ca=20=20
10dc=20=20
10dc=20=20
10c4=20=20
10c4=20=20
10d6=20=20
f0f=20=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=20=20
MSR_AMD_CPPC_STATUS=20=20
0=20=20
0=20=20
0=20=20
0=20=20
0=20=20
0=20=20
0=20=20
0=20=20
0=20=20
0=20=20
0=20=20
0=20=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

In reproduced state, where all cores are stuck at ~544MHz, MSR_AMD_CPPC_REQ
values appear to have wrapped around?
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
MSR_AMD_CPPC_CAP1
d08a2c10
d08a2c10d08a2c10
dc8a2c10
dc8a2c10dc8a2c10
ca8a2c10
ca8a2c10ca8a2c10
dc8a2c10
dc8a2c10dc8a2c10
c48a2c10
c48a2c10c48a2c10
d68a2c10
d68a2c10d68a2c10
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
MSR_AMD_CPPC_ENABLE
1
1
1
1
1
1
1
1
1
1
1
1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
MSR_AMD_CPPC_CAP2
0
0
0
0
0
0
0
0
0
0
0
0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
MSR_AMD_CPPC_REQ
ff000f0f
ff000f0f
ff000f0f
ff000f0f
ff000f0f
ff000f0f
ff000f0f
ff000f0f
ff000f0f
ff000f0f
ff000f0f
ff000f0f
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
MSR_AMD_CPPC_STATUS
0
0
0
0
0
0
0
0
0
0
0
0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D



And, when I (re)set the scaling governor, the MSR_AMD_CPPC_REQ change sligh=
tly.
Here is side-by-side. reproduced state on left, and after re-setting the
governor on right.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
MSR_AMD_CPPC_REQ=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20
MSR_AMD_CPPC_REQ
ff000f0f                                                      | ff0010d0
ff000f0f                                                      | ff0010d0
ff000f0f                                                      | ff0010dc
ff000f0f                                                      | ff0010dc
ff000f0f                                                      | ff0010ca
ff000f0f                                                      | ff0010ca
ff000f0f                                                      | ff0010dc
ff000f0f                                                      | ff0010dc
ff000f0f                                                      | ff0010c4
ff000f0f                                                      | ff0010c4
ff000f0f                                                      | ff0010d6
ff000f0f                                                      | ff0010d6

Thanks,
Dan

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
