Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9028B38B7A1
	for <platform-driver-x86@vger.kernel.org>; Sun,  7 Jun 2026 11:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780830051; cv=none; b=QV+znntuUowf8lqTFRiTEWquM+gic41yp9g7UC+BKjqMww8X4bYuJ/cyQQSrp/YuyRaW8wtT0pZ+aNGWqh9ocCvP2k7bfzEvBJRx7YU6f/X5LDz1XCCCFQv9e7qm/C/K2SIOrOmmGJzQw8qUfyosSnh50iTxureAh3aAoFRPqB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780830051; c=relaxed/simple;
	bh=fHLWYK6SCE3B+i8XpfwYuLaYM8g9QKsMn8lnGsch+ts=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ABqrZOJ+N6fcDt5r7dOpnLbA0yju3lw5F9wz1xQZ0spTRDE+6aXQN7SCPoYskawksfZ80PWTcdIHL4OikzNTj/h7ezisAyf1Oo+TK+BRGxYDo13qPA7XQi2Vwi6B9uFKBZ05EHdIHG/nWrk21pXWMBst0uNMWrr6km8XbZOLdz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqM1F0Ks; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqM1F0Ks"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4216CC2BCB4
	for <platform-driver-x86@vger.kernel.org>; Sun,  7 Jun 2026 11:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780830051;
	bh=fHLWYK6SCE3B+i8XpfwYuLaYM8g9QKsMn8lnGsch+ts=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iqM1F0Ks6I1dpi+B90itFBzr8lQ4wUg1L0P6urQIcpfOLV+6bwxGvXvcF7MJxSgaj
	 ySgV2B9zY8JoHqpshLI7iXY/ZwL/ThaK8ctHz2SdqE+YiGG1nGuNbHD9YgXO5oa8xm
	 gdvgQ5hnvtH7VLqMjXB6kozC/d1dRYZw2vKKCjCizPqiHPfm52GPG7Dx7C0H72I2gk
	 JYP3tLPWY11aAEEnUR54pd9PCpQnhIrLnf3qWg7vxNT+8N4Gmu4ZJ4oCXyGYegGLGY
	 N6WzHAvFuQMCw0lNfvgHFTjq1Ov5eZYZdK0bNI8w38CXankGAp6YdVoSt9RvkCoK5y
	 1x78dDE+q7zbg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 242DCC3279F; Sun,  7 Jun 2026 11:00:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Sun, 07 Jun 2026 11:00:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: george.stafilidis@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221583-215701-g27FdNfHxO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221583-215701@https.bugzilla.kernel.org/>
References: <bug-221583-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221583

--- Comment #41 from George (george.stafilidis@proton.me) ---
By the way, is there someone at Lenovo I could contact to ask what exactly
causes the keyboard to switch to the =E2=80=9Chigh=E2=80=9D state? I believ=
e Lenovo has started
supporting LVFS, so maybe there=E2=80=99s a way to get more detailed inform=
ation or
firmware insights through them?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
