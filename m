Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA3E27A462
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jun 2026 17:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780768293; cv=none; b=BRNHOX9pyYQsx/B2KC6vjhEIPXIgDP6hne1stj0sRhGLXrWhpV7nvMWLKx3JpyHhWMv7Uwxkomh9NZNQLwi2fRq44GsQ89tmkZX1N3AV+UtqCahJ2Ka8vYfhCDTBOkBbKwqXQ8fDuY8nVYU6gSenNFRnzI0K4iA6F1ITK0N43Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780768293; c=relaxed/simple;
	bh=Ua0fxrzG/Lgr2Iho27h/z/Tr3xDvBjviI4ie8K/1mSs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tCvpvTOAaDdwQ9EKLgl6J/5kvPGg3tW8bOgIxl0GnqqEvClxXZ++fm4vP0gKR3VmgX3JP7NOyhrY60CXdv5nQjWv2t82uCK4EiYMSQeHAuO8x4+IxCfK++Gzu+pYR2caA2MHoYtq9DNhysozj1GOGapEUVdw0a2SEH0pdIpn6yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PjhkXSTp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PjhkXSTp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF652C2BCC4
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jun 2026 17:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780768292;
	bh=Ua0fxrzG/Lgr2Iho27h/z/Tr3xDvBjviI4ie8K/1mSs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PjhkXSTpHndB9BxsnWDPeyIzIZEf1gHNFAfbDLvuWNSZYEfAC/M6rATNaUe6A/lCn
	 XEoxLfeC4538NNMqfT3bFdqPIwOJNUojy93u5TIyBNtk0hZZGIGr8taVlJUN39f29h
	 LKiOwvNMIo9LUWG02zQT5QSMkL6Q0l9Xa/hxtDc71PVWVMYoOxZ08m0crSdcPDJViM
	 NZXKcZk3/y1ZaI+XrRgWBup15uFT0m8TyOwAfxwQSwRDz4ltuwB2coaJw9RW/Fj2vP
	 XIFh883pG5Vrt0sq08J1Y+SVmnCJdOAITwQjpf4aROStubIPcd977q+VoX+9X9NmqW
	 +nHcT1tY0hBKw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 99966C41613; Sat,  6 Jun 2026 17:51:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Sat, 06 Jun 2026 17:51:32 +0000
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
Message-ID: <bug-221583-215701-6YnQNOTywJ@https.bugzilla.kernel.org/>
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

--- Comment #30 from George (george.stafilidis@proton.me) ---
> Hmm, after 5s? Most devices I met turn off the keyboard backlight
> immediately.

Sorry I meant to say that I opened the lid after 5 seconds the backlight did
turn off immediately. This is a translation error on my part.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
