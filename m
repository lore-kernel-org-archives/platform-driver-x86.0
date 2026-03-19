Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DA930FC1E
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2026 17:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773940991; cv=none; b=gJ1hK0lxUYcV7HITmx+mOWTILhw8vEEow46yWjpWskrMwxcaKk7h2GQpz26RilSEszD3P2vSqB1gxuyV4w7coIch2baTyY5wkBmXnVZNPmIcX19vEvdnXdmrw2pQFe4JuX8X7gsaxhXVgg1D4WiaGWLK0fXBGwnip5Bzpzff+zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773940991; c=relaxed/simple;
	bh=vtkv6kowRCAi8EqHVCp1moxwVHmFtvDCCo7rUUKEFFk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rOMjktSKRDdLBej5UoeTp2CZ5pjN+Qjh9A5eSsOs6jLraMhrAzVWqyJefF2vMB5BlLAB3DpTBf0zDRIlj1N1M3romXDyaFY0TBlWCKdPM9k63QrsQaEnmWOGZPrMC1lwFQAYKOH2YMpNO+OZKnPgy1Ot5OgAZB6wpniLY5OSPIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lz1clQX3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lz1clQX3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82ABFC2BCB0
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2026 17:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773940990;
	bh=vtkv6kowRCAi8EqHVCp1moxwVHmFtvDCCo7rUUKEFFk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lz1clQX3uyLFev5WRSICyoJmaB++zf+gXVBsPLFKoLjJlPCoy3ZRMpiD80Ca3sJMt
	 grT/0w/fd9kdigZs7yZkSg0S+jkVpPevwOfzTolA6cieLBvREjno5q4cigqBEUtkQy
	 A+oxQ2lGA1Px6a+1TSwxm+SIw98XHj27zwOC6yj+5kZyUg4PUwf3BgZ3cerxmz5jdm
	 Ikpv0HTiws5Sg/b6Nx6Pso0VnzXRZbS3xcHCWFPFOsFHwUaqoPf088Ey72HnVGXSKU
	 k6o3RIPZ7EMInA3Hx5Q+i1EyJ4EJvIeIp7zAUo9a0K2H1sUsROHS7Kgic8SGgF+fyw
	 WjGk/ZjR4Qh0A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 701CFC53BC5; Thu, 19 Mar 2026 17:23:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220473] Linux 6.16 doesn't let me to shutdown the system and
 sometimes to boot it (lib/list_debug.c:35)
Date: Thu, 19 Mar 2026 17:23:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: reanimation-lp@yandex.ru
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220473-215701-vET8iSlfPG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220473-215701@https.bugzilla.kernel.org/>
References: <bug-220473-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220473

--- Comment #14 from Artem (reanimation-lp@yandex.ru) ---
(In reply to Andy Shevchenko from comment #13)
> (In reply to Artem from comment #12)
> > Linux fedora 6.16.9-200.fc42.x86_64
> >=20
> > LOG:
> > oct 07 11:42:05 fedora kernel:  slab sock_inode_cache start
> ffff88ae0cb25480
> > pointer offset 8 size 768
> > oct 07 11:42:05 fedora kernel: list_del corruption. prev->next should be
> > ffffcf5a090abb18, but was 0000000000000000. (prev=3Dffff88ae0cb25488)
> > oct 07 11:42:05 fedora kernel: ------------[ cut here ]------------
> > oct 07 11:42:05 fedora kernel: kernel BUG at lib/list_debug.c:62!
>=20
> Have you tested v6.17+ as pointed out by Mario?

Not relevant, ram problems.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
