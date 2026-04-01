Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749411DC198
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Apr 2026 12:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775048287; cv=none; b=Xd1NzEfj6LZmgyi07oJFX8ZU5YismtYGjEF0tj6D0B8yJ0/a7JK26rTSInF83hiMBUmR9BjdNLfjo6x9qZpon3CWW8sTSBchV8FUVgb2XYc9ZhNZS9iRjvDGlITbT/gNMn0FjnL2FjBH8Qs5sDLSk2bKTU8QcQ/aQzjCCM7VJ1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775048287; c=relaxed/simple;
	bh=mBt0oaIGJ0OsnaXO5xQ7Pf806fWLfV4dGNry73UkLbY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hd7u10ldX9mLp4qUB9YMUQB+LAGlsTGBNyF5DA/ysB9d6OPVXj6wJG4Yw7shl7WbKtHxLp0JQxmFVTtSHfJfPOs5dvCGR2bNUWQTS+Ijsh00Csp6yMa5SdOuYdQ+mXk18sF6pDz+b3/JMkCgcrwbTqo67XGJ3Gex3OihVLgbP7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=czYwmU72; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="czYwmU72"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58ACCC2BCB3
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Apr 2026 12:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775048287;
	bh=mBt0oaIGJ0OsnaXO5xQ7Pf806fWLfV4dGNry73UkLbY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=czYwmU723t5GrZGH1lrrLNy/tetvjT72WcOoeQns/P7zl/NYpD8vKHb5+gFuYkf3n
	 74AVsMeKCz7pHUmiKIsyF9qlK0eC82pwwnB9xGvOCqWlVl21iN39d5TycyELirsv2H
	 7BSFKBFIbWLyg4b1G6PAB2h33F98rTSIeniEb+cpfrC7qOsLktmasAZgiDSoUx9Ko2
	 oGZo1TXwVBfyHAbHHRvoW33tWvQlYevkIBE6AKDejUuZv5sXPaK69pBAYNkGsGIdjJ
	 Wk3zEK7+ID2L67vhnRr4pS5DsJFdMi1pmW1dU7vdqRUnBu79Zjm61C0m5JOH8S9fXI
	 CT7sVDPOedzPg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 51E7DC433E1; Wed,  1 Apr 2026 12:58:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Wed, 01 Apr 2026 12:58:06 +0000
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
Message-ID: <bug-221065-215701-eDozORXIhr@https.bugzilla.kernel.org/>
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

--- Comment #55 from fililip (team@nitrosubs.live) ---
I see there's a new firmware update available (at least for my laptop):
https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/yoga-serie=
s/yoga-pro-7-14asp9/83hn/downloads/ds570271?category=3DBIOS%2FUEFI

Is it worth installing to see if it fixes the issue or is the root cause st=
ill
under investigation?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
