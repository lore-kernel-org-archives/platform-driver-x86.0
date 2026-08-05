Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FDA2D876B
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Aug 2026 01:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785893328; cv=none; b=QHg03jXcjhUbrpCkQSr+NJ3KsBhVj8oYG8V1GJuzzDIf4kbPmCF5jhSl3q5axcMeeDvm5+Fj8NVSNG95MekbUeA13l74FCnqeYUThEx21PFSvgWvG89txIEpoKIs0/nTz6gSP9gMgO8l/E7LEORPrXF/UTQIVWN5Zr84cTT6MiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785893328; c=relaxed/simple;
	bh=6TPB5RACVk+kyw7d5KoGmZjRHmo5Y5DUS1QnvoV0FCU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mYttNdVEgQjcA4n5JNJm2OZKKRlOvllACOA7p7NfP1t1TC9KWIFWvitjWgCwgSZ9cn6b9ZNif5YnjpmWY0VmIQ9LwGP7X24z/dGjWmHjAcMaKwWIkWxAuNt8LFNrV7Pzf3NUjkGjTsPHME9gHnlkXgJwaqYM/gLecU2ZlWtFiBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rI2l/lXp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rI2l/lXp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35663C2BCF6
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Aug 2026 01:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785893328;
	bh=6TPB5RACVk+kyw7d5KoGmZjRHmo5Y5DUS1QnvoV0FCU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rI2l/lXpuk2/Ng/7ejz+gzHNgHL1ytKUpZ/DMEE7b7FWoTU4sQChfrUUnuqD2E7jq
	 6p5aT9UPo/cJrKtMQIEaikWlk1ieH82Zgf7IkmE8seSaGDOl98d1heEP/9Yl6Kg7Tf
	 naTi8D6IqprBBW5p4J2/JA0eIYvdP+vF5zI4QNKdIB8McDT4pfcpMz3E3rcKnGoUQC
	 L4M1CnvWRGHbw2t+OaEXmh9SVTlYSrdkttc/kMGqF7sacYP9PLXV1tXmaKj2Psa4j0
	 n6VwZfR6B2cSYgt29yf0mtshyqiK9Jjfe8iZpTiJ1jPyI2BAns+PoCZP7lmGq2gGvt
	 vpurcTbgnQQtw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0FC0CC433E1; Wed,  5 Aug 2026 01:28:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221694] [regression v7.0->v7.1] AMD Strix Point (Ryzen AI 9 HX
 370) intermittently hangs on resume from s2idle
Date: Wed, 05 Aug 2026 01:28:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: hongri.cui@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-221694-215701-zQweb208jk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221694-215701@https.bugzilla.kernel.org/>
References: <bug-221694-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221694

Hongri Cui (hongri.cui@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #4 from Hongri Cui (hongri.cui@gmail.com) ---
CONFIRMED FIXED in 7.1.6. Thanks Mario for pointing at ISM, and Peter for t=
he
7.1.y backport.

The fix landed in stable 7.1.6 as commit 95776812e6b8 ("drm/amd/display: Fix
ISM
dc_lock deadlock during suspend", [ Upstream commit 3714fe242592 ]). It is =
not
in
7.1.4 or 7.1.5 -- I checked those ChangeLogs when they were released and st=
ayed
on
a pre-ISM kernel until 7.1.6 appeared.

Test: dropped my 6.18 workaround pin, booted 7.1.6, and ran 30 rtcwake s2id=
le
cycles (30 s asleep, 15 s awake between cycles):

  resumed 30/30 | no-s0i3 0 | counted-fail 0
  last_hw_sleep us  min=3D29514099  max=3D30090332  mean=3D29935818  (n=3D3=
0)

Every cycle reached deep s0i3 with essentially the full sleep duration in
hardware. The whole run stayed inside one boot -- no hard reset -- and psto=
re
picked up no new entries.

For contrast, the same harness on unfixed kernels:

  7.1.1  wedged on cycle 5/30
  7.1.3  wedged on cycle 28/30   (cleared 27 clean cycles first)
  6.18.x clean 30/30             (predates ISM 754003486c3c)
  7.1.6  clean 30/30             (ISM present + fix present)

The 7.1.3 result is why I ran a long loop rather than a handful of cycles: =
the
deadlock needs an ISM worker in flight at suspend time, so it can hide behi=
nd
many consecutive good cycles. 30 cycles is not a proof of absence, but 7.1.6
matching the pre-ISM baseline exactly -- on a kernel that does have ISM -- =
is
consistent with the race being closed rather than just rarer.

This also retires the amd_pmc line of investigation from comment 1: with
amd_pmc
unbound the box still wedged, which was the opposite of bug 221664 and poin=
ted
away from the PMC/SMU handshake. That now makes sense -- it was the display
driver all along, and the clean PMC mailbox traffic in that dyndbg trace
(attachment 310381) was a red herring.

Hardware, for the record: AMD Ryzen AI 9 HX 370 (Strix Point) + Radeon 890M,
s2idle-only (/sys/power/mem_sleep =3D [s2idle]), Micro Computer (HK) Tech L=
imited
"AI Series", board F8BAC, AMI BIOS 1.02 (2025-03-03), unchanged throughout =
--
so
no firmware update is involved in this result. Running 7.1.6 unpinned since.

#regzbot fixed-by: 3714fe242592

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
