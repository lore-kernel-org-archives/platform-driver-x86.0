Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4B7191F91
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 20:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750278307; cv=none; b=XjwtJSX1Y0YIyVf7tilT0rzJGu50OgYRlvepHtCave/6gSGe84q/m8JYVCeSGGUyZQXea/+kWusv1tXYmaseV/s+x13MmvV70OyZnnnzBN2Jxvuoos99HiZ1t7ulFAB8yLF2/LKMKGR0X9StGDmRsn/aW4+Gf22FjbnFhmKCBeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750278307; c=relaxed/simple;
	bh=OVymcJ/5S37rQmq0jq7kjv7DxNk6Wqp9l4y1xVZDQEg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aD+jWMQV61j01yM2FtNbydawiyLb41iG4IxVcetIt9vMdQunAsH+BrxFAd33t7zZqzmKV5Qkugjcw5bfy4jhhZ8p7xqPFvXyjl5RUYF5zxhp+iNesdPw0ehTww6d0CB4dWtA3TKl+t4DXATVmoD1sz/KmW15A+S7qvKKWhgL47Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KkkPjPmP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkkPjPmP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D60FBC4CEED
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 20:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750278306;
	bh=OVymcJ/5S37rQmq0jq7kjv7DxNk6Wqp9l4y1xVZDQEg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KkkPjPmPFfc3d8eJ4Yfy7576mEabjj+1dPL7YiVK2EyzO2+Onp78hd9Sa9FZxvyrQ
	 Bzypo002o8G5av6GM8N4FOcZT4lJAfOMitDIwwSAWlZE4tt0+I+5RtqRh8buCwM+b7
	 5tynlDvvicwz1Vy4OFkd4sx89Pd7XOLFQLA7FrSrIfv/+fbP+G/PqyFKpteYgwnquz
	 A0xUTbi1miDwsfamel3h58nVNbhRWVYa78sEBqEV7HPj67AkUq1ShVO57/P/BURNAa
	 s4gH2e2SXmpq225Npbv3UeQD3ctDx/1JGxUvEa7TZs3ajKu+9JM+h9aTvVFRWNbuV0
	 jNUg1o2Ti0tpA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BDD2BC3279F; Wed, 18 Jun 2025 20:25:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220246] Dell Latitude 5400: Mic Mute key stopped to work in
 v6.15
Date: Wed, 18 Jun 2025 20:25:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dimich.dmb@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220246-215701-hQy2Q9ACQI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220246-215701@https.bugzilla.kernel.org/>
References: <bug-220246-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220246

--- Comment #7 from Dmytro Bagrii (dimich.dmb@gmail.com) ---
UPD: i8042 driver is present in both cases, but in 6.15 it is linked
statically, not as a module. Not sure if this could have an impact.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
