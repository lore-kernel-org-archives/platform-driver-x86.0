Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8EC35E930
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Jul 2026 17:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783878753; cv=none; b=CP4LQRSxBdD32LVtvRBxVLdoEs3OMMZCAeeoMpGKSOKs/VkmpUdOKAIEuCzpemexLTLA8oLY8spodgdaU28MRIlMPpWxR0uQ3FCiUpFY0dDR1WDzgK5RQ3+zvDvEOe/Ba57mErt6AerQTtijiDsQJaz0Fo8QYD6iDzFAPd/hvpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783878753; c=relaxed/simple;
	bh=MsythmgcwciYJN7jZM7Gh5bFVAw6Cwu3F12VHvNTFn8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DxLE8vuhGmXcAx7JRfZB/MyYKULcq96VKBtRr4pa6G4lz2hLuOhcJQIvyNdZr1gctwF+Qq5L3L4wGsOQsr8BCL3t3VnXVipG/hcMFNapomqM2q+ALkIguGPhgYsYKQOZlNtH6lvV22IleScuGLv5IvTbSBIAY+uLilI7jIjciLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgAYma8G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgAYma8G"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 922EEC2BCF5
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Jul 2026 17:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783878753;
	bh=MsythmgcwciYJN7jZM7Gh5bFVAw6Cwu3F12VHvNTFn8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WgAYma8GRffvtLjBb3MnZNBtcSJfixFwuuXX6QOyOyF4z35gesLi/BYtKNz9S/HX4
	 TuVrhG9QKlc9x5bO7TlkVBe2rVjgw2pdr868y8mEyql4BO5tEs39MIQpYK/hFy4bC3
	 wpU7H/6kWLnLUE41NbcIBc35LsELrioei+vh1nAZ38TDjfWc0leuU+0g73gfGcrgNA
	 aduI0BCkB8grwVY1JOi68w73T3VYpwLvGT+YgcM3tyFCC5Ow+3o13HCDOjAkMQ0DHk
	 8EX6P5i3NApMZZQqFDckTVkbVzLE1fDsyR8juW25FjJa+XXCUYrHy/XwvBr36G/aCT
	 UN4pwv+TPtpmQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 81E55C41613; Sun, 12 Jul 2026 17:52:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Sun, 12 Jul 2026 17:52:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218305-215701-4FCRLGtluQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pepegnu@gmail.com

--- Comment #152 from Artem S. Tashkinov (aros@gmx.com) ---
*** Bug 221744 has been marked as a duplicate of this bug. ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
