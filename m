Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F56366836
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 19:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781205716; cv=none; b=oLq+TixOpqirSfY1wnvPzFm95+7zVnEecN/qgXkY54EpFf4B5g0nkzu9Puu05TaYpJj/YR0YRgbUf1YPEJU6BFWmVbwfm8JJA7QZMUS6w3U6RkhW2tWIHTEIZTar0pL8tZLXNBDH/U6LMdtsWgJUfsHJ2GfA+uJKW6HYTTEFtkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781205716; c=relaxed/simple;
	bh=nPFCnN3OSmsi5XxEOD4cqarZVuZgNwAo1dkcQl6mbpk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DGWt1gqEkBlFU9JLtcwjqi78N9blldgoQzBuM8v0B3v2b4DoFvr4xIR7ko+VcOCQXNmffu53mVFiwKmKTqdtXdtWr+Qq2XVKoAtIr3Bw8OnYFXDKz6NojmHFiRM36IFHLb3AWp1KeaIaETUIduPK0uZynWaAXX89Q0n1rNVEX4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JcPiWX/6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JcPiWX/6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C6B3C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 19:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781205715;
	bh=nPFCnN3OSmsi5XxEOD4cqarZVuZgNwAo1dkcQl6mbpk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JcPiWX/6dKbWrHt3oWpE0XLqQCQIJL01ZXLz3BNSYcFC4XRFJfiLaOSFx5NI+cfCL
	 tYIFqDkkOGkpXX69JQSamsYwIOd0ITC0+fMGlPsnXiuO7BsiQodAy7BfxMVgl8d9Nb
	 tPe2CSa8Mk7q99AgBY0aycNZ1BtDgg0hIutdeCkK1J2Luv6CcqWVGLszPbOkm2fbWb
	 S/97emhwtPywDL3anq6hN/YotXmOAyvRiGAwOYBqOcHNqyppugokZqb1InAth69VnE
	 lf52wwwR+5rFPlHZFnx2uuZ9SOyrbCkmMLF6HPJoLrR+GylZH2v3NY1EOS1Fdn0I9j
	 9FThMddJYDjvg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6D333C3279F; Thu, 11 Jun 2026 19:21:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Thu, 11 Jun 2026 19:21:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chgenn.x@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-8cn4JLyUNQ@https.bugzilla.kernel.org/>
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

--- Comment #93 from chgenn.x@gmail.com ---
Ok, I'll try.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
