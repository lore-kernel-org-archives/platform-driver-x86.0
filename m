Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2084F5E0
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Jun 2026 11:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782041016; cv=none; b=twfEO+Xo8RRXAJ+jLKmSWjscye2q5BB1ZsVR1yjI/gJwtWnAklNmcaGRv6hT7lf5PnVA4rInE58mmLFTIpKFuTafV3fXCJdbb0MRzkL4jrO3F/VriFBOq9VnoFZiprKHk3fuWIvAy+HWE3j9z0rrRn+FJurpKRpVtOlIqMClY1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782041016; c=relaxed/simple;
	bh=QtQgwB4H+JWDydIRwjg7MKhFvDPcAZdPFwwH3RQckOA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GupMTZ+RzfDh81vnzPLdaoFGQuigwYUrNz6SMmx1pLktxFiuPfL2KkaoCN6JfSHK7wmq9voV4ezWnMDF/pehaTftIlzo53S8DgoVkQF7zqSbpwD5XXPRXKYoKJt/gNsXcZsVu4TZLhmhb4+3LgLFB7tRvfgip//M4zG2nYLW1U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dTQogrJC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dTQogrJC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A04FC2BCF6
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Jun 2026 11:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782041016;
	bh=QtQgwB4H+JWDydIRwjg7MKhFvDPcAZdPFwwH3RQckOA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dTQogrJCKQq3Time+RT6KCy87yGHt4ZgYM69Df4zeFvFBKWScfduQ0a6thj4SjBlI
	 0dDCLoWwy7+/ByEbPGuVYOEwqsIcYE0qp5WNLaWz/9GykPhk3cOMakiN8UzeLbspdw
	 WmNsgZ5RntR/FAZLQSgLECcz2sfgBqjyiUPuVhKr/EZdclr5IcLi6525K7sHciyoyM
	 F0W5WttWo5YE2K3PCsFthMS435iUymG1y7BSy1prUBb8irCbwWxNmxn0jU+FJrVCXy
	 oqAgMKKMjDwA/8k47u4W4syqJRFtgz4mZP0RBlwKBl82AoIt83eKZOkZuMWSlLb78h
	 UkRkJ3qUxY06w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5B098C53BC5; Sun, 21 Jun 2026 11:23:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Sun, 21 Jun 2026 11:23:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: marciosr10@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-fJPBo8ZmUy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #151 from M=C3=A1rcio (marciosr10@gmail.com) ---
Maybe it's time to submit the quirk for the next kernel release, unless the=
re
are further tests to be done. Here, even with the updated kernel and firmwa=
re,
the issue persists.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
