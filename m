Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328291369B9
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Apr 2024 13:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712669215; cv=none; b=Lh2P+7Mc2VqbTCK23lZhVi2HmzHZY13xIHZzpy0x6yhs+BmrFz6euL6wcXvHiNEsrl+bFSjjWPeHw39q88w7CGnPFmM4YzmRk4Kb743RPTT6EhQ1VIFAv+2tS/BzCEGkgAN/cJCSYGV5Y0YzksZHfxnrmqcjlpxA2QXHknieSug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712669215; c=relaxed/simple;
	bh=hfqQGRKoQt5sZODexZ6NdKtYnuAW/rdleks2SLhsaNY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WUKdavh2wLbJrhqCUBUkYSVOgprYeaTiBD3qzz09NeMWATuf9ySCmOZ77rFwhhMFzI6oEiEewccq8oQiP04fiTGFRxMaC49V2UEV+tFYTFb8ao6YH4ptDitZWRXWh7dfRKSAw6E6Th0ZxEbDuOjitDVEA+rafxFGX+0gxbIqRt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UIyRoLIA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UIyRoLIA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F10EC433F1
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Apr 2024 13:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712669214;
	bh=hfqQGRKoQt5sZODexZ6NdKtYnuAW/rdleks2SLhsaNY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UIyRoLIA+pUs3XSOBNDjq7YyBWGf7fBywvypfOHDmi5caLff313YRwXZ+GRm7OW/+
	 Xra2JFcvoQc6+Li0K9jaYXQ78VWrSO1jdiIvvCg9xLT4nwLcpaIZfN97GkLip3xIVg
	 3dMuEUahn6kAcjzuoM7dLocqrC5wUl59ZynGjXAZFQzsANq8zPKJ+P8NyDa0mSUVVR
	 i+P6teBO7RGoHrVYMBREkhj2QC0ScR7N1WNGMelBa4Kvf0LkUzj6xBty9NDbZ0a5hf
	 aPIsJhFyOr8vYW7S7txo9d0FcbQgMziOd4icA1oXyfdbFSe/YevpzYlYyCb2f6CC/A
	 F0m9A32Gy1oeA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8F1FDC4332E; Tue,  9 Apr 2024 13:26:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218696] DYTC frequency scaling deterioration and event spam
Date: Tue, 09 Apr 2024 13:26:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lmulling@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218696-215701-fyZxshdJjv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218696-215701@https.bugzilla.kernel.org/>
References: <bug-218696-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218696

--- Comment #3 from Lucas M=C3=BClling (lmulling@proton.me) ---
It's a ThinkPad L14 Gen 3 (21C6000UBO)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
