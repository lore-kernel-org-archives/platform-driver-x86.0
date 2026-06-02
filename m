Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED8F3438BF
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jun 2026 10:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780394936; cv=none; b=o8kfrrs6W+s9up9m7SYZ9i9mI0jdQp3srEcwjc0fEnV2elnhmNIZZiKbYTbNXcCaO6rtnTEj38e7aCN9c9u+4p/NtzG3DqUWyPuRBeFHHP//D4sGsZQ7X2nEblhEYp2FOXY46U+QfxTAZ/a5mjcj1TbDD6/c6+QnCqenxSW0gj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780394936; c=relaxed/simple;
	bh=hfhdXcDgyBIRJdAbV+2ICrzWWafX9Cts0WIF0uoRzfE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pjKZCoEhCvLKMp681w/NQPpfVkkmjx+SkLJQttCKV90P813qkv4FlI7vFJ/rgtso4lg+q0wdz8MaQJf0swstDS3q4V5qSztO6gtoRuyET3e8TNwAnUt0C+yVaNyAF7zQmooZCzrlGhv1rzALeS4c+qNu7yams9sTAhL4R/DWuZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RkmREJu5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RkmREJu5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A08ECC2BCC7
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jun 2026 10:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780394935;
	bh=hfhdXcDgyBIRJdAbV+2ICrzWWafX9Cts0WIF0uoRzfE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RkmREJu5dmEzzEMix+HkaQkWiGFSQq0vDDf7k3bmqEQkWEFKvvsSeaGhJjnTOFWkD
	 /BUfKij+CkEwQyQvPU7el0/EN6Jc6vDqL27d1GlAAUIYHGnvO55+upZpVJsDZLSg6C
	 h2JIZy770YRuJGb+79Ll8TZHdEuIux2+uNzB96ZeMVAm9mjEiLGGXyr7Mkm6WAmUlk
	 wTgXGS5vHkiRWGYa9QIT3EYNpOUI1bozaToccXcpUJ4PSdo1ZBtuGcjQFO4fc+LMVS
	 Sn69Uf0UEgRzraMtR4mPxGxlaGtPEQuB+0obCC7VQ3MPLPxWsXPYae4HX+Ljv4CH54
	 3W/c3LVHnUddg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7F0C4C4160E; Tue,  2 Jun 2026 10:08:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Tue, 02 Jun 2026 10:08:55 +0000
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
Message-ID: <bug-218901-215701-N7PVEnPCeq@https.bugzilla.kernel.org/>
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

--- Comment #63 from Armin Wolf (W_Armin@gmx.de) ---
Do the previously working hotkeys still work?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
