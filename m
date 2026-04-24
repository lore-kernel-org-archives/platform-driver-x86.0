Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303AF347C7
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2026 21:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777065319; cv=none; b=kn9knMKnvbZL9BU4306u7txcwvrE0F4ojr3wTE4LuTxVFqdwi0rt0uVmoq3N8BxGBneGahOs0NVqh7b1MKEvHJxnX/4a+5sA0CTVQwz3c88KgAaMIUDrqKR4YSEbS1JhJdqDkjXZ1MOOqiedCOTj6fLyy433qsOvRmNGAnsCv7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777065319; c=relaxed/simple;
	bh=8AG+Xtv9eJB86hbd29Tr4NBtGli2f14KAgOKu6AcPB4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RD4rZ9cCYsjoAvYyj6VtMozh4Dm869hMnbi9mQIt0JFVa29R9zzyyzW8jLo+lH4d+mhbwnxCKENxapKj8m3Z0+TlLPehaTnCPFJ9uGWFmhSp/8PH7YMHrh/Vpyh2emDFPMaRhQXwvrH6j3er8sbDOTBDLOxPg1UWMTgptCSOKc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACOa+n2O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACOa+n2O"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC707C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2026 21:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777065318;
	bh=8AG+Xtv9eJB86hbd29Tr4NBtGli2f14KAgOKu6AcPB4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ACOa+n2OPq1hGg2/CBV4nxOsBafQCd0Slb23rTRx/L8pyXK+00oTUmIXJXTqP7ouF
	 283ICjJQS4DJUV0iuKzZb5/LiX6bPGIEDJ1J1vf4af23MctpH+/So0QrtDS+ckB+sM
	 +gjlv5t9sRXAmphv6yeSd/hQ433yXd4tXvemaklnOCRBKzo48vgUb7Uw/z00LojrK7
	 p0dmdu7MHgZdnc/vfOvqUSReGiD2ekHIT6AnRI06417m3BQt6dSFgXUGfXK+1x7//t
	 VYSZrgkLy9Tx2nS8a5NDZaQnBwKxzfX3k+LtGN6PrSAUxGdtuHAyHbKLEgtgnXf5IB
	 5x2Qjojn+B25A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B6698C3279F; Fri, 24 Apr 2026 21:15:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Fri, 24 Apr 2026 21:15:18 +0000
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
Message-ID: <bug-221383-215701-MHj92IKn5H@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

--- Comment #29 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Woah! Well play with it and compare EC and PS2 traffic in both cases. Sounds
like we have a race condition after all.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
