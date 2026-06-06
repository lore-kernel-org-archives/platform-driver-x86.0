Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE559EAC7
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jun 2026 18:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780770686; cv=none; b=lbRJTRDTMd4OMFfz94r2Qjf7H6gcxPJhy/bt7s5Jwx6sJW9kexYzqSJnoCjQqwa666ptUIBJkKUjnu2pawq6dHatujkSzqSp77JmN5p5rolA6JrJ0436sqQHs7TLJiOqQteRBSpBVX1AkZwmasw6PcE1KKFD5DnnJzXMa85F2YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780770686; c=relaxed/simple;
	bh=5d9jJy58JpJZBAJJVUI2Kxo+WD5xYXxCs5mdAXpX9B4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fofUNKHpCscELHRBAqD1+Go/Q5hYV/8xd3SwhOZGgomWIosgG8x9BNfqpAQrf2/ZvCPa1hw+KDg/xTYEkIYt9EVhU4sSr0zi7RJ2X2RWoRmiNnqFB2KR+/DK/DW6TasgfEBrnExG3PmkgTIX5JZBVC9umxHwdcL95Z1OYDkn9xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EzceDLXA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EzceDLXA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95FF0C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jun 2026 18:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780770685;
	bh=5d9jJy58JpJZBAJJVUI2Kxo+WD5xYXxCs5mdAXpX9B4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EzceDLXAL0NmUHjEiU75MwvOq4uvyIEOEPvz8TKaqsRjNC+xSOOEDsjSqK1N4rRBr
	 BcpJUx/377+x9HYK58vcLYV1IaqpCR5sa2aShF9izToOhrQauqpOpmd9YSeoqHGE/M
	 K/N/HTXkDHt4lgVyWqcFLOrY0zta81BC1y8IUtx2kmrmK2uQORyTYbp6/sM1zQ/d8I
	 nen2IUG95hJLIrSmEH28vV/7jLg2c1MzatH5UO2aWavu81DtA0Vpjg9/LwkdPn+z2K
	 bsrVqy/9hVprNlRnAwmfx6XNIRIvJl7EWb5ZIVxSfhdBmlYunj6f+vVrrRjEMH0Tqb
	 5GjYEy00Qyp7A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7395BC41613; Sat,  6 Jun 2026 18:31:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Sat, 06 Jun 2026 18:31:25 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221583-215701-EO77sJ2pN7@https.bugzilla.kernel.org/>
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

--- Comment #33 from George (george.stafilidis@proton.me) ---
ultima@fedora:~$ sudo busybox devmem 0xFE00D42A 8 0x05
[sudo] password for ultima:=20
ultima@fedora:~$ sudo busybox devmem 0xFE00D48A 8 0x54
ultima@fedora:~$ sudo busybox devmem 0xFE00D42A 8
0x05
ultima@fedora:~$ sudo busybox devmem 0xFE00D42A 8 0x05
ultima@fedora:~$ sudo busybox devmem 0xFE00D48A 8 0x55
ultima@fedora:~$=20


last command did set it to low

ultima@fedora:~$ sudo busybox devmem 0xFE00D42A 8 0x05
ultima@fedora:~$ sudo busybox devmem 0xFE00D42A 8
0x05
ultima@fedora:~$=20


these did nothing


ultima@fedora:~$ sudo busybox devmem 0xFE00D42A 8 0x00
ultima@fedora:~$ sudo busybox devmem 0xFE00D42A 8 0x05
ultima@fedora:~$ sudo busybox devmem 0xFE00D42A 8 0x04
ultima@fedora:~$ sudo busybox devmem 0xFE00D42A 8 0x05
ultima@fedora:~$

these also did nothing=20

ultima@fedora:~$ sudo busybox devmem 0xFE00D42A 8 0x00
ultima@fedora:~$ sudo busybox devmem 0xFE00D42A 8 0xFF
ultima@fedora:~$ sudo busybox devmem 0xFE00D42A 8 0x05
ultima@fedora:~$=20

also nothing here

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
