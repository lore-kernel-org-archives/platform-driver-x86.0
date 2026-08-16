Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD1C22FDE6
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 06:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786862482; cv=none; b=jtePIkiFLR7ks5Zl41dFKk/Uh8NYg2uUs6Gh8a44kN5UXKth3CBvuIIRyjbE7rs1WyPz/rLPipsqfQZQ5+C9a+MYr7dnl/YRhbAzOxtSN+tDL04/QA6Q8wbTqy51m9Ggo4nuOHRqLMQ7n6oXsubKnKaUIB/Vir2abh1M7JQRVWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786862482; c=relaxed/simple;
	bh=5l4PS1B3GurEptxfhcYPUwC9LBrIBjnACALnp2OtIWA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MFvNrhY0gKJsMlbXqpxWWm+Qu+yNYz8C8b+Z6a0+mOK21RuR3GB9qZ1EgpaJQaIhZPN32v6tDcGyoAT6tNbJe599uFRaMsddANwLYQO7t+Fb9DgqdTvZRy5rJKiJjT9ACPQXQqmLTsojOmoUPI/bTpquHsoLx5bJJVLTGZAY75I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iGv1x2+F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iGv1x2+F"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B598BC2BCF4
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 06:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786862482;
	bh=5l4PS1B3GurEptxfhcYPUwC9LBrIBjnACALnp2OtIWA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iGv1x2+FzqHQi/cK2KxdH49+l3iBV70zMCIA/jGEDqjAsiE8NFKlYWI807df7XIef
	 NYeB1fOA0MNMQaLuzZfWPLXGhqR/P7ceXrm7XVdTe8wUd/xS5nZPxOemD/BaednjLp
	 7DR6SVybp/gXjvPHWkamngwFlmMVI/KyeWG+xJbWtg1te0fWSfnToDXbhZegbPdF6X
	 3bvVNTHfaixkholuGAbf2rtd6M5a1HqAT75gP7iaRg/sTpHRCk+z6bRn08GVoO0kp3
	 yx7FtHXaZWUCvo2fzVVHmlFx6IMt8UBAcz3ytlq70ChU+uiw7yow3YMW6Dz31oX4o4
	 apD6aOi71teBg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A37F8C3279F; Sun, 16 Aug 2026 06:41:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221893] amd_pmc - Last suspend didn't reach deepest state on HP
 ProBook 445 14 G11 (AMD Ryzen 7 7735U)
Date: Sun, 16 Aug 2026 06:41:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rayshuee@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221893-215701-u0Yqwm8azC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221893-215701@https.bugzilla.kernel.org/>
References: <bug-221893-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221893

--- Comment #1 from Ray Xue (rayshuee@gmail.com) ---
Created attachment 310660
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310660&action=3Dedit
hp-probook-445-g11-s2idle-quirk.patch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
