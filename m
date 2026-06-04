Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1339B3DE443
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jun 2026 10:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780570571; cv=none; b=fozqz8iNjWVob3hauOY0/yXbQhmfBPhfBGbrfxfdqurQZhQoZD/XEk58KyZbhd7Uj8am7IdWBykck7pS2aE2IoLk92kEysw910/bix+OSZRet6rIj2CTthe1xesVtDVVGT3QVs4icsS7nR7s/KLuhL+Z10MU9L04N3p4pqr68WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780570571; c=relaxed/simple;
	bh=xgktKS9bkNkZfLeTCoc21yKTTmOI9FXX6w2Auw+rt6E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E1gwSTHsOBjtj1yknoNjXG5HEKqgGUZmAn9jd6cc/vEeG+CjtffU3RRRQT07Zgmy0ccT95/7+UGufaZPrcXJVqxHCn2UCXLkS+SCV0wDmTWoGfFDvvzGIC/pBFsBVhl1NrLI+VSUFB7EKeP9mYDpJFYAHk4u2hRbr0HW6PohVNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+rvcSYa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+rvcSYa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD040C2BCB8
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jun 2026 10:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780570570;
	bh=xgktKS9bkNkZfLeTCoc21yKTTmOI9FXX6w2Auw+rt6E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=X+rvcSYausryr1m8tmj7MUgHXkv7i4XKj5kbHKSd6aXH7/3jOvay2QYr10Ef5PAUk
	 hCmFxkY72JThy7vl3EsiCC0FriaGLJY9+j18wgAdNChawwqVfAFcMDm0RU5i7kGKdd
	 zJfNztE0+gLZIa+ujMazGLTwNWzHka275LwMe5G+K8oPY3s0h2TBcSQ7NXvcE5MZg2
	 ddmaE9s+5F9MABnUBgO5j2A2m+a25YjRU92mTkO9iwX1FPHMO7Kaz3N1zy1zH9+AQp
	 zcNRSWasxrXAut8ArDEzIsoAroIJpHLE3rnFH22WRykKlc48wSGqw4Cyv6Hfe/5ecT
	 0SD9iMp4xrfkg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AB75BC41614; Thu,  4 Jun 2026 10:56:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Thu, 04 Jun 2026 10:56:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: 4966508hayk@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-ZDecTSQNKP@https.bugzilla.kernel.org/>
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

--- Comment #74 from Quaternion (4966508hayk@gmail.com) ---
No, I just run lgfnlock.sh in terminal to turn the Fn lock on/off. I cannot
trigger the Fn lock on/off event by pressing Fn+Esc.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
