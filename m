Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB62308F16
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 Aug 2025 14:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755873268; cv=none; b=CTE2cmBlXYlq29nbkC4nPfnRPUaY2JZTcGY5VrGInMOg1qJC3rNi/2Gv+B3DOpn4Wylr1wi7vhxe6SwDWjCg3x3tag7o+LBs1FVSVlLtBaN8LuQpDyWppZWI5ndxn/eqeXsbk+nWtBJl+2dUCF+QC2JsUzmSPLMB4IWaXLwvMVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755873268; c=relaxed/simple;
	bh=k5yrYJssbIk3ZHTonj/gN3d0mWaUN7rJPzQpl23H6j8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bmaJkd+UZXxzA+dpS0WtVNQuqw/3WlHGVtZZq59SSqwll7e/imbR5v2SDfz2XSedeuiF+8FhbDnp1RcC02Hy6eQu2fpKp6Bhrt8dOjpKjCyldA7L73M7/EYWoxVu3K423TJ8yB3XjSDO2pgAR3vO+MKcSVImQWIvZAUwsK3L014=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rVcRBleu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rVcRBleu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B96B2C113CF
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 Aug 2025 14:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755873267;
	bh=k5yrYJssbIk3ZHTonj/gN3d0mWaUN7rJPzQpl23H6j8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rVcRBleu28QhqmEYXcwHm5ZLbLRctSg9A5k5E5BRVWAe3J/OAk1OiD8WeLleVNmhT
	 yaKwOeiMC9YVYiqXIqe7c7N+YeVwSmYpAfwLZ1X2356UH9tP+HojDpxXDhyGO7bgmc
	 7gIB3HzkBxnUd4fJtAkaP2hpD9Lf19Wb2Rkw6ryrEmZrVkEuVapW0fs5Y3C9nmuhJ3
	 /l1xVhXyJVJVcoEuRWSprTmnCjp2KJjblnEVr382bk++buCNJUoy9365rKT57pMrAD
	 Mqxw8+r1JR+ONrCWxV/enyi1yuUqrPdtqL65xymE8FDODI12QG6e6Jn+wwo8JaSmNs
	 wgYVrUs3He1zQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AC296C41613; Fri, 22 Aug 2025 14:34:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220473] Linux 6.16 doesn't let me to shutdown the system and
 sometimes to boot it (lib/list_debug.c:35)
Date: Fri, 22 Aug 2025 14:34:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ilpo.jarvinen@linux.intel.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220473-215701-xd6k8FGAnj@https.bugzilla.kernel.org/>
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

Ilpo J=C3=A4rvinen (ilpo.jarvinen@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ilpo.jarvinen@linux.intel.c
                   |                            |om

--- Comment #7 from Ilpo J=C3=A4rvinen (ilpo.jarvinen@linux.intel.com) ---
(In reply to Eduardo Medina from comment #5)
> Sorry, but I can't reproduce the kernel panic intentionally. I didn't see
> any clear patron to do it.
>=20
> But I blacklisted the 'asus_wmi' and the 'asus_nb_wmi' modules through the
> '/etc/modprobe.d/blacklist.conf' file and now I can shutdown and reboot t=
he
> ASUS computer normally through GNOME.
>=20
> Through the openSUSE Bugzilla I was linked to this. I don't know if this
> related to this topic:
>=20
> https://lore.kernel.org/all/07815053-0e31-4e8e-8049-b652c929323b@kernel.o=
rg/
>=20
> https://bugzilla.opensuse.org/show_bug.cgi?id=3D1246924

You've acpi_register_lps0_dev.cold+0x13/0x1c in your trace above so it looks
very likely the same issue. I'm hoping Luke responds in a reasonable time a=
s he
has been too busy for kernel work recently.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
