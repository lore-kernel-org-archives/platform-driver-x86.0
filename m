Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9D121D58C
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 18:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734719435; cv=none; b=h/vOduZ7VH0N3kC3f6X9gH7LHkqGp7mqU92hejJBukOtTF3Ldfb5ov685unq3HIn+OHlb8GLVvUhn/IO2WDNlx2lLqSqKUM8f98Czz2VaK7t3td6pck9EEGDHzsvn84Gs4ze+W2EiEbci82XGblKp/j0J8kmn7mcJmov21T0Fko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734719435; c=relaxed/simple;
	bh=JDtWXbYAGX+dqxAX4Hq0MNT7uthg2IS3FW+3BLk8MSI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W48kIvwJKVDPc635HmqEieDAjZ5QxYObENL8/hvqLumi3QJOuT7h9xOhra8V+6lW3YWwP98c9eS8L/ZqQUjh12gu2L0KV2sE2Y8BUOv7N/mEAj+3Ldz0PZTjU8i49WHonmMyDepPfccz8G7Sa/QN/EyptjvuZiaLWq4ZR3tHGhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FewX7hfF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FewX7hfF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 051B0C4CED7
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 18:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734719435;
	bh=JDtWXbYAGX+dqxAX4Hq0MNT7uthg2IS3FW+3BLk8MSI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FewX7hfFcRIsJhHKxha/lGztmVxJMA6PME9G1xyxUpgMuo8KRA4ksubCusJSF3tBW
	 M54KgPFqXHv7HGWzlTvghJiHym6X3Qd7SnkP1qSS9bs7I3JXBjzMWeX2Ki/pCYMpGo
	 tqliPqcx9DZ3dhu0GIUYJbNz2jZtMc5pXG9iJ2gPT+4oinThGIE8kAAMMuaISzkYcI
	 RLpgKrU5aOaFescyoA5GDKogJFquUM3G4VwvMK28ygkJqXxvk/bweps1i3gX8OhLyf
	 aOxAOW6lDsqLCBV0t80Z86V92HhLK53sgvLhhXibde04H74yCaQEPZGgUn2pKyZ9um
	 HQdMjDb7SSjAA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EDA3FC4160E; Fri, 20 Dec 2024 18:30:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Fri, 20 Dec 2024 18:30:34 +0000
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
Message-ID: <bug-219495-215701-Uh9SXWam9A@https.bugzilla.kernel.org/>
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

--- Comment #34 from jarkko@kernel.org ---
I'm working on a learner fix than my suggestion. A patch should be eventual=
ly
out...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
