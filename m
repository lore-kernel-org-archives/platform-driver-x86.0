Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEBF13D503
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jul 2024 21:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721770784; cv=none; b=PHe4+cGDbftgUiBZdY2lkTCTCblFCOIOYi2QLw2uAQs39HiRq8iz66U+xb6IEf4Y+PCp5SSmVUhxu9h1n2hPb+E5YFo2SD70syg0ohe8yvJ7r6mj2y3flbE2azb/WdbNIsCr+PNyaMrILjSTZ26fznzp9lIMpN9SSyz9j46KKtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721770784; c=relaxed/simple;
	bh=5AjI4J8AUYm1Ov4IplmagFjtEaELHQl6ZZBcRnXVQbY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bAq3OnNL0Dk6Ea3xByAkJZIpisGj3hdOCK1SX50wZFUFF0gxBzG4caj88XpkGGuWGVoZVNnLXr251ZoT1KAwTZqomBkXefpHuuz4737AmrjQdEGi2bYltdRw9s3TzvonrOpDX7LViwV12Z71fSnDgTYbL07PiL0N9shkuHURFJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JUyKLkOx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JUyKLkOx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60F25C4AF0A
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jul 2024 21:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721770784;
	bh=5AjI4J8AUYm1Ov4IplmagFjtEaELHQl6ZZBcRnXVQbY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JUyKLkOxKrdgF6kNP6LWtWrTDLOeFtavWEGoibVJbfPWoW//wQbXBJ+XMKQ2+u27n
	 LXPFbF0cT7BH/3xdgfJ8sBLDdoMNZKe2m2UO4mhxwEef8gfZF9bMAN7dJ+uGVkxYHn
	 TE04+ee7c5gRZFPhHJbwl6Hm5BAiCunSepW9pueCbHnFgL/gSzu1YsYA8kf2gNMZZG
	 HFBAJtTSKDfHuGnsWx00hK8qs87U6eIR1qH0y5f8TUoWiAgecPH/SLddfx3z20F1dz
	 bys/GqXRr1BJBO0muWO5mVAyWj5m2bLSX5fEOsHFR3OPY92jRnMiKEaTvCxSfBYQiC
	 5YU26jZIPpNjA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 491E7C433E5; Tue, 23 Jul 2024 21:39:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Tue, 23 Jul 2024 21:39:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-0ZljRckQZi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #49 from Armin Wolf (W_Armin@gmx.de) ---
Alright, the necessary patches are already included in kernel 6.10 and will
also be backported to kernel 6.9, 6.6 and 6.1 thanks to the stable team.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
