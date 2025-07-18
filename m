Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF05A1CA84
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Jul 2025 08:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752826960; cv=none; b=BLanz5pCDWJmTbfLnCP2sjHzpsWOVmfTabMkm/VKrznZP9zRA62o/kbzQ+d0k1nnSvMucsR8cORdtoZAdZS6+qR9qtSDBpWH6JUX/QUqVbF+gwnBeE7MSjnvOKd6HwcXSszcqzDprwX5ZvwJ7//MTJJm9ecQ0n/BWAIng7aCs60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752826960; c=relaxed/simple;
	bh=zTgWpnP5VjsuqvqA0RWLC+BgLhKu4hmohA08uhdxYxI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YwmWMcRxYheop4ZmOdt8VyOPUQ5vhsnMHN60d1MgXX6vVw8VS7+ZjjzT4CnjzdNAZd7sx0/uFZMvgMleSH5vk7O6TvbrgKnRyJuczPFpHAqbCfcsp/v3ce2VxjOwbODUBb0A0Ek2GgR3o4BI8rfHkavWmss8Ae+qW2zahYcLjQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AiaIucKd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AiaIucKd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CC7CC4CEED
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Jul 2025 08:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752826960;
	bh=zTgWpnP5VjsuqvqA0RWLC+BgLhKu4hmohA08uhdxYxI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AiaIucKdF0zzLQBaOtEHeeN7qLUYWM9RjyILfPlnMtFNSWufjxwEPN5QfPvndMR0i
	 XyRjCz9eFc5GzMSndFBfvS9TPPMQqBz/hTYT+E1UlojLlDdT7ogm6OQYe8iAyCUWbt
	 8aJBH/d1jPCGAVQY25azn+sw11WGSi0AXQ6HRJIcg5rTLsklcI4swksn3rrJsaWDXy
	 N67fHEDxGQudY/uXhvWjzl7EEjO3T8YBUxVpityc+vBdjGt/QRVcauJqvDTr9b/EBE
	 BuaHsYkrrtFb5HwyGSDhvtQFFs13gJubCMxPXYIPrMVd2rUOs1i+vFwSZk63qjOkMs
	 4ErepsfDz0M6A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2554EC53BC5; Fri, 18 Jul 2025 08:22:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Fri, 18 Jul 2025 08:22:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-PKKmbl5LyF@https.bugzilla.kernel.org/>
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

--- Comment #97 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Henri from comment #95)
> For me, the patch did not completely fix the issue. From time to time, I
> still experience my Ryzen to be stuck at 544 Mhz after unplugging it from
> the power, while sleeping.
>=20
> Laptop: HP Elitebook 845 G10
> Processor: Ryzen 7 7840U
>=20
> OS: NixOS 25.05
> Kernel: 6.15.5 (linuxPackages_latest)
>=20
> I have also run (an 4 month old version of) the s2_idle script, with the
> output being here: https://paste.debian.net/hidden/a701167b/

You're running the ancient BIOS/EFI:

2025-07-16 12:36:40,946 DEBUG:  bios_date: 08/23/2024
2025-07-16 12:36:40,946 DEBUG:  bios_release: 6.2

Please upgrade.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
