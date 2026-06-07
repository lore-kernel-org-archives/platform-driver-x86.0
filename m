Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81B12874E6
	for <platform-driver-x86@vger.kernel.org>; Sun,  7 Jun 2026 07:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780818827; cv=none; b=lG4PaEHr9n8Bi9SM0RG+t8mQie7+Lo3ZmGA1asXCfIbPuJV+oNOBs+lyjcPNZdKdjgPtGRemdXfwUwJ0ShRnAVPQtsH6rdLX2DUXb8xUDFA6u/mafO1XcVPtAvMIqfQrrNhwcWmoK6y1d8j7DI0cogYsJibrHBx+Nq4hE+FNa30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780818827; c=relaxed/simple;
	bh=rS5mXL/zRkzmsH+q302mOh0+Xzkr42xnTE2TijqjGcc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LqyppBMqLTML7XVL2rUauJlPJbLCNP0KgUzCgRI/jlbEfo7dHtnWZCA7FB/h/UJg7fSJVehvtxZ6fN35fVEUcGJAe9Z4pcJGWdly5GnnQXhyUcAyv341BJsgDLu1vSU+jdNTcx5TQERc8fyT8FlgxOIOIMLyUs7Z7x07cDNecW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IDGocG/Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IDGocG/Z"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21805C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Sun,  7 Jun 2026 07:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780818827;
	bh=rS5mXL/zRkzmsH+q302mOh0+Xzkr42xnTE2TijqjGcc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IDGocG/ZsGxFDQn/c4vFx8E8X+9wo9sThLr1uLJPo1oRh3arvcKrbIYDcqSRVX/se
	 Kr7PM3p+AQFG9El4u7CeA0y2OBrf0ukBjPEPfa85eNAQkSrR15AmlqUJDdmVcjk2mb
	 cfjVqRc/06E5E3RqxXzs/WyOj/FLnniuP2bllttYcw4VYCWnzPyM4a/BILOolj0s0u
	 xaY7863nKYglU40f38K+fJzIchsO+HtyBjn6J7se/cXaJs+8jziLSJ25W9Mxz2qLXw
	 HH2pMGwlViabbog/Qy1OQZ6BR7GWcC2xjTl8GD7FuGJz5O3fbAntHxBcKV6YnCJW/l
	 Qxsne3mBgecgQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 05C23C3279F; Sun,  7 Jun 2026 07:53:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Sun, 07 Jun 2026 07:53:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: george.stafilidis@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221583-215701-ydm822C33h@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221583-215701@https.bugzilla.kernel.org/>
References: <bug-221583-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221583

--- Comment #37 from George (george.stafilidis@proton.me) ---
Created attachment 310279
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310279&action=3Dedit
Applied the patch

Hey Ron,

I=E2=80=99ve applied the patch and attached an MP4 so you can see what=E2=
=80=99s happening.
When I press Fn + Space, the OSD message appears correctly, and the quick
settings menu shows the keyboard button with Off / Low / High options. Howe=
ver,
the High setting doesn=E2=80=99t seem to have any effect.

Should this keyboard control button even be visible in this case, or did I =
mess
something up again?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
