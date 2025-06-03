Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB4617C224
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Jun 2025 20:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748983113; cv=none; b=nrR2GrQuW7aG7edBTmL9TzPg49S8VSN6auWIx+lvhtZxhdpAHHV5qc0+nv90ty7RS2AkUlQS/+MfLPtl94+TOaEY2ythYAS0T1KQaTZIqVJ5+CP8vGp8oxcI67GeD9ZQh5y2tM58yxC/1A9Iry3wF4B7AxcLPZZqe3gqAFdjrK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748983113; c=relaxed/simple;
	bh=cJzvrKphFfp8pwD8QjXJebxVkW/9LxC4cWhpJqsRzNY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T3gqqmc3I73Jg9AsycWI3eJi2lw01Tzk26YC45cqF57/mWPkH0yjdhJi/2yGD5mAcOREfmb+lCYQKrXjrSwhj9IqfpeF2qmMSheCbzunAoxZ3DX22WDfJ9ZOIU/QfVWCcAyMWLbyKLjVhfRAeSlH2/NtbbsxV1KymgEqvPdPlhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wduk5PkC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wduk5PkC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0A8EC4CEEE
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Jun 2025 20:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748983112;
	bh=cJzvrKphFfp8pwD8QjXJebxVkW/9LxC4cWhpJqsRzNY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Wduk5PkCS7dkUEJRnXpNneV+6VPwlKpWQesurXuKDAcrs08sUdhH8xFk1bRaT85h+
	 /psZu36I3MWA0tBR4s5cbyzrW5l77+74mZoXB1An3M5s25hKXPJZ6p4dqewC2X4yuk
	 ec4QeNUKe87InGkIEe0entiFFWbQFNoG0WPHu6hMSrWZVN6nrFss4bnrGnGmo6MU66
	 eUj733YSWkXOsB3K24UZtJbqgYhvzkwz2V4iGN1Kc8kpFzSO5qooAZo8gLJs3JLZ3q
	 FGxLFS/R6BV921ANl8ogIlxCaGJWJhOgZnvIBD5QM13R1Mi1G2CWjs4eqbXtowYwYB
	 MJlDNE1n6Ku6w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8B483C3279F; Tue,  3 Jun 2025 20:38:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220116] amd_pmc - Last suspend didn't reach deepest state
Date: Tue, 03 Jun 2025 20:38:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: mario.limonciello@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220116-215701-x8rDWqHpX7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220116-215701@https.bugzilla.kernel.org/>
References: <bug-220116-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220116

--- Comment #8 from Armin Wolf (W_Armin@gmx.de) ---
Yes, i need the output of acpidump to check what kind of WMI interface the =
AMW0
device exposes.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
