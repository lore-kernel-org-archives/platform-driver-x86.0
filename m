Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B26D3B6C03
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 08:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779266632; cv=none; b=mgohdKBMJRkftcA5CFoWbI1DG4p4WAU6djUeLhzH6PTxXalieWBpYRWdf/6r/BaLN0wDGeeNgDVTxEDoE7UUWbYokcLNOD+RoB0CROfsWtuzOhOeAfGm6i6QRvUZdHIHm/+GnREnGIg4b0aXSS9KdbP+M1RTIesq6VU4uP/BlnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779266632; c=relaxed/simple;
	bh=mi6GzGoaPmVW0Tfyepa3e5bQQh0b2fl7dU5vrXB/uu4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UV3hrlTpx5wYrzr76OmH8bhWm2LuofxoYGiNofP84KgH4bMhPp7lqcUFZMF/4deJSUc0rlmCq0mNpXS1bqD17PO3lbqe7nOa4Rj5CHuLAHegth/ZD9Y6tmiXC1Kv24XdRimYquD/GfCcI806UqVMdTkn/jLrjjBXCJM1Cw4wqbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9oHPI9I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9oHPI9I"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99C6FC2BCC9
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 08:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779266631;
	bh=mi6GzGoaPmVW0Tfyepa3e5bQQh0b2fl7dU5vrXB/uu4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=l9oHPI9I8a8fur865rh1JhsCqdds5MSmO2yng9Z5xDwdot6/4QkjQSFy1hZ87bEql
	 +nKf9L4lE3euMChFDC7ipRplFhyDXoHFOcjSpd1hY9nge/vKR8qa9190hw/lVkpoMY
	 /QfMqcA4hjIPGRt6lFpVrXzd+vIm3Npuj8PVG83lZcLlzwXislyH3fWuiwiZ0S5sKS
	 VohWQtcvqLvPW5pxaVDWfRo1kHVZPh7ykzP+j6l0crpiA5k7VyRqvkhUy6aanOFoJE
	 uDD47JA0zgY6VHKGprwdeDQFEMBRd2Bx5cqr3V9InqNYo1CN8P4bp/FEx7QnBYoRvc
	 Rlm9wnMJCToRw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 81478C3279F; Wed, 20 May 2026 08:43:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221546] Fujitsu u727 notebook lid close does nothing kernel 7.x
 - normal triggered suspend/sleep working
Date: Wed, 20 May 2026 08:43:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221546-215701-BgD2iWaiK7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221546-215701@https.bugzilla.kernel.org/>
References: <bug-221546-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221546

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #4 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
(In reply to Artem S. Tashkinov from comment #3)
> Please bisect https://docs.kernel.org/admin-guide/bug-bisect.html

yeah -- and check dmesg if there is anything that might explain it (you mig=
ht
want to add a full kernel log with a working kernel and a really fresh kern=
el
one here)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
