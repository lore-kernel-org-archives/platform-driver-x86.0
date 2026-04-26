Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBFD25B663
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 18:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777228789; cv=none; b=hzinowmKZymnDDXqwsPEuhZDm5488KSuydD9NeUCtnhA6GilAl/YGYeVzv1OnNuitohTffLJeX4tt7h3YgJc8mpf+IoP+2SpBlul+XL1j15ac74CdzdslfvcRLjn3XANiZKsNsy6E1GpTDCT//6l+/uahQBM+w+fst4/Vs5tzhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777228789; c=relaxed/simple;
	bh=dSKJDp9uwmBUwjBICd/RK9AFUiRH9pHxIdhNLmE+o0M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sjQbO3lkPSJ+zUA2BrvD5DUn4TR+5r4Q5BRmvxPyAl5WToOY9mtK3XX/TuMP5RGoOGZ6tjwCe/S5mQJlawrATP4OH0ud1UdSGXVJ5iC+cUse8Rmqh+hPoS3Zzc3zPsRGM1PM0aMZPQ0g1rmeLaYR0RKIM9sI7f08Bsp2yUqJL1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlUjB8uI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlUjB8uI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87C3FC2BCC6
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 18:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777228789;
	bh=dSKJDp9uwmBUwjBICd/RK9AFUiRH9pHxIdhNLmE+o0M=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dlUjB8uIJ2sN58YfSvNxQzugA8yZOl2+0XBtHBBznrg7JP/wQ+kyAFG/wRg7uE9Hi
	 3wuiOL2uj3VIdB3vIjsaNtXtPClUKJvMrR2OjHYc1TsjiT77sCsf8okLJ5RRLniYB2
	 89ZHG8RweL2ftYrQ0Qgj4BijAQvsNvdKtZ8fZRENbnpFSvgJy0B7tjXfBVI0UNn7GA
	 lCi5bk3sEdC/2lZoBns9oJ2Su0L9cGtpycbLT7j1qoWSW7l9mE0RKekRbikAV9ZPPE
	 IiWjNHh2lUniFPCL6ZtVkoBPXQMcZs/1fklLaUYz1XnhmwTvsNBiL1nleYCYLK1P97
	 Ttu8na8+QKY7w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 801CCC3279F; Sun, 26 Apr 2026 18:39:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Sun, 26 Apr 2026 18:39:49 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221065-215701-Cv4NbHXBMp@https.bugzilla.kernel.org/>
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

boite.pour.spam@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |boite.pour.spam@gmail.com

--- Comment #61 from boite.pour.spam@gmail.com ---
Same behavior for me, with a 83HY system.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
