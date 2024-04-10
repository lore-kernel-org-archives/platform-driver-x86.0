Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C92D51A
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 05:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712725383; cv=none; b=SGKUTucRiKXpq/B+wPgqgkMmPTGKiEcigjBql/YjG7NOJiAMM/46MzHGJZdZ0kt9MM8fCcdI+r68tnTFDwWPajszvv9EZoWZ1aOwwEfPpO9oBP2TSy9giloE3BCe08yNjbKnAstbm6pHbwGY413aS+xLPf3asYta5L4T9JHbb3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712725383; c=relaxed/simple;
	bh=5QDc1rPQ3TYFmVGVgeXsz9MfjLJ9ZoXJK6FAS6hl3+0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=btJRIKupnpiYS8LK7vQ5X2zfbNCf7qitFUWRHhqCaVQII1i1CVcAHJvgXjwZBU5ybpex+FIC2HyEAUTPh//axTUeDswUnhXrxqyd6IZQ5zdIeeE3aeA5DCcFu/SpM/9pgWw6ezXQUcDGJx0g0tDfMaGYU1K8twpjmE0PjNhHA7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V339osqy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V339osqy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCC48C43390
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 05:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712725382;
	bh=5QDc1rPQ3TYFmVGVgeXsz9MfjLJ9ZoXJK6FAS6hl3+0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=V339osqyU+/5a31/uK1Rmb+bzfQdx5HsA3MkM59bvrXM7s3MCNrRpk4Oe0pfEA8Y1
	 n4I4IGspDav+4/uIG+kXECUZYbY/5pDXo6NmYCjRoWzPHO9rp1Dmop1AQaLAcPrOqc
	 asnw25DRaONRqcYudSiI58SRQ1aFzgf/YBmhtxHvAI7oeQV9t3+j7KX/Qc46ckBdQW
	 lVBoi5PVD6ZdNFAL7ASWlVKSo/vFlAz9GSJCXQJ/9wiCN3AGtsAibqNcXh5+ANXkAf
	 DfmOKjaR1jaS9NKEAf2qHJs5aj9s3skQcjZ3zuZgelR2Rk96F1hUCEfxqNzXkTtSvt
	 erGX3G7UXbKEA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CBFC1C4332E; Wed, 10 Apr 2024 05:03:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Wed, 10 Apr 2024 05:03:02 +0000
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
Message-ID: <bug-218685-215701-52NmhgILaT@https.bugzilla.kernel.org/>
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

--- Comment #14 from al0uette@outlook.com ---
(In reply to Mario Limonciello (AMD) from comment #13)
> Do you find that various CPU
> coefficients don't get updated even when you've changed the power profile
> when amd-pmf is bound?

If you're talking about energy_performance_profile, then I do have such a
problem. You can see another issue opened by me:

https://bugzilla.kernel.org/show_bug.cgi?id=3D218686

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
