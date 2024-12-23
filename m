Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF05318BB8E
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 08:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734943384; cv=none; b=OB5ActhK3v5oQYO8Wrghkw70wE3aiG0epY3om4kcqHpIlgrlwcWb8EKCuaoj0tlSZzK1FRoNK/M9+wUhjRqN80ng2XxSxHpCg36+kQp4qLnErN7wBImDdoy/P0LE8sHkPGxlKDOkJXxIJBUhdjauIC7fjO5ZJCYjrdUr0uUbiWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734943384; c=relaxed/simple;
	bh=jXFDV30Rbin1hNiyIrcq/uGOaHaOeMBrtSrZLuhXKCg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MHIU//XSZ3NmFBmVBhajDFULspD6SdFZ3LGRpEk1IW+fmJx21x6gb83RUF+DprRbeQHmhkicthsK7h2QaEE40Rxw0+5liTmM/Z7PYz6PnJYBpkrVzdMIc9f0N9GvV+tZYMmUU6rCVyX5cdE+SqYGcKT9EVhi+ZLpmobSYvZ+YL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hunta3d5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hunta3d5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54EE1C4CED4
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 08:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734943383;
	bh=jXFDV30Rbin1hNiyIrcq/uGOaHaOeMBrtSrZLuhXKCg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hunta3d5bsWZP6yJaJHOURsSv10/uENBi8Css8HOjAHUWZhtFP1uSkqq2MQWlbnGe
	 JWE9aaFI8nMEb6Gdo+qNjZt/jPSbLeFxT6JDdDGv/9jlHenRqHRwR7saVQ/S6N8Lt2
	 pCZ7IdEPvegew9g+bDJdmGo1aCwoA6g85v+qskW851fE/2kNPgMl2xZwIdhJU+mTv3
	 VIJ5SD6XKJS6gkeA/7dUy6ccP9Vdru55qDeO6WEKBBiVpHVin1d+/1K+csoVEFnobd
	 8ptPDt1taBcmEoIH0HMX1Meeuu46aos0QI7Z2i7pWWq/x2DCsQ0YPcfyrC6Y75/tQZ
	 0E2qqjLDRCkzw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4E2EDC3279E; Mon, 23 Dec 2024 08:43:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Mon, 23 Dec 2024 08:43:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.liang@hpe.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219495-215701-E6Kg4vT0D4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

--- Comment #56 from andy.liang@hpe.com ---
Created attachment 307388
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307388&action=3Dedit
v2-patch-kernel-6.12.6-lp155.1.1.g509a912.log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
