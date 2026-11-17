Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953724;
	b=BM6FpPsXglqifessCeFIusElLxm0fgrJ5oNfk1VPghYXQZCLtwWYwRBH6aJsIRKzw0Ls
	 o3BYmlsgIJ66p3CKG5PSwNv96qY78BoWzJ2s9Bet367BYVbhquo+27ROpXYTSQwTWrKQ2
	 x0CaOkP6f7h2wNiEOGP65t8i5xFwOIq3yd7wmrFvYxuc99tCT9wAAktxsqLunJrejqlh+
	 1MdY8rTwSHCO/+tW7mf8ichSdh36oRLw37EMFfKhoYL9zuOYapQbn1ucUGOgHJcnF8vrC
	 zg1VzdJDUBhOpg4pmFiSoSSUxbVRmFOpuCLnv/+WAE6nh/YE/xEfUiSnBj6QxETvHqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953724;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=boXIXEAAkKfMuQCl6QjutCaJtxYADcnDiOLCg/Qz6ts=;
	b=kcd/D8gGyoyutAPxCw7be+xBWogDeyMQfO6CEVW1GVwBA84kol2boUP0hHsKas9J1zsS
	 Oae0x4Q7sPgg5/4boBWIwHsvVsrhwxzUrbI7ldy3yOkab0Nw7z4xKmcPGKVr1RPdoH2XE
	 O77Rs1eQdgQfS/ck5ZzA/zYxZcAU7tNKorWCsJN27tc+n5fkTL1J7L1Ux2QBsvAYav1JJ
	 s+xm+4RWZ3E5Kmq/zACquPE7/0l0D3FHbRLVqPkMqVSXVOOvj23/6h/Iotm5i5uCdt0Le
	 kl6LiylQa+2QXP2y+BAHs06rmqmv7xILQEhBdOP7WSp8ifhI3DEjiisjQmumDkIj4WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z7BJ4AeO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0DF606A32A
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 22:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z7BJ4AeO
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4DE281F000C8
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 22:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794953724;
	bh=boXIXEAAkKfMuQCl6QjutCaJtxYADcnDiOLCg/Qz6ts=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Z7BJ4AeOpBptYexM6liZ7VM94iMQkKSSzpfawSS66PTFwnTQEtZ+pLjOFbq4yKxiW
	 l/SDlisZSw4897mXJE13744ifh+mCMn0/RyDOYSvD/pBZ3+C4ZIxp74WVnAu/56emW
	 65PYMfE6unobRAFJTgkeZPjm/t5I7seTbSgKXSCrWUGnIuS0/MJ+Aq037PMS4nn4s8
	 hXp6FwbQLGVQiDtG7zGXyph8UpcakJizdgRoAtFKzojLBqn371eH/izhMHx8F7WVPF
	 FNOBS+PXzoQ8AqMsf1QSR4/hYAmSc+quaqf7hORCg58FYokp8zuydmXX3qlyaz1+GG
	 kX4M0vycrMApA==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id 3E747240040D; Tue, 17 Nov 2026 22:15:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222275] lg_laptop: LG gram 16UD55U - kbd_backlight has no
 effect, unknown WMI scancodes on Super key
Date: Tue, 17 Nov 2026 22:15:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222275-215701-jaRJzP8MsA@https.bugzilla.kernel.org/>
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

--- Comment #4 from Armin Wolf (W_Armin@gmx.de) ---
The year detection mismatch should be irrelevant for the keyboard backlight.
Does the keyboard backlight cycle automatically when you press the associat=
ed
hotkey?

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
