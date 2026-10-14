Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C641A9F90
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 10:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973385; cv=none; b=Mwo5N5qcjV9SUUrY4EKgmkY4uSUPMeubrXtG+m2CzgT2QuoxPAoaEwJI+z3bNEbWDgqqrKf/bFs7v1juhMVkkLZij291g0TGfZ164LwPNb+HR/SsbILn54HAGFCcX/x7Kuheo4fKphqoW9X9EVDOhtOAdyia8ZpUlXQDGsjK7Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973385; c=relaxed/simple;
	bh=2liziQ4iDP7YJ78jd+5V8emXuJW6cZhsgJCRBb9Sk38=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bQVya/T7zWujjD8uOeS8wwlX7/L/2aLso335wiGiUrun8PXdx/LXbj2r14bbEWYCfTe/K0QNuuhXr68WwRJ+oItW1RrRQereYKpcNriLDImIIbT/hY2SebeExD92QxOYvSZZCrTP02zO1NUaVPwP9x8QcKkj5JwMmgcs8bZpb+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ad7xNnoR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ad7xNnoR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2760FC2BCFC
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 10:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791973385;
	bh=2liziQ4iDP7YJ78jd+5V8emXuJW6cZhsgJCRBb9Sk38=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ad7xNnoRry+7+9X88cqSiCt+M9fRAT4fpL5Jjf6PfGY5Oj//kHSxBi28jkZHqRrbE
	 DnnIp21cjQsSB9vAZHoZZWw24CRnfNofTNrvx60IolatOyVgOSYT9/D3c9BmCHvhL9
	 jpwVo2iSLlULPgZCbB7vjHgZKCMDdQhtByfXt2+NSXlxDCrTAHJNI1g85hpzfrUT9u
	 VDmcbgJqPy+YsMYnUMLJ019ict5bozGUm6mSgm2mMbrd4V5gG1RislX5I7rJTrLqEC
	 HisSf/5wxaFJ2xMQrgWBaVOo4iZL/pbUkrnnkRYJsky9nafQZDbzGZeXsiLSYFirv2
	 kw+n6M0Le5ooA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F36C9C3279F; Wed, 14 Oct 2026 10:23:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222044] hp-wmi: Mute and mic-mute LEDs not supported on HP
 Laptop 15-fc0xxx (board 8DC9)
Date: Wed, 14 Oct 2026 10:23:04 +0000
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
Message-ID: <bug-222044-215701-dRlXuPzz3M@https.bugzilla.kernel.org/>
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

--- Comment #12 from Piyush (neonblade018@proton.me) ---
Hi Zhang,

I am currently tied up with other work and cannot do a clean kernel recompi=
le
right now, but from the hardware routing logs:

The internal digital microphone on this AMD platform is handled by the AMD =
ACP
SoC driver (`snd-soc-acp6x-mach`), appearing as a separate hardware device
entirely from the Realtek codec.=20

Bug 221233's assumption about pin 0x12 was likely a misdiagnosis because on=
 AMD
Mendocino/ACP6x, the DMIC data lines do not pass through the ALC236 pins.
Therefore, mapping `0x103c8dc9` directly to
`ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO` should be all this machine requires=
 for
LED control.

If you submit that patch to the tree, I will be glad to do a final confirma=
tion
boot whenever I have some free time.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
