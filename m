Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D324D38D6BD
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 18:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782240131; cv=none; b=Dfr28RrwJNTYJRSTb4ctcBbZTjc0TqDs31hRczFMyRADIZvd1ptU2W/XnGf33NAgXM81qhJ3Ip9WQXcigvS2vEVKgweFoh/pam3Jo/Fc2DT/Ezjr+tf2S/8aMyUiWLrVskrKM0bXnBwMGeB8tHvr39otiXawTX8ZDLuFjpNSWQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782240131; c=relaxed/simple;
	bh=7TX6CiEfGNuq8HMVIrJy3EI/2m6iOzy0N05LY7b3nuY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TgPHzF2PiKFGxtUSpx7hmv9unUbkehUOYMIf30d55rdW63gbgB9qv3l+Yo/RcL40MBH/q0Cs0EIGeARCvO7LX/URYuTr0qT/dUlU1nZYGPlLOU6EJBqW4nPa7KFZuBDqO4IvDdmFRlQBkPv+/yqfCwAG/amfv8RRVyLLXERr/hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T75kO19f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T75kO19f"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77033C2BCC7
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 18:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782240131;
	bh=7TX6CiEfGNuq8HMVIrJy3EI/2m6iOzy0N05LY7b3nuY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=T75kO19fs2E35TOz8d/m0HNTSkhwuUtDvMNnHX09sWhmbn6qUXWqr7bLqnfS0dK4U
	 xBbt+17K68YGlztdyUMPfCgwinzk1U0eF5me+QaD8nKgozpQQNRykjiIEeBn8ioVkd
	 lTuPzaImHzAUO2zr0T3w1wHOrn2GDOFQxCqD9Evjkzq0IOcbpGVHbv3bDorih50NLH
	 RYN36UgMDpTU4YsbFd3yVt6//4kK3zTlO/2SdEKu2TB4BkoRtxFeZ8kjSshAOT2F2h
	 1270ZsRvnuTZ+yIOg2KU777JOIwTTrdBRbbaqgEuntNwO2H3R/h0wH1zWgU9cDFKEA
	 1nsUmp/FC3W4A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5E6B3C3279F; Tue, 23 Jun 2026 18:42:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Tue, 23 Jun 2026 18:42:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: krishna.chomal108@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-221569-215701-2Mj71XNaMG@https.bugzilla.kernel.org/>
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

Krishna Chomal (krishna.chomal108@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |krishna.chomal108@gmail.com

--- Comment #50 from Krishna Chomal (krishna.chomal108@gmail.com) ---
Created attachment 310356
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310356&action=3Dedit
Debug patch to log system design data

Hi Milan,

Please apply this patch to the master branch of pdx86 tree [1], rebuild hp-=
wmi
driver and share the dmesg logs. This isn't intended to fix any issue, I am
just trying obtain more information to figure out why "platform_profile: Fa=
iled
to get profile for handler hp-wmi" is reported.

[1]:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.=
git

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
