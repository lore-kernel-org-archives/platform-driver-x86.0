Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F060D11187
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 May 2025 11:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746098789; cv=none; b=mK4PON2SU2z6WzffByqPL4G1V1juFY6+sgN2MJzzeysj8fnUTpQ95rPH2CCtTiph/tfjCO0A9BV/RLOeuFWMgh0aBCpgJiy0Ayf7pPpp84bXCuGSYmymxRHYy1o/ZVjrn6NxIBGRxf/kOCjf4HZRnU6vcOxSEHs3fGkUYzdjUvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746098789; c=relaxed/simple;
	bh=aeiMyU+wNWec2l05WK3PC4X44GnebXXbExI1ypvrumQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l5lj61HeBObhEQLfyzQ1jjdWwcbi995Yz+5JVo+J7aQmiYZzDjchN+jgPaotPwbiwKFrUiYbffeLCcLjIXfS0Pty5V0QNPMpv7K3r6u2S7OnMZugAXT8DIjnsNGT+infIQYvZx6YFYD7zQZT7AHWHl1C0Wtf1vT+1EOyZ9ynprY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qkmcq8Ik; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qkmcq8Ik"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55B6EC4CEE4
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 May 2025 11:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746098788;
	bh=aeiMyU+wNWec2l05WK3PC4X44GnebXXbExI1ypvrumQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Qkmcq8IkQqe1Us6k96Mur8Trwwkbyo6kFKPM+sRsjhz2ko4RfeV9b7E3mfrGw0MK5
	 GTNRZyhtp/uBgtG8W2x8SH1EmxRdt00wZf48QlHBAnWgl2wtgOocPoymsoXiQKj0wn
	 41bg50bEAF4VLQFSqPefg+s8YC6VahsOnskc2wHGt+2En6oXSz0mE4BniyvBySgGP3
	 Cyekb3728XNTi6c6j5ijWEYIQEJeMl6T6Mm9BVcaHHUFlq9FjOr133M9OLVWGg77OB
	 GpQnfPKoEfgrsETIUTRIH8HGcnbYymcFp+AdY0PteWz2L1/Fj6juCKIO95rSenH/bb
	 +8RQObu2yZTbQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4739EC3279F; Thu,  1 May 2025 11:26:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219786] asus-wmi: WLAN is permanently soft-blocked on S5406SA,
 but can still connect to networks
Date: Thu, 01 May 2025 11:26:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219786-215701-BbcScpQQSW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219786-215701@https.bugzilla.kernel.org/>
References: <bug-219786-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219786

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g

--- Comment #8 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
bugreporter23 thank you for your work on debugging this.

I think that I know what the problem is, let me write and attach a patch wh=
ich
should fix this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
