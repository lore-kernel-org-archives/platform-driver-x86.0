Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708788;
	b=AmoKJZgJPujrUMDri8274Is7KO2p63ToAdxy0rwhOM3fVEjPYOJdHmJmNqyjaT/rnmC6
	 PI44oVGuraYJWVOSE2+qFYEKC0GZpmxPr7HfncuaBfDf5GWlv5tPy+5J0KMGn4COiHkNa
	 m35V8V4z8Q5KHd0iCkNJbvTsE71jG0uXRQ4BmRE8YDms66mtQ2g+CX1OticXNbpS+m++H
	 LIeH823xw2gVNE3s3fRUJR3Kyl8BUxPumE8zQ5nJ9zyBEU26BfIU8/05bSPGw8oqbH7bH
	 saKk98CPO/AHLjs0phUleE720uW0s7UdvP5Zh4loqrPETAQ2ufXo2ohbx/LC3zII1Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708788;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=Fv17Yzwq+SkYOvWzluVOcgYxi7pm/ryRLaUU1iF+jbs=;
	b=xjfyhpuBOMSnT8/kSRNvAGhjBLCl4kw+VYXWif0U82WrOl5vyuvpcSslQQj76/ct6zTb
	 8YMAlgpXiicIUC/7js4biDkvl2ZWPvtBgs9OHMoV2y38q9S9hMb95giUhvWU6Cq7Xtj/Y
	 515gpVtaNp6JHm6cS0VPACL6v6G+FR2JgdKAmH00XKmpUAxWo+QWHxbEnY+O23XkVAcIq
	 1uwJJtW2kxgaegqYYder+gU4MSzWac/G9dAsFciSgaUg4y7QEg06cGnyeZ2pYmSX/xADH
	 NpDVK3WcKr74So5ZwSeJ+TEDvrOFTpHAN7cJ+XMxCzDOqXcnscuTGOcFcAe/yqBIeBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gmfvF6Nm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0B4606A31C
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 15:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gmfvF6Nm
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A23B1F000C6
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 15:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795708788;
	bh=Fv17Yzwq+SkYOvWzluVOcgYxi7pm/ryRLaUU1iF+jbs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=gmfvF6Nmxj63+0rFigZI5NZwbcoEUm8cGixpxMpNts5ePDUn3ltYoVcGK+EJj9auT
	 ibBb588czYoYdbDiYq6Oi6lc1WOi57RmA83LqZ/jq5ynx2y7fgjuc+12f/YWd2XgkZ
	 lGqWSrbt6goGs+g9lXL71D8caYs/0LNrdEo48rBTL0RhKjDMjrizwPyVHAYAfv7otk
	 YtDQYAR5kv4Yj8D6ZZBLja9IIloQnlbhr1x+AY+Iap8fyzqdAOnvPQUgabhtfMOahA
	 v2iKsk92QwNt1I71CJxDDqRwmzA1UZc/FpyIQvKFSRdGfka4pLbwbYIrOpKTFX+fTT
	 KoZW7pbiKoyBA==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id 14399240040F; Thu, 26 Nov 2026 15:59:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221419] ideapad-laptop: brightness keys require continuous VPC
 polling to function on IdeaPad 3 15IIL05 (BIOS EMCN60WW)
Date: Thu, 26 Nov 2026 15:59:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ing.martingaldeano@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221419-215701-oYRnLOc2ep@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221419-215701@https.bugzilla.kernel.org/>
References: <bug-221419-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221419

martingaldeano@hotmail.com (ing.martingaldeano@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ing.martingaldeano@gmail.co
                   |                            |m

--- Comment #6 from martingaldeano@hotmail.com (ing.martingaldeano@gmail.co=
m) ---
On a Lenovo V15-IIL (82C5, same Ice Lake platform), the same "keys only work
while polling the VPC" symptom is caused by the kernel disabling IRQ 9 at
boot ("irq 9: nobody cared ... Disabling IRQ #9"). The ECDT declares the EC
GPE as 0x6E, but EC0._GPE in the DSDT returns 0x43 (a GPIO-routed GPE). Lin=
ux
trusts the ECDT, so the real EC GPE 0x43 floods unhandled. Patching the ECDT
to GPE 0x43 (initrd table upgrade) fixes hotkeys and lid with no polling.
Please check `dmesg | grep "Disabling IRQ #9"`,
`cat /sys/firmware/acpi/interrupts/gpe43` and EC0._GPE in your DSDT.
Details: bug 222331.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
