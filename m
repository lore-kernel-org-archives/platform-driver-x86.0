Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58B01DB34C
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 May 2025 17:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748366881; cv=none; b=lOZ3vN1mHom9Am2Of6Tz/xNdWTBqvhSNR1cRqdzIbUUk7r/ohu98fvs2kkMFaXgyaT2IwC/qBYN0lW5zj/Mt4KMNibtZHiuMuAX+p7z8idy8rvmrnDssldkZWN1GkhfakXF+ykeOBgRF8cBGu/IyXUvDjQg1uZ4tXmUVho8AmK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748366881; c=relaxed/simple;
	bh=kWmFUAJ0MSmOexDKwyEyzGHbiEFt2rmB0/UtoEe6l3I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VgeqIIXqoEstAo75tZSjIww3WrRZaibRhIOHTHRwvhj7E3mFt5etSUZu2BzCdVipbMtvPKHNTCebPPSyKN2xZvGK6xlUayDh5KwD+Ej6uALtxlXwFugPxQAwl3vt3+VJzB8Q0QHwJi8DnfosqXvy7rXLcKLYSXtQCiK03DaMIu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oeEvzPui; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oeEvzPui"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E3B6C4CEEB
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 May 2025 17:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748366881;
	bh=kWmFUAJ0MSmOexDKwyEyzGHbiEFt2rmB0/UtoEe6l3I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oeEvzPui6XH52fJ2UKMEeaflFbbn0Fv2URJXJvj2l7n49mGc/fwZrZnzkOT7n/Dnf
	 4xx5Z85O1ze4LSM+ik9J6iBdj8sn9/mlntrl2j+20A6vXSLjnwnpRo/hQP27rpZ4iD
	 rMv2janZ058bb7SiKjKwiwKHJPoG9j2twtItK8LKnxHhNXJ92xk3EPzPFq5bvf8Oca
	 OxK8VVVwyuSe5tvNet5FpWqI9bs35hczkIltvnZh35oaU1WmKRs0+kJvzgowkGjZ+n
	 swjeazwRa+VO/5DUKWwzK633+Ad/8fGu6abVliXrlBkQf0+DXIXSNhLyGJgUYwFSbG
	 YikT57D5wOM+g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2D228C3279F; Tue, 27 May 2025 17:28:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218771] Lenovo Thinkbook - turning off after closing lid or
 (dis)connecting charger
Date: Tue, 27 May 2025 17:28:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218771-215701-FpJL6N3Mzq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218771-215701@https.bugzilla.kernel.org/>
References: <bug-218771-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218771

--- Comment #12 from Rong Zhang (i@rong.moe) ---
(In reply to PMR from comment #11)
> THX :))
>=20
> I am not sure: I could not find it in a change log - is this patch an
> experimental one or will it be included into the main kernel line?

It is awaiting review from maintainers and hasn't been merged. Testing it o=
ut
and sending a Tested-by helps the review process.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
