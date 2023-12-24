Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF6710F8
	for <platform-driver-x86@vger.kernel.org>; Sun, 24 Dec 2023 07:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCCXucf3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80C66C433C7
	for <platform-driver-x86@vger.kernel.org>; Sun, 24 Dec 2023 07:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703402835;
	bh=hELWWdR9YblENCdVKd9k/Y4bluXdWxRWK49y2a5fI8Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PCCXucf3Y4+bo+bdmB4Po5jQ7HW1zmP3AfLNSw+Dcg0g4ajUhbCuDDHqtqZoLF6+Y
	 Oe+sDoA1GiKx2A2KSvmTucPiJM8WZdEUMPplXTtvpEzqYL7gMI44ngyL+DMc/mMvfw
	 fr5YdhsKXUPnbFoR+hv1lBoYVlcKk+ENuWrJJBsM5drBc3VF6+XGLY8tLY2Eqf/KkE
	 dnahJjwnHVMTY/vbB7jMoiuadBbc5/9neycDHpAmbmVRXWzDWZuDQxdR/v9brXqF/N
	 He14NYW7njGG2qhdF7RXQRbrm+UI6jCm7mLZCGkMoGiQZ4lxVOOXYfHORJPi+exFx3
	 yrwjRRP+8R/xQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 628FAC4332E; Sun, 24 Dec 2023 07:27:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Sun, 24 Dec 2023 07:27:15 +0000
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
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-218305-215701-zCqdDVdlA7@https.bugzilla.kernel.org/>
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

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |6.6.7-200.fc39.x86_64

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
