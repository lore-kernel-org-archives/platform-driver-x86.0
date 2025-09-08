Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634902D3756
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Sep 2025 19:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757361524; cv=none; b=jAFqQ3caweCEU7peAfk1K3s3/1VeNVXLV4mo2xIBPG8KM3jMgtskfiOSegsY+fyhGKig+Lc7fyGhgvyYAXmg77o2mkGpbclge6zUZ+QQk4Uj3xSq15CzpHaXhqtNxX3Kq20F3ZmZu3n99fJhz7aW+VGdQ4nmHqcHwQcWk4DmHuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757361524; c=relaxed/simple;
	bh=nVFLUtDGB/jwN6aSzOzSMLQI/z/oN77nrjNB/Oo0tKA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GOu7x+FZhiMmnP/4d8lhblUR25Xc/3Yeh+3hcIZhONsZvX1EaeKHR45jyfuJodIhFeUZwC7meYOup9+0lRZ8QY/d+CUCcL4+33ENk3b5Ri3PoCXdJziYUtLBYST2oGYAuqJwYKMxpGCHbgPSYGZJSrSjUVbHCvucqC2i2k8p3/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YDRduKLJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YDRduKLJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D58DAC4CEF5
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Sep 2025 19:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757361523;
	bh=nVFLUtDGB/jwN6aSzOzSMLQI/z/oN77nrjNB/Oo0tKA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YDRduKLJ2JqKg94fo15N1CbA/0UxQiyQgPn1NXiEa5GqMgADYX5C4Me0DmGWH/1O8
	 wSzZiOdf+U0Bq0a0QvsMuE3/nIgLqEBmZTaKmDmL/kUuXALyxGTbA1UytJiyJ4QmM8
	 MKeDR/dj++R5lSp4076t8h8HNgICZLybCTyj8Zw9LIN2K6Ks14LkrIfO8swa8uG6vz
	 Q5aLl4TO6D1zgR97GrZZVxiwnrmkxgss9Y8hQsF0k/BMMAs3crsxCp+mPlFQLR7tTC
	 wPRnJWm5LAQFuYdHPkqdmT7sQU/9Jh3/lrxtXG3VRlx0baoANmVOMWpiSwZ0aC7Yt+
	 hhlfLevEbVRbA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C9A27C3279F; Mon,  8 Sep 2025 19:58:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 08 Sep 2025 19:58:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: petar.vidosavljevic@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218305-215701-jptE6aZ1aR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

Petar Vidosavljevic (petar.vidosavljevic@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |petar.vidosavljevic@gmail.c
                   |                            |om

--- Comment #100 from Petar Vidosavljevic (petar.vidosavljevic@gmail.com) -=
--
(In reply to Peter Ries from comment #99)
> (In reply to Henri from comment #95)
> > For me, the patch did not completely fix the issue. From time to time, I
> > still experience my Ryzen to be stuck at 544 Mhz after unplugging it fr=
om
> > the power, while sleeping.
> >=20
> > Laptop: HP Elitebook 845 G10
> > Processor: Ryzen 7 7840U
> >=20
> > OS: NixOS 25.05
> > Kernel: 6.15.5 (linuxPackages_latest)
> >=20
> > I have also run (an 4 month old version of) the s2_idle script, with the
> > output being here: https://paste.debian.net/hidden/a701167b/
>=20
> I have same hardware with latest BIOS. Running Arch based Endeavour OS.
> Kernel 6.16.3-arch1-1 ATM.
>=20
> I still have this annoying bug. Thought it was gone, but obviously I didn=
't
> unplug while in suspend that often. But the last days I worked more away
> from desk and needed to unplug when suspended and irregularily (every 5th
> time may be) the CPU is stuck in low states 544MHz.

I'm also still encountering this issue.  Kernel:
6.16.3-200.fc42.x86_64

My hardware is:
HP Elitebook 845 G10 - 7840U

Some of the output when running "sudo dmidecode --type bios":
BIOS Information
        Vendor: HP
        Version: V82 Ver. 01.09.00
        Release Date: 04/14/2025
        BIOS Revision: 9.0
        Firmware Revision: 96.55

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
