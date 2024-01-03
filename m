Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0671841
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jan 2024 00:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N3C0c60r"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15016C433C8
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jan 2024 00:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704240203;
	bh=JzZFHDqBNVDCiWjINI+ThCmcI76WGemQ6lFAZCCRtJU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=N3C0c60r9/emBGoZZ3pqCA4rp2W/2UuMyxUUVhyslF5WYZdzACq7ve3HKZRnW+pU+
	 yJnhkWM9lPdOcBYUvH0YiPAk3KozDe+EXT0ZnsRedJNPKMMdp6lafqoqtdT9HHIBdr
	 vey6bO2q5hkzNGKioirJdBpe4fK1P0DkCst+LDWlyTUikjCBPN1OHSmEFCPQr2E9uu
	 cv2TKyEtWUIeXHeTPj7New5//6xWJJO6XuUMCfik3h3iFuzqL1WD5Z6zlGdsqlVyrj
	 FgR5lRhTJ8bMqYtc3ltQp7/oX/O6xCnEf4SXdXNqbZMlwwKQIjfFXc+8oAs/e4p9de
	 72GUmYlI2ETjA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E9374C4332E; Wed,  3 Jan 2024 00:03:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Wed, 03 Jan 2024 00:03:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: dan.martins@zoho.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218305-215701-nL2fl76mm2@https.bugzilla.kernel.org/>
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

Dan Martins (dan.martins@zoho.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dan.martins@zoho.com

--- Comment #13 from Dan Martins (dan.martins@zoho.com) ---
I am seeing similar behaviour, to the extent that my CPU cores get capped at
some low frequency. Sometimes it is a few cores stuck at ~1600MHz, and
sometimes it is all cores stuck at 544MHz. It typically happens for me when
rebooting. I tried suspend/resume several times but could not reproduce that
way.

CPU is a AMD Ryzen 5 7640U on a Framework 13 laptop. 6.6.8 kernel on Fedora=
 39.

We may not be having the same issue, but I wanted to mention, I can get all
cores back to normal by switching the scaling_governor from powersave to
performance and back in case it helps in your case. I am using "sudo cpupow=
er
frequency-set -g <GOV>" to switch it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
