Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAB626291
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 06:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712729417; cv=none; b=oE0+9bsx5jInUZhVBpWk9Y464ECvtJJUkNMtprNwewTe+zfK9bD69Ezcqvx3mWXdjO66yFYMhGVc4DPnBnKX9rRvrSYoToRC4IeYz75KCRIS6DPOr7gmnO33EpD2zkEK26gwPsFPHR39IDPUwTYzdUJFvGZJlPGI4qkx2F4wu2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712729417; c=relaxed/simple;
	bh=oOV9/9TRFYBKgp2uQhe4OG67sK81OxNsPjaIyusPJfQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OGHfShGhWVyc9k+bjuZl9R0BT80IizUdQ2XytCRUiE10MlG6XXwcJvF5t8fZoqng1O+M0fJedC7Puy/dmaOewPp0zxbPuTONZpQocbgnBSyfZhUNaxbBishBOrHBIUZfC3pcYziMLnIR8cl7JHISnq3fYIqGGkuLpRVuoiUZxEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YTmIUAX0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YTmIUAX0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B04B7C433C7
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 06:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712729416;
	bh=oOV9/9TRFYBKgp2uQhe4OG67sK81OxNsPjaIyusPJfQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YTmIUAX08iG/aLJM/pbK8ckeaqoU8cgPFIDZ58MHsnua+/3cXfUPw7rFoIjojy9ID
	 AdXRxGZxMLXXuC4Xxs6hqxq+pm01BC1IUlLK2S15OCIx4TH8MGJf3uTsfBfDmDzFWy
	 bW8DtQdlcDxZ5uu43I9704sK7EVmi5bIssXw/v4Ilp601fp+saxybRe24uBoedd34b
	 kazPEZNQkLLOiL2GtWtN+YWi0P/apMaTZ5bACogIom8O+SXoUyQ+FiOrr5WbHF2xgD
	 pwmZdlDFuNPwlCxzGZpr/i7ZmDNqUkcyw8JHZMfhlcJ4/RI1m9nyPm0GxcWZgQixYX
	 4y18jAZUZ7efw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A9129C4332E; Wed, 10 Apr 2024 06:10:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Wed, 10 Apr 2024 06:10:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: al0uette@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218685-215701-wSecWDf8qv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218685-215701@https.bugzilla.kernel.org/>
References: <bug-218685-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218685

--- Comment #22 from al0uette@outlook.com ---
(In reply to al0uette from comment #19)
> Oh sorry for that, here's the new result(amd-pmf)
>=20
> [low-power]
> sudo cat /sys/kernel/debug/amd_pmf/current_power_limits=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> spl:45000 fppt:65000 sppt:65000 sppt_apu_only:54000 stt_min:0 stt[APU]:0
> stt[HS2]: 0
>=20
> [balanced]
> sudo cat /sys/kernel/debug/amd_pmf/current_power_limits=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> spl:45000 fppt:65000 sppt:65000 sppt_apu_only:54000 stt_min:0 stt[APU]:0
> stt[HS2]: 0
>=20
> [performance]
> sudo cat /sys/kernel/debug/amd_pmf/current_power_limits=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
>=20
> spl:45000 fppt:65000 sppt:65000 sppt_apu_only:54000 stt_min:0 stt[APU]:0
> stt[HS2]: 0

This result is also taken with power cable connected

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
