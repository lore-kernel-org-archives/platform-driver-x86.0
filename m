Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AA115A48C
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 11:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712748609; cv=none; b=G4RkfKKuRWg+IC1t+0NpH+CkKOfHtQEmZej++1v0y5lxVx6fefw0TvDx029i1nf6aivUfJj35OxITL2gSMp6REcSysDqnHU3UspaQAnoDbHSA5kUo1xsfB0hAV41QND/YEminZ+/fjU9JIRein/wXx1IBD3ySvt4xb/eNHChqx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712748609; c=relaxed/simple;
	bh=C5J8wsGXEDmaug5kE3yJMtWryv9tdjqDm2RFvFHNWHg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pg84/0bxgK3124et+fFJQzxJG8ORdJrrZgq3SVD861z07s3JRPM9eqwM5MZPw/FkSQGqYnypL7Mg8u1pHE8zkJufdK6wXOQ673Ifrvi+6Hb+uHcMYcSlBkP4FbJDiRNWOYniuMmM24svpTK9YMIOupW9qlG6/3pC5r/fOyNaUBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uQOGZt+t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uQOGZt+t"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C8B2C433F1
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 11:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712748609;
	bh=C5J8wsGXEDmaug5kE3yJMtWryv9tdjqDm2RFvFHNWHg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uQOGZt+te/SsaClH8wO9RDRCFcYDVnEZfdPkvAMvDlNO0jYiuZv89Q/cTavdEiKGQ
	 IIoDqDirKeBufxzSTR8pHifmLIBpDkAzmgFI7KWfDqMxRAPHZG4ZQchQPV6hODDWAy
	 Zc2guFhrhXjxRBWmH5obaVbEAkfoHKDm175cr0ySsNGR3yJop/DhIOArwNd1ALirHY
	 LxSYlLug1jXb6S1Tqz20Us1o85oSzbeFZCm0AZOgpUi/etwg/Uq91zaRo9mySRDHGq
	 ahwgkW2BZx04KlrHfqeuTYnlgG67ry0kZdGaDphEGHzyfDcbSrzcZ/JyshJgPHeTu1
	 CLowVHzUaibug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 36DF0C4332E; Wed, 10 Apr 2024 11:30:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Wed, 10 Apr 2024 11:30:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: al0uette@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218685-215701-5NMoSWTpew@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218685-215701@https.bugzilla.kernel.org/>
References: <bug-218685-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218685

--- Comment #26 from al0uette@outlook.com ---
And the issue still exists, which is why I'm reporting this issue

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
