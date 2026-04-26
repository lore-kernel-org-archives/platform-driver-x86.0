Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1969F125AA
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 18:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777229074; cv=none; b=LgNDhG5kSKKOn/md7vA3AmR/En97f9NOSjnZr9wWbXjMOLXPye5LkEzfYL2ml2+vjb4Kzv8ZqR5YKesIHwcDioNAnhIKhYGE5rTvdNN9fjxCi0KZuoLCJ1dGkKUTX+tqIGzFtuCut2edysqmVJP+J8sHQE9xc4F2VVo5TEp3uRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777229074; c=relaxed/simple;
	bh=OpDLt0WAY6/iYRCZnKh60VaQOr3xidMJYysJ9VZS14k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dpj54QvvyK2xhak487gNlE5irEqDu9Y5ZZRydpeRtX9siCQYfSy/lfS3rlVAmn41r41vdgF2RR/K0o9G/5aTA/tIsq1ZWtM4iRUPCojifO26nIqmDzzxaXQX6WPgj4rH1QUyYC5cjPGhmnagTrjikYoS6zy2eA/c+8XcC7as0XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dj5ZDg0J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dj5ZDg0J"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AEF7DC2BCC7
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 18:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777229073;
	bh=OpDLt0WAY6/iYRCZnKh60VaQOr3xidMJYysJ9VZS14k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dj5ZDg0JB4a0qmV7tFL7FbWEkB2szXZeW0xrlUOgqqbmgFVLxcuFEN7fykjldmhOT
	 CVLLw1emn1SPaocWEHRh7iehPrzopXjBDgdoINVMDJFRbNVan/G7osqG5ptBT+i/Rq
	 vgWr+m8Kr0c4tb9PicWllbKLaJDQMuW5BgyGYgRj1YvcST0qOAAGY1woy9dVLStMmF
	 k6QWjM2hVmvGny6zsUQK/ZELQomD8+vy8TsFIa+fGfrF0PrcUsf6oE1j7pofSNG9/n
	 OyIpL2U92m/Mw0ytZMOhJ6er/uHhSfpYNc3ubnYomAGobmMhY1EP0P4wX88NZfvOoi
	 Y1M7J8TpOZkHA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A87AAC3279F; Sun, 26 Apr 2026 18:44:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Sun, 26 Apr 2026 18:44:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: boite.pour.spam@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-y2TML6sqWF@https.bugzilla.kernel.org/>
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

--- Comment #63 from boite.pour.spam@gmail.com ---
What changed with version 6.19 that made this errors pops out? I don't reme=
mber
seeing this with 6.18.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
