Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4632D8378
	for <platform-driver-x86@vger.kernel.org>; Sun,  7 Jun 2026 10:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780829353; cv=none; b=JKE2vP3z2GuwGYYOuiARqt4DauM8KvT7cctNOFIdGy1M+0sKrEHdsPCEm48I/ofZFn+kkkNWPB5HlZzxJc6FsyftPe+zyffTcFkFgCdNws7iZ+Tsh7OL9r4+SF9PHagnXNyCYm9qAgSJe6by8Ms/HixbkGNetGVoBjERKGyN+WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780829353; c=relaxed/simple;
	bh=GdtW9XuuNg8ZFt4Qse4x7GLrHpHsLQivyZdeSl1Jpb8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kw9SexPtSsLDE8PeRpQy9EGMoxzHGNAj8K0hNSM5gznwUkXfDEKZ86BNqMJOoL6B9YXzmihquAMeaJ7gT8qao4aNtu/WapUf8cvjdiv8D6vYAzsVRCWtpzR/F3gNMYDq9iByHQl4V1GNDXh34oXoZXl6LHt0OSZuPpZHcZF7aOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AR+V3E+T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AR+V3E+T"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EF6D0C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Sun,  7 Jun 2026 10:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780829353;
	bh=GdtW9XuuNg8ZFt4Qse4x7GLrHpHsLQivyZdeSl1Jpb8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AR+V3E+TBtyUHJjVTIk2gUJvZBqYqPHQnIGyfFwo4FNjS1aRCxMOViNG9y8OaJOi5
	 NMaRx/Qywll+iwNSiCg/tbonYXUOyT7Zts2aIOOiEFnmeL/8B0Lg9Df2W7kCUG2lzN
	 QgtIXuKf5xgExYjrkBhDnZJ8k1159BADqHJ7W/n+ttscmzVtyg6NRRQINBgljieXrQ
	 LRZEQkG/8Fa2TTvKzT7kL7RUXQiHNQNqUycXp4rsN89dwrY01t7vRhcFP9Y1jnljah
	 LmD1BJbGzbKAzumJZXCkzbzUpZP+5gTO+T464CwLcViqFsNQPIlRFGfVymR8D9ljKL
	 JfQLTM5rTmcTQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D0F3EC3279F; Sun,  7 Jun 2026 10:49:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Sun, 07 Jun 2026 10:49:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221583-215701-ShkI4Lha6r@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221583-215701@https.bugzilla.kernel.org/>
References: <bug-221583-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221583

--- Comment #39 from Rong Zhang (i@rong.moe) ---
Hi George,

That's expected. As I've said, "this DSDT patch should allow you to switch
between Off and Low using software", and "software *will not prevent* you f=
rom
switching to High anyway, but the hardware brightness will be Low."

The LED core of Linux does not allow different set and get capabilities. To
have a fully functional OSD, we must provide all three states with the side
effect of ineffective High when using software control. I believe it's the =
best
result we can achieve. Just ignore the High button :)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
