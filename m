Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA03640DFCF
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 00:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777075299; cv=none; b=jBkvCsLO/P0pAmiJSUlJemU1nGi/37aAC0Zc9lRkq12mHd/VhN56bk85t0NyUnIcU3r2btWIDsTmzLxV1XkZv6iosfi2o7n1RaZ/pI0RmhLudJ4JPMjAHWK58jkkwpdqBDmCfN3A22sGy8lY7wMTE1hzT3pWSOjuBjbwbhsK9Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777075299; c=relaxed/simple;
	bh=Izfaxc+JorsbKrTL83eG9b6sb8K+0l38hFn7gXILYtE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MxklTrRtCepv4c6+bJq3WXq5LVnQw+Yt8wbT5zV4FZZOltDAUODJxuzc25kn/WyYdQw/4qGswKt2laLzuBMgxH2zKbCAsofAruLLof9i9nd7p87RzBTADBVHPeho3LyS8bNJpWZvxYQqZk9kkr/gJVTaOnY6zkr3VvzaSzCBjNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iqi8Rxm+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iqi8Rxm+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6FB78C19425
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 00:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777075299;
	bh=Izfaxc+JorsbKrTL83eG9b6sb8K+0l38hFn7gXILYtE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Iqi8Rxm+giwNK+79RZY+Dd4023LpeCaIwSRZAzwxzHY86Ur9y4ZCPjCHbp2HAGs5k
	 MmOff41qGkVEbhJVD9NEbhRipYnmMbWmEQu3otn4+fQxSObTWpCa5rfJphQ4aZZ3WU
	 7vuJ5i5bIn/+ywER89KTj9yEMNGcrSr2gi6WEbwVv27IYyFRhp5YiFHJHgmdOVEsVD
	 juiwHiJMJmlebl5QH0O23Jq9Gr3YYcYoLKhPg7Vm5+B260L7KcSxDEnP6r7vzubRX1
	 MoueK7dMG6ux/Sx/UmCKQc59a1r+yPZFS53KsGRv6N7rbYNdujTpic1a5b0o8aIluo
	 OMVLlDXweWTYQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 601FDC3279F; Sat, 25 Apr 2026 00:01:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Sat, 25 Apr 2026 00:01:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: metalcaedes@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221383-215701-theIbLTpwN@https.bugzilla.kernel.org/>
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

--- Comment #33 from Daniel Gibson (metalcaedes@gmail.com) ---
> How about if you just do the 2.5s one every time on way down, is that good
> enough?

Yes, turns out it is. Weird that sleeping before and after suspend for a
shorter time and sleeping only before suspend for a longer time have the sa=
me
effect.

I'm currently comparing the dmesg output of the broken case and the working=
 one
(with sleeping 2.5s before suspend).
I have nothing definite to share yet, need to do these things again and this
time make sure to use the same way to wake the machine so they can be compa=
red
easier.

But one thing that's very noticeable is that on resume there are *a lot* mo=
re
messages from EC, especially right before "PM: resume of devices complete a=
fter
1518.040 msecs" and right after "PM: suspend exit".

Once I have better comparable logs I'll share them here

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
