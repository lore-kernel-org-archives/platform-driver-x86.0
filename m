Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B489B17BB10
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 17:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712768916; cv=none; b=FIq6RgobqLrdBIscQZQwIsxdzh0KUBdyLSgLVNoevy6MzqxgMS0dICU+Ur4QB5I7iynPsi1NUAV9BKR+A6W6uDxeRbA89XsLqsnfMrda3o2XidmQM3WXYKe+eugzAYwj0Dtfz+abIjCnIgR/1pM3mf1Y5RYbmvq6cg/Pe3xQCJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712768916; c=relaxed/simple;
	bh=kBj3klT+1x/NmSSA+lwIlizmOKUONy62HaIEGguWbBA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HaGx/srv310vnWo//KFAQm7kLCnB1kZgk9MzPKEla6O2Ro7qkP7h+O/shFsrb31EYksOzg2tBgLEwnbJosa4VEU0DbURjfHUUXpVVhFk2+loVDbdNTH2lDz7DRQuwslK0OI5q3CFfmL5P4UZ5Bl3w6CTHf1rjqIRpC+yWBKVjXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qwTdqQxL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qwTdqQxL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33937C433F1
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 17:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712768916;
	bh=kBj3klT+1x/NmSSA+lwIlizmOKUONy62HaIEGguWbBA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qwTdqQxLZajQjOyb3dkTZVbSh1h+p23LqYzw7s2PMucNq5M3qzGbi3NkleAB9SLRK
	 j9u9loiIIfMEFcyy5QUANperD7W+moKGpKOsE0IfIME1st9t2oYvbaYYEu5F78PCfG
	 WPVe70/zuKKQRImTEJNyK3D1wu4HqyBjxI/M5C8JMyhH+Ic+2JW3aSt/HYyWNyTXZ5
	 2DZ52xy+A1qhL1ZMKEB6L4KNkSpQOL6Z428dpLNWWdxCgcZVheBhozb4518354qYZs
	 BySIIc8M0FMpduP2lHtB2k+S8l/WrY5+cMTGrI3WtsbdXBRjxnD6fIMBlRnzx6d3xX
	 wFUv2Wc7a3aeg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1A518C4332E; Wed, 10 Apr 2024 17:08:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218696] DYTC frequency scaling deterioration and event spam
Date: Wed, 10 Apr 2024 17:08:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mpearson-lenovo@squebb.ca
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218696-215701-ii3PGLKiOE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218696-215701@https.bugzilla.kernel.org/>
References: <bug-218696-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218696

--- Comment #6 from Mark Pearson (mpearson-lenovo@squebb.ca) ---
Thanks! Forwarded to FW team - they're trying to reproduce it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
