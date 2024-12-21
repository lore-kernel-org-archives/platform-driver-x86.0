Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B631F755E
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Dec 2024 14:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734790335; cv=none; b=nqt+bsem9NNW9hAGMZ7HZ5yhVTVjzXSj1d4lOUFz2dcahL3xbbP+NsafDzAH5jYV+hCswpvBxy8NiiiWXWON5VkY9H/S3qIMcGA7wTyMVSnpbBLl1gQ8P2ZZ6BiUtbYkWoWAUYCRVDtR+vGL9b5WJ1DUKYjTiUmeOE0ewfq96Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734790335; c=relaxed/simple;
	bh=xRkP2IZdutLzTbL2rbW7FA2FBBlLCW4H6E6+45jCIlU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rwOc3CH1VaapmVzOIoLF6eGC0dY6AHrmNxV5aBXKJCFNA2yzUQ4+UvQRw/LsmHAG2+/Y+2HA3FRRQFTG4fcZbyWxZTDxrs3drXgU2owSZNbyEMgcRv3MXCkdOoJIL0OowWsYVY/L1+aMK40+GdzGI/fqsDQDhjXswnQi2M8Gt1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b4gquceS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b4gquceS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6450C4CED0
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Dec 2024 14:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734790334;
	bh=xRkP2IZdutLzTbL2rbW7FA2FBBlLCW4H6E6+45jCIlU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=b4gquceSkH4kEzreW7E8qhn9Xd98QcSgeW93HTlbxl/nupQ5FxV0wa9CgdiHYtgUr
	 Y5MuKj4WSsMYf6u05/QtIL2Cmt4EFcg9t/0eSHSptLVlr5tYrpXTXTEkB6q23zZ6Jk
	 bElytYZ2UPddWSD0VksGo9kyY8cWWZtLayFc8zPbRHUEIicA7Rxh8tiK06gFrAcLXt
	 diCHgqgsTeuT4zxt5qS4jW266yZnt3R9ZzQW0XdCPlVv8P3gxSSeTyndi5pU34hI6E
	 S6l9/n94tX65gyE8a2I0EnECUrGCAYkxCE4kD8TsO9Mw6UBVRSxoSYpQkwgUWTaDgr
	 1qcluA3k7wong==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D0186C41612; Sat, 21 Dec 2024 14:12:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Sat, 21 Dec 2024 14:12:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarkko@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-kZlXcx2oTH@https.bugzilla.kernel.org/>
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

--- Comment #47 from jarkko@kernel.org ---
That said, obviously requires testing with the actual workload.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
