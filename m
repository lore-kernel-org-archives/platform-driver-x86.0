Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2550D35F5E7
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 18:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772648973; cv=none; b=Bp7b/cIABoxdgJ4NNQfHGgq+SvR3H3+BmJCgb1pYrTWAbP0e0eKf0S9Hq1Dpb+deIkebcGbVyoInW21NJWcQEQGD+qVPH9UWyEGtyklP+HJcMmL3pWU+k8DRff9g4B7EEvXUNHTM6kronq3pMreGqGzlphbOajOsONLWY8B0u5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772648973; c=relaxed/simple;
	bh=rsQZ/Wp4lAZyMwGTQ/b564ooVutmps4slxMPeBdh/JQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UlvWl5bWATiHjoCtqtmiuZ52+D2CRRO8tZjoC+ujDx60AubXxsCz0bG3mPmQnTNjFZ8MNGKfbxSffWVOiY2/hDVoYyi3O75OCrPuQGMzz9ji7AdTeViJFETdjorFpyZ0D2BTZShBwb4KO/t11LZiQ13SAl4UipNVCt8DM4M9CBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fczogevP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fczogevP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 007B0C2BC86
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 18:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772648973;
	bh=rsQZ/Wp4lAZyMwGTQ/b564ooVutmps4slxMPeBdh/JQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fczogevPWXFlcR4ACyiOdEibhvcweoG4QYScxQOKsEVdlbh8zqgUE0oy7r+ZMR83F
	 BjGuH+k01eN+wKQQtMnkmACsiqu9Uzq77UPRC1d2IJKxWFLWZral0lmwXS8TcTztZL
	 fEx0CYUbBdg94YMCFamcX+LowbLcd1K060jtJsOQip+SFjAMaX3RDoeI49dJIIK9Tw
	 8PqES3yWguTW0VJVv85wA05TP2JtnAQTTEWEHDfW0f21ofhB8rPFoz5TkeVlDxmZCQ
	 WInS1zVZb8xgjLKAyfCDdYmUSc+B1H+iAfBPYAV3bovP/2ax+/VElA2yIGRtocveQu
	 D6bib7A31+g2Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E074AC4160E; Wed,  4 Mar 2026 18:29:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Wed, 04 Mar 2026 18:29:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: team@nitrosubs.live
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-XFGpeHC1Ar@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #49 from fililip (team@nitrosubs.live) ---
A thing that I noticed over the past few days is that while the laptop is
plugged in (before boot) and in conservation mode, no errors are present in
dmesg. Only when I try to view/change KDE power management settings or
unplug/replug the power supply does anything happen (like ACPI errors or the
ideapad_acpi charge type duality issue).

I've also seen problems with delayed responses to unplugging the charger
(though plugging it in seems to make the OS react much faster) even on 6.18=
 and
prior, but no ACPI errors were ever logged to my knowledge.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
