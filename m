Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575501DFF8
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Jun 2025 17:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749144725; cv=none; b=M2T3QktwO7HO5Ufo03cr1HZrPQMQvyGSp5E35RTqUneUCNNC/t9+2ASvu1SXvg9LF9Wu2aw36vXjxbIH5DQZ8CGhraWhmFx5Db+gsr6gd/FgxCOJ9Ixy7/0dScpSusfH00uTQr74qRPYzMOJDGWCcDY+tab9i7G93w0hTQr3VWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749144725; c=relaxed/simple;
	bh=S0QHJsrjrC4QNnLosgee9n8HSaIdDDJNROTwGbUDiNs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nm+bcraSxDFljOU5LXgzx/ph8/Xpcp4U4jI2UlVZ26qoMWZVUOwN+yMouDb2O5sWRRcVArY02PFg0zcmKjIQwfE3XhlD7dZnhJUtn/YM0n1UoNtKhlM5nlyw6hTBATbysDBdUSyI1ydoctABp9p82LGpYOqUYCOn348z966/vMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gk8ka7+W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gk8ka7+W"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CED67C4CEEB
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Jun 2025 17:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749144724;
	bh=S0QHJsrjrC4QNnLosgee9n8HSaIdDDJNROTwGbUDiNs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Gk8ka7+WRcLCqa/tKAEbj0XKSGZ6+KdBef3G++b9Zm1t1201tu3WSc6RXmXJYCi/j
	 Fg9bnagHomN7C/UkSXKUQlCCEfRik20kwv8icVQp85HoW84SyXE1myL30KDijsMcjS
	 YB9braaCZV2J/gAsMCF+WgWSSabcKE1d3C7Uj8HEnSAAuSwXKNeoFpXkz+BKZ85eEf
	 0v9Bax52xfzSwAZCLgTbmjocD+u9CS7FDljMeTC2achLx7LhuYw7x6vPZxt+Aedj32
	 /uHi0DBjhg2Bg0zvI3EtaKltPEF4LeSoIp7jqydEDInId5DAHR9eJxEoU6dLGbbGO5
	 LPsgXrRLkyV4Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C74E3C3279F; Thu,  5 Jun 2025 17:32:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220116] amd_pmc - Last suspend didn't reach deepest state
Date: Thu, 05 Jun 2025 17:32:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Input Devices
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: mario.limonciello@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status component product
Message-ID: <bug-220116-215701-wrd76INoqw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220116-215701@https.bugzilla.kernel.org/>
References: <bug-220116-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220116

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
          Component|x86-64                      |Input Devices
            Product|Platform Specific/Hardware  |Drivers

--- Comment #22 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
OK thanks.  It looks to me that this is most likely a problem with your
firmware.=20=20
You can pass this over to linux-input guys to see if they agree.

But I feel you should report this to your manufacturer.

If the input guys don't find anything wrong with the driver something we "c=
an"
do in Linux is default that i8042 wakeup to disabled, which is something we
have done for a number of other vendors with various firmware problems.

https://github.com/torvalds/linux/blob/v6.15/drivers/platform/x86/amd/pmc/p=
mc-quirks.c#L223

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
