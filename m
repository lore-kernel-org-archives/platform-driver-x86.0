Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0A428D85B
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Apr 2025 18:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744309802; cv=none; b=QHvfpG8nrf1OWrMHoVPwTQsdq5pQ3wLUGOfud25c5wgvvYQH5h26D8+VA9RHIpIKl/672wWU3/doGAQ9JyZdXHFa1bURefxoqVWYf6JVn2MYTjJVNhwciyTNHob/B8IILvlr2xNLFgKKRQhfpyn3MBR+EOFOJAUa1ThT4daMaWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744309802; c=relaxed/simple;
	bh=XWhSAZ5tEe9ag2sRK1K+eFckeY95X0s1vmCormnHHbU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WP1vZxvctffAl4Tnj7CMxO7vhMqMp6giVxHPd0kAcIDFg+94OnRu/gsNfKo5/ipKo1LOG9OHvaEMe4fguy6mbS4E4/FTAlB0z/GsWCaRuhxZ5HEQ2qTyhb914SRaGbhIBbuzcJ+fY72xIONzS+2DUIub2KHegHjV6ZaXclk/kwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JkINbFZp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JkINbFZp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6FCAC4CEE9
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Apr 2025 18:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744309801;
	bh=XWhSAZ5tEe9ag2sRK1K+eFckeY95X0s1vmCormnHHbU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JkINbFZputUqVusMudfs08Q2W0nZ0QzTv4up49NBk4TN4fAOmLvf8xeY4EUfD+8Jp
	 mcmsOF/ZQ5fyFnmqINFbBpsgvSiOflHUCIgECvFUwsQjxdbHqShtAWway3woUFD5lW
	 Bwy6M4Kpfbu5RfPnXfqyBHz7plsUNyzja21U1hcWKCgpryFfYZLtEY0E8L61VH52Cc
	 gA0hxkpyKXjgiDg1bZQZQEIRCHfese/ZxTXJMgE0OxMRQEnI9CAa6JRFpu8ZTvSYB+
	 RmhN5RLc6yv7bAusEhHmfHbaoMjdVUGoNkGHPcmc5LwgH8O5u3f6uoSs5BeSkLZBxt
	 fBqo8Dh6Kp6Pg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8F5CEC53BC5; Thu, 10 Apr 2025 18:30:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Thu, 10 Apr 2025 18:30:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-cDvr5FBCS0@https.bugzilla.kernel.org/>
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

--- Comment #87 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
The side effect will be that the APU doesn't go back to HW sleep for an ext=
ra
2.5s on any time the ACPI SCI is fired.  It's fired for things like power
adapter and lid.

So look out for anything happening around those events that's out of the
ordinary.

Side note; with that 2.5s in place can you get me a report generated with=20

https://web.git.kernel.org/pub/scm/linux/kernel/git/superm1/amd-debug-tools=
.git/tree/amd_s2idle.py

and changing the power adapter in a way that would have caused the failure
before the time you program the script?  I'll just double check if I see
anything funny.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
