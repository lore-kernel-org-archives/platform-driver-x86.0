Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2E7136349
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Dec 2025 22:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766184923; cv=none; b=Lt8Xpf5pqGQYPbqUClvuX2w+OWxXghaohLvqOR9XWWDMXXZzJ+ZvpgkovvboYbwmgqtFQBVonHN0ssQF7CFSUZHkuZ8DuzlvSYrGDWQBhcyBzGl4Bo/GJ/ycyW5+uyLVxbi/KMGDy5nGsssv/9bdmegXIFGulrxRqNvDmsOgQ/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766184923; c=relaxed/simple;
	bh=5DJB9Zh+9iPq3NEJ7kCRcIKBPCB80eQYvOQPSu4hrx4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BAZHxe1vBSyt/1DLKL9WffKpK+Sys0SsF6GvvgXQ7T0xv0fn0yRG3DnVjSSMVW5iYRmRpSYA6cJBFTDpSP1ObrpepjK4lJv2O8ygG3oldDTYwSUPij/jfMuScPeymj9ML/bDCYnGgBss9eoHpcsPI/FWTf28saMwq6x5fw7ilmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dy+npv3H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dy+npv3H"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E59FDC4CEF1
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Dec 2025 22:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766184922;
	bh=5DJB9Zh+9iPq3NEJ7kCRcIKBPCB80eQYvOQPSu4hrx4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dy+npv3HjTs9lqLdF+MV3Z2r7nNYkU9D4UJJGzOcBgin/p3a3Cov+0eqlzIDR5ee3
	 d9PYBpBA43CGxOnDsuutF7yYrB2o7zxg9umpEf49fzfERNSVdaw01wTAaN9ZQNih/u
	 QYTNnftdMaUX4thoskG6A/PXxwt6xVPIKCBzvRRjTXq+3m+I7k1gtFG6Q6FdGru02B
	 180TvmhdJnMJEj1UIOGxOAn/nZM6xMgqkurSIWAKnrqWvaEdhBbsXskaVwntcyH6Dh
	 Q/hzRcpM9Y1MCBaQaKleSyqxqWCLJKxlkJT9BHxlUv4r5AepQDL+S4Zh0kk0wdFGv7
	 qkkPOfCfuY7xg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D7C16C4160E; Fri, 19 Dec 2025 22:55:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219904] pc speaker not working (just pop's/click's) on intel
 chipsets gen 6, 7 and probably more
Date: Fri, 19 Dec 2025 22:55:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: keyofblues@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219904-215701-qEU7yW8mCe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219904-215701@https.bugzilla.kernel.org/>
References: <bug-219904-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219904

--- Comment #19 from KeyofBlueS (keyofblues@gmail.com) ---
ASUS has recently released new official BIOS versions:

- ROG STRIX Z790-F GAMING WIFI - BIOS 3107 (2025/12/15)
- ROG STRIX B660-F GAMING WIFI - BIOS 3811 (2025/11/21)

Unfortunately, after installing these updates on both motherboards, I can
confirm that the beeper issue is still present and behaves exactly as befor=
e.
The fix works correctly only with the test BIOS versions that ASUS previous=
ly
provided to me through technical support.

I've already informed my ASUS contact and asked them to pass this informati=
on
to the technical team, in case the fix has not yet been fully merged into t=
he
official BIOS releases.

I'll keep the community updated as soon as there are any further developmen=
ts.
Thanks to everyone for the continued feedback and collaboration.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
