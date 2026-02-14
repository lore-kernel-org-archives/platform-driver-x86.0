Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627273EBF24
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 05:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771046229; cv=none; b=bdTUlnCAx1jJ6GqD/fJYa2NK7uKwu6cOnlVG2LCVtiYBRgBaTqCk2COAKmc5ak0OzBK3nUhb7pXpb2TaioJWarqdvugGSWdXLz10AguB2knMCnoI9jVuMLa6CPcPCXKcYYjpRTSpCPTa58CAW1N45+Kz1PWdbHhI13RZ1w7znOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771046229; c=relaxed/simple;
	bh=mOgEInfBmThCXprQyv+n7C/yZCkl0P7ZuU0UTMAdhd4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fafS2iV7JMGVGsIhnO0yOGjJHt5a+Qtj4A/ZzifLiaAGESFs7Nkwzw6F4b2Qtsabogw5Zs0dnC8coL7OJ6993iDtNvZxgz2Tifv8WvDx2S9CBe6fgL88PjGu2xSnIaG/kJcO8lq6qDxzY10ZjYSv8Z0gJcCPGxkGK5be+SP6Q18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJ9jEdQD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJ9jEdQD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1EBAC19422
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 05:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771046228;
	bh=mOgEInfBmThCXprQyv+n7C/yZCkl0P7ZuU0UTMAdhd4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LJ9jEdQDUN1F18xtRxKtuKqSg6FLLSYsuZGQhBH6WH/LZPCmfD6cYy1o3n1b3tPzy
	 pxwwxwgJ+nPEcbsGDsxcfjfibAo4s8J1uO8re14vRCg2BHJ2heqHBkeTbHAdkXcRwe
	 b/5UdCKpa68yEIYjvwNjsEI7LFediZg0HIEJKhufT6shWRuks9TK3nU2f4ONiXUAGm
	 x3UYVUgj+a//oUKE3HEjqZc5K1m11wQMbwG857o4ov0eFKBsIi5T81xLQd3ZThS5a7
	 S+ZFKeLzhAM8nbfJA27+sxdWUAuLSUmPnghvIcHVXgcvvARzMeDq8/gs6/gMCPdA/H
	 roJqbYnAKdvLw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CEF70C3279F; Sat, 14 Feb 2026 05:17:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjA2MzldIFtCVUddIGhwLXdtaTogT01FTiAxNi13ZjB4?=
 =?UTF-8?B?eHggKGJvYXJkIDhCQUIpIOKAkyBmYW5zIHN0dWNrIGF0IDAgUlBNLCBCb29z?=
 =?UTF-8?B?dC9XTUkgcXVlcmllcyByZWplY3RlZCAoaHBfd21pOiBxdWVyeSAweDRjIGVy?=
 =?UTF-8?B?cm9yIDB4Nik=?=
Date: Sat, 14 Feb 2026 05:17:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: juanm4morales@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220639-215701-sfvskPx5B4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220639-215701@https.bugzilla.kernel.org/>
References: <bug-220639-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220639

--- Comment #10 from Juan Martin Morales (juanm4morales@gmail.com) ---
1.
$ sudo dmesg | grep hp_wmi
[  554.103966] hp_wmi: Registered as platform profile handler

----------------------------------------------------------------
2.
$ echo 128 | sudo tee /sys/class/hwmon/hwmon1/pwm1
128

$ cat /sys/class/hwmon/hwmon*/fan*_input
2900
3200

$ echo 255 | sudo tee /sys/class/hwmon/hwmon6/pwm1
255

$ cat /sys/class/hwmon/hwmon*/fan*_input
6000
6400

----------------------------------------------------------------
3.

$ sudo ./hp_full_thermal_check.sh
(attachment 309375)=20
...


Results (attachment 309374)
=3D=3D=3D HP THERMAL PROFILE VALIDATION (FIXED LOAD) =3D=3D=3D
Hardware: Board 8BAB | Kernel: 6.18.7-arch1-1
Load Type: Stress-ng (Matrix) + glmark2 (Infinite Shading Scene)
Fan Path: /sys/class/hwmon/hwmon6
---------------------------------------------------------------------------=
-------
PROFILE      | CPU (W)    | GPU (W)    | FAN1 (RPM) | FAN2 (RPM)
---------------------------------------------------------------------------=
-------
low-power    | 55 W     | 27 W     | 2800 RPM   | 3100 RPM
balanced     | 55 W     | 28 W     | 2800 RPM   | 3100 RPM
performance  | 55 W     | 28 W     | 2800 RPM   | 3200 RPM
---------------------------------------------------------------------------=
-------

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
