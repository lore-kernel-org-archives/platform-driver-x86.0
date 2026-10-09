Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B364F3914
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 Oct 2026 17:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568554; cv=none; b=RzfsTsSFweQXB8qjelJjf0CNisjqqRTjG3xQhSYXBSEyovPCnMT/gwn/Lylv7YwFgaejHiWynjSUfUa4DWxy/xOCP+f0peMC+ovzUBp1bbUO/qddQUlCjIgaxZ1KnznGKnd+gKp1AEwfTrwQnD4nmg6eMfsahx8f3/hJUCMs/kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568554; c=relaxed/simple;
	bh=B+n1PDD5dw/UdQVdirWutjWL+pGh3dNNznM9DwpTXIU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uQq9IgVAew9WVORZ4NhOIS2AkB1g0JMdDiETCNnj3SXA2qodQ3VPk+BTsIrqGym39o1zi5PAOUINIbkR0z+GW6R31jv6bSd5h3UO78rSCfpOnbMRGPd7lXB/2EkD8niuldQFUt+/rFBfN+OfPD1RpilegjYSjHLcucxyg00maKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c9AEkHWz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c9AEkHWz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6CF01C2BCF4
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 Oct 2026 17:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791568553;
	bh=B+n1PDD5dw/UdQVdirWutjWL+pGh3dNNznM9DwpTXIU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=c9AEkHWzmK1lqGx93ucqQB3/f0tGHAV7VRzKqaPXIsGLb1ksHAFY7373KEJbc6NM5
	 8GZApzCNbAI8EL1WKWb/z754Gk5tWlSIoiWEw3av4kKvWdTGlHwwPfeVOKlbux1ZK+
	 H3SoH/KzpZbvumT8uWBv8Kgyk5wDac704q9lidKBDASpQSnfOgmmqD10BeeD2wlt/P
	 o0RiBYI1wSp8rl7TUD0KK0KacQf8MTOdcs/ANj5VuKzAvtzngrj5XxmnKI5JqOgM9N
	 qOCHuPmnH1iLh5l0KmWz4o0Jk8qmxUppKukF3bGT8T97+s41FnBTsk5ZCiH/MAcpkf
	 A7xLjywtZ6Rnw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 59DF8C41612; Fri,  9 Oct 2026 17:55:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222044] hp-wmi: Mute and mic-mute LEDs not supported on HP
 Laptop 15-fc0xxx (board 8DC9)
Date: Fri, 09 Oct 2026 17:55:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: neonblade018@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222044-215701-UHOmPiIfvU@https.bugzilla.kernel.org/>
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

--- Comment #8 from Piyush (neonblade018@proton.me) ---
Hi Zhang,

I built and tested kernel 7.2.9 with those two chaining lines added to
ALC236_FIXUP_HP_DMIC:

    .chained =3D true,
    .chain_id =3D ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO

It works perfectly!=20

Both LEDs registered under `/sys/class/leds/` as `hda::mute` and `hda::micm=
ute`
with native kernel triggers `[audio-mute]` and `[audio-micmute]`. Both the
speaker mute LED and the mic-mute LED now toggle instantly in hardware on a=
udio
state changes without needing any userland workarounds.

The internal digital microphone is also fully detected and functional via
ALSA/PipeWire.

You can consider this tested and verified working on my hardware. Thanks a =
lot
for the fix!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
