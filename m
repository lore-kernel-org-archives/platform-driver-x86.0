Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2974503B
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Apr 2025 18:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744308111; cv=none; b=ZyODurs4sz+5s+uZ0nEpq5kcAuGT7APUwOg9Yzc9ZBH/SBcQNR6VrExHzBlhkoeNPZ2uHX7tUbVXunZo4Zuk96O6Whi94njI4mKBnIa2z613SPSpRTXaj0l4iFjn6jT79ZAcGf2aBsGjUfu+eCXW1ZS03nBZspGbmZNQo4KsXns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744308111; c=relaxed/simple;
	bh=OAjREGArxhMhmUMa4ixoo6fsIhQzOfzYrtoACI1h7TQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HSqvFrFS//xMtToKC2c89n2FTtIFCDnBpZeIa018zNPuh+/Pk10XTdgf1MR8xbT27oKYu0ioloUVSoK3v3PQKvgi4r77G++xtCW/MCxrOUt6yVKBHnY4Wjwyr8w7l4OQO3Hi7XTfJUwG8sr0Ay31EdSgX1LKqu50bFiz0tRyuw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aw/Xt3F8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aw/Xt3F8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06F45C4CEEB
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Apr 2025 18:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744308111;
	bh=OAjREGArxhMhmUMa4ixoo6fsIhQzOfzYrtoACI1h7TQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aw/Xt3F8udY1u074tMPmVMzOPONB54c82z9244oACapHHyCglKpFFCSrSzxBcEWGn
	 /OC7jp30WfRNTqWhKXhJG4C1CkBbqDE+/If05WIcxWGKwjnvTLMyP44Me5dQnoiJZo
	 LlUrPoY2WQDh8sY+JG31WqVmh+tX0FsH+c4UF6qGMCW5QVFZ771ly90hsGHfGkC4YM
	 VbdZlAtdd2TKPHXh9ZGcR9aJB9c7dIw3kLz3fw68GNuGUi9Z1nTr3UPpRV1lpflSfv
	 cMsNBwtykJiszHw3+/m3BEwQyINvPoEl7L27/tU91QZeDy9fYQ3LABHanM3+FoGo8l
	 JwvgP5eAyK9Zg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F0C83CAB780; Thu, 10 Apr 2025 18:01:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Thu, 10 Apr 2025 18:01:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mail@dmewes.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218305-215701-WQ7LHH8mO4@https.bugzilla.kernel.org/>
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

Daniel Mewes (mail@dmewes.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mail@dmewes.com

--- Comment #84 from Daniel Mewes (mail@dmewes.com) ---
I've been experiencing the same issue on my HP ZBook Power 11g a (with AMD
Ryzen 9 PRO 8945HS) on both Linux 6.8.12 and also 6.11.0 (with Ubuntu patch=
es).

In particular, the variant of this issue that reproduces reliably for me is:
1. Laptop on AC
2. Suspend
3. While suspended, unplug AC, wait a few seconds
4. While still suspended, reconnect AC
5. Wake up laptop
6. CPU frequency no longer exceeds 544 MHz until I unplug and/or replug AC
again

I've tried your patch Mario that enables the sleep for all CPUs, but I was
still able to reproduce the issue.
However, I then updated it to sleep for 100-200ms (instead of the 10-20) as=
 you
had suggested and I'm no longer seeing the issue.

So it appears that this is a valid workaround until HP fixes their firmware=
 (if
ever). Thanks so much for investigating this Mario and figuring out a fix!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
