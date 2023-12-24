Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA501117
	for <platform-driver-x86@vger.kernel.org>; Sun, 24 Dec 2023 07:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lIcwHndH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10E29C433C7
	for <platform-driver-x86@vger.kernel.org>; Sun, 24 Dec 2023 07:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703403039;
	bh=MkmW+g6BRS/VlVDCorMkvoHYSJFTLaED7QDY18NCgfE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lIcwHndHAsLvOH3xGh8QYRlippEUTIt/D3YMSI+INK7h1rxTRI18pku9+34Otg7LV
	 qpdTz+eNIKWYD/uvCD0xeM4XVmOSUnNmdbOWGf3rt35EpCabw8lpVmjTeH2Y8wjzUc
	 6sciTaJRI5Fu2Hwg2wt3LHIg5unNLDpSRdBGWPxeoIYzvp8QI5VlRbiQ7skRrnZq+q
	 a5C9fOnhs0r6UIv8JoDXvQ7MA5rVB88PWvvyY/hWf9BSWQLZ9O0D9aXk2MDEsUAT3G
	 4/8vxt4Hbp/iwNCtcQD/kwA4D6zYWla8TtMVjLSCmwepy+5z/iABDSuxMvvIccte7z
	 DHdu7hogOprVg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C77F3C4332E; Sun, 24 Dec 2023 07:30:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Sun, 24 Dec 2023 07:30:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-T2QoJSJT84@https.bugzilla.kernel.org/>
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

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
I do use this command to constrain CPU thermals:

ryzenadj --tctl-temp=3D75 --stapm-limit=3D30000 --fast-limit=3D30000
--slow-limit=3D20000=20

https://github.com/FlyGoat/RyzenAdj

Perhaps on resume the firmware sees altered limits and wreaks havoc to
everything.

These last three parameters suddenly become read only after the bug occurs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
