Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1D8C129
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 06:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712729127; cv=none; b=e2aRCbM2l1fH2U7Mbj9ykQGSyzCrnJCgAVCota9BI+7etD4Nv4Ha/NwCiX6QPMLhJ7kFfBsJMOW5bR92O8hLwTZZEsFAcKkt3Gd6HqAycwtgr+bSas/OmlAeve5ZOQEEri2jlQGM8AsrehSzQqWjLM0VzSVUd0lNowTDefnGrOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712729127; c=relaxed/simple;
	bh=NoWV6ysmbelsqSuJMJXzU54up+pXm1OW9A3s6wqYWHQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EpSDLBDQ70BU1jmjEj/1RukHqM8BUfFb5IDPfDnpZHfBz1fv5SImK0rNrvc0p8imKCm9WfOzJOlKZ9v/c5agST8VIa7IeVySM0o9J2ZFZMn1iedqnW8/sqX2GvMBsHRjsVkZVlMRKdLvC7KcfVG/MWioYhPnjvrNttMx2mu8SAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uGci8LVx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uGci8LVx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7501FC433F1
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 06:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712729126;
	bh=NoWV6ysmbelsqSuJMJXzU54up+pXm1OW9A3s6wqYWHQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uGci8LVxyuPG1Ay6ZIJRU8HMwwL/Z/Tv9JA5L7samFV0E5FJZkLE3XsQcHbh7Ouu6
	 igg/LFG4zhQYBbjKpGHHGzkl+Bqa2L5E75zt06GEQ6HA9UOkkw1LFuM6iEIFP5zrvw
	 jwM7CUyOAPmpX6RUzM6mgF6dGk8OxiBw93bRwp+IVhg3nS+t7a5u6ehHzXqFcCCZZJ
	 MJNyzOLCrlHik6d+q26ubxlfLTK6Ql2d5tmfRc0Zmii1IgVOJtBSUgRK8U8L0UlMqb
	 EwqYLfAisJsGkxgqP/fbwC9VYGmMxcy+hf4kgIf+pQQYaVhOKu3KsGepCwiTq8yqyh
	 8n37FbSBTvUiA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5F234C4332E; Wed, 10 Apr 2024 06:05:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Wed, 10 Apr 2024 06:05:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: al0uette@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218685-215701-XTar4R0YGL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218685-215701@https.bugzilla.kernel.org/>
References: <bug-218685-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218685

--- Comment #20 from al0uette@outlook.com ---
(with asus-nb-wmi)

[quiet](asus-nb-wmi don't have low-power profile)
spl:35000 fppt:65000 sppt:44000 sppt_apu_only:54000 stt_min:0 stt[APU]:0
stt[HS2]: 0
[balanced]
spl:35000 fppt:65000 sppt:44000 sppt_apu_only:54000 stt_min:0 stt[APU]:0
stt[HS2]: 0
[performance]
spl:35000 fppt:80000 sppt:44000 sppt_apu_only:54000 stt_min:0 stt[APU]:0
stt[HS2]: 0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
