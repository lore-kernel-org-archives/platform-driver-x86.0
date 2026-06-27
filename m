Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9588F38F930
	for <platform-driver-x86@vger.kernel.org>; Sat, 27 Jun 2026 08:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782550416; cv=none; b=iOaJTGbgFjaV7L0sp5+nVnt8WyFEGTr13+zrNE6URReetMnKPXiO4h5WgcgFqzIMRrAp+2lPw+0Ab7ayFopddrwS592VDoP6AMXkO8b1YrP/vh5xN4pIC1Rjz73Ai5It5JJsIVF6zSl/WHL0pJolhH3RQd9g2FVAM/DADSJOPrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782550416; c=relaxed/simple;
	bh=szgWyB0YyXpTWQuSpXZykEEquEPheePI6vJnXd9a7b0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rUHcmBm1k4mx+oom90Lsz9O/XwhyBgxu1Q3FAJfMzIEgRRoiu+XJKjQ8WS6qP8Fm2i49e1/gBZTgUy0XyKcMSRQwjZXw/Von+vbVdOh9GcpzWruYgk9ip4+OZtFan+bnh2q6g+CL37YiO4gZS27vAQpZhbIwgTyJHZ2U711/bJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LyzTcnul; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LyzTcnul"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49552C2BCB3
	for <platform-driver-x86@vger.kernel.org>; Sat, 27 Jun 2026 08:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782550416;
	bh=szgWyB0YyXpTWQuSpXZykEEquEPheePI6vJnXd9a7b0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LyzTcnulgGWgE13Dcg5T4WKOXtTbadA9Be3+c5WPzkn/pUef80RYQBc4fAg9eceKQ
	 8a+Xd9EJLKvVwn53p42O4LzMsb6g5GVeQ50m7yFcLSdKgcywJfz5PLnQZXb0cmLMSQ
	 L4KBNYAb6seNdZXUuzSZBDfMPlmbTx3l56mBNheohsF3h3QpZP2zBvSqZbiemEDXRf
	 pmalrU7HC9v2NNi2tdcrD3W7W42ZWkETbtO+8ticeL7dPmiQlUyFMT3HWw2ClS85pm
	 PtKkrzJXaUQt1aLXhL09Vx5jayA9dGwYawZeSE7gjtB+amQHEJQMjEVxOyMTCtsTW3
	 Db6YSG1LCetWA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2B85DC3279F; Sat, 27 Jun 2026 08:53:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221694] [regression v7.0->v7.1] AMD Strix Point (Ryzen AI 9 HX
 370) intermittently hangs on resume from s2idle
Date: Sat, 27 Jun 2026 08:53:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: hongri.cui@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221694-215701-MlbEeMmwfr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221694-215701@https.bugzilla.kernel.org/>
References: <bug-221694-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221694

--- Comment #1 from Hongri Cui (hongri.cui@gmail.com) ---
Follow-up on 7.1.1 with amd_pmc.dyndbg=3D+p enabled.

1) amd_pmc SMU mailbox trace (good cycles) =E2=80=94 attached: amd_pmc-dynd=
bg-7.1.1.txt
A clean suspend/resume shows the PMC<->SMU mailbox completing on every mess=
age:
  suspend: AMD_PMC_REGISTER_MESSAGE 7/6/3  -> each AMD_PMC_REGISTER_RESPONS=
E:1
(OK)
           amd_pmc: SMU idlemask s0i3: 0x7fff1afd
  resume:  AMD_PMC_REGISTER_MESSAGE 3/8    -> each AMD_PMC_REGISTER_RESPONS=
E:1
(OK)
On every cycle that resumes, all PMC->SMU messages get RESPONSE:1. A wedged
cycle leaves no
trace (journald frozen at suspend entry; box never resumes).

2) amd_pmc unbind test (cf. bug 221664)
  echo AMDI000A:00 > /sys/bus/platform/drivers/amd_pmc/unbind
  # then 30x: rtcwake -m mem -s 30
Result: STILL wedges (cycle 14/30, same silent signature). amd_pmc was
confirmed out of the
path -- zero AMD_PMC_REGISTER_*/SMU traffic after the unbind. So, unlike bug
221664 (where the
same unbind made suspend succeed), this wedge is NOT gated by amd_pmc.
Caveat: with amd_pmc unbound, /sys/power/suspend_stats/last_hw_sleep stopped
updating (stale) --
the platform was no longer entering deep s0i3 (shallow s2idle) -- and it st=
ill
wedged. That points
away from the s0i3 firmware handshake and toward the generic suspend/resume
path.

Next: I'll run git bisect v7.0..v7.1 (clean A/B anchors: 7.0.13 is 30/30; 7=
.1.0
and 7.1.1 both
wedge ~10-40%/cycle). Happy to add no_console_suspend + netconsole to captu=
re
the exact hang point
first if that's more useful. Advice on which welcome.
Attach /var/log/amd_pmc-dyndbg-7.1.1.txt to the comment.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
