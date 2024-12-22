Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512BC646
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Dec 2024 07:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734851973; cv=none; b=rk2FbajccgivEL67+8EbsCkjHhalqPitBgFDQTvufrxPxO+c4YlRwXUOaVEs7cmTCn2UL+QdLfKc4wX1DR+eKyPqTALdMWACmQKB88v5RAP+mSngRCnS3g23Af9dNv/7+hQ3VEe6H/TlqglGNIAOHRjeiaml/x4AfBkFEkZNgyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734851973; c=relaxed/simple;
	bh=z0l14kKfeKDyDh+p1twNjXV221+2PLsSFYfbaFns3h8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=es4g5ib6RCWFX73Srd25Zjs5HCRWMnL1ytU1R49mudrnKFwS4oc81q3fUwJS2usmHZPHDmqTKPhIBdXVW7WQofelww54i4zVzIRxcMbFuukfUYQVbTU35CJasHPsROmuGgLyjIYNXIRBhpS0K81zot9rIks2r5W9OUPpseDJKOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XsFlDNkz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XsFlDNkz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 061C0C4CEDE
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Dec 2024 07:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734851973;
	bh=z0l14kKfeKDyDh+p1twNjXV221+2PLsSFYfbaFns3h8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XsFlDNkzGWNDJldr9feyzF0uHM4nZL5/43PF9298Y/T2IWcXRZ/0JJGkvYNIJ9vNW
	 vt/JrOVZ09iRo9oLX0kVlRzSGL5NedMxF6+JY07rRyxDEY22CVsDE4ZeZ3ttlxCMV3
	 kiEZU26WR5wckyUHgWv+ZYwYi7kcWlXQ+F0Goy6A5SfUhkTXNPLs53Xlxq68il+iAd
	 2RaRDT/y5CUIECKeHFnRBARKe+G9unZ2Q2rR6ZWUFsObYxt/q830f5WtbPpTsA8jHQ
	 uZ8d9jknQxc1I++3WQiK3kSz1OQlvyxgcqyw51Lj0KRQKb8NqdqR4Jskyooc3E8dyc
	 DoCHx6jw4gDpQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F0F9BC41616; Sun, 22 Dec 2024 07:19:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Sun, 22 Dec 2024 07:19:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-c5vgZlO7Vq@https.bugzilla.kernel.org/>
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

--- Comment #78 from Artem S. Tashkinov (aros@gmx.com) ---
So, it's not just HP.

Mario, how come two unrelated vendors have the same EC bug? ;-)

Maybe AMD released something buggy to its partners in the first place? ;-)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
