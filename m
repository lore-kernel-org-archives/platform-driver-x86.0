Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789DB282F05
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Jul 2026 12:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784981074; cv=none; b=dCIjp5FNKLMGF1+gaXDzytxwNauVXrgFQkxA6Cz3KOuTz04JabyHELvw9Y9RZCOE426W4kUkHRJTSv3a51O5A9rlK0pLcv9xMWGwMB/M4hi6IS9/kR/fYOoKewUJL7n8ey0UTb8Cx6HGW/oIrkxrIPrTK986MZ+Kj7VAPGeo7go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784981074; c=relaxed/simple;
	bh=hy2mjUQEODjLRz5j2Xu1C8V8+RQqknTo9LEVUz64bcM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e+metR9UTZNqxsWuITUpabOcqhuLyIDkKBbsiYgsxuMVeZW3+TXoaah1/NKMxVwd8rxxmmRbdnpmSVR2Jp/SJqydvknPEZIaZCFTTdqbcdQpEoCQ068c8ia0t56UnIYImWoh4MtyG+ZpKRbAfWsfO13mGfmBlIXUI77S8M3DVRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/z4sXbj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/z4sXbj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04AC1C2BCB8
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Jul 2026 12:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784981074;
	bh=hy2mjUQEODjLRz5j2Xu1C8V8+RQqknTo9LEVUz64bcM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=c/z4sXbjd7OAhtBjGgtbSKFHZD0DWnxAM4Q+8FSC+pIVZS/DwZSPc5wquSWJd7KhX
	 cl5/RlAcElYkTGaG3NY5GkqtSh+LgVQV2MymbY8ShQ6DygcjLWh0LVG3imSKzEUqqR
	 n13eq9DsHPpYqz+l8GNWZIjGCIl2ER1DSiWz2cQylrmq/5xt1SqutuiWunAVziRwuK
	 quY7/FM285TLSDNmlXbRHr2F15w+znnMeRaGLLhZyxLfyJfiTUwh6jSTbNUbBDF6vS
	 Ces/GO96rvxkubgg5qbAylizSm2QvSGNvlzgR/dtbjzQLpSYjOR9zrmA4PQs1wc6dZ
	 GtL/rROh98rWA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CFDEEC433E1; Sat, 25 Jul 2026 12:04:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221789] [BUG] Prestige 16 Flip AI+ C3MTG Panther Lake - Tablet
 Mode Switch SW_TABLET_MODE) Not Detected
Date: Sat, 25 Jul 2026 12:04:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: workspace0001@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-221789-215701-aWva6ykNPW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221789-215701@https.bugzilla.kernel.org/>
References: <bug-221789-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221789

work (workspace0001@outlook.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |7.1.4-202.fc44.x86_64

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
