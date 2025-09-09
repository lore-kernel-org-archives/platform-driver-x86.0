Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49CD2FF679
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Sep 2025 14:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757428077; cv=none; b=Vl+BDl54QRcqUODVhJ3b/xDIjOdO2IAH4AAZAlPSAJx4NdN9iM2QA9bwsBJ5j1uCRN/dJyQ6PU9wy0zGEFnGP/NUrFfMW7AACX8fBlo+fOVrRh9s2mjWazhVy/rG3u+u3rH7FTgMDCrBTwCCfCvAo3aJSBiZiTebtMUzsroy8Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757428077; c=relaxed/simple;
	bh=F18ZLASJLzEHh4dumA4o9Nca+vRWY1IrCa9JKPFUO2c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hWHxoedsNTYV5Oqz8Twur6pAB9DsXNgM8u1FAstd4eWBZlAYiF4G0zHJw0LKTpOuAUedFcY+ssAE/XRkphRUUJRcLWewAvzf37mZXhW1ExnzkSK4wDqIVx6f9vPRZdy2KmrZhGW8Ozr7JrieZ1IqA0cv/2+f98XEIe/FkwsIUzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c4nsg5i8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c4nsg5i8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68CA5C4CEF7
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Sep 2025 14:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757428077;
	bh=F18ZLASJLzEHh4dumA4o9Nca+vRWY1IrCa9JKPFUO2c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=c4nsg5i8nybc24V7lGRvLc+oJnFHmXt3WbNQslQrHr8M95uRocAMViA3EJCSUnZ6I
	 S78FdXM+SEsQLZ+q4tat4OVhEXHkLpM5O3F94FzZm8lIzeAGkkmFVSGKQw90ajg0Lz
	 2YHXHODCfhXPBn/qZGQHslCUjDyhFNq5ye19ltaX96tvqLmVvkZkUX8MVH9+X2v43c
	 h5P8HTdnQwN27cAc5O4irnZBai1THl4EuJ/wp81+tztAGmxKXpNbDzHdsDTNrDd3jt
	 etFE49gueGluy0aPqCk6z6xFY42CHSQ5DpXkdYYaVwsAJamfx5q5Ok7A3sw7XKYyp7
	 q7HdPmk9Hu+uA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5C5CEC53BBF; Tue,  9 Sep 2025 14:27:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220473] Linux 6.16 doesn't let me to shutdown the system and
 sometimes to boot it (lib/list_debug.c:35)
Date: Tue, 09 Sep 2025 14:27:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220473-215701-D4g7kcVQRj@https.bugzilla.kernel.org/>
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

--- Comment #11 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
No it's not in 6.16.5, it's in 6.17-rc5.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
