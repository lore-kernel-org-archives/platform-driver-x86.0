Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1A8286428
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Sep 2025 22:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757111073; cv=none; b=F6iHcAJQTXtKfNJtiVMKjEX2cKCArUi5BhCzQHDRXXRdNcrXGlVr9inDAYGiAho9ryf/Pc8w/u1Ui/tRSoUZIVGIXMQEmmkHeWTqM3hkpTgl2q/fQ6yt8jEwI9Nl0i/SFbvrXeKmj10hq8jRjoRgu+jLt6vdFtQKDdoB0rONhrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757111073; c=relaxed/simple;
	bh=AmVIjBTwchf1Dr3TQJSmSatL+DSgxKogkPLrzU5spUw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kh2+cv9FEASK4NckABMt8QrtlKm12m9sMFMpYBNvkw1vS02cIzEFMMnc7vraxe0HpqZkNkBAuXlVWOslNWIrFI9nsGeleXiCaRBklgiYgv8h/eLwzwBdXD2BxpTGodaJiI+w2YJWx/wJM1/IlHK2IcKojc9rtsSq3ODlpwkjh+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQbGUke8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQbGUke8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87B9CC4CEF5
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Sep 2025 22:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757111072;
	bh=AmVIjBTwchf1Dr3TQJSmSatL+DSgxKogkPLrzU5spUw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LQbGUke8ZKum3vuZ1X1jUcCQWCezNNJH0VSIOyoQdJg6v5p5LXpS2Uc3DL74PfmbF
	 ooCVZfkcrNVoOqqMcDiR5g7ZskHzQmvTxO8UK70KriYjzSsP1pTExxCVA/oJ1ZF+X3
	 KLVpgX/sxZrWvD1Isqr96Inc5Ye2Zhy+31N57V4Okrs/wy+ZvQJE+1UqEuyy/vvwsz
	 rvj+aLDaHzMFJsXIZobwXau/cCIw767BKFty6pEpMhWlDpS0w/FlwSQcw1iaoUboWn
	 XrKwV+UmPqwKL952tkhuL9/25/u0UZf6F/nGV5zx15A3h0cGKh/KCYsSxGwhHIzWIR
	 SIlKa0BcrH3tw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7717EC41614; Fri,  5 Sep 2025 22:24:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220473] Linux 6.16 doesn't let me to shutdown the system and
 sometimes to boot it (lib/list_debug.c:35)
Date: Fri, 05 Sep 2025 22:24:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: binarygator@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220473-215701-LfwrDXhx5D@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220473-215701@https.bugzilla.kernel.org/>
References: <bug-220473-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220473

binarygator@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |binarygator@gmail.com

--- Comment #8 from binarygator@gmail.com ---
Hello everyone! I'm experiencing the same exact problem on my ASUS ROG MAXI=
MUS
Z790 HERO, whenever I boot with kernels 6.16.3 or 6.16.4.

6.16.3: really hard to get to GDM, it usually starts printing stacktraces o=
ne
after th e other without stopping. If I do manage to log into the GNOME
session, it won't last long and it's not possible to reboot or shutdown (ge=
ts
stuck and need to reach for the reset or power button)
6.16.4: easier to get into the GNOME session, but everything else still app=
lies

I also keep getting the lib/list_debug.c:35 kernel bug:

```
[Fri Sep  5 23:47:08 2025] list_add double add: new=3Dffffffffc0e187c0,
prev=3Dffffffffb4327a20, next=3Dffffffffc0e187c0.
[Fri Sep  5 23:47:08 2025] ------------[ cut here ]------------
[Fri Sep  5 23:47:08 2025] kernel BUG at lib/list_debug.c:35!
```

The usual asus_nb_wmi, asus_wmi, and asus_eeepc (might be wrong on this nam=
e)
are mentioned in the messages.

If it's of any use, I'm on the latest UEFI version. System is otherwise rock
solid on any other kernel.

Luckily I'm on Fedora Silverblue and so I was able to downgrade the kernel =
and
pin the deployment, but that means there's no way to get any kind of update=
 or
install any new package because I'll also import the new kernel.

I noticed there's a kernel-debug package, i might try to install it tomorrow
and see if I can get any output.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
