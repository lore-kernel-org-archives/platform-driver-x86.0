Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69E93AD514
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jun 2026 10:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780482214; cv=none; b=mP6s5PHVUdu7XdQo9tFv1DChKC3oFTCyI/Tpa29Q5J7RRcQ3n6v18yZbAl3h2nF4Q50KHx58Q7JPcvJT0ONXbcK8eQhMk9pBqQjmw0+fm/O4A6XqPmxXHc3mYuxPru/EREtxO2eVntMpixVA8RJKpljD4A6i0QXvqz6L7q/Jm9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780482214; c=relaxed/simple;
	bh=0QzMzYY83gH/yB6ouR5UxiyJ7hlzFloMOwBsTRhNHtE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tVqLgxVAOeWevxxhHjwku7FFZtqNTtracNbw6qv9ck0LVWsfW2/A/wE+qWY9x9xYsThlHyX67VsfY4hHgBsfjIKghGsnXJYApuzn2Vlvj58mBJhqtTZv0hD6bxgJ86WKpjdFEZKjYEXQ1DjJbsupxtlvwYf7nxSwCrHMR3CMt8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eLNwynEi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eLNwynEi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5179DC2BCC7
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jun 2026 10:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780482214;
	bh=0QzMzYY83gH/yB6ouR5UxiyJ7hlzFloMOwBsTRhNHtE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eLNwynEiBvtysuyKF1294Rqe9IHGFYx0R6/HgCspumAxAoUYX9n4cMXgVzCYRlqux
	 8HchCgGXfiOG4I9bjDLu6CzZe7d6F45H5lEZGv22xSajFxeQ0oAQGLgoI5FGWXZ/vJ
	 iDQWOA7b6IdXt4HW1qvGMHpd/c8q0RwO/DgvByNlc5rtwhDxkV3+3XNUl5EVIl9lhK
	 3tFbTTZi69AC+mac2j/7EQ1DrmrSDhuf9kFoG1Hv+T1HzTvfIj3vI2Klyg1X+YJYc/
	 JWC43SxGW0KKf2QJJRHgzpYR61kfxmMQANUMSSLLl05gU1JGr5axPdQxi166GK0o6C
	 W0lmmjXwlVjUA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3210FC3279F; Wed,  3 Jun 2026 10:23:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Wed, 03 Jun 2026 10:23:33 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-218901-215701-Xz6GazIui5@https.bugzilla.kernel.org/>
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

Armin Wolf (W_Armin@gmx.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #310222|0                           |1
        is obsolete|                            |

--- Comment #67 from Armin Wolf (W_Armin@gmx.de) ---
Created attachment 310254
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310254&action=3Dedit
Prototype driver with improved hotkey handling.

This driver should now forward the missing hotkey scancodes.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
