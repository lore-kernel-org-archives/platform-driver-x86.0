Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6899F1A5BAE
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 11:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786879310; cv=none; b=i1BDBZnc/0+5Sm5jcuVPCR75Lv6/IK29MC3Sh7LLCKtFJW4ZsuHpIrc5iglRqJdD2wk8Eub39HCVRMYYbtleDLrX//BonqOZfIKDnQe45oxNNSP8gEHC7UjlLUQ4GbxnFhvsqF31B8zSTQz7uE4sf28ois9RJSckmukR9P2iccY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786879310; c=relaxed/simple;
	bh=M3lEVuwkubErYzt13XMpIaDWLE2O6SzIoPt60zRgLO0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O56WaJXxy4heVPB+Wzg/1cat9w37XpCUytPfAcnKNikVxswgGsC25o+wp6Q+93zmq05g2+cF/QndyM8ccwNjVdrMhCG8nPnIFEYXUV80nUsktJDIkAF3/1wyr+jS+0Tv85wqPEjQjbspmXRrYbdinH/Q4I1zLOJ/Yb15Om0iqzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lkavYn1f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lkavYn1f"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E87C8C2BCF6
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 11:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786879309;
	bh=M3lEVuwkubErYzt13XMpIaDWLE2O6SzIoPt60zRgLO0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lkavYn1f2zQb3FZH3NXmktpH0Re0BBw1VwS1dE9ei/Kn/IQlgv0nZ1xoQM5e3Ov90
	 7f8Ch6R1omlBcdwRBQfbMNGgkKQS5mDBqXO+v8giZNP6Ukjnd5TAqAV7f8vA/QOYID
	 YS8xpWRQrQdGXls21I5IxwJfOa5pIgm6WeVWPHvDi3anXTUsFwnMIBNlAe7Vrz8Mvn
	 WHr8YkqV9ABphBG9HBQ87mWFNJmCByzFydbsozxgxoUyGZ5H5+4GEtsWBbcf+StjFX
	 g9jBTFPj1gu7pfDdu+ckeVUp15EqrXjpYA3WYEKjkhgXqfGe8QxuPDD2KGVBDFJ5gF
	 5d+CXg0w2OzAw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CDEC4C3279F; Sun, 16 Aug 2026 11:21:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220926] HP ENVY 16-h1xxx (Hayden): hp_wmi platform_profile
 fails to read/write
Date: Sun, 16 Aug 2026 11:21:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gibs23@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220926-215701-CYtVDYBWGk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220926-215701@https.bugzilla.kernel.org/>
References: <bug-220926-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220926

Gibs (gibs23@proton.me) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |gibs23@proton.me

--- Comment #1 from Gibs (gibs23@proton.me) ---
I have the same problem on same platform on kernel 7.1.8.
Changing profiles does change fan behavior, but RPM reads 0 with hp-wmi.

Package power also seems to max at 40W no matter the profile. On Windows I =
have
peaks of 115W and then drops at 55W after a short while.

I also tried mapping my board ID to Omen or Victus configs but doesn't work,
the ENVY seems to be different.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
