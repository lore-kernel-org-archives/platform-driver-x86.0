Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A91374E66
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jun 2026 23:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780528070; cv=none; b=i3Nh80xhM2Dd11Jjz2CEn7VCvEhiurFWDy3DcmW8vOfdpFH02iC9sweMbtiYgOsDKyENXO+qd6dI1O2jDKkWqvjj7Ev6tV7+rPWo2dK4MmNM7rufQKeR24lqqx0i6owBbHmr1D6fyRwL/8yXI0uQN/rukpIEYk/8R1w3nYeUyUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780528070; c=relaxed/simple;
	bh=kaVrzDOnvnW6yyxnmMKURLWnTg+o9fPsd5MMwHTyvZ0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hImHv1DPA4AFw6eNWOiK6WKCRdrbglM9tiGF9YFaWTpaTUVvkFfH8gdLV5jOuuRnDoZ23gAFYgvbTllz4+VTi9XfGxPHA0SJuhH/7e0NhqlU7XqMIgMGosDYhJOiFe6PC93ufG8+k9q8W6pA+roeH+c/Yugj7KqSvOm4lclJNWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XwOJnbv5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XwOJnbv5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8F88C2BCC6
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jun 2026 23:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780528069;
	bh=kaVrzDOnvnW6yyxnmMKURLWnTg+o9fPsd5MMwHTyvZ0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XwOJnbv5EWdD4pQgCqlQsEwmUugk667FWh2w7sDp7AzDa+fPglLtI1YcL6TQrj+vp
	 HxiOXRwNN8ZEwEWTShu+rgGhecH9PJ6N3RXkniSpFoJK4a4ydh4PdxGzzrmazc+EgC
	 TZ/svU6aL5LovVqhZ6o6+uH98EMk1cGtkDZ3Gt9joJ65CZ9E2gJFSme7HSsStbOHJ2
	 YcT4l6hUp8xK5HV8rn5qh/tMwr6jj9sc7OgOt1IepU5wk46XSYf4qnlONcIq18l2GH
	 IuuyN4CVU58Lfc8I2ghz7GafrYtJtFj70LlR/HrfMNoQ2jQHibrpCcmUZMEYdoyXAX
	 BKjzfHcrA4K8Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A973DC3279F; Wed,  3 Jun 2026 23:07:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Wed, 03 Jun 2026 23:07:49 +0000
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
Message-ID: <bug-218901-215701-24SPzYtTmA@https.bugzilla.kernel.org/>
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

--- Comment #70 from tacodog311@gmail.com ---
I think we're making progress. Fn+F1 and Fn+F8 seem to be working, but Fn+F=
4 no
longer toggles the touchpad.

F1 -> KEY_CONFIG  -- Working now
F2 -> Ignored -- still working
F3 -> Ignored -- still working
F4 -> KEY_F21 -- used to work, now "touchpad on" appears on the screen, doe=
sn't
toggle, I suspect it triggers twice (off/on)?=20
F5 -> Ignored -- still works
F6 -> KEY_F16 and notifying the LED class device -- still no effect
F7 -> KEY_PERFORMANCE -- still no effect
F8 -> KEY_MICMUTE -- Working now
F9 -> KEY_CAMERA_ACCESS_TOGGLE -- still no effect
F10 -> Ignored -- still works
F11 -> Ignored -- still works
F12 -> Ignored -- still works

I also notices that Fn+Esc is supposed to toggle the Fn lock, and that does=
 not
currently work.

This is my evdev:

Fn+F1:
Event: time 1780527642.116637, type 4 (EV_MSC), code 4 (MSC_SCAN), value
f070002
Event: time 1780527642.116637, type 1 (EV_KEY), code 171 (KEY_CONFIG), valu=
e 1
Event: time 1780527642.116637, -------------- SYN_REPORT ------------
Event: time 1780527642.116658, type 1 (EV_KEY), code 171 (KEY_CONFIG), valu=
e 0
Event: time 1780527642.116658, -------------- SYN_REPORT ------------

Fn+F4:
Event: time 1780527664.185518, type 4 (EV_MSC), code 4 (MSC_SCAN), value 74
Event: time 1780527664.185518, type 1 (EV_KEY), code 191 (KEY_F21), value 1
Event: time 1780527664.185518, -------------- SYN_REPORT ------------
Event: time 1780527664.185529, type 1 (EV_KEY), code 191 (KEY_F21), value 0
Event: time 1780527664.185529, -------------- SYN_REPORT ------------

Fn+F6:
Event: time 1780527716.168356, type 4 (EV_MSC), code 4 (MSC_SCAN), value
10000000
Event: time 1780527716.168356, type 1 (EV_KEY), code 186 (KEY_F16), value 1
Event: time 1780527716.168356, -------------- SYN_REPORT ------------
Event: time 1780527716.168372, type 1 (EV_KEY), code 186 (KEY_F16), value 0
Event: time 1780527716.168372, -------------- SYN_REPORT ------------

Fn+F7:
Event: time 1780527729.707137, type 4 (EV_MSC), code 4 (MSC_SCAN), value
30010051
Event: time 1780527729.707137, type 1 (EV_KEY), code 701 (?), value 1
Event: time 1780527729.707137, -------------- SYN_REPORT ------------
Event: time 1780527729.707147, type 1 (EV_KEY), code 701 (?), value 0
Event: time 1780527729.707147, -------------- SYN_REPORT ------------

Fn+F8:
Event: time 1780527743.793305, type 4 (EV_MSC), code 4 (MSC_SCAN), value
40020001
Event: time 1780527743.793305, type 1 (EV_KEY), code 248 (KEY_MICMUTE), val=
ue 1
Event: time 1780527743.793305, -------------- SYN_REPORT ------------
Event: time 1780527743.793320, type 1 (EV_KEY), code 248 (KEY_MICMUTE), val=
ue 0
Event: time 1780527743.793320, -------------- SYN_REPORT ------------

Fn+F9:
Event: time 1780527761.607632, type 4 (EV_MSC), code 4 (MSC_SCAN), value
40020000
Event: time 1780527761.607632, type 1 (EV_KEY), code 589
(KEY_CAMERA_ACCESS_TOGGLE), value 1
Event: time 1780527761.607632, -------------- SYN_REPORT ------------
Event: time 1780527761.607655, type 1 (EV_KEY), code 589
(KEY_CAMERA_ACCESS_TOGGLE), value 0
Event: time 1780527761.607655, -------------- SYN_REPORT ------------

Fn+Esc:
Event: time 1780527879.303527, type 4 (EV_MSC), code 4 (MSC_SCAN), value
40030001
Event: time 1780527879.303527, type 1 (EV_KEY), code 240 (KEY_UNKNOWN), val=
ue 1
Event: time 1780527879.303527, -------------- SYN_REPORT ------------
Event: time 1780527879.303550, type 1 (EV_KEY), code 240 (KEY_UNKNOWN), val=
ue 0
Event: time 1780527879.303550, -------------- SYN_REPORT ------------
Event: time 1780527879.456554, type 4 (EV_MSC), code 4 (MSC_SCAN), value
30010001
Event: time 1780527879.456554, type 1 (EV_KEY), code 240 (KEY_UNKNOWN), val=
ue 1
Event: time 1780527879.456554, -------------- SYN_REPORT ------------
Event: time 1780527879.456569, type 1 (EV_KEY), code 240 (KEY_UNKNOWN), val=
ue 0
Event: time 1780527879.456569, -------------- SYN_REPORT ------------

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
