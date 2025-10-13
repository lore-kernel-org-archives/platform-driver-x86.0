Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5067A4C85
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Oct 2025 11:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760353695; cv=none; b=Lw2ZhifNh8jl7iWHf2+U1byVzvJ17Jy9IIXrIAw+dzzlO4xPWxWlARznw593W5RZCdGVut9L1k9kivou64KghMMCGFFKPEa7LB6XuKZVDocO5aFLJHSSpp6KQGax+nKlzgNpJXJFLHZHRTb9crRQVWMW5GuoqHlyy4w2IWXxB3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760353695; c=relaxed/simple;
	bh=8BbRRAd5bPX8r87ejMScubPm9duxSGe7BdEnfy6S6lg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JMZZo/cB/T0bNkOal5rxUHNFJ46a8mZToxjFSQiv04cNJkmYdGv/A2e3T/JB48TN8j+ZyVIa9PisWlkWd3vRC1+dw44+ZPIB1L69FBZE6X2ZPqvbmRCOWaezcgbWLA7Rvz3xMJKGHWU35MlkVXWTHDN96YDboBchHHdEQByvn0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tNeF7JVA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tNeF7JVA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AED97C4CEF8
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Oct 2025 11:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760353692;
	bh=8BbRRAd5bPX8r87ejMScubPm9duxSGe7BdEnfy6S6lg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tNeF7JVA2CRLaidTUtWcWMLXqNLMZEPoqW32c1L5BHfe0OgKKYSoCroPiRLdtCG6O
	 VNVK68J5XNBxB4kooBnPbsrD+wOLYSKm6M5S4aNCdYDL29RC3+SJyzddO/swzSm9fJ
	 xLTpM1GihA+aruRcR+kddvflibiAJlZiG+re9D4pqewmCOLPx9EsYxtbWTACR4pr9L
	 HedemYugUIc8qK7zTZCLpHLYU/LMlmncbu42nWSR4Xm2sZB9Zhyk7ejfhoUsDKtFSf
	 H+QXR499PKEkoJH0HFgbRqODHPYrPWDfage+LYOa/crSneAR0ix/PdPDYW8F9jOJET
	 30ZeURCjpvM/w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A2FA2C4160E; Mon, 13 Oct 2025 11:08:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220646] Regression: kernel 6.16.8 fails to boot on Intel Raptor
 Lake Z790 (ahci/xhci error -12)
Date: Mon, 13 Oct 2025 11:08:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status
Message-ID: <bug-220646-215701-xopwLRdq6o@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220646-215701@https.bugzilla.kernel.org/>
References: <bug-220646-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220646

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
