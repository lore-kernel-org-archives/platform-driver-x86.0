Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4871DF751
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Feb 2025 06:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739340918; cv=none; b=tkIsjtUuUXsk/2bpUQL2ycdm2q5b0ztsnV6ddQ6EPzPQ+smmPGhrWdzFZOzf9ZQzgYC55RpHEAI9hTOMJQmm7BWZHj0pA5HM3wTKu2OKXZGhJIi8Z1uHst0enLub38k+A4tBZ3ynsIFkCsPosP0AuFUbRgd/71ShLGuqu0dKsR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739340918; c=relaxed/simple;
	bh=N3Lrg6Xnx2cb5QKIZTbwoiIhM+zvdkNXEpLWG0cjdEI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=geXL5GxhweDT/t5yyJ5UibrjGGzsBt5o++U3g/9l0jDf8wmx0+nEzPx49d/dxtaj9F9M7KrijSlFbv0TyWgVmhBRKEWeqY4OW6HJ6IOqaqjvnf+gzyaFoPAS1KVsdHaYb0G2t6lhyc1XOTJYzOyCk2VIvJ0awxUfuFv7Mi7rl5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H9yYygl1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H9yYygl1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 462B4C4AF09
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Feb 2025 06:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739340917;
	bh=N3Lrg6Xnx2cb5QKIZTbwoiIhM+zvdkNXEpLWG0cjdEI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=H9yYygl18cW6l48vHTBGm2BQmtkdlKZWhnF5XtPViMCmPVxsaVDaIT3Xt82TXVO/g
	 vOYf8mGI8MD/906GxY8uUUto02t0t/pNEiB5XVNM60sqWIMs2Wq1I0YVunE/3lqL8T
	 FDNhzyKgn28zKKnWpmIyQ7nXIiG53nA5LZzWascCaM4v8Ce1hZDDOeWUXbPx6aDNpi
	 g/LD3i5hrCDKKcSV1tViS/9XILqZqcG5q0ZmQ8pp2ohOIrNdNtUu3nY9aAdSmXzxBf
	 91bQK9zDTrImG5rqMOQMNbzPeHxfocrC9y7K0s9arkBE0PxCmSeJ5gnJ+yVkhCkOQ/
	 lzzVUIVM+dm4g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 37E82C41614; Wed, 12 Feb 2025 06:15:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219774] Interrupt Affinity Inquiry
Date: Wed, 12 Feb 2025 06:15:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: 553216989@qq.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219774-215701-Pk1W7oVGTo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219774-215701@https.bugzilla.kernel.org/>
References: <bug-219774-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219774

--- Comment #1 from yuboyang (553216989@qq.com) ---
The effective affinity configuration I would like to inquire about is relat=
ed
to MSI interrupts.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
