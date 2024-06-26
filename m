Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9735E1836F5
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jun 2024 14:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719410859; cv=none; b=hGb9mcKqKo0kSQ9Hn3wt/EsVZ5MLmZWYfhQgCpTt1VmOgLzeO80L3waOM7n6OMpq7UDOlZapEuJvWtXm1hTJj4oCW2qHj8Uxb9PFpnr4R1Y2e9wbxZV5fIUjtq2lMYiW8SPcjPbDOslHC5/R9DJ/a4dxHupaygCscyYivUoApBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719410859; c=relaxed/simple;
	bh=kqOofbQgnnL1ySOdbbXIYqpZNCs0vu7Yr1N+twig9E4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eCKAttBy5qvBjFQwGvJF5J44hsZoEHzGeBJDE1k7Zl4tUJweM9OzMievDpb1D5NEGid1bdoqnOeqb25wInX+4SDap0+DWM3ZNaBr8NQlM7LjjyWVXufLNWiIRpCqeyN8VWW/a/GUzOaHwj0B1is01/1/yYpQVqKL7dCNqqskHR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qGNhV1mg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qGNhV1mg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1131BC116B1
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jun 2024 14:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719410859;
	bh=kqOofbQgnnL1ySOdbbXIYqpZNCs0vu7Yr1N+twig9E4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qGNhV1mgtxt9XCPlDiV4YligDwtZUFkOuP1ZtSeWqUDofzbgr2TPJvwUQNAiAE++C
	 JKSeWXl91urQ2BVZHk/oXuATDT9cZEcdfrdO0KlRGKl7jzoT6g4De9uQrblIy92q1B
	 q1bUAbmFvwYscIfvz/0X5BSEznw9Q2dbTRwqhglNsbKLnV+MNy1T6FqcVBeZOUf1Qz
	 gjX1uXZss/CjZa1MACTpM3Ij3+0JYZDiwTEtrnV01WUcx5qNYiAj+v/kGd7+0jgmkU
	 4N2qC2Ojy+cm7X55+5dwkKe7u3n1mRWiiMWyFGoATSFGzq+URCtj9mrDDeuz43lsnt
	 kqv0BionATpdA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E6363C53B73; Wed, 26 Jun 2024 14:07:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218771] Lenovo Thinkbook - turning off after closing lid or
 (dis)connecting charger
Date: Wed, 26 Jun 2024 14:07:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218771-215701-SYN0Q7oGO5@https.bugzilla.kernel.org/>
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

--- Comment #8 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Conversely; I do want to point out upstream kernel bug trackers are for
upstream kernels.

Distros sometimes pick up patches that cause problems and so they're "usual=
ly"
the best first triage. If they confirm it's not their patch they will gener=
ally
suggest an upstream kernel and reporting it upstream.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
