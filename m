Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7387227FD74
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2026 21:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777067456; cv=none; b=CKYIs6mqe4kQPWKamN0vWwlkH7J29Sjh7SR3zKMCKd42N0n4suhyzr0Yht8/+pO1v/NYvmShYJ2gCeNEJ/v1ilPkY/ebO0+f9/MMnIfu10LFjv/PHSL7WEa2130iBD2oR8a+v5EHXuOFmpBs2GntGtTt2h/vUKudgJckGDNGZBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777067456; c=relaxed/simple;
	bh=RqutY2xCpM0TOpBYOqOyIuxKkhFwY+o4qJsR0GglTA8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SO/URQ7LQuapGkzrrDSwB+OKtPGizfkg+M+Bl+OEeyHsZRe/rmDt808ltNUy3G72yx9R59Uza8Hx+Jww4kMc1EA3mcH/y1NHJMcuurrzUJ88CDxOJfo/NIyLfsm6eoGsi4Jekx8BWX6N8y/cKEtOTugCtW8SqaqooX6xvZk9l/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TaaGUDmq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TaaGUDmq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56746C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2026 21:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777067456;
	bh=RqutY2xCpM0TOpBYOqOyIuxKkhFwY+o4qJsR0GglTA8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TaaGUDmqMduax4vF/QqgF+vefSQBAKqH9TGYDUruKICL8kDDbUmnZcfBcO8PT8Uyo
	 rrf6ELwfTHmj1dFbIG/iH8GGN54ZOUrXt3CaUYA1cHVsA8nzh3gaXV5bc/TGxXG3bx
	 ZwoLR029iWTNpffJqo0UdcnUHs+oejDciLM+9woNZhBWjCGh83JU9DiEBKsugRvHlT
	 VqOVWiIL94QRpcKN5ueog0jz1M0bzXPUHC38weypp9nACt2reDbPvnyD5ePFAVrFmZ
	 4+wYNbMMo3BMOyzmHHpbmZf/aHXrccS1BrjZSzgFVdG9RLCOP601xvFx/P75Y/u9Bz
	 XnMVgxz8ZCuzA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 42486C3279F; Fri, 24 Apr 2026 21:50:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Fri, 24 Apr 2026 21:50:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221383-215701-dJhEMUPKRn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

--- Comment #32 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> My understanding is that these functions are pretty much the last thing
> happening before suspend / after resume, so probably not much should be
> happening?

Turn on dynamic debug for the ACPI EC module in drivers/acpi/ec.c.

> The PS2/i8042/atkbd traffic isn't much different, except of course after
> resume it starts a bit later now, and the functions called after resume
> (resetting the controller etc) succeed without any additional hacks in at=
kbd
> or PS/2 code.

OK - more likely EC then.

> Right now those sleeps are always done, I'll make them optional via a mod=
ule
> option and maybe a hardware quirk list later.

How about if you just do the 2.5s one every time on way down, is that good
enough?  It would be a lot easier to quirk (you can just add a new conditio=
n).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
