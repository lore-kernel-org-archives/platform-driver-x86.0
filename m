Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CE03EFD15
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jun 2026 13:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781529032; cv=none; b=n07HhyfMO0oDRb/EfScpVyBMI9YOj51pNIttf6C8+USlm2ELd6Og489vvQZu5dRbtnSd64ilrSVooZYqsIoNTZydVzk39M/c7m4/gU9DmfKV8ceOvlcSxIhYRnmQIHC/NMhzhYz+8GlmLoqYszJry0OVjK7W8JX5pBiQrGZ9FVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781529032; c=relaxed/simple;
	bh=dzYqlV8/rHOrOL4f8/gkdZv7E07gDB83WHMDhjhtIMw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BReS3omMEsPSgznRSRxuPCHhh1ex4h6KXN9J++VRmjGaU77liJDkajNxBworkwGrhr8F/Yq9JEbMlhCStcBScLc4f9IVF1j4e7+Guiqi8eGZJX0hiUOxVFXu+0Wwo4mNHVNcxTYAKnk15LgkHqn2MaAinakWmXk9+8Rj4diuebA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MZ8KlseV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MZ8KlseV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE934C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jun 2026 13:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781529031;
	bh=dzYqlV8/rHOrOL4f8/gkdZv7E07gDB83WHMDhjhtIMw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MZ8KlseVYpTsFruKgGaSN9CvnvvwbPh+rHItV+9HlfzVfdLwTAEmCnOtLBFR1Qcap
	 j834Jcx0esYzyLTOPHsXTQ3DowHx8s0b/buAL/sgYwWbucShngaKBWDswYfDvuil2x
	 asiUdb3pqDaKUyTKkpxrMP6ECdMxTfsDYgLxOBKm4AZEV5a05ue8FH8xKssPR3XeDt
	 ZHZzxxp7y++a09tGH1pF7xyo1Tg+uI9l4o5Nju0pajxudx/1jkIYaUPlR0/sqpBBBf
	 FzFBJU5FD6vHshVGZ8FALeZaMFVNoy5tXn7Y6nme4umfINbJsiXCc6CS2OGG6KEAme
	 qEvKW5ZBduLOw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A124EC3279F; Mon, 15 Jun 2026 13:10:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Mon, 15 Jun 2026 13:10:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: 4966508hayk@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-Ap91PwZjRV@https.bugzilla.kernel.org/>
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

--- Comment #103 from Quaternion (4966508hayk@gmail.com) ---
The hotkey functioning of the new driver for me is the same as for tacodog3=
11.

All the sysfs function normally (reading/writing) and produce the desired
results (including kbd_backlight, which at last makes possible to turn on t=
he
keyboard backlight in Linux), except for reader_mode, for which I don't
understand what it's supposed to control if there is no hotkey for that and
night light is available in Linux anyway. Further regarding the lg-laptop e=
xtra
features document update, I believe the sysfs which need to be updated are =
the
following:

Battery care limit: the original=20
/sys/class/power_supply/CMB0/charge_control_end_threshold=20
doesn't exist,=20
/sys/class/power_supply/BAT0/charge_control_end_threshold
works with or without the new driver.
Keyboard backlight: the original=20
/sys/devices/platform/lg-laptop/leds/kbd_backlight/brightness=20
doesn't allow modifying, the new driver adds the option=20
/sys/devices/platform/LGEX0820:00/leds/kbd_backlight/brightness
which works.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
