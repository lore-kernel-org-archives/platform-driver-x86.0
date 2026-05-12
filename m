Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC4239769A
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 09:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778579275; cv=none; b=EN+ANAPgO7PBQve6Pa1kcqWHECP3dEQHI48ThEgWNHxwAWKBualDCsl5oWtOLvfypH8fzKAbHjrCJInTkDPXSSlE5WMGJ2HyVbYH18KZFms4bebn1rrCcHe2nznyszS/NZCL119VhTM3ce16visZit6cxzNzGWN7LtTgcNEkeMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778579275; c=relaxed/simple;
	bh=XFIMY4Ox7luxP0r8VhgXPv9w9Ir0ujjS4plm1uWy8Fc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GXe3MH1KDeoV67Mem+gVc91TYQBHCDUKFWaoFAHTqBpRQ65Hn9BA2o9+X63+1uoFITW0qO06C6oUkpxDVqCsVwY+FVMhEWJC05sje3GyKAZzOhgtMUs4GE6DMdBHrOa71OUGbmg9w565S4a7H8jutmy/hjYUsS9UMWfENHetHng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQehAX4/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQehAX4/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC1C7C2BCF6
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 09:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778579274;
	bh=XFIMY4Ox7luxP0r8VhgXPv9w9Ir0ujjS4plm1uWy8Fc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OQehAX4/oB7sLU36LzTkhzr3CjNiCgETE/CJJVb4U03CeYLsEQJ7ZBt6oESih3jf0
	 wb7DsLtXZOQvg9XpeDqNGTOY+YwXDJDJ7uVxHb+SGazHri9pD9JJLZVchxSEK3X/Zx
	 v/9Z36PJjN+skktL/D7ludJyncOzU2GgLNTmd04RJp7PjQApX11z6Jkld9zF8xg2OV
	 N9EvGo8PjrVT1/XHNbD2jw3njgvhvjXTDuUGP5EKooRkfdt1DIyltACEYKgZT1ceoU
	 I3ZdQM+fY3T8HPVIN9x/A/pbvxiduW0ERg8RUtMWtSsZHmUw5jUlExOcIegdVT5Jw8
	 k3ccnnrufjY6A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B426DC433E1; Tue, 12 May 2026 09:47:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221430] nvidia_wmi_ec_backlight: brightness writes silently
 dropped on HP OMEN 16 (2025)
Date: Tue, 12 May 2026 09:47:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hansg@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221430-215701-XgVEFYba4T@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221430-215701@https.bugzilla.kernel.org/>
References: <bug-221430-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221430

--- Comment #8 from Hans de Goede (hansg@kernel.org) ---
(In reply to floquimaurice from comment #7)
> Hi Hans,
>=20
> I added acpi_backlight=3Dnative nvidia_wmi_ec_backlight.force=3D1 (and
> nvidia.NVreg_EnableBacklightHandler=3D0) to my kernel command line.
>=20
> Here are the folders that appeared in /sys/class/backlight/:
>=20
>     intel_backlight (max_brightness: 192000)
>=20
>     nvidia_0 (max_brightness: 100)
>=20
>     nvidia_wmi_ec_backlight (max_brightness: 100)
>=20
> I tried echoing different values into the brightness file for each of the=
se
> three folders. The commands were accepted without any errors, but the
> physical screen brightness did not change at all.
>=20
> I am just reporting the facts here. Let me know if you need me to run any
> other specific commands or tests!

Ok, so this is not a classic "which backlight driver should we use" problem.
But rather some issue with one of the backlight drivers.

The 192000 max-brightness for the intel_backlight looks suspicious.

Assuming that the LCD panel is indeed being driven by the Intel GPU and not
muxed to the nvidia GPU then I would start with filing a bug against the i9=
15
driver:

https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html

What value did you select in the BIOS for the hybrid-GPU config ? If you
selected discrete only instead of one of the hybrid options then this more
likely is an nvidia driver issue...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
