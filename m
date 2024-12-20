Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0021B219EA0
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 20:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734726880; cv=none; b=V5zjG2Gk8YBNoHQDQhLOgakDqvLuVQuJV1lIzfrrBNgQUBZH934iqDdP7HtFvWRRxWDm+BY/J3y4T7ddwH4d7M4ShtM2pLjF3QyWEJqLe9ibC4xGK9kCv/dGOBWn5Z9Kr13aiggaZqaE+/Q5VNgDRYjySrAu4pCLooI3GsMOiCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734726880; c=relaxed/simple;
	bh=n3TD4dQenIGL8KH03xOnl+khrL31HoY4RgUByaiMSnc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eHqwcEIzcOsK97FXJ3qYu12Y8i2IF0/kBmnexfI/xBmE5dad7Pp2HtrdPYSJo45iptPcLpt2U+5x7k6wv2HkiozjtGWxwm95X682y0hzTn3uW8+BfVqX3fsgAgR1wshXetUVhXRmztWgf09d+bOQ/A6yB+7A54GL5pPnDZtRWD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nqJ/onss; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nqJ/onss"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8561BC4CED4
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 20:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734726879;
	bh=n3TD4dQenIGL8KH03xOnl+khrL31HoY4RgUByaiMSnc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nqJ/onssvkdSN23H2rE2JnD7OPhD8l7MzwqIsGR65O9RO1j80mP2mmeIq8YjO83X0
	 Vpvjs92BC7Jj/DnJ5/G1prz0MI6TNB6TvRz4uTkYEMOK7MRKtJwOGgp7VJgblP0WhV
	 pHybPZ9S82zUuExsrdUog4dbrXtt1sUJhljGIu0S6BxUkeaRAOzU+N/5xLBbzZ1Ddd
	 IQ6W5QHlgawdQeW/O/v1cKL9vC7VPtF5Qd2Y5usN4GPmKXpz6gYQ5R3nm1i9BHFXAQ
	 68YEKumeIPAvbTA3SRgzoMbffwrRzKrdnOENR9elpm5th+TPIAIk6GyltYK6F5e5d6
	 79JbDoof4Q18A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7DC6BC41613; Fri, 20 Dec 2024 20:34:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Fri, 20 Dec 2024 20:34:39 +0000
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
Message-ID: <bug-219495-215701-8UemHueYGT@https.bugzilla.kernel.org/>
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

--- Comment #41 from jarkko@kernel.org ---
These ideas pretty much will solve this equation I'd should have patch out
eventually...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
