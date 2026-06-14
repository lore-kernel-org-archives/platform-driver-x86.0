Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521EE30D3FF
	for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jun 2026 22:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781474567; cv=none; b=nXt7b+lrO6cA7R0sxjT3bp4X6ZoIwepxO3OhmC/7a1aGTF38PVGxeW1JOCDNYCcDLxIh8puS7Kc0jQnr/6KL7Wn65LzoZdxyJUM/QAC51cixYZAnG+hXfuzfDrW/p3FVXJjIxamHJnpNpbqq4aDxX4B0Cz2OWKkAXacjeW9PGfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781474567; c=relaxed/simple;
	bh=CinM/7j+KOEkNOayDUorgJjTgmZry0IMNIhxsSgutws=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cDxnhMEltZvLIXux0ABu04qib2sOtEeNxg/tQ9Yc+WFh4om79aRIqNZRyYH7kvuLI7xqgDL+klO7aoJEoDri0Qe80lyaffD0freBAzGkxTyIAD8Qis9HyyA5a3Dp2YOH2mJlzGo7g3GUak9KH9Gzlm1d42Svzkd7PsvN7YalQUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1iyzzQ3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1iyzzQ3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2A69C4AF0E
	for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jun 2026 22:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781474566;
	bh=CinM/7j+KOEkNOayDUorgJjTgmZry0IMNIhxsSgutws=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=o1iyzzQ36tJrxB7A2OMnj4LITTTwInDudOxKxyaCGdFF8OTn3cRzQmQGkmPH/PWgW
	 UM2WPARR9KPvEnaV2vR5Jhf6X5Lo8qu+zoVW1Qkx2QyLG4wpME3+HVyYWcMdGeOCRR
	 3MgLJPJFFmuJuaR2Tv59+NnkIAxS653uHdeYUyQIWwFxzbBtGcTOrbU2aAfoRNk6JO
	 EV7UDYk50RjR8FJ8Y3rlzLOhf+XUrDz1EzkFogeH2UyNI9wh2RUYAuCX9G6p1HKsMX
	 M43PitzbA+LwUmw5bNAXWPcxEKNZ+hoeER7QV17cYh9sLBvIcG+55Y131P+v3aNJ79
	 cQrPckXdL5wcw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B8374C433E1; Sun, 14 Jun 2026 22:02:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sun, 14 Jun 2026 22:02:46 +0000
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
Message-ID: <bug-218901-215701-2AhcuDISgM@https.bugzilla.kernel.org/>
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

--- Comment #102 from tacodog311@gmail.com ---
I tried the new driver on the 2024 Gram.

As far as the extra features link, that does not match the features on my
keyboard.  I have this:

FN-F1 (LG control panel)  ** works
FN-F4 (Touchpad toggle) ** double taps
FN-F5 (External Display toggle)  ** works
FN-F6 (Keyboard backlight) ** does not work
FN-F7 (Fan Mode) ** does not work
FN-F8 (Microphone toggle) ** works
FN-F9 (Webcam toggle) ** does not work

With the new driver, Fn F6 sends the following signals to dmesg, but does n=
ot
change the keyboard backlight:

[15333.979822] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371904)
[15334.310872] LG Gram Laptop Support LGEX0820:00: Received event 128
(268435456)
[15334.409043] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)
[15334.542793] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)

Fn F8 works to toggle the microphone, which did not work with the original
driver. Fn F4 still double toggles the touchpad, and Fn Esc, F7, and F9 hav=
e no
effect. They do send these dmesg signals however:

FN Esc:
[15854.894052] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371904)
[15855.210808] LG Gram Laptop Support LGEX0820:00: Received event 130
(1073938433)
[15855.352868] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)

Fn F7
[15884.223459] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371904)
[15884.817714] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371985)
[15884.990659] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)
[15885.176615] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)

Fn F9
[15921.433649] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371904)
[15922.062526] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)
[15922.067552] LG Gram Laptop Support LGEX0820:00: Received event 130
(1073872896)
[15922.282500] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
