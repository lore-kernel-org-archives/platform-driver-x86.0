Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AA026E711
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Sep 2025 20:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757362185; cv=none; b=KnYcul1FAwXcLchn30RQh3J2E+/mQgTLLQe49ab7Eele2cHWkwoTqz6Bf//R/bNZb3sdxKcPYwwP5bxWZg/ucc/2NrQ90XN4QhYXwwBduegnbNEnPAk5LKtOPOko27YXv1xnwTWTmX8v4BozPo0aJhUod1RZP/eR0knlzempGRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757362185; c=relaxed/simple;
	bh=IAjRxlAqJGriYR/rru//k2C5NQbNW2uQSxlmY+lI86Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Gig1Pe4gpKYsNYrohH0/wiaYcpUdkZrT7DogHAYWosIXW5ygZTgSI/FsC07UuEMvwBwTXAAitn6eS6Hvhsi4kCGg0k2Z9l0ElHW3c4hEFvvYT9TIHmLZK8w0qx/xjxDX05I3rTaiehTGde6QdwxD9Wgr6wI2CtNaYmnhKUUShpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLpgiJVf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLpgiJVf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1410DC4CEF9
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Sep 2025 20:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757362185;
	bh=IAjRxlAqJGriYR/rru//k2C5NQbNW2uQSxlmY+lI86Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OLpgiJVfaQIHvCc4wzTEfSCA/VD1Fvpb8pCUUJw0FvbaGR4lZRql3NRldZxudSQc4
	 ZhPX/Mn7KmfCufhVw+1cgqA9ILEHmgA9BPouwiezMLl5GjURuKTErXlfJkUlByRcTR
	 CX/mO2vn1iKRFJ396GYpbKO4MtZDqrikaf+NVEmWcdkOuygZaMB+26l72NBn6SooKG
	 23fzpPHZ6FwuBfOBwZC6EU2e0NUhEIIsEJpLrI3KuEoe+7dra5JNji3KbOpEbFing6
	 YwPh5ctYuJVfORV/KOxB5jxgbisL0N1oUF0z3esQ2Y2BmFX2rBRzYn1sUZ6kCMWPUR
	 tDisnOkK/rWlA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 06FBEC41612; Mon,  8 Sep 2025 20:09:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 08 Sep 2025 20:09:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-6N19SSQIgE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #101 from Mario Limonciello (AMD) (mario.limonciello@amd.com) -=
--
Those of you that can still reproduce this, does reverting
https://github.com/torvalds/linux/commit/4dbd11796f3a8eb95647507befc4199545=
8a4023
change anything?  That commit is correct so we wouldn't revert it in mainli=
ne,
but it might give a hint that there are multiple timing problems.

Please give it a solid shake out (at least 10 cycles that you unplug power
adapter during suspend) before reporting back.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
