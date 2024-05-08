Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE5E82871
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 May 2024 11:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715168543; cv=none; b=FzFA6cc8Ayty07+A0+jrDQzmRg9wSgEUTA4+rA5ciZebl9TdIww50ovYIBhClt4vJTTcUrQRwr3Q5EXrpzvI5DpaCJmG8QSJgnkSnh41XpjPS2NshQoKp6bLAmz4IxZn1QQy9S9KaImZbMP6+sjYuDgPXeugsYPwM5eijuXT0Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715168543; c=relaxed/simple;
	bh=ENmtqGZzW81/Gqz525tru9dNqfCxqgWWnCUV04udGck=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OzCX7vC5U648Fsr7mShG+xPyfUMGo5aHt6sq8eqGhUwnYImzTXw3K0OJYAYH2sskm/lbrXRYFqs9/b6v8D4HSxqqh+Brh8Spej9tROyk3czTus+IHkJTQXAcuQa7g0FG1xU7n+3GSlAprmYnIYoSYhNr4J3Kc2ISuxk9YcgysYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RUePGPUe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RUePGPUe"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED60FC4AF67
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 May 2024 11:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715168543;
	bh=ENmtqGZzW81/Gqz525tru9dNqfCxqgWWnCUV04udGck=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RUePGPUePtlkQl6g0XTz18QsbCGYFkeLEIwjXE/90jM2E1bT3GuJLxPUjsky8j1zB
	 W0rK4C4Jmf5qzLGbfkIu1n638YZlMh44El15Bi5rwwv9KGU8+iG0aZWwQ/mU7W6+R9
	 zlfq9OP0voYhZyeJOqdwPVnWvtDdrDnH80Qhx2JZqjkspjCAHB0gN+z9zx+kuocvEY
	 vlKNXGPm43WdrvpReZmU/yJWpu+bO9a4SPLmeVYfsSxe+lQcBtOuypF0ttPa8x6QoI
	 98vy4jnJCtGkk3XQaI2Ox7wyH7VMxFW4AiB/iiGR+vsOJUHzHOmSu7+bt/38oJm/yl
	 sKGlb1UtPDITQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E091FC53B6E; Wed,  8 May 2024 11:42:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Wed, 08 May 2024 11:42:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: vanoverloopdaan@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-vO1Hx7ewCI@https.bugzilla.kernel.org/>
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

--- Comment #64 from Daan Vanoverloop (vanoverloopdaan@gmail.com) ---
I just encountered the issue again, but this time I unplugged my power adap=
ter
while the device was suspended, which can also trigger this bug. When I loo=
k at
the smn_value, I find 0x017f1201 again (the "normal" value). When I plug in=
 the
adapter, I can work around the issue and find smn_value 0x017f1221. The val=
ue
will stay on 0x017f1221 until I do a suspend/wake cycle, which resets it ba=
ck
to 0x017f1201, regardless of whether I the low clock speed issue occurred or
not. Any kind of plugging or unplugging of the power adapter while the devi=
ce
is awake causes it to change to 0x017f1221. Plugging and unplugging while
suspended does not seem to have any effect on this value, as it would always
reset to 0x017f1201 when waking from suspend.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
