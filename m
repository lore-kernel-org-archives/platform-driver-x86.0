Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61D015920A
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 11:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712748126; cv=none; b=OoB+BABwf+tlsrjdEPqnmPCDUUbpUQkNJalYUBBTNmv4CD2VyXLHfzitZN0rrAA5LBUGM3fpKRZeIXTSM4pFrnygG/bC3svuBAVPtX9NE8KaVOTFAVxMAicA3OHxwQygK1UnyNFiGpj6+gG+v2DYWgcTFZEezPMIP48c0aVpRfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712748126; c=relaxed/simple;
	bh=h47PH4tzXmzNkCuDsxEfSvwr+IGkhEN6RZnGqSw6PH4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bynsa0hAzjpN/EV25oQgpv8L1nC5X2othvASYNDQR4xdtXxUVICg7sqv2Dcw6j2VIk9DW+xW7lvk/72AwLd6DpQaXIBoquhXbMVb3NVczGsTe9E2wMmeST+SG1OoO1UPO69k/RX/CT2j0H84VTX4ICuboGNa0eIWu0Yy4XepH6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mhNEz2+N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mhNEz2+N"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61EE3C43390
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 11:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712748126;
	bh=h47PH4tzXmzNkCuDsxEfSvwr+IGkhEN6RZnGqSw6PH4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mhNEz2+NV1AhgGb1whCiXuV65xS+sFfk66fdCd5mVy9XjTb6bW63LWtzbchZfpGHl
	 nVUuG0BzSVG+ERUbWfBQrT0j9XJE8uT2hA8iqs0Iw/dWPgS8bkmhbTXD+W4LvaILSo
	 uh7wkAywxuViRQzDu28O+0tSEb2RGq/kczYbDWBbjjVk/45ohUkHeaegnto24S+CkS
	 Dn5jpfPlR+G9+xGndoWSKAF3O0YOWUhhJM3C0XNX4cGtjbp4TBbEg3by8T6uYsSD/d
	 noOB1HFMLvpJsNRL1SyKOsukqcyK36cm/FOb7ulgp+r80Hc47dBz4P2TxK4mrdNabZ
	 RtJJdALg0oaLQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 489D5C4332E; Wed, 10 Apr 2024 11:22:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Wed, 10 Apr 2024 11:22:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218685-215701-wWWp14hNNq@https.bugzilla.kernel.org/>
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

--- Comment #23 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
It looks like the BIOS has a bug that it's advertisement of that bit even
though it doesn't work.
I guess in Windows this is a no-op.

Hans - there's a few ways to handle this I can think of.
1. Quirk against this system and BIOS to ignore that bit in AMD PMF.
2. Allow multiple drivers to register for platform profile.
3. Do nothing, let Asus fix in BIOS.

What do you want to do?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
