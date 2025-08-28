Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D7DAD4B
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Aug 2025 05:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756357854; cv=none; b=eSqrk8F549JgFQtuTlJGOTr4HFdZD8J2u62N5/MrlO1XAFQUxJurcfd1OWjLhWeFoyx70mtDI+mqtAdl5TxYAMIovZChXzXQLcq6gSuneINiqaLmBOv6iuFzUpS+YccsLw0b1yfc3HMn+1qVZqzBX3crDZTjlmr1LWkixT3idAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756357854; c=relaxed/simple;
	bh=ck51mOlzJsf8YPaNg7EaPBg3F3PtdC0C6kN9522/m3U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LnynYXHGUNNL5w/Rtc5UWaLxG5f9YHxzq45ECE4wIuPGor0ILqnMm82NYUhRhhWHz0gEUgl5YvJ9TK/xroNhQXJIyK89npLShDEJhkaHNSRX7BQKEvj873xwzRVqTnW1uEsZ4PeK7r8370xlTckku5NpP+P8AAr1PdseaHcg5uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=swa2P+PS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="swa2P+PS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06B46C4CEFA
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Aug 2025 05:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756357854;
	bh=ck51mOlzJsf8YPaNg7EaPBg3F3PtdC0C6kN9522/m3U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=swa2P+PSIWq5QcxBHQkXyaQ0gM0DgEcmT9cGZxbTEYkRUPv9uYFHW5KQooZlzl72q
	 O9oUzzXxko2eFdBB3HdoGpy6QetzXui/nrvxoMejAeKwk7r0EaAX0JRBKBoHpF+d5l
	 59nDABEY8RatzulUaggtVruXgGDLEUOZbzABhUyeCSjFDjiXl2DD6LT3lRbWaTsrrx
	 ppLfzPFXpRppMLaPqdIO4d+zb4jWVbprCEZaWOn7X0B3z1L6iAJmuKN7q4zSN+SwVK
	 0X/wSe4dm99HhUuBZVV3p+wz9WRhqDMadk76sGhDUvmiVK4pz/AxxBuJzFlxS97aAA
	 Q0hUSlxVsPICw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F0B36C4160E; Thu, 28 Aug 2025 05:10:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Thu, 28 Aug 2025 05:10:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: ries.infotec+kernel@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218305-215701-89Tj7WM46h@https.bugzilla.kernel.org/>
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

Peter Ries (ries.infotec+kernel@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ries.infotec+kernel@gmail.c
                   |                            |om

--- Comment #99 from Peter Ries (ries.infotec+kernel@gmail.com) ---
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

I have same hardware with latest BIOS. Running Arch based Endeavour OS. Ker=
nel
6.16.3-arch1-1 ATM.

I still have this annoying bug. Thought it was gone, but obviously I didn't
unplug while in suspend that often. But the last days I worked more away fr=
om
desk and needed to unplug when suspended and irregularily (every 5th time m=
ay
be) the CPU is stuck in low states 544MHz.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
