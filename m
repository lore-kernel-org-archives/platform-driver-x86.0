Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C53391853
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jun 2026 10:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780568691; cv=none; b=Z0W3y4fz68wPodUocJOlEXCBNKOYYeXXbk508h4Ezjq4NFR9O4qiw20Xas8BZ3thMf7eXYjZfIdVE9LdprWtVTVsbT5txhpmXyVgLBAuoGBoO6D11SKUvQdQm6+9NmCTUNEhmH2qhCfqqP5pghJe5XJbfAtxsKH4kQl/8Di/QNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780568691; c=relaxed/simple;
	bh=xR/53+I1JFfoKhGD0/SJRx61n6zFeEwy34IVll/aJ1A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a/jTPLPC4E6bt9g/MNxGw7mZt067MbpenpQagFaZn7MJvWiIvodJyEa0Gl6/kvyDehO/dxngjZhJ2ebBS9UNrGPnNy7+F7wvxPLavXGiWzHIw9cqZgvEe3wpIXXIX/S3HM4QJeeHFDMl8UUj/7MMja7RPCequghk0AMxI5JXoyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tp/Wiu40; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tp/Wiu40"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8299FC2BCB9
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jun 2026 10:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780568691;
	bh=xR/53+I1JFfoKhGD0/SJRx61n6zFeEwy34IVll/aJ1A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tp/Wiu40He5g2VUb7dKGr1tOzTRAWdK3I68TM4jpka/e7cdBNgTwfXGnIZCQVhS+3
	 rGx/bAoJu1AmwxuArsDAr5pPGD/mc7Z9t0u7vZ2SGB/lPFwMChYRQD4woUJFGgw/iK
	 WJviJIqmaQbyCWqXxu6x40GBxoosanxWQegWkFXUajXnis0opJTN7qaD2isQ8cxml1
	 MpLs1hi/pxpwsvEKOW0lGSIW3sG8uZytVbYmBzauVhdWD2EPZAV56pI1xtlEwCSwsB
	 1+erqSNrPrjf5RtsKbT5YNZ6EY2nOhsnZhkVGW6jsM8e0FhPaJk/7sookqheCwZmNw
	 hQCqdVLJXtXGg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 70093C41613; Thu,  4 Jun 2026 10:24:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Thu, 04 Jun 2026 10:24:51 +0000
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
Message-ID: <bug-218901-215701-URQ01I52v9@https.bugzilla.kernel.org/>
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

--- Comment #72 from Quaternion (4966508hayk@gmail.com) ---
In my evtest, KEY_PERFORMANCE and KEY_CAMERA_ACCESS_TOGGLE are present. May=
be
the Fn+F4 has something to do with the settings? The combination started
toggling twice after you fixed settings. As a possible workaround, I can
mention that the touchpad state can be easily toggled inside settings.

Here is the new dmesg response (I omit the Fn key press/release event):

Fn+Esc:
[  978.268869] LG Gram Laptop Support LGEX0820:00: Received event 130
(1073938433)
Fn+F1:
[  411.436702] LG Gram Laptop Support LGEX0820:00: Received event 130
(252116994)
Fn+F2:
[  413.325769] LG Gram Laptop Support LGEX0820:00: Received event 128 (0)
Fn+F3:
[  414.323986] LG Gram Laptop Support LGEX0820:00: Received event 128 (0)
Fn+F4:
[  421.565755] LG Gram Laptop Support LGEX0820:00: Received event 128 (116)
Fn+F5:
Ignored
Fn+F6:
[  425.480991] LG Gram Laptop Support LGEX0820:00: Received event 128
(268435456)
Fn+F7:
[  427.640268] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371985)
Fn+F8:
[  428.620331] LG Gram Laptop Support LGEX0820:00: Received event 130
(1073872897)
Fn+F9:
[  429.512356] LG Gram Laptop Support LGEX0820:00: Received event 130
(1073872896)
Fn+F10:
[  429.976413] LG Gram Laptop Support LGEX0820:00: Received event 128 (120)
Fn+F11:
[  430.509555] LG Gram Laptop Support LGEX0820:00: Received event 128 (0)
Fn+F12:
[  431.333337] LG Gram Laptop Support LGEX0820:00: Received event 128 (0)

I use the lgfnlock.sh script from

https://github.com/leoomi/LinuxLGGramScripts

to get the Fn lock working.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
