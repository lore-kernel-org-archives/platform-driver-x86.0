Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B864409621
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jun 2026 11:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780572593; cv=none; b=jjI5vYuFVxH+Pq5w9DebDm91mheYNv/XGs2J1EA4xkkkXq1WW6um2cYEQ+zBh8u19F9n8+23HOK89anUMttiQFo4WcaUBIu9u/eYSxhACyMztqHjXMYT/jolAQbS8UdMziGy+G2peFDTago2gHVi3DiV3X0QLB2D/hh5GUtMHJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780572593; c=relaxed/simple;
	bh=us5QloT1ljfJshdaW6+OPK9PrIE7wGV0Nn4v6Eh15Ts=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ngBGwCwrA7uKHbEXPXqUXpHKiAw0CV0DtgbXgPB+HxnO5l/FiyyO9m55dH/Sb59AfKpRdrqjkyXj3oWvAnoH9YBdEsalBFEVR3Dbrj/bmfMAmNOiXY/6at/8WHTw2Q4ZTHHLgvc+kvCxaYPzhOqw53qU75ZI5c8bHH0/GVaMl1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HKrUhgai; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HKrUhgai"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC3C2C2BCF4
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jun 2026 11:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780572592;
	bh=us5QloT1ljfJshdaW6+OPK9PrIE7wGV0Nn4v6Eh15Ts=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HKrUhgaiATWPcd0pMZmE9vrR5sYrJ6rr7OUCAbYNgkBYiNY1+hF0FmQSxuNTO8fsx
	 FIpmAQKVI2My6jL18s6fzigTVfjbcckCy7RWXnVrNh0BBslrZKFOyVymYAkjsIB0lF
	 YXp/N0cxvgF4UhHf9ivyYwgX3lFYFPaOlVv1rvuJcU558FZYg1y76DijxB9fr1MEmY
	 3Qzn2AZ9W5Q9ULvncfGYMUYoAfq+4bjpIEDJ0Vcgz9YiSkwA830XKS1bpCHhmdosIZ
	 G7D8EzaG2psxBS5pkuY0WWPnd1IwEhcaSPmeyjzUpQlEYQVVccGumpw64798JZzm/o
	 1zj9o1j7AHJZQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9B14CC41613; Thu,  4 Jun 2026 11:29:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Thu, 04 Jun 2026 11:29:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-H0AJ3y8kKa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #75 from Armin Wolf (W_Armin@gmx.de) ---
Can you check with evtest where the second touchpad event comes from?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
