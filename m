Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697E42628D
	for <platform-driver-x86@vger.kernel.org>; Sun,  6 Apr 2025 14:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743948289; cv=none; b=VVHKslnlVKaZUNzW0tWOlSG9rNEAWwCLKLFmkz9Mt/qTgQ4h6aXqPJ7KIkuUx0b/4PgN9usyxgibymrEzK8ydgFNjJaMho6CYlnoYCGUTCWnbZTjXouoYjdkqzbxln/LEvNDucU139xS8zKG7lksZMIbO1vF7gFQAnGMKgi0Xgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743948289; c=relaxed/simple;
	bh=RGVjWwsXqoPaIgrSvu+bxkCMGs1T8O0aetiuP0idtsM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LnTGLIlkYMJirBGHdc8M5jVzoeTSzAkBB+ZIamWsay+aL1E72WFHa/NUHDRjdAMhUxctQjt0IJ3zWDfs9G14QtCikJd1U4wHWJwZGCYDAV8F8nKTQT+h9/PLixJHIlwuOYeZ3PsNLNzUiOxXmV4n8QES/SCZtiYKnBdl1DrPFws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=faP/YPYB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="faP/YPYB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C80C0C4CEEA
	for <platform-driver-x86@vger.kernel.org>; Sun,  6 Apr 2025 14:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743948288;
	bh=RGVjWwsXqoPaIgrSvu+bxkCMGs1T8O0aetiuP0idtsM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=faP/YPYBQoL4CmadHMYXwjJ4iiQyUELFE6pJYwJKM2oWHv4QCJNJ4TOWxuK6ma08C
	 Cr59WUNtpUd0HXMMXzFw7rmseucKD1NnWV4j/tJkp/9NxWAHMc91eCGRHKw3fpT2bt
	 ZT7UnY1uPW/1njAf8yCc/usjDZx4byWwaHroszt9DZbeFrY1pPwXVLcjKEt2U5t0LZ
	 jaZSSR5R5WVxgGoNebGL+IXeQL358IYB0V0d++0zgiUuwdz/BJTX7E5yuosLPPvIKi
	 TmwzEkZdS+LyRV/hQVaaxV+8dBNjga3Hp1oUTLYWzo8J1/fLHT8AsMuD7hhKqaeV22
	 aBcqinr6ogjeA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B619EC41616; Sun,  6 Apr 2025 14:04:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218863] [BAD FIRMWARE] amd-pmf AMDI0102:00: ta invoke cmd init
 failed err: 60005
Date: Sun, 06 Apr 2025 14:04:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: tomas@digitalspace.name
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: shyam-sundar.s-k@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218863-215701-qk2rS5rCf3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218863-215701@https.bugzilla.kernel.org/>
References: <bug-218863-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218863

--- Comment #37 from Tom=C3=A1=C5=A1 Mark (tomas@digitalspace.name) ---
Good morning,
I would like to ask if there is any news in this area?

Thank you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
