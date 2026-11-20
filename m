Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164794;
	b=srxnRVryZEDot4FkhinD8r4m737GgUNmZtUuhb1XHNYrDOmcVKBUHjqAupCGQo+aemqs
	 +kT1djMjTG+WOU1PW5ir2vFjEoFbH6QaWHd5CzaTMOLtOrS5nScM0Bgrs6zAxM70W2BOL
	 wQ/X2AhuSjpjzc98QWdRKLTDALBxr53VO7Ekzp6/eq9UBBQR7vrPGP/MpckQQ+e2VJzCz
	 AtdQsoaq2YmvC6l8rqHlibv0NqXDm6p6xYITV2TMEzAnBGS8rvroUmarekecmXp0u01WL
	 m37fdyQCyud2Ef85+UgWYLuYajKSgqiZhbHFvcd6PO2TJzfWKQBZvuxUVqCfef36g0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164794;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=YTdBBJQ3ER1dZiAE9J9h2Qmto1ByWU9A/X9++wI4Vaw=;
	b=qWZSVMKY9fdINjJ7m6zZugyks1aeTpgP/W9h1rlsr468CtxQtCHET1glfwgzR5ABe4Nl
	 Z514aACEqpPn6BibJXV5IURuexUfMuxog9or+XYPADETSQEgEz964cdYJhj3/mlfLeTFd
	 LGrJyR8ic44avsuV2gwUQPK88czp28ah1KiY8BqtJwOzr1IP6ll5eSamRVWZdFCvlwAap
	 JRBZJtJHEZGzxcCYN16wTBc1iGokqOuZfQU3WhsDmThhIJfAYZm8jEUSz1tlXJsA2XiVC
	 Ff//64R53c/zUReATyzIQdKApDhADYy/eOXKqen8h8OMBdgeg2LgCOhoRoXLUmtEzgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fAXu4PCD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BD5606A32A
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 08:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fAXu4PCD
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA9A21F000C4
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 08:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795164793;
	bh=YTdBBJQ3ER1dZiAE9J9h2Qmto1ByWU9A/X9++wI4Vaw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=fAXu4PCDKwao81D1gA2Wanp+YcPEQ6BOBtLJ3cAqAb3EICr0vjus2kvw19uPGaWNk
	 vYYvBn6cxPFGSJfquOJoQS/DDqEN4heMsDA7ay2JE5R4qs7q/gIqEi/GmeGRhljSdq
	 B7oxQhQZcwMe/b/6E6xpejJB1KnhVX4q1LSbBMJt6tAZxCAmlpRb4WoihyHcRGIxR3
	 0C+BF2IgOuCSGlQKspes9t3UVEYqN8Yg2K1fsI2jvJOzQs/KGYdbiPwrUMO0X1TC+I
	 YCs7zkT61M2P6FvXw9IGnvQVq6DKxn39qhlNmS6gGSKoAb/yJYWkpfPZ1ifMp8wuR+
	 MI1os03R9emhA==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id D6615240040E; Fri, 20 Nov 2026 08:53:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222275] lg_laptop: LG gram 16UD55U - kbd_backlight has no
 effect, unknown WMI scancodes on Super key
Date: Fri, 20 Nov 2026 08:53:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: daxter1992@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222275-215701-DsMzpppl1K@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222275-215701@https.bugzilla.kernel.org/>
References: <bug-222275-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222275

--- Comment #7 from daxter1992@gmail.com ---
Tested on LG gram Book 16UD55U-G.AX85BN, kernel 7.3.4-300.fc45.x86_64:

The kbd_backlight LED device is no longer registered (confirmed with
ls /sys/class/leds/ =E2=80=94 only tpad_led remains). The other hotkeys
(volume, brightness, mic mute, fan mode, etc.) still work fine.

Relevant dmesg output:
  lg_laptop: product: 16UD55U-G.AX85BN  year: 2022
  lg_laptop: Cannot get handle
  input: LG WMI hotkeys as /devices/platform/LGEX0820:00/input/input54

As confirmed by LG's official spec page for this model, there is no
keyboard backlight on the LG gram Book line.

Tested-by: daxter1992@gmail.com

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
