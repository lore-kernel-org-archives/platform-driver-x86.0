Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5385ECA
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Dec 2023 01:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OydZ+xBR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 558A0C433CA
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Dec 2023 01:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701651823;
	bh=LQEewxZ+b+xA0xAA6B26bFawa6WwHzgETLYD3k/NkGA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OydZ+xBRKA3lfd5xEZ4oL2GFqCJVk9UTVeHuAT5J5WB2VaFNh6ILvqh2MFwMXg9M4
	 egcRXdqK02kX6YX1npifpFsQATf9Q/KPr2seSj5cC2H/JncbyB3TQmUMyM45uISwxK
	 jaPhxOI6nYE+HtIm0qn9yikEXUM0Exf8nHmXqnQRbJIsm39YNUrYpUqM0WUCP8APgm
	 +Z2a1OjEIorYhnaOICIiHBdVXxgZpbaS4RSMwpApvH6PrAdM14rQ7EEUvRqGcyVlml
	 F/VYbxVWZ1pb0hKj1gODF5rKpnhgM3WGh8z3JdCrVENDG+uz8RvoMqOyYudLoKQTL+
	 oOmXAqJbzcJ6w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 43BB4C53BD4; Mon,  4 Dec 2023 01:03:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 203191] The fan speed reports to 65535, despite the fan is
 stopped
Date: Mon, 04 Dec 2023 01:03:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: antony.gelberg@gmail.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203191-215701-pAYpqcPLme@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203191-215701@https.bugzilla.kernel.org/>
References: <bug-203191-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D203191

--- Comment #19 from antony.gelberg@gmail.com ---
Okay, final one (oh that Bugzilla would let one edit comments).

About the above, I realized that the discrepancy in
ucsi_source_psy_USBC000:002-isa-0000 is because the PSU was unplugged in the
second sample.

Also the GPU is now reporting temperature again (not sure if this is relate=
d to
me reconnecting the PSU).

:shrug:

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
