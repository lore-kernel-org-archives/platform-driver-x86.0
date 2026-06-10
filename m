Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B966D3921E9
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 20:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781124010; cv=none; b=LGXxkbHgjBysWVbHuTi8six0quNL5a9SaOkCnPW0NXmfRg684Qjwj7kK6PntRxru3rMS9XcPrENDVJZjImYgapH4J2NLtbJqWBa1/HrW1sOuQh5A8BRzlUka/NIuQChU2ir0Lc34Wh0XSrEmxSvP4ctRplChQAP9jBeMdJg15uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781124010; c=relaxed/simple;
	bh=tnP47p/qiwHfkbM9ECvmHNKVY5atzbbmzxiZuZyqplM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=arp7NkOWvgDNYqeW+A5Xp2IXmm7n/T/zSkmCB/ax1aB80S8VSNEvm2DzRB9RP0dex4aSiJHGACpqloJFh6/G6/PKbD8hFIvv2f9CYtMtkuCJFXSxzYGPdziAoC8XA5CC3srJT0zCdfpVdYKrTsgjVHwwaD3AucdPB4XMz94do6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qoQZRJWZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qoQZRJWZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 424FEC19425
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 20:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781124010;
	bh=tnP47p/qiwHfkbM9ECvmHNKVY5atzbbmzxiZuZyqplM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qoQZRJWZCCbIkJdNaxPI8xusQO6lV021kXPGM4eK4mJS1VG/TlbbA/sk6wzeLjyES
	 FEB2vVpUxacaObn7g8eRLorlR0zdNdClwwLsD8/y5InuKQR72c1WMKokiNpmJ1RBXc
	 x8ul+dYF98FR97dKccJjqFAvgyv1ZGhNYKGkTmkWHtelU+tY7kS4l/K9arSgtPgXkf
	 untrhrOdwXVhAQh/kQCEMgeyoPbUsA3Ua33MgCghuPGI9k/xt0DvltwmHFuDHrzOXP
	 YasCqlPHsQ4/Utw0Axde1GZQwc9u2ZH5dMl6THybR/0CZNtgj3lcgctJmvy+54HuYq
	 b/IRUN2PZSCoA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 238E6C41612; Wed, 10 Jun 2026 20:40:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Wed, 10 Jun 2026 20:40:09 +0000
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
Message-ID: <bug-218901-215701-jNu9w48kaw@https.bugzilla.kernel.org/>
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

--- Comment #84 from Armin Wolf (W_Armin@gmx.de) ---
Sadly i was unable to find anyone with a LG device, so i cannot fix the
keyboard backlight and fn lock toggle issue just yet.

However i can send the necessary patches to enable event support for your
device. Are you OK with that? Just remember that you will need to disable t=
he
touchpad toggle scancode of your keyboard using udev.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
