Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303AB3E1D08
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 18:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780337194; cv=none; b=oCo1ZYD/aALFggu4bz4iu7mL3mQJICoAi3qhcMgz696+Jk/y2b3XH+/sLGlto2FH9Ja4AZ7mcj1SY5s77XFe17ebUF8kzyQia5fLuK55u+6HWttTltTaucLom3HNxC5Z0yfEC3AuEJAzFpCIe7nkJ88xhjGSzwpeaC7Fb5tpuIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780337194; c=relaxed/simple;
	bh=zYbuXEk0nr0RTjPLQHYocKotpfASEKGCe5PeIm6rXeM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RgngRK3ES2vroq0DfL/EKu8UVAG3VgUARa1JSCkk4vLlJ0NY1NQT/9STUYXbETq/yg89MIaQ8g/PO2hbpLlOT7PDR1LZA83k9iR8cTK2x1YTjy9T8dkRBnJJWWOSrRDBCBKHBaUMGP8aYalEfVp36sWRK8lZwe8wCzXeXHASZBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CWq89lbJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CWq89lbJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 008E4C2BCB8
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 18:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780337194;
	bh=zYbuXEk0nr0RTjPLQHYocKotpfASEKGCe5PeIm6rXeM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CWq89lbJgJTQE6qItjMT+GRQ99jC6xH1dwTA2OHdh17zhV02KhWJd5evXYsTR8YjB
	 sb3pwepv1/Lvfo4g6wNIU5ln2Zbtr8r3PfAW+HSa1dX28RJDUx74yvgPfymR0B/71B
	 BIAceHPTkvXPUU8Lc9yeWMf0Zw3+9xoFuPJruL44OVqnuav7vAxv6M1fL+K+LNxHWO
	 s3YjrAqwTTf/9jbtgQYJnGtoLva7l23wHcwGlO4H5wI7x7zeoqay7qZYwj7VKWRg49
	 aMqiPLJhT/EKX4mQtykvKBVBQ8XunCVb4F8rieNESICPfUz9srFt47gmxb+3M/bs0K
	 7Wj8SYvMFWGVg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D68C7C3279F; Mon,  1 Jun 2026 18:06:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Mon, 01 Jun 2026 18:06:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: george.stafilidis@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221583-215701-THunrPVWV2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221583-215701@https.bugzilla.kernel.org/>
References: <bug-221583-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221583

--- Comment #2 from George (george.stafilidis@proton.me) ---
Created attachment 310234
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310234&action=3Dedit
acpidump

Hi Rong,

I checked `/sys/kernel/debug/ideapad/`.

Directory contents:

```text
$ sudo ls -l /sys/kernel/debug/ideapad
total 0
-r--r--r--. 1 root root 0 Jun 1 17:23 cfg
-r--r--r--. 1 root root 0 Jun 1 17:23 status
```

These are the only files present:

```text
$ sudo find /sys/kernel/debug/ideapad -type f
/sys/kernel/debug/ideapad/status
/sys/kernel/debug/ideapad/cfg
```

Contents of `cfg`:

```text
_CFG: 0xfe0d0018

Capabilities: bluetooth wifi camera
OSD support: num-lock caps-lock mic-mute touchpad camera
Graphics:
```

Contents of `status`:

```text
Backlight max: 21
Backlight now: 17
BL power value: on (1)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Radio status: off (0)
Wifi status: off (0)
BT status: off (0)
3G status: off (0)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Touchpad status: on (1)
Camera status: on (1)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
GBMD: 0x10060020
HALS: 0x0000ca40
```

I cycled the keyboard backlight through all states using Fn+Space (Off =E2=
=86=92 Low =E2=86=92
High =E2=86=92 Off), then compared the contents of both files before and af=
ter:

```text
$ diff -u ~/cfg-before.txt ~/cfg-after.txt
$ diff -u ~/status-before.txt ~/status-after.txt
```

Both commands produced no output.

I have attached `acpidump.txt.gz`.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
