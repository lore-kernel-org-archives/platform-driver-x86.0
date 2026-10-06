Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FF53DDB0E
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Oct 2026 09:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280239; cv=none; b=KfWeME7pQCWo+XAps7NqAIPG9HYiPfEfdwUytRPHoYGJdDkWX3gd6rAUm+2TIr7tvbki1RcP0YFGFzh+GdcQfYhXtiI3500Ll5Kqi+ocLPuo44f+db4SvyksX2tgvW8u9iPY9emvZGSWvVFBdNeDnnoRkFFwkNNR/2O2o40WLlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280239; c=relaxed/simple;
	bh=j5KmZb5OcUwHEC0Rj4ua9iUnWZ9TF4neI6sfUwmo6kI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hy8J+5AMO2Xw5zYdY8fk8GIBhfFRavHqCJvf5/9NAww0ToAWjSRCOC75TqwGxS9xgNwhuzEIsUbquqJBIl9Y2ydnzcaZMrDyHbk68f0mX44eoqKutWaKOjw10FUw571UETDsgP/MP6bbKv79zxUM/wJQwQXVtuKHtG3KUMl9YE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=epa4UVND; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="epa4UVND"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E05AC4AF0B
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Oct 2026 09:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791280239;
	bh=j5KmZb5OcUwHEC0Rj4ua9iUnWZ9TF4neI6sfUwmo6kI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=epa4UVNDHH83pEoESda7UaCqh5En2Z9Yr9KeQP9yq+CG4NhLf7arFpzwoKX6q+Dea
	 74LbF8mP/gZ3hQ6r1Tng3KCS+jNBqPsrgmbehHV8qHAAKWDnX8Ia5FUhi6zS6LssMx
	 xjBIjdg/qpzx+IdHwqhqIhmuFlorzFseHm4bpfkg5NhAn2+VGIilG0cDYOHI/pj8h5
	 4I23vqiKf6cpy2+XWN0boINcZgBslKeIMm8tsQVIyoxlqqmFfS8I54jm8vtJOqbWYI
	 vuGkBVT51FPZ+C/omVrw/anyzbJFO3h/VqDjd6oBDWWiRx3AVxF8ZOSgm6ToC+EYCd
	 tqNNLMikMtl/g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 22CFFC3279F; Tue,  6 Oct 2026 09:50:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222044] hp-wmi: Mute and mic-mute LEDs not supported on HP
 Laptop 15-fc0xxx (board 8DC9)
Date: Tue, 06 Oct 2026 09:50:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aryanbabupiyushbabu@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-222044-215701-mjMzRHaJHa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222044-215701@https.bugzilla.kernel.org/>
References: <bug-222044-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222044

Piyush (aryanbabupiyushbabu@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |aryanbabupiyushbabu@gmail.c
                   |                            |om

--- Comment #3 from Piyush (aryanbabupiyushbabu@gmail.com) ---
(In reply to Zhang Heng from comment #2)
> sudo hda-verb /dev/snd/hwC0D0 0x01 0x715 0x03
>=20
>=20
> sudo hda-verb /dev/snd/hwC0D0 0x01 0x715 0x02
>=20
>=20
> sudo hda-verb /dev/snd/hwC0D0 0x01 0x715 0x01
>=20
> sudo hda-verb /dev/snd/hwC0D0 0x01 0x715 0x00
>=20
>=20
> The x in hwCXD0 depends on whether your sound card is card0, card1, or
> card2. Check whether these GPIO settings are effective.

Hi Zhang,

I tested these verbs on card 1 (/dev/snd/hwC1D0, Realtek ALC236).

Results:
1. The GPIO mask (0x716) and direction (0x717) on root node 0x01 need to be
explicitly initialized first:
   sudo hda-verb /dev/snd/hwC1D0 0x01 0x716 0x0f
   sudo hda-verb /dev/snd/hwC1D0 0x01 0x717 0x0f

2. The mic-mute LED (F8) is verified to work cleanly on GPIO 0 using active=
-low
logic:
   - Turn ON:  sudo hda-verb /dev/snd/hwC1D0 0x01 0x715 0x00
   - Turn OFF: sudo hda-verb /dev/snd/hwC1D0 0x01 0x715 0x01

3. The keyboard does have a physical LED indicator on the F5 key (speaker
mute), but it did not react to any standard GPIO bit toggles (0x02, 0x04, e=
tc.)
on node 0x01.

Could you provide any hints or specific coefficient/verb sequences to test =
for
the speaker mute LED on this ALC236 revision (Subsystem ID 103c:8dc9)?
Alternatively, is there an existing ALC236 fixup in patch_realtek.c you'd
recommend building against to test both LEDs?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
