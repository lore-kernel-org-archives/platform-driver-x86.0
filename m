Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EB728137C
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Jul 2025 11:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753270180; cv=none; b=MBancHV7jSoOjszLYUolNeVxYutsigMMqPnRInt27OQkIJxD53VCbEmGg37LOgrhXzBbapsN604ZPa69HaCxqquDU5qfr15MBfZ8b2gWNM7Bp4PeRaeh5fi7A/S8CpzcMLbsdd3OeuHMZiz2nj++H4Z3zyPVAxfacEbbBXG7AZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753270180; c=relaxed/simple;
	bh=gMcl1YmSfHYu/Vj5kEstSogTU8PTU/5pijn4l11B6RE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TTgKLsO26jcjEZCerjxWGH0/L8apSpHuC19WdbQLRU5ybIXqDQoeSRuvDXfNKOprRteAkCqDQZAsGOd9kM/e+6aCaR9G8ebAUi2/UxF7e5g0k7UwHHlLdfMhWNZcgn0KXxPWgK8qVN5ToZfwfX24OqAO31l9rAZSwug1VeAtguw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a0bl1T0N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a0bl1T0N"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4C4FC4CEF8
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Jul 2025 11:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753270179;
	bh=gMcl1YmSfHYu/Vj5kEstSogTU8PTU/5pijn4l11B6RE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=a0bl1T0N/+tEehq9B4V56D/xr3fBRHsNByCOHhmlYG5hsL+FSHFMwTT76qlha5F/W
	 /lj9SGJc4X9D1n4VZxeBXwspZ7rdJpG4bEvIYqRbNiE8xm444QjQVbQD6HLBwknGIW
	 WiDUR2JHpV6PcSQi9w3+dMkyHYKvcWom5s3xOU4a4LUkgeKXZ2DGW2IdE+tbLQ6joM
	 ckc9SMGIQvw6humJIjm0e1Pp6DjbgdMFkA95GmycRXzjqgsG7/o413Bvf2N9d1IS6p
	 aIREqXLGeHvcz7r5CRCVIPbGT27ovRjO/uhe8Hxgv4g933t7D6vSCz7vuQZBohRGXB
	 AvLvgKcSV93Gw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C9212C53BC9; Wed, 23 Jul 2025 11:29:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Wed, 23 Jul 2025 11:29:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: kernel.org@axomail.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-ocCOAOvc6m@https.bugzilla.kernel.org/>
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

--- Comment #98 from Henri (kernel.org@axomail.de) ---
Thanks for pointing that out! I missed that.
If I still experience the problem, I will report back.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
