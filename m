Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F661370
	for <platform-driver-x86@vger.kernel.org>; Sun, 24 Nov 2024 13:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732454644; cv=none; b=gUZvoRS4z3eIBgEvIEKbawgypUap0LZ8Z5FyhQlyi57vKTw2Tj4mqZT4waRbPH6VLxVK+8YfEE/51/pZXb6MyLkn2XJQmS/ufpvmAQU3oL1LYFCU7luf7rdgm5cRQobml/OJGrfLYX+j4r67oHEZ7ZN8DLrZavEnQEBTwYHpbHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732454644; c=relaxed/simple;
	bh=lVAjAPe3ICkIpJgAPKi8jBWTFHBN6bdeNtU8AvVlPaI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NDl4A+LvFdImYh9YV/kLKPk6AqUUE/5CaINH5H/qIzSgGhyUJY2AsSsBvjLfT/dGgz8t14ll3D0VXdYW1OsYvHKSi2p5w6XACLSUpieaEYfXH5lVAMt0tp3BoFcG6GBRUM5r6l6rP7B/Jcz41d0+eWTp6lKOTgenA5K1OwfXWjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kTRI9NoG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kTRI9NoG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60226C4CED1
	for <platform-driver-x86@vger.kernel.org>; Sun, 24 Nov 2024 13:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732454644;
	bh=lVAjAPe3ICkIpJgAPKi8jBWTFHBN6bdeNtU8AvVlPaI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kTRI9NoGm6fr0XJhihxqrERvWVuX7dv/YdAfbJWPIG1bJLcjzkBPbXFv+poggMi/B
	 2ul+uF/TCL2aYz1H9FK/JDsZI7cue3uz0nS4ngVoR16hqI5FK7XqyL5E0KMPt3Cbjw
	 BzM7xX0g3uBbUMYnTLn2PWsLbNJknChfVB40xdVUGT3a1bjPc53dWJTTmo6qrU4Bsr
	 jxJJFuZgBc6+ur/8bQPyIRhar8FkLfHZPCQ1EJgLhEkc7rMeGp4cMF07sYPXCuVhft
	 4v+LgByJiJxgGHNzKW0gPZvwWiaBQMAG/8H5w1KGfVj4AAtLpcViGarI1ns+M6psJz
	 3Vy+WjodA+Z+g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 493A9C53BBF; Sun, 24 Nov 2024 13:24:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219517] REGRESSION: charge_control missing in 6.12
Date: Sun, 24 Nov 2024 13:24:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: auslands-kv@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219517-215701-s7JVS4xR0N@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219517-215701@https.bugzilla.kernel.org/>
References: <bug-219517-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219517

--- Comment #20 from Michael (auslands-kv@gmx.de) ---
Maybe it was because I was using 6.12-rc7?

Anyway, I am ok with the email address. Thanks a lot for the fast fix!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
