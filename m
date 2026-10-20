Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792535481;
	b=ZPWBIKuuIAdJ93LA4HxFP7N4zq7V2dZMdIjGWBBxeO2rF3CCYXRkUZknEgFSZjxl6HOS
	 qkKdcsGQWxxE66Ysq4Eu0ZhV69n2Ljfw2iqo/FZ4OPXWewkOTkSpOhlgaJt40nxVMd59d
	 5i5xyb4Z9tOGs04lmcwvG+H35e8hIZ+FWncsVtsz9loTH/TlOoZq4ZdV2nZoU3yUqgAzo
	 EQN4VsMwCPhEMU/QnguoqxXMhMAEbsYFqkmgDIyKdf8xZ+Xk/MNx33MCAbA1E9iv9tfXd
	 URNnqTORkIHBow5rtA7QAgz65PrkctqFmeXK5059iH9t511Bi8VyUV74+uANpkQ7cXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792535481;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=p7WG1H6F+Erx8urQoFe9GP62MikJYUj+hGmKpe70u/4=;
	b=jA26xs9KfKaIoHlZs7VtoJmvTy+CFBlVZqqBwDGLm8N8hleuMQeaWnFiVxIoxjOId78n
	 0XgMKJi5hQtjeHDxz8FogB+Gnr6JUMJmXFBu/RW1zbR4ExuUAwoqhmWmAshzfWo7Ts+H7
	 ZtPYbROBZWOkqmQ6PNCzUME1HBBOulhEVQDsytSjktPK5L1SgYElt4j1oKf/iEYghCdjb
	 yreDFpRKHZ5IYY2kSWnOhIBpKr6Iaw1mlBDxC6OBDz4QqTTHCvg2ZZbIQmgQZ7ssaMF+R
	 cBwCH+SENTmwcfthrzz69XC3Mq2fsmr7fhcBmZIPSaBaAa+RQKDNDT3lm5okR3fsiIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jwvIYELE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF53606A319
	for <platform-driver-x86.vger.kernel.org@localhost.mlmmj>; Tue, 20 Oct 2026 22:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jwvIYELE
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399A325771
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 22:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792535481; cv=none; b=TbkzBVtFmqbxV98SvWbPP6j3KEWfD+U84JpJoztfrIEcxMYsjhMCfh4ZDHN2QIBFUd77Rw4tselsvY5hgb4p3DkLfML8+z0VI5iMFkqDxAEFKBCsLvODQ4ETbEik77jPAmpJH4C1xhbbN40CGWu/RUosLEPabWCGqI/4FZshd2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792535481; c=relaxed/simple;
	bh=+Qa+wY/HiDOxDXCgtdTH4sI3NWmS+5wGrJE65bZp/Ik=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oeYcHDEHn3Iq6hjqAk7oYolrG+CI8RxSXuhVacwBOqT3cJ5IYwIkft5lc8bq7DxhZQ+FvxVGQe5Xrj1NnrPIrFiYRb8XmQaPsRQr57lraPZqNXBQ5NmDbi63lkmFUbl3RREzGSeZ3xAGwq9Wuc+Q2XEutxPXHY1Jm4jav/IptV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jwvIYELE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7FCF2C2BCC7
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 22:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792535480;
	bh=+Qa+wY/HiDOxDXCgtdTH4sI3NWmS+5wGrJE65bZp/Ik=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jwvIYELEJsPt1Ec0MdmZqw91KqD9YMfdWU3ur8viEKyWNtCp0VotwZv3i5fclpJ2H
	 of8ggFs4OEK5FnLn42kZl/jGe50uLg4HdFdv+5ZgwsDcYpVC7rIQfgnzNPC0Gu4vSW
	 3ok3tUhlhYaXP0UwfIm7nKfFIxCLVTmm4B2VTVCgCvecEPxGGt0US32ZXppvISK0gF
	 diGRCqsEh7uW9kly1fuUt5uIubeRcZ0MN0dDZIZy5o0eyCFx5xoDiSz/kC7vQI+k+B
	 PuwnoaK3k/Ketx6QjUgjM4ps9pill+MsvSWaCM9ssxZ2YZt8+UrXqqZMO1mApkrrSb
	 tgTBER6w8/HAw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 536A1C3279F; Tue, 20 Oct 2026 22:31:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222161] platform/x86: lg-laptop: Double input of super key
Date: Tue, 20 Oct 2026 22:31:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: helian.caumeil@clever.cloud
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222161-215701-fvyfHPK5YK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222161-215701@https.bugzilla.kernel.org/>
References: <bug-222161-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222161

--- Comment #4 from helian.caumeil@clever.cloud ---

Of course,

I reverted my patch and run "evtest" on the two event
source at the same time, only pressing KEY_LEFTMETA+KEY_ENTER.
I indeed see some keypress on the LG WMI hotkeys side:

/dev/input/event5:      LG WMI hotkeys
/dev/input/event6:      AT Translated Set 2 keyboard

dmesg:
[  710.072542] LG Gram Laptop Support LGEX0820:00: Received event 130
(805437440)
[  710.348094] LG Gram Laptop Support LGEX0820:00: Received event 130
(805437441)
[  710.584279] LG Gram Laptop Support LGEX0820:00: Received event 130
(805437441)

/dev/input/event5:
./evtest /dev/input/event5
ut/event5
Input driver version is 1.0.1
Input device ID: bus 0x19 vendor 0x0 product 0x0 version 0x0
Input device name: "LG WMI hotkeys"
Supported events:
  Event type 0 (EV_SYN)
  Event type 1 (EV_KEY)
    Event code 171 (KEY_CONFIG)
    Event code 184 (KEY_F14)
    Event code 185 (KEY_F15)
    Event code 186 (KEY_F16)
    Event code 191 (KEY_F21)
    Event code 240 (KEY_UNKNOWN)
    Event code 248 (KEY_MICMUTE)
    Event code 465 (KEY_FN_ESC)
    Event code 589 (KEY_CAMERA_ACCESS_TOGGLE)
    Event code 701 (KEY_PERFORMANCE)
  Event type 4 (EV_MSC)
    Event code 4 (MSC_SCAN)
Properties:
Testing ... (interrupt to exit)
Event: time 1792534713.188538, type 4 (EV_MSC), code 4 (MSC_SCAN), value
30020000
Event: time 1792534713.188538, type 1 (EV_KEY), code 240 (KEY_UNKNOWN), val=
ue 1
Event: time 1792534713.188538, -------------- SYN_REPORT ------------
Event: time 1792534713.188569, type 1 (EV_KEY), code 240 (KEY_UNKNOWN), val=
ue 0
Event: time 1792534713.188569, -------------- SYN_REPORT ------------
Event: time 1792534713.464086, type 4 (EV_MSC), code 4 (MSC_SCAN), value
30020001
Event: time 1792534713.464086, type 1 (EV_KEY), code 240 (KEY_UNKNOWN), val=
ue 1
Event: time 1792534713.464086, -------------- SYN_REPORT ------------
Event: time 1792534713.464104, type 1 (EV_KEY), code 240 (KEY_UNKNOWN), val=
ue 0
Event: time 1792534713.464104, -------------- SYN_REPORT ------------
Event: time 1792534713.700293, type 4 (EV_MSC), code 4 (MSC_SCAN), value
30020001
Event: time 1792534713.700293, type 1 (EV_KEY), code 240 (KEY_UNKNOWN), val=
ue 1
Event: time 1792534713.700293, -------------- SYN_REPORT ------------
Event: time 1792534713.700322, type 1 (EV_KEY), code 240 (KEY_UNKNOWN), val=
ue 0
Event: time 1792534713.700322, -------------- SYN_REPORT ------------

/dev/input/event6:
./evtest /dev/input/event6
Input driver version is 1.0.1
Input device ID: bus 0x11 vendor 0x1 product 0x1 version 0xab83
Input device name: "AT Translated Set 2 keyboard"
Supported events:
  Event type 0 (EV_SYN)
  Event type 1 (EV_KEY)
    Event code 1 (KEY_ESC)
    Event code 2 (KEY_1)
    Event code 3 (KEY_2)
    Event code 4 (KEY_3)
    Event code 5 (KEY_4)
    Event code 6 (KEY_5)
    Event code 7 (KEY_6)
    Event code 8 (KEY_7)
    Event code 9 (KEY_8)
    Event code 10 (KEY_9)
    Event code 11 (KEY_0)
    Event code 12 (KEY_MINUS)
    Event code 13 (KEY_EQUAL)
    Event code 14 (KEY_BACKSPACE)
    Event code 15 (KEY_TAB)
    Event code 16 (KEY_Q)
    Event code 17 (KEY_W)
    Event code 18 (KEY_E)
    Event code 19 (KEY_R)
    Event code 20 (KEY_T)
    Event code 21 (KEY_Y)
    Event code 22 (KEY_U)
    Event code 23 (KEY_I)
    Event code 24 (KEY_O)
    Event code 25 (KEY_P)
    Event code 26 (KEY_LEFTBRACE)
    Event code 27 (KEY_RIGHTBRACE)
    Event code 28 (KEY_ENTER)
    Event code 29 (KEY_LEFTCTRL)
    Event code 30 (KEY_A)
    Event code 31 (KEY_S)
    Event code 32 (KEY_D)
    Event code 33 (KEY_F)
    Event code 34 (KEY_G)
    Event code 35 (KEY_H)
    Event code 36 (KEY_J)
    Event code 37 (KEY_K)
    Event code 38 (KEY_L)
    Event code 39 (KEY_SEMICOLON)
    Event code 40 (KEY_APOSTROPHE)
    Event code 41 (KEY_GRAVE)
    Event code 42 (KEY_LEFTSHIFT)
    Event code 43 (KEY_BACKSLASH)
    Event code 44 (KEY_Z)
    Event code 45 (KEY_X)
    Event code 46 (KEY_C)
    Event code 47 (KEY_V)
    Event code 48 (KEY_B)
    Event code 49 (KEY_N)
    Event code 50 (KEY_M)
    Event code 51 (KEY_COMMA)
    Event code 52 (KEY_DOT)
    Event code 53 (KEY_SLASH)
    Event code 54 (KEY_RIGHTSHIFT)
    Event code 55 (KEY_KPASTERISK)
    Event code 56 (KEY_LEFTALT)
    Event code 57 (KEY_SPACE)
    Event code 58 (KEY_CAPSLOCK)
    Event code 59 (KEY_F1)
    Event code 60 (KEY_F2)
    Event code 61 (KEY_F3)
    Event code 62 (KEY_F4)
    Event code 63 (KEY_F5)
    Event code 64 (KEY_F6)
    Event code 65 (KEY_F7)
    Event code 66 (KEY_F8)
    Event code 67 (KEY_F9)
    Event code 68 (KEY_F10)
    Event code 69 (KEY_NUMLOCK)
    Event code 70 (KEY_SCROLLLOCK)
    Event code 71 (KEY_KP7)
    Event code 72 (KEY_KP8)
    Event code 73 (KEY_KP9)
    Event code 74 (KEY_KPMINUS)
    Event code 75 (KEY_KP4)
    Event code 76 (KEY_KP5)
    Event code 77 (KEY_KP6)
    Event code 78 (KEY_KPPLUS)
    Event code 79 (KEY_KP1)
    Event code 80 (KEY_KP2)
    Event code 81 (KEY_KP3)
    Event code 82 (KEY_KP0)
    Event code 83 (KEY_KPDOT)
    Event code 86 (KEY_102ND)
    Event code 87 (KEY_F11)
    Event code 88 (KEY_F12)
    Event code 89 (KEY_RO)
    Event code 90 (KEY_KATAKANA)
    Event code 91 (KEY_HIRAGANA)
    Event code 92 (KEY_HENKAN)
    Event code 93 (KEY_KATAKANAHIRAGANA)
    Event code 94 (KEY_MUHENKAN)
    Event code 95 (KEY_KPJPCOMMA)
    Event code 96 (KEY_KPENTER)
    Event code 97 (KEY_RIGHTCTRL)
    Event code 98 (KEY_KPSLASH)
    Event code 99 (KEY_SYSRQ)
    Event code 100 (KEY_RIGHTALT)
    Event code 102 (KEY_HOME)
    Event code 103 (KEY_UP)
    Event code 104 (KEY_PAGEUP)
    Event code 105 (KEY_LEFT)
    Event code 106 (KEY_RIGHT)
    Event code 107 (KEY_END)
    Event code 108 (KEY_DOWN)
    Event code 109 (KEY_PAGEDOWN)
    Event code 110 (KEY_INSERT)
    Event code 111 (KEY_DELETE)
    Event code 112 (KEY_MACRO)
    Event code 113 (KEY_MUTE)
    Event code 114 (KEY_VOLUMEDOWN)
    Event code 115 (KEY_VOLUMEUP)
    Event code 116 (KEY_POWER)
    Event code 117 (KEY_KPEQUAL)
    Event code 118 (KEY_KPPLUSMINUS)
    Event code 119 (KEY_PAUSE)
    Event code 121 (KEY_KPCOMMA)
    Event code 122 (KEY_HANGEUL)
    Event code 123 (KEY_HANJA)
    Event code 124 (KEY_YEN)
    Event code 125 (KEY_LEFTMETA)
    Event code 126 (KEY_RIGHTMETA)
    Event code 127 (KEY_COMPOSE)
    Event code 128 (KEY_STOP)
    Event code 140 (KEY_CALC)
    Event code 142 (KEY_SLEEP)
    Event code 143 (KEY_WAKEUP)
    Event code 155 (KEY_MAIL)
    Event code 156 (KEY_BOOKMARKS)
    Event code 157 (KEY_COMPUTER)
    Event code 158 (KEY_BACK)
    Event code 159 (KEY_FORWARD)
    Event code 163 (KEY_NEXTSONG)
    Event code 164 (KEY_PLAYPAUSE)
    Event code 165 (KEY_PREVIOUSSONG)
    Event code 166 (KEY_STOPCD)
    Event code 172 (KEY_HOMEPAGE)
    Event code 173 (KEY_REFRESH)
    Event code 183 (KEY_F13)
    Event code 184 (KEY_F14)
    Event code 185 (KEY_F15)
    Event code 186 (KEY_F16)
    Event code 187 (KEY_F17)
    Event code 188 (KEY_F18)
    Event code 189 (KEY_F19)
    Event code 190 (KEY_F20)
    Event code 191 (KEY_F21)
    Event code 192 (KEY_F22)
    Event code 193 (KEY_F23)
    Event code 194 (KEY_F24)
    Event code 217 (KEY_SEARCH)
    Event code 226 (KEY_MEDIA)
  Event type 4 (EV_MSC)
    Event code 4 (MSC_SCAN)
  Event type 17 (EV_LED)
    Event code 0 (LED_NUML) state 1
    Event code 1 (LED_CAPSL) state 0
    Event code 2 (LED_SCROLLL) state 0
Key repeat handling:
  Repeat type 20 (EV_REP)
    Repeat code 0 (REP_DELAY)
      Value    250
    Repeat code 1 (REP_PERIOD)
      Value     33
Properties:
Testing ... (interrupt to exit)
Event: time 1792534713.189414, type 4 (EV_MSC), code 4 (MSC_SCAN), value db
Event: time 1792534713.189414, type 1 (EV_KEY), code 125 (KEY_LEFTMETA), va=
lue
1
Event: time 1792534713.189414, -------------- SYN_REPORT ------------
Event: time 1792534713.442128, type 4 (EV_MSC), code 4 (MSC_SCAN), value db
Event: time 1792534713.442128, type 1 (EV_KEY), code 125 (KEY_LEFTMETA), va=
lue
2
Event: time 1792534713.442128, -------------- SYN_REPORT ------------
Event: time 1792534713.458047, type 4 (EV_MSC), code 4 (MSC_SCAN), value 1c
Event: time 1792534713.458047, type 1 (EV_KEY), code 28 (KEY_ENTER), value 1
Event: time 1792534713.458047, -------------- SYN_REPORT ------------
Event: time 1792534713.541971, type 4 (EV_MSC), code 4 (MSC_SCAN), value 1c
Event: time 1792534713.541971, type 1 (EV_KEY), code 28 (KEY_ENTER), value 0
Event: time 1792534713.541971, -------------- SYN_REPORT ------------
Event: time 1792534713.699964, type 4 (EV_MSC), code 4 (MSC_SCAN), value db
Event: time 1792534713.699964, type 1 (EV_KEY), code 125 (KEY_LEFTMETA), va=
lue
0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
