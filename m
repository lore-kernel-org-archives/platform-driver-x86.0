Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA55D3F20EE
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jun 2026 15:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780415706; cv=none; b=hMtnsbE4dVQ7OpAPaVrL+xcrZbpWKmdh3F82W1ap2TqJZK3y7Ny/CC4X9ONvZ80R9Rath62b986DIYsEecUr9neSPGTtyFRW+61177NYdn5F0bnIEjSTCBS43yocu4oo/I9cBU1qkn4N8ANdvPqKAQgmtsfpoQXoBd/We8lwsH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780415706; c=relaxed/simple;
	bh=Ee933TxxF7ti2GZOvtl042GPUaKYmTwhmRnX98fn8/A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bIsLP8Ddmp6Kl288XK+iDMx62szBv5CHjVBycs/JjYaBx0B2o1vk0b3ZywmAsnyrwYiiKNygY2XApPb/i3gpZsO3bxQpaeH4mJsg1L8S5+5es65/mP8kmv0Q814W5EUiIxQgD9kec5zQMV6+N4fn/u1nA3+mpu36/7eeashwNEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyY3nZWO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyY3nZWO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79CCAC2BCB4
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jun 2026 15:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780415706;
	bh=Ee933TxxF7ti2GZOvtl042GPUaKYmTwhmRnX98fn8/A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CyY3nZWOnFW7iTvW/GI/V6NrJBVeWHfACnhvMtCZaGh7vw8QYI2dWHhIfQCHZBPgB
	 XLgTuxrb2KvJVpS7jV6ek5iUEKqkSooddm3rSuINU1xhqax9PvdVdkq195n7mk/eSG
	 IoH6g/60xVNNFHTpazGO1c2MbkavS7LF+SiByQsDz2/Xrd7y1KyUXq83V1CqTseCZP
	 lMivc5kYshbRarWSB/qIzWUWyhTLuqGSdIyQcjN6F71oQX1fQb2HlJSG3b574JqsDE
	 lQhi4DW3VPT75V0XhTNNkxLsUbrzdTWr1yHhnOjt1qp6jWnysW/EU4l7PpK8VDVSVv
	 aKytbDDkTMR0Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6FC5BC41613; Tue,  2 Jun 2026 15:55:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Tue, 02 Jun 2026 15:55:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tacodog311@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-OHyz1drZoT@https.bugzilla.kernel.org/>
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

--- Comment #66 from tacodog311@gmail.com ---
Yes, all of the previously working hotkeys still work after installing the
driver.

Regarding the "don't release after pressing down" issue, I do recall having=
 to
implement this udev rule to get the F10-F12 volume keys to work properly.

https://askubuntu.com/questions/1314193/fixing-broken-volume-up-down-and-mu=
te-keys-on-lg-gram-14-2-in-1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
