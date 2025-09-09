Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD172309B9
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Sep 2025 13:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757425176; cv=none; b=r3L9r+9wVXv8HrYAgAwr1jCY6x43MaYNibr+j0Gs4LujHwpv3U3f9RzI1wifK9/KLTmMd7QeJl47Yyv2CY7GzJFk65JIU/ZcxeoqDyzuzbArn+qJjRieRMnpdTcHLpb2kEMhayzp3kTUInxq7hi80L0J7w8prp5W+Jd+wJLeB+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757425176; c=relaxed/simple;
	bh=QrW+9Qxh5h5F8LtXOBe9yAxBlhPJtqdVC5rELC0gW5U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iMVKnspM2okf8Zyr3XB4wo+8fi/RyGjJuV1sv+FpXqZXdZx0hbF0+jw1JmlB2GFbVk1UByu1UXh0dBek9vFRXuK7aWd4bG6nWKQawEE8dP65rUz38IWrrwN/3euTayuR/ECNHTO5YB9H7skD6RXPVeVL+DFuUOUKlUxfj7VCauA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TykTrqbA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TykTrqbA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25559C4CEF4
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Sep 2025 13:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757425176;
	bh=QrW+9Qxh5h5F8LtXOBe9yAxBlhPJtqdVC5rELC0gW5U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TykTrqbArmDWjZRlrwDZ8eBR+7+omlRRVlIvyWcjkq4aPp5D6PL+BTfa+iFBlj1u2
	 Z6tmQB3wSosK0FW+3D1sKciP0dRE7yl9PS2N4dX714zbsKVkRdzm8Ci1PT1VeaacAo
	 3mKQb002kDDzcc3CdzQa8fskNa/A07QAnbjajiXKeQDJ67zH9aT+uwkmtBxNUlE4ku
	 YT2QPvRlt26xkc4R9DumdZE+dZI4TXpjnP4FHlxVGIw+Iq/Wh+Ol69+Za7LfxboVEc
	 9W4umRWNM2d1tU0bWsM4N+amPEPomI0DHsovp2SFVm2CvSC4YKG4dNseIG/e4eejuf
	 xg/lSE0WjU2+A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1A17CC41614; Tue,  9 Sep 2025 13:39:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220473] Linux 6.16 doesn't let me to shutdown the system and
 sometimes to boot it (lib/list_debug.c:35)
Date: Tue, 09 Sep 2025 13:39:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: binarygator@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220473-215701-ZBiGfVty3z@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220473-215701@https.bugzilla.kernel.org/>
References: <bug-220473-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220473

--- Comment #10 from binarygator@gmail.com ---
(In reply to Mario Limonciello (AMD) from comment #9)
> This commit should probably help.
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/
> drivers/platform/x86?id=3D5549202b9c02c2ecbc8634768a3da8d9e82d548d

Hello Mario,

I don't know if that commit is part of version 6.16.5, but I got that update
today on Fedora and it somewhat looks worse (but it may just be my
imagination!).

The lib/list_debug.c:35 bug is still visible, and after a bit the tty starts
printing orange stacktraces without ever stopping or reaching GDM.

I tried to build a kernel from scratch but I did not have much luck.

Thanks for taking the time to answer me!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
