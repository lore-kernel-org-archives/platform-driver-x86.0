Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265B1366060
	for <platform-driver-x86@vger.kernel.org>; Sat, 30 May 2026 22:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780179653; cv=none; b=b24P7NsvjFaJc2A4VHV+ZmrYsPV+G+9tby4L2ZXv1HSGsO+IqMM3du+90wFXCkArvATBL9rp4BxT6ZFEXhQru8WBdHy/WUqCeoq5szyQL0aUQ/NIC0meVxXx06OY3QRBk+GeEljMT3xbVd/BetqC8YIWI69FDJP4Yn7k6f5H2XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780179653; c=relaxed/simple;
	bh=8ve09lNU7FRW+/oq9LkrquVMHxLA9g4yVVAx1xidKAc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ww1CU+Y7+jqwLaXFA/gCl9ksvtLDT7lTIw2eiDHtbPO1ISa2tsSgkcLkDzerfrIz3oWUNcfAzIitlOaOpMJUffpI4qK/sKDvqPt1qviqnFigipVDUOjvd38t975cxp8a2TtT/Dxvkw8GGktTRkU1TPUCcPuuNCzyQGuBHaZSTW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sD0FPcN1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sD0FPcN1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9155C2BCC6
	for <platform-driver-x86@vger.kernel.org>; Sat, 30 May 2026 22:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780179652;
	bh=8ve09lNU7FRW+/oq9LkrquVMHxLA9g4yVVAx1xidKAc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sD0FPcN1Y/BjALR3ZLV2qBOxFJEb6xGJ92MLUxUsRUZU8oQh5N6ipUurJIeNLhuLE
	 nMNds928crV7LwnLj/xjE74Jn1AY8fCwQLoG8uk8Z4JMnbjKiVOaV2FEEu/Wl5ILCE
	 lAmfsmQDv8oi+0plJd90eN5fE9OdeEH+PMTDFoLJzROBScy91rR5jni2quUqiNyvs+
	 IU9yqFUXnL3zbd/ZtqBM/Gta0xrw0wfDVIJyBl+fOQP/ON7ofNViRLwj1QygK0J1j1
	 2gBfLeAadS0Ku4U5DhY7gcM6GSHV/cCMr7UZcrFXed0S3FMi+PvvSFd0Asegg6ngpv
	 pePAwz2DHrjjw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9A518C3279F; Sat, 30 May 2026 22:20:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sat, 30 May 2026 22:20:52 +0000
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
Message-ID: <bug-218901-215701-GULBkrljzG@https.bugzilla.kernel.org/>
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

--- Comment #57 from tacodog311@gmail.com ---
I ran that command as root, and I have these lines now in that control file:
drivers/platform/x86/lg-laptop.c:238 [lg_laptop]wmi_notify =3Dp "Type: %i=
=20=20=20
Eventcode: 0x%llx\n"
drivers/platform/x86/lg-laptop.c:276 [lg_laptop]acpi_notify =3Dp "notify: %=
d\n"
drivers/platform/x86/lg-laptop.c:679 [lg_laptop]lg_laptop_address_space_wri=
te
=3Dp "HD audio power %s\n"
drivers/platform/x86/lg-laptop.c:688 [lg_laptop]lg_laptop_address_space_wri=
te
=3Dp "Fan mode set to mode %u\n"
drivers/platform/x86/lg-laptop.c:692 [lg_laptop]lg_laptop_address_space_wri=
te
=3Dp "CPU temperature is %u =C2=B0C\n"
drivers/platform/x86/lg-laptop.c:695 [lg_laptop]lg_laptop_address_space_wri=
te
=3Dp "CPU lower trip point set to %u =C2=B0C\n"
drivers/platform/x86/lg-laptop.c:698 [lg_laptop]lg_laptop_address_space_wri=
te
=3Dp "CPU higher trip point set to %u =C2=B0C\n"
drivers/platform/x86/lg-laptop.c:701 [lg_laptop]lg_laptop_address_space_wri=
te
=3Dp "Motherboard temperature is %u =C2=B0C\n"
drivers/platform/x86/lg-laptop.c:704 [lg_laptop]lg_laptop_address_space_wri=
te
=3Dp "Motherboard lower trip point set to %u =C2=B0C\n"
drivers/platform/x86/lg-laptop.c:707 [lg_laptop]lg_laptop_address_space_wri=
te
=3Dp "Motherboard higher trip point set to %u =C2=B0C\n"
drivers/platform/x86/lg-laptop.c:919 [lg_laptop]acpi_init =3Dp "Error regis=
tering
driver\n"


There are no "Type: X  Eventcode: X" lines in dmesg, but these lines apear
after each button press

Fn F1: (no effect - settings? button)
[1097723.464413] ACPI: \XINI: lg_laptop: notify: 130
[1097723.895908] ACPI: \XINI: lg_laptop: notify: 130
[1097724.018615] ACPI: \XINI: lg_laptop: notify: 130
[1097724.130833] ACPI: \XINI: lg_laptop: notify: 130

Fn F2: (works screen brightness down)
[1097761.246182] ACPI: \XINI: lg_laptop: notify: 130
[1097761.480285] ACPI: \XINI: lg_laptop: notify: 128
[1097761.674707] ACPI: \XINI: lg_laptop: notify: 130
[1097761.733056] ACPI: \XINI: lg_laptop: notify: 130

Fn F3: (works - screen brightness up)
[1097871.463304] ACPI: \XINI: lg_laptop: notify: 130
[1097871.931609] ACPI: \XINI: lg_laptop: notify: 128
[1097872.119712] ACPI: \XINI: lg_laptop: notify: 130
[1097872.224662] ACPI: \XINI: lg_laptop: notify: 130

Fn F4: (works - touchpad on/off)
[1097895.738841] ACPI: \XINI: lg_laptop: notify: 130
[1097896.223999] ACPI: \XINI: lg_laptop: notify: 128
[1097896.290507] ACPI: \XINI: lg_laptop: notify: 130
[1097896.403914] ACPI: \XINI: lg_laptop: notify: 130

Fn F5: (works - display output change)
[1097937.733774] ACPI: \XINI: lg_laptop: notify: 130
[1097938.585044] ACPI: \XINI: lg_laptop: notify: 130
[1097938.868729] ACPI: \XINI: lg_laptop: notify: 130

Fn F6: (doesn't work - keyboard brightness)
[1097982.681501] ACPI: \XINI: lg_laptop: notify: 130
[1097982.818509] ACPI: \XINI: lg_laptop: notify: 130

Fn F7: (doesn't work - fan speed)
[1098282.555102] ACPI: \XINI: lg_laptop: notify: 130
[1098282.909315] ACPI: \XINI: lg_laptop: notify: 130
[1098283.116257] ACPI: \XINI: lg_laptop: notify: 130
[1098283.201884] ACPI: \XINI: lg_laptop: notify: 130

Fn F8: (doesn't work - microphone mute)
[1098300.478939] ACPI: \XINI: lg_laptop: notify: 130
[1098300.982330] ACPI: \XINI: lg_laptop: notify: 130
[1098301.089168] ACPI: \XINI: lg_laptop: notify: 130
[1098301.242992] ACPI: \XINI: lg_laptop: notify: 130

Fn F9: (doesn't work - disable camera)
[1098322.727108] ACPI: \XINI: lg_laptop: notify: 130
[1098323.213560] ACPI: \XINI: lg_laptop: notify: 130
[1098323.321364] ACPI: \XINI: lg_laptop: notify: 130
[1098323.509275] ACPI: \XINI: lg_laptop: notify: 130

Fn F10: (works audio mute)
[1098340.794792] ACPI: \XINI: lg_laptop: notify: 130
[1098341.421561] ACPI: \XINI: lg_laptop: notify: 130
[1098341.432123] ACPI: \XINI: lg_laptop: notify: 128
[1098341.684261] ACPI: \XINI: lg_laptop: notify: 130

Fn F11: (works volume down)
[1098355.263622] ACPI: \XINI: lg_laptop: notify: 130
[1098355.723023] ACPI: \XINI: lg_laptop: notify: 128
[1098355.960150] ACPI: \XINI: lg_laptop: notify: 130
[1098355.989765] ACPI: \XINI: lg_laptop: notify: 130

Fn F12: (works volume up)
[1098367.928555] ACPI: \XINI: lg_laptop: notify: 130
[1098368.780921] ACPI: \XINI: lg_laptop: notify: 128
[1098369.017551] ACPI: \XINI: lg_laptop: notify: 130
[1098369.029370] ACPI: \XINI: lg_laptop: notify: 130

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
