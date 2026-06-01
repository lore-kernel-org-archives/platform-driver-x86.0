Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D003188596
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 17:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780335016; cv=none; b=Lw1uVPiy1qjkz/HhcMUL5cVKGI97lOiniBzfFneQpzdoWI3Qsq3Hc33qQQbSqPow6cuFnizz7lZwT4eVhzZkdy6S20DRukLd+nnujzcdmtYiiXnHBSiLyKJ5LCjo6z/Cw8Lg10Kl2lIUL2B1egBsGqPM1qnndKHHuiYmSurxzc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780335016; c=relaxed/simple;
	bh=qa2PBGjB73DNWp+O5whbqf28pX6th57E52vQLLhe+wQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AUFo5hOYm+Kd/2VWUlMq13d305lh6ofPXF548UwmaoPXXtpCZL1kPPAHOvq5TsjLOu8fioP3AROvsBo6se32uKgHMxkRx0HzxjAEzvO+GGe3YaA4Vt9AXGe5KyJD2+53OnVa2yanufnMseiXDDB6oPbUiqCaJ30AXVxGIbhsVCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ShQWh6vc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ShQWh6vc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0EE30C2BCB8
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 17:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780335016;
	bh=qa2PBGjB73DNWp+O5whbqf28pX6th57E52vQLLhe+wQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ShQWh6vc0D9g34hhHq5RTc/ijP72we7bLuW0vSAuk/EdeuLfZA+vGBUqhJeJH9eJ6
	 +wYNBvKI2chO1ax6Rr/NjrIyqFb2N0UuPnEYLgnmpac/ecoKEL0wbTHRsO1ZU/VVd3
	 /LJrAgOhir4sPwcK9w+SPIBt9KQB+sGxvkLLu19zScVwNuxpa+ViSOpz4thvFMAbCU
	 d4W58rGARU+Cu6YE+Wqdg5s5l9et0bV6CTMfNK06qu5tiHTFVsfEfbepsBYcxbpTWe
	 Kkncq89zjX+nfulFU+gmlnPYSvmenlsEGAGL8CN+VGCSJVoJDsadv+d617xbQe9Won
	 X21aZDGEVnMIQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E6470C3279F; Mon,  1 Jun 2026 17:30:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Mon, 01 Jun 2026 17:30:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221583-215701-Rl7VkHyGdY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221583-215701@https.bugzilla.kernel.org/>
References: <bug-221583-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221583

Rong Zhang (i@rong.moe) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |i@rong.moe

--- Comment #1 from Rong Zhang (i@rong.moe) ---
Hi George,

Could you please dump the files under /sys/kernel/debug/ideapad/ and attach
them when replying? Please also cycle the keyboard backlight brightness with
Fn+Space and see if it changes their content.

An acpidump will also be helpful.

Thanks,
Rong

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
