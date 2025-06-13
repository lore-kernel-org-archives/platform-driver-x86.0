Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F9C72608
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 13:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749819605; cv=none; b=auWXf8l4EvmNqg2uc/TBcLhQ72qhyPYE9b0+X6iqWIXBKizw5b6niuJv4SZQmbutFCyT643Bud7kG8e0BU8UCJTAEgJj9jCQBtWRyRZTvYhYXxk3AbdKIVyUzET6HTMw17J6rA3mMpVc1qlJbi3eu/Y2ZDvRR3LmhPJkoA5eUnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749819605; c=relaxed/simple;
	bh=UJ+tVNY+vmRuKis0IbPpkM+zjVD/e2jeK454mlsoQYg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HmSbPMfdYa7w//Lt+RLgJFlpijyahRGsrWXIRFsEgqv7MAJWH6BrfkihDGIVePksqtmz2/B11j67yFBB4hSfZcdsbaX5rA4Cn/DoywkuCLyqdWasHo5irfbNK5R3RJgD1Laq/pzvpj29rFdqQWouIcWip+jVsGAKnCQ9E/gumZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qa8kXQt3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qa8kXQt3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85AC0C4CEE3
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 13:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749819604;
	bh=UJ+tVNY+vmRuKis0IbPpkM+zjVD/e2jeK454mlsoQYg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Qa8kXQt3bj90brxpnEE1rxGqgET8LQRq4nK5riCxloi7ySoClFUWRcvO9hkoOa60t
	 DikTjWQCHeqnOgO57ayjeiauDAFDrvNw2c7jUVL0H0O8NP4gKbLTeWtiWAHOme+bak
	 BgctcK9TFlazn1/o2dYuH83xjC0rKDD3gdB0NhnYycxvYAv2M3PvmisNpapLINqRQ6
	 ui32FEpvdRcLr+AhLZ8GPEHfGzEwCJBebSmlDY1PGfVs46ny8W/hSfc9RXgEnBPMm3
	 4eGluubwkLh2PajCt3lDdzgciG8T6UlwaAryfFC+/FZn+edvcuzmv3AXiid5jIcQjT
	 gkfa193sLGbBA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7DC56C433E1; Fri, 13 Jun 2025 13:00:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220224] Kernel 6.15 causes crash (general protection fault) due
 to amd_sfh module
Date: Fri, 13 Jun 2025 13:00:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: g.molinaro@linuxmail.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220224-215701-9eBZOA54QI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220224-215701@https.bugzilla.kernel.org/>
References: <bug-220224-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220224

--- Comment #8 from g.molinaro@linuxmail.org ---
Quick update.

Before leaving work for launch, I removed the blacklist file and did
`mkinitcpio -P` before shutting down the laptop. I left it connected to the
power supply and left. Upon coming back, I tried to boot into all the insta=
lled
kernels: arch-6.15.2, cachyos-6.15.2 and cachyos-lts-6.12.33. And ALL WORKE=
D,
with the amd_sfh module loaded, without issues. Sadly, I was in a hurry and
forgot to save the logs.

Barring some gremlings, nothing had changed in my system (no updates at lea=
st),
so I decided to shutdown the PC and unplug it from the wall in order for th=
e EC
to reset at least partially, then powered it back up multiple times, both on
battery and wall power without blacklisting the module. The results are as
follows:

6.15.2-arch1-1 : now boots up without issues (it didn't before);
6.15.2-cashyos-2 : DOES NOT BOOT
6.13.33-lts-cachyos : boots as always.

So it would seems that the issue is now somehow limited (at least for now),=
 to
the cachyos kernel. I have ho idea how or why aarch is now working while it
wasn't before or how they all worked fine the first time.

This time tho, I have updated logs:

- Output of journalctl -k -b -1 for the failed attempt with the cachyos ker=
nel;
- Output of journalctl -k -b for the successful boot with the arch kernel;
- Output of dmesg for the arch kernel;
- Output of dmesg -S for the arch kernel;
- A New screenshot of the kernel panic message with the 6.15.2-cachyos kern=
el.

More tests to follow...

---
As a side note, I found out there's a BIOS update available for this laptop=
 (I
stopped looking at the website after a couple of years of silence). I have =
no
idea what it's about, and I'm holding off installing it for the moment not =
to
invalidate previous testing... but I'm curious if I should just to see if it
changes something. I'm open to suggestions.
---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
