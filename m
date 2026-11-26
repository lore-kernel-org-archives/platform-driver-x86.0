Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711340;
	b=cfc/wXpyb6xwgedtiVJzCFTLjFGYAbN8ZuRWrdyU21aPwh/v5KDr/Cd63gqDc9sXJaUD
	 Z7sIxIrjw37/5RPk9xIjHDciPRaxy8GpVUXP8/7LZ0JiwqrNXWQIZ+m3Ee56f3YjbG12Z
	 irNA8Y2lPjQJEkpZ881foYZDHXIUA6c9kPEw5A0fo6dGdph9NVX8fE5sIHbre5QFWlnH7
	 pJJUp/uFRahyVTZymElunBi5pOrhNc3G0Sa6kOTARQ6z2YbQ7msTNeHlBDcWJtTK8z03e
	 l1Lii297iLrR18A3jc5fAzL79kPe3rx5kk1ZJEwuciI21yytLJrp8ddabFSg3m9G7/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711340;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=Pz0j6is2i3ZnFrFyIbqXFa4mJ8oDpVi29EpuIhnvO7Q=;
	b=MldTWRSxkv+qnAz9ZDGax7rRBwNw0lqusz7/JURpx0t5y5UTpo2i3GGP10E8Oo/XWS5c
	 KZJaDLo8PGXf4lrpePg1IRqoguHSwV3wKdKVDUu2QcY3BifNhC7DQpF84YyId33j8cEIt
	 y9OzkBVmnyLn+J7MRxyZ4PudJNFUKSWG1ArTk5H3x+47Z0ZIdbTxKpinWbRJ178S0QyYF
	 ocbXDdgIzqA8uA7pPTByTdIVtgypCPrmNQwfSOrOOWtCSlZ3qsjlP8jo+N6TFF/pgYtFF
	 oN394WSEeuVpZkuzt2Mw12p6kJe44Rw/WBOQfqLtrOVieqktU6bCJEXxVV0M4J7C5Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kdJmcYvw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C57160A263E
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 16:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kdJmcYvw
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFB331F000D3
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 16:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795711339;
	bh=Pz0j6is2i3ZnFrFyIbqXFa4mJ8oDpVi29EpuIhnvO7Q=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=kdJmcYvwKIunCHoyHg8PPKkDWqnHZhkbDYIJ3SbjSVz8BGCAuFJ7EEhkfK/EUP+R4
	 OhSdb52JNw0KC8yFtCPNTPoKsZlZDxWHVlwIj22jtIsTZvDg3jk+NV2vMDGpystFNn
	 XfJvvHdj3WHeSUoUGEXYxVcrjoUI4yd62hJamXrSUoyx6uGRYybnNAZBRRIlyv3a+L
	 ktZhZ+sOodGuTL0t1Elh2IuWd790PldivCskAdhRCuZ7k4N0jDUSYdYnbpwI7GGVhP
	 i1BVttr3NB30BbDJWI5FWJImvXtqf+iDCv8TaIc+OY19JZkSfV6UvqqdxV2jbZOjdv
	 GIX+4211Q9Ygg==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id BC215240040C; Thu, 26 Nov 2026 16:42:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221419] ideapad-laptop: brightness keys require continuous VPC
 polling to function on IdeaPad 3 15IIL05 (BIOS EMCN60WW)
Date: Thu, 26 Nov 2026 16:42:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ladha979@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221419-215701-2rxKkPbaYc@https.bugzilla.kernel.org/>
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

--- Comment #7 from ladha979@gmail.com ---
(In reply to Mart=C3=ADn Galdeano from comment #6)
> On a Lenovo V15-IIL (82C5, same Ice Lake platform), the same "keys only w=
ork
> while polling the VPC" symptom is caused by the kernel disabling IRQ 9 at
> boot ("irq 9: nobody cared ... Disabling IRQ #9"). The ECDT declares the =
EC
> GPE as 0x6E, but EC0._GPE in the DSDT returns 0x43 (a GPIO-routed GPE). L=
inux
> trusts the ECDT, so the real EC GPE 0x43 floods unhandled. Patching the E=
CDT
> to GPE 0x43 (initrd table upgrade) fixes hotkeys and lid with no polling.
> Please check `dmesg | grep "Disabling IRQ #9"`,
> `cat /sys/firmware/acpi/interrupts/gpe43` and EC0._GPE in your DSDT.
> Details: bug 222331.

That's great, I'll test it out. Thanks!

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
