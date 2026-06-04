Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081B33E0232
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jun 2026 08:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780561535; cv=none; b=CfDnyok6miqP1IN4uQaXQK6zoZ0FLGBh3KwP074lIjekZz2GIqxC3Hn2fn5HuHJYIo6iIHrpu4lnjhjgXFVsSGl4XGq06TaVvx2ly8EeuNr/Y2SR1nToS4VwwkCg2hNY67Y9IMvmYNsmJF7Nl9ufyl1YDnLS0Gt3/odUsjahffA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780561535; c=relaxed/simple;
	bh=ZJQmj6zlMdBU27r3Bpz6jByENAdMOD72kjUH7MEDoX0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B0uSHJeWPk7LR+XXOVgJ6+x4HK11tl2vUZ1un2RKmNLIU8qdiEuQ95GRKxi2VrewSylxjbwgV9ZJiMMBLrnTTyUXDH3NqiRHAZ5N+ZG40HKtphoSCCVlrfTI3xhfyTP1lMIbRFxEiYXowGfiwBbGcp2XyMYzS2zL1mKqJgYnMA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dovwA3x7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dovwA3x7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8D84C2BCB8
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jun 2026 08:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780561534;
	bh=ZJQmj6zlMdBU27r3Bpz6jByENAdMOD72kjUH7MEDoX0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dovwA3x7Qxn+JBKE0J/bIWe1KUP+9qDmeOilHjK/SOtbDfy0TwsxHuM1TCmMYduVq
	 imLbWmILuqMuerdUpcw5EA58DpREESfxNRuVV+SbqmSxPwtiaI16GBIUM2TY9d0J8D
	 qNvacygmDbnvv0gGDz9R4CyKEvwR5tP9FXZfWVJEF02VdQDJsG2t6WlgWolQntMvrn
	 a2fGqiTTqbbkumKicpsELDr6BAZKM3vBW4GgClo+tcDzjYztFwIUyRbKCltNIEcAiV
	 FNrnqNpJW7R76KybEAjpmXTASro2n50aLgH3TX8PI1hlUwjZel4AIYnnuAQzKgY3eC
	 ax0BOj72qbsZg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A8E2BC41614; Thu,  4 Jun 2026 08:25:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Thu, 04 Jun 2026 08:25:34 +0000
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
Message-ID: <bug-218901-215701-Lo34CD2xqi@https.bugzilla.kernel.org/>
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

--- Comment #71 from Armin Wolf (W_Armin@gmx.de) ---
evtest shows that all keys emit their respective keycodes, it seems that yo=
ur
desktop simply does not handle KEY_PERFORMANCE and KEY_CAMERA_ACCESS_TOGGLE=
 by
default.

The touchpad toggle key also does emit KEY_F21, so i have no idea why is sh=
ould
not be working.

Can you share the output of dmesg again (with Fn+Esc?).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
