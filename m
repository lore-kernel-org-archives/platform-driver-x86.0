Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38B02EB0F
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 06:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781937264; cv=none; b=qDLAA5bBuphxd8k6Znz6vgDjatMAEyG7iTMD3YUDE4F8eihBNzCoTOtpUGE2w5R6kctrItLUdYh8ryX+ieP0DwaDYl/QcyOoCZlPgs3XXP3krfjWpS55yzhaxMELSmPoQwMKz17tz2W2jOJ2cNRgmKjzNZqdoYsSwXBYa6yoH8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781937264; c=relaxed/simple;
	bh=HW9kNttVQvl58g5MPtLpuhvjuuq1z6+1iSLOUREb6cA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rMvbI4jzA9kzGUU5yC5wLuutNgSDB57/sZI2hQUy5qgV0uU50bXt99jkcw655ON0lVOjSDKZ2K1ghFuN9+TSwvz8UGwVUC/+i7Tx5F7v1A3xFFQvwMD6cu420mRtYe3FoPedanFPKIs4DLBCUKGthDopvJNlSaAYRk13/06m+FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SRJXQg/f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SRJXQg/f"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68F4AC2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 06:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781937264;
	bh=HW9kNttVQvl58g5MPtLpuhvjuuq1z6+1iSLOUREb6cA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SRJXQg/fYO/zuIKV/bbyxC9D6y3A09pKfyVtWxCKutm5CaA4Wc52YcSw1ZwdaauIs
	 R/v6xCKvAKSHg9CSnE7rtJeWhx97nGApDH0Qo5qoQ3SpXHRNeQBvReRwPhGv3vi4M4
	 FKwa84nSEBKrj4x08P9xhBTk4dIXNp5ugPpbbKY/BzGJfcIc/EYwBehZefq0rQhWnl
	 ORQyMJ2Zgl4QCuyTUiAmMTBdjN03qyDsEHSGLRoZ871WWgEq5SMc4MfKAdbDWrkKhh
	 1NbJ2Z2+DIoUc1cMEZvWLLxkiOBkTadVnWwLw05rJhd56ElAayikhbrgfVH53slGIq
	 vioMY4hSVnBsA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 49A93C41612; Sat, 20 Jun 2026 06:34:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Sat, 20 Jun 2026 06:34:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-a3HQYuD6ye@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #23 from Milan Oravec (moravec@ukf.sk) ---
:) Thank you! Patch applied against 7.1.1 an compiling now...

migo@migo-HP:~/build/linux-stable/linux$ patch -p1 < ../hp-wmi.patch=20
patching file drivers/platform/x86/hp/hp-wmi.c
Hunk #1 succeeded at 1650 (offset -12 lines).
Hunk #2 succeeded at 1670 (offset -12 lines).
Hunk #3 succeeded at 1700 (offset -12 lines).
Hunk #4 succeeded at 2014 (offset -12 lines).
Hunk #5 succeeded at 2275 (offset -12 lines).

Will report back.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
