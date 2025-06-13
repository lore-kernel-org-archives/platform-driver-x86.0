Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA25A29
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 13:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749819745; cv=none; b=fYJetNRoTk/cRaiKAgPODHjtxtIFOS1bb0xCjBd71CWN5rAPovptJzyYHE8bnPY6SE0XLEtli7u7kchFq2UqWVIG6ycqynLc1tY3IDyU1m+6nWb7MLWr5RxCcs+fdBziQuFAuXHL+u4GMT2YcuFZtTgWhEH08iCZRzNtybnn8e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749819745; c=relaxed/simple;
	bh=Or9BrrX+zIdoFyA53y1k1kVzhxbkfB3jt+icaOmICJ0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qxxbj2moWJxO/K0mIZ7dY3mvI/uQncQZC28yOci/tjQZWhy4S5YVOJ7n+iMZFE43EQvtheA+L2HCH73dna2VWybHxZZCzayseSlpAPw2tc2n+YwQnaJVY8zWrQf81nHCe3I6Hbg6UoNGLCgjGrH4WRypy8OASn0R7zlVpR6Q+a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OG/COxG6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OG/COxG6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC884C4CEF1
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 13:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749819745;
	bh=Or9BrrX+zIdoFyA53y1k1kVzhxbkfB3jt+icaOmICJ0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OG/COxG6c77sHB0v1X0iS/luqRWjAP08V5FHWtQAXeB0iZL+jJGHQwH1vNwOz+1gG
	 +DvH7IzOOOnyZK7r0fTW58LLMZ5BFb4EnRdqETZpQDWuh533JpUM2y//290Fs2vi+h
	 NOL+ZS0mDgLoQXT1i0sj7QzwcCfPWhIC/CducUkc8MTOSwR3gHZU1V4fapj3OLSScy
	 CZQg9rALltLG2KLaLxMu+8Nal8FxX/e+tmgDHNmM5S1q4AisAljdR6OOkW4tWuCKAr
	 gxj9fhEk8tbOUCX8rsWsZOrJgl7l4QQbavH1w3JT5Bp9RL7lV8l6zy2GAWKkRIRwwm
	 8wX8YqURoffXw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B5AD7C41612; Fri, 13 Jun 2025 13:02:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220224] Kernel 6.15 causes crash (general protection fault) due
 to amd_sfh module
Date: Fri, 13 Jun 2025 13:02:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: g.molinaro@linuxmail.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220224-215701-Zpjz0R98el@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220224-215701@https.bugzilla.kernel.org/>
References: <bug-220224-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220224

--- Comment #10 from g.molinaro@linuxmail.org ---
Created attachment 308244
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308244&action=3Dedit
Output of journalctl -k -b for the SUCCESSFUL attempt with 6.15.2-arch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
