Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D15264612
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 10:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787309480; cv=none; b=Yi8XJ2smcbqh4I9dq2md1eDCyvnUNaSOwS6RsH2EdnPhJ+ni/K2u5VglqsLvsShquM8s/3FCVFBFqz6HmqdAc6euQdrRJ6/nZ8X3m55D9WcreI/cL/o+0b2ClqFYTizSix8OlM5lgaNrv5y+8O8ptUc7bq4/G1McHAWBMp+F3kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787309480; c=relaxed/simple;
	bh=rkI/msqNIE90IG/DXP9KIRO6sEkyYeRguYj2kPKnkHA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZlVLkfR4BzvD45j0GixZl6yY+CzUnm1JBmxaVtrVH2y3s9FdOEbgybcoqsoCQ5U+xWFsWxEUVe7erleIV94EXKPwtXeNLTyEScqOW/udNuQUxkqGA3KqqIEzk8PvnnTET0VMDo2L0UW8LcJdesKkzF3uGxNeWx2FXPsp8kI2COI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWLJ/CqT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWLJ/CqT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D51DC2BCF6
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 10:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787309479;
	bh=rkI/msqNIE90IG/DXP9KIRO6sEkyYeRguYj2kPKnkHA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SWLJ/CqTg/qVc+POEbWl5N9yH0jR7ui4Z+AQ7B62pspZwDsEsd8QqF6r6dmc2ZGZV
	 mZGKBZRqQzXK25iIXRUz/dTH21DgorjdTIgFXRxfy66Bdq7+C4BDyF2eqcoRcfQY8p
	 mJvI/MnpWXACDjPnSD5Z60juR69eKSPX6kUzVJO179kvVwNeZAZiUqTD50KZWheXzK
	 Hl1+2GC1qVyAxjuwNJ5m+BxaGDjbnd6ipc4DK4G3IepcwLVsRsf4KcWjdFDIwRmdnp
	 6QirJjl88aIpVF2/4SaQK5MT5UvSfpi01ArX+jC4Dlf9GIzArjO0aNMwJkrkANSVty
	 +Ea+KSf61ZDFQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8DB8AC41614; Fri, 21 Aug 2026 10:51:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220926] HP ENVY 16-h1xxx (Hayden): hp_wmi platform_profile
 fails to read/write
Date: Fri, 21 Aug 2026 10:51:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gibs23@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220926-215701-geqaxG5HK5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220926-215701@https.bugzilla.kernel.org/>
References: <bug-220926-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220926

--- Comment #12 from Gibs (gibs23@proton.me) ---
Created attachment 310703
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310703&action=3Dedit
ec dump with fans at low speed

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
