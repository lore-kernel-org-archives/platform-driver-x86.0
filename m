Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082A6322C88
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 15:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774884039; cv=none; b=F2SSwwzWJULBXxD+oBxsFK8bP/6NLosRX0/7USFFwcigerzN9q7nGwQynhfuzeA33FCl40CPRoea6IgbLOROGvUe225D4oKAEKB0y9/ev7sQyiebbQYbDaP3ZFDc3X89zUKPAsuB2Tg1O42VC8+00Y11VBAVpHqbV/rDupDZN4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774884039; c=relaxed/simple;
	bh=EguJGqgW0WVB31Dy4138zVI5p89zuwhApi05AeGXn/M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r1wR7tzvv4eK9Nn65RDqI8kHPMRS2jd9z26jiZMnx2L+sMExEeHqJ/pQpRHbVKENS/jq9gRKi2vrxNzBPKik77RH867sDlFtaeUqYBqPSoA9V1eFxkAkjbgY9+ldVFoV16EGomo9jBIbJV60DOwAx7654h64zB4wFsM7nsEVg+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U0uQOoCI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U0uQOoCI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A7E0C4CEF7
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 15:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774884038;
	bh=EguJGqgW0WVB31Dy4138zVI5p89zuwhApi05AeGXn/M=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=U0uQOoCI5kehF8LZIkabQ9X2VEhHfLZB2haYLhxXd5nYcc8ZR7kjx99Ds+PdUXFIh
	 t1hKYJvdakJlSXJD2jP0IT3Z48rlKGEU1V2IlYkVwl8pdILx3tSjMS6+aTUsFQnOME
	 fSu6PoVcmuALmepeM0BeV+fmiUmYzFQsknXjVVT7Di0ffpEWoV93OJmILRqEfng0uw
	 HNhkFe3zRIbXvfIDyFvF3Wv7d35z1dUbAJcGtbSsy8iu0q3KtzuejIkZa+0EKJYuSz
	 ej9OxrZ3ohYuHa9FvYfrItVqYUsXESagbG37Hd6nZITyKkKp6BPm+Is80GwUwKyFDN
	 EL/2fbCnWALVA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 90999C41612; Mon, 30 Mar 2026 15:20:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjA2MzldIFtCVUddIGhwLXdtaTogT01FTiAxNi13ZjB4?=
 =?UTF-8?B?eHggKGJvYXJkIDhCQUIpIOKAkyBmYW5zIHN0dWNrIGF0IDAgUlBNLCBCb29z?=
 =?UTF-8?B?dC9XTUkgcXVlcmllcyByZWplY3RlZCAoaHBfd21pOiBxdWVyeSAweDRjIGVy?=
 =?UTF-8?B?cm9yIDB4Nik=?=
Date: Mon, 30 Mar 2026 15:20:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: krishna.chomal108@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220639-215701-UvuzyC0p2J@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220639-215701@https.bugzilla.kernel.org/>
References: <bug-220639-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220639

--- Comment #19 from Krishna Chomal (krishna.chomal108@gmail.com) ---
Hi Juan,

The patch for this board has been merged into the mainline kernel. You can =
find
the commit here:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D13fa3aaf02edaad9b41fc61d7f6326d2b6a4bf80

It should show up in the next release (likely 7.0 or a 6.x stable backport).
Since the patch is upstream, feel free to close this report as "Resolved
Fixed".

Thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
