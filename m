Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71719155C82
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Apr 2025 18:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744656347; cv=none; b=ZqJVULb3TolnlYH2RIwpZ8wxgXzkQE20NBSBXojBw6I0fN6RaCXuxxx9spdSS7Q7KmYJBehzcZFTVdvkLrYnSQ6BkJxD0z9PprixWlr235ioyCNHpSdrufR7CAAWZlWjonjAsEpmuAvf2/KTtVOqSm7ar2MXt7r5BshuYcJ8Yvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744656347; c=relaxed/simple;
	bh=6vTiu3mgQpZQZdpPq36LOLKFR1gf5/nQC3fi7b9ZexE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bGXbc9dAOFqNwU2HhqO4CbMxENAtr5tLvxmVq2tuvOf2j9wnJaU3QhpinFrD4+hdrp2Am8F6XJlqN/ZiF5+f0gqP8YaI4Y5PKHrT039dcDwxApYKpGPX65K5cuA4MSnwK6xb5lP2BuaUsPlAGcUGQk6nrldhyAtS7jBhxr9r6Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MfOx/N6r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MfOx/N6r"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D482BC4CEED
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Apr 2025 18:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744656346;
	bh=6vTiu3mgQpZQZdpPq36LOLKFR1gf5/nQC3fi7b9ZexE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MfOx/N6reK/pvff65gUnrVMZxPiAiccrvEdobJFc50DbJO9B/DgyOL+LxGrCroIro
	 3CQEUw1DHfbUD5kQ8G5UIbYYVHkTmMNu+FFDj1IfS7w+9y3DGBUOiO0msgwu/TJWM4
	 uNdYxrMdwMNqwk0xXnfcbkFNq6IthCSXC9zo9e96iyctCCpbjfozKFGAD3mgxeaGDk
	 3OGSo2eB+946sCGypNCSOAY1wG5HU26iJmZGJWHnBYIkiXLJ77zuaeagRmJDNWTrGn
	 EokmyfWVtqWoRvBWhjexLESkt4tOo7+CC4FKX/gILV1kX+7LPvCYc//jPL/YFDqIb6
	 eccUgzogaAHew==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C6E81C53BC9; Mon, 14 Apr 2025 18:45:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 14 Apr 2025 18:45:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mail@dmewes.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-m3czcrPwig@https.bugzilla.kernel.org/>
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

--- Comment #92 from Daniel Mewes (mail@dmewes.com) ---
Confirming for the record that I haven't noticed any adverse side
effects of the 2.5s sleep since last Thursday. Battery consumption
during sleep doesn't seem to have meaningfully changed either.

Looking forward to seeing this patched in an upcoming kernel release.
Thanks Mario for the fix! ...and Artem for raising the thread here to
kick this all off!=C2=A0

On Mon, 2025-04-14 at 18:27 +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D218305
>=20
> --- Comment #91 from Mario Limonciello (AMD)
> (mario.limonciello@amd.com) ---
> Here is the submission for 2.5s:
>=20
>
> https://lore.kernel.org/platform-driver-x86/70dfa642-4c97-4aaf-aa79-70127=
974f03e@amd.com/T/#m174cfe2f4ec5893e39cff6994a93ebd499ec29e7
>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
