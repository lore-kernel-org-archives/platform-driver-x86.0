Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF8F3815ED
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 May 2026 08:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779094679; cv=none; b=tUGPPGrsgGj8On0JuYcybpG3fBZQoQ9vZyILqyyaNgem4L89vzAyk8EjQ2Plzs/GLlLfxXbdO/9WRXaatIsnasHsknvPcoH8Y0YRN7Js3N5jl3gW16S76aEFu59Xu8rKvlNGdZ4iuFY3Ry8sfBSH2xzQCHwYrVR0srTyc8hEE7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779094679; c=relaxed/simple;
	bh=4BszEcb6vcx3Jdr4xOJfHGkIZh++F6cyAlpNMJXFquA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HErE6HsgmLtBtPX++WE6nL4IBP/Tnl4wwFT3PyU+VhcI5op5yrcQTDNUs+BiVDRM+GDcBaPRyzI0GgYoYZSEvxJLzhLYi+C/Gf4GRwEWNAPPGzuhabMQim+37LfRnHeGCGZNocofneRLQxCvO7vulmHvucYvqHj/8SwBrd9PVrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFCZ75Y8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZFCZ75Y8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93E06C2BCF6
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 May 2026 08:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779094679;
	bh=4BszEcb6vcx3Jdr4xOJfHGkIZh++F6cyAlpNMJXFquA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZFCZ75Y86QuaB9C0FzfBeYV2z4a52CVaY/gpIg/h9TXh1uDdNJ+DvEt62XIpXzP9N
	 6iGmN/bSEfA5Z82Vrv0agnwxub8RySjJcdUd+mDUWRhjt1wP3JRApCSHxE0GqOQS0Y
	 FfzYw22h548kQ+fUpCQFEt9jy71fHS9mYSr8pOY0cpw+xeUyb+cnLsrtNjDV8FNKpP
	 E8CtbgKaWCkH0khpDjRymEwq6DtYaQy+Q0i0ovtYfIrG+PACm7+QhThhiD9oM9M/NR
	 y30CBhd17VLLSS1g4jyRe1lc6WoyI7pgDBY+BpvRGBz4lSWbFakC/nlfIBSJ3n2T+I
	 7gd7Cgzwj5+2w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 80C4BC3279F; Mon, 18 May 2026 08:57:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221523] [BUG] hp-wmi: OMEN 16-ap0xxx (8E35) - fan control not
 available (no PWM)
Date: Mon, 18 May 2026 08:57:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: krishna.chomal108@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221523-215701-kQSWMO1FTh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221523-215701@https.bugzilla.kernel.org/>
References: <bug-221523-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221523

--- Comment #9 from Krishna Chomal (krishna.chomal108@gmail.com) ---
Hey, apologies for the delay in response. Since fan control is working and
CPU/iGPU power limits are raised, then driver seems to be working. Regarding
the dGPU issue, if you have an nvidia graphics card then you would need
nvidia-powerd [1] to get dynamic boost working.

[1]: https://wiki.archlinux.org/title/CPU_frequency_scaling#nvidia-powerd

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
