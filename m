Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4B527A123
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Sep 2025 16:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757953470; cv=none; b=dYcQWeBHkAUb3apDIx7rJQt7nr6KpnupII1x0ze+ORmSDDf9IEmytJohDx1sOxm3Z8L4aAIujn6/qSVYDoTeh90s70CVflVDCAbn8+i/61+iEGlK1emDwIhD0mjHZPbVDcPBIi59R6za9yPDJ9hlsgUeWf/GgOHmehm8NyQ8Lzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757953470; c=relaxed/simple;
	bh=pf/BrGYEFL5hZJqWXn+BoZsSP9gUfzxHLGIKHeHfFt4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c0TUlRsTqVERBeKNx347j4qZGl4Rly7pAhCxd9mD6f/5au8aZZIVsTnUFDMbkXZ16SxsTPj5wmmINjkovOLd/GnaigzvoyYUcNL8HSb63de3gY9HkhXyZbI9gf8TPuwxodnSqLWV5qFFxZ+KOFywtJriMszGJ5NLe8U98Tqx9lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WtD3DFQC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WtD3DFQC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3EB1CC4CEF7
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Sep 2025 16:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757953470;
	bh=pf/BrGYEFL5hZJqWXn+BoZsSP9gUfzxHLGIKHeHfFt4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WtD3DFQCheKY4p35s7amEp1ZaDQX7fb+9rhNBLgXII+Zh0BAQCXOYkyyROaCoPzlV
	 zC5YVIRmpoC6GV+bdYD/6vMUdeBg364vvEC4Uc+WOkkXN91R/Bzehx6Y5oHHKKc/2P
	 ZW0PUfpQUII7CRodWJq/tcwAEWxEJGuDmvHZoYhCqepkQ6IHy9lq1gfYVlA0mJN/Tt
	 reTccae8nsbS4acFONldj8W+ikxTwCujJsoJoMKhZPHoiLZ/v9Be2vOnPqqqM9K5NJ
	 mD3on7zhiop0GIGL0T9Hd74xR2omA1QU/JzozNAMf2BrIUWoUeHifNc1DUlRBJcNW+
	 9pw+H7k9Hzvow==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 32FAEC433E1; Mon, 15 Sep 2025 16:24:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 15 Sep 2025 16:24:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-IbTZTuMaGp@https.bugzilla.kernel.org/>
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

--- Comment #123 from Mario Limonciello (AMD) (mario.limonciello@amd.com) -=
--
> What kind of delay are we talking about?

2.5 seconds.

> If it's under three seconds, I doubt anyone would notice.

You would think this - but there are test suites (such as FWTS) which check
hardware sleep residency; and this throws the numbers off.

> It makes no sense that you, an AMD engineer, have to struggle with your o=
wn
> hardware.

If you look at how many quirks for BIOS/EC issues I've developed over the y=
ears
unfortunately the reality is that many OEMs don't test Linux.  The ones tha=
t do
find issues like this and fix them in their firmware.  They often have litt=
le,
or no quirks and things work out of the box.

> Perhaps AMD could really push for a certification program for the EC.=20

I don't really know what a "certification program" would do that a simple
series of manual tests wouldn't do.  Adding a test case of "boot system on
battery", "suspend system", "plug in AC", "resume system", "check performan=
ce"
would catch this.

But anyway - that's a business discussion not a technical one.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
