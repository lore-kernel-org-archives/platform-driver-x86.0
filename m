Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F0063A6
	for <platform-driver-x86@vger.kernel.org>; Sun, 24 Dec 2023 15:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BOL1yfAC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 742F2C433C7
	for <platform-driver-x86@vger.kernel.org>; Sun, 24 Dec 2023 15:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703432245;
	bh=a3lIW1wfOA8ak6e7ub8w+zL3Odv5WWqSAjcMt8p9kco=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BOL1yfACW8Xdc9z1+oZPQECreos7MrSZKBHf/0m4nVLbE3EJ2CcAxHaVKZle1elGx
	 dmgNKrgmfkUsqwZhgq/NxU0mH8SrssD+Iagprh44kyB1io3kjsMk8DUP9DYamL2I2x
	 rE+RMRRzh3SYt+fJqT9S08+CtP0QS0aglXfSGkb8nFJrqXblqm0qc9VEu9JP1Z5FvI
	 1Bdmoiwh+7MB/rXpuj/XU5WWil5pHT/4KJQo3cmoeD3MsllzxBaOnbU0ne74CCk9WE
	 4O7igWNzd0xAWyOO8SabtL1ucJ7CpdffDGHEWunWPuQPq/B4lpidk/cuAxdkVZHcSr
	 l1BsRZF6uLHxQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 55CCDC4332E; Sun, 24 Dec 2023 15:37:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Sun, 24 Dec 2023 15:37:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-Wdvsh1MxRJ@https.bugzilla.kernel.org/>
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

--- Comment #4 from Armin Wolf (W_Armin@gmx.de) ---
Could be that the firmware fails to properly restore those values after
suspend, does the issue also happen under Windows?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
