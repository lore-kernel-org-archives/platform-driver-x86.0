Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DF62DC76B
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Sep 2025 16:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757782757; cv=none; b=fwTYrZUxWaT5nOxm7PT4nBU9fqnG6TUo0FNgGE/Q0oqbyf3JJOIrDA/3NUf3V1nYRg/gBaRfPFfIJGSmjlyQf0e8DN8a5YmkHSzSZisXQodLBc0rB1NdFZi7u+sQUQZOX525DozbxZgMg0NQ0PWlP8ZKftzJBr1wdgXJ62ssWW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757782757; c=relaxed/simple;
	bh=6Hov/PysGVOuqx5SFM85N8Q/CpMgsFOfpi4XxtoZ1d4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fNdmvxTq5S81o4FsiGosGcuc3U3yU2Xv/nQ5lJrjl/LzV7ImpQhc5F1/9pLufsWJ3TxCL2Zh8lymnXjyROPPov1uFikwC6bT2I31cO3jJPXMmHVZSNS+hGRu428YbR4cGWkbj3jSwQMMQONIVDo622bwaRsjKjlBNM/jWSFddyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ig+jnhd3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ig+jnhd3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7470BC4CEF8
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Sep 2025 16:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757782756;
	bh=6Hov/PysGVOuqx5SFM85N8Q/CpMgsFOfpi4XxtoZ1d4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ig+jnhd3eRd9gXYqF3Z8FYfuZLU4g05yKJrqcVZba0mo1dI4gps43jhi9aHZ5spTG
	 05YBPr73585sJVLaU3lTe10F+Zjkg4vOGJDhcM/fByHPy2YQDyOivUCzzpT/owfhCi
	 vUo2FT9+z3VqstVYJ8KgbFn8SqLxkDBeZTH9z9BwneL40TCAeh5SJWHV8fjogSXfMk
	 Kpep9M8T+Ek3We1VYh9Ti6YO4ts35Dv2OtjLrmt7sS0WkWaLPArj9FEIcslsb9fpT2
	 eDytFjzR31MMdVh4547ULj5tuWcZxk+9lnQ5ijkiuS/VUUy95c+EI26E/CyzokEbqi
	 ukryB6Qqdkosw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6E22AC41614; Sat, 13 Sep 2025 16:59:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Sat, 13 Sep 2025 16:59:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: marciosr10@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218305-215701-L8fQQXrLuB@https.bugzilla.kernel.org/>
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

M=C3=A1rcio (marciosr10@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |marciosr10@gmail.com

--- Comment #111 from M=C3=A1rcio (marciosr10@gmail.com) ---
(In reply to Mario Limonciello (AMD) from comment #101)
> Those of you that can still reproduce this, does reverting
> https://github.com/torvalds/linux/commit/
> 4dbd11796f3a8eb95647507befc41995458a4023 change anything?  That commit is
> correct so we wouldn't revert it in mainline, but it might give a hint th=
at
> there are multiple timing problems.
>=20
> Please give it a solid shake out (at least 10 cycles that you unplug power
> adapter during suspend) before reporting back.

Hi Mario,

I tested reverting commit 4dbd11796f3a on my HP Zbook Firefly G10 with a Ry=
zen
7 PRO 7840HS, as you suggested.

Result: The problem was resolved. I performed the test cycle more than 10 t=
imes
and the CPU frequency scaled normally after every single resume.=20

Before the revert, the problem would consistently occur during the test cyc=
le
described below:

1) Laptop in use plugged on HP charger (any power profile)
2) Close lid of laptop
3) Unplug HP charger
4) Wait a few seconds
5) Plug in HP charger
6) Open Laptop - See that the CPU is stuck at 544 Hz.
7) Unplug and plug the charger makes the frequency normal again at a minimu=
m of
1101 Hz but scaling normally.

My system details:
- Model: HP Zbook Firefly 14 inch G10 A (SBKPF,SBKPFV2)
- CPU: AMD Ryzen 7 PRO 7840HS
- BIOS: V82 Ver. 01.09.00
- OS: Fedora Silverblue 42

Thank you for your help.
M=C3=A1rcio

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
