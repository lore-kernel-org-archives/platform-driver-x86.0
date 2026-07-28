Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0224F3B8D70
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 07:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223867; cv=none; b=lGsKjp8/rxNeS1/89xfBP2HLswEtvzEt+jrRsQiiwUX4YX8t7LyUYXxLpdIfDMrXgcNiwRp8mpGscTqCZRyg0oDeja/2jDAxSwBPWflYVNHBDIYTL+6Y4GydepdKxExxZjejOpXgYQdRC9hD3FFBMFRSBZUZS0L4Yiy9UW3EWbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223867; c=relaxed/simple;
	bh=GZKljIdPXUK+/co8+pMXjctKWBeL/JpKfWPpzpr3RrA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ux8jdF2NgceMuryxZN7URhw9lo3k/aMfYYXnFqC4IOIMNjKT6C4aHZZPzSccLDY4ucA/HbSb2Pl7RWMuTq+3mNZyzECyqrTtRgPs+ax/yM0Z6BLrUuO6m4dxMVdlckzUpc6PpFTQ0ebAj9YhIk4ksYjDp1mSCxdavuD0PSzGESE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bPYEw8R6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bPYEw8R6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9407AC2BCFA
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 07:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785223866;
	bh=GZKljIdPXUK+/co8+pMXjctKWBeL/JpKfWPpzpr3RrA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bPYEw8R68XsAh0pxvdjRByLLECu2ASgXNQpZzPSknO6cIzIDsoyy2E0RiyzuOV0tV
	 dFFdmEw7mg9xdmujpkLOYiKJlt6MdbRg3g2Ji42ZpP4qrFT1xE4GORuFTtfRM3YDLW
	 PYEQS12/2IdxjrZan8gj2hUG6SoPZ/Ay1Z9Z0N1iRkY4A54ELxeo6IAA0qARPA8hUJ
	 d7jZOPZjxTzp20AMZQTKGfsye2KVprTls1Zwp5Kb13AiVeZKmgnFZxSRmihy5se7qj
	 V4tFLLAfK8pabSFVaMG1pmQ895UMlUawfawoPaHcxwgKDsUW4XB4MmZSAVfi7Mb/QE
	 EWxAcJnCwbyZw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6D528C4160E; Tue, 28 Jul 2026 07:31:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221800] HP ProBook 445 G9: keyboard backlight hotkey no longer
 works after upgrade to Linux 7.1.4
Date: Tue, 28 Jul 2026 07:31:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221800-215701-nJ1rc0YfxU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221800-215701@https.bugzilla.kernel.org/>
References: <bug-221800-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221800

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #1 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
Thx for the report. Be aware that this report might reach the right people
here, but it might not, as the root of the problem is vague (could be input,
platform, or graphics drivers -- and even something else). To find the root=
 of
the problem three things would be good:

* please attach dmesg from 7.1.3 and 7.1.4 directly (not in an archive, thi=
s is
to much or a hassle for some and bears risks, too)
* Does the same problem happen with 7.2-rc5
* Would be great if you could git bisect to find the change that broke thin=
gs:
https://docs.kernel.org/admin-guide/bug-bisect.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
