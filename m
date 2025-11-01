Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BB91FECBA
	for <platform-driver-x86@vger.kernel.org>; Sat,  1 Nov 2025 09:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761989022; cv=none; b=PVj/jlOfv3AID9RV/zw5dDiIKmsHEGQVKUvFiC9Ta3lM7BU/4VqekSbLg4rxLNRMJnVadJo5OVY3gFGsytyDIGZxCrGlrF8nmlmb5UWUUVJ+JqtZ5QXpHj/+JYjdY1mhDR1Wld3eEMtwWnl957b8AC9KL3ba2wjEicLfm5zx05M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761989022; c=relaxed/simple;
	bh=JuVdjKMkKPkzI7PuvMrb633bo43KqsmNn42fi2dyyus=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hu7q4OvytOdA7tQHXY7Au/+KdAKJGyvaK3GJbejXYEtj6geFUGFyz9lx3AtStEmJUCN0alX5JqWUGsEliMOy8lbnC1JA+hC60II4WTtapCiJBX0f0EoC0sDltPtMrVoeB/o1Y2ohLof4Ym1fCTLlDlRoxoKhVEGEHGEJtv79suU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cWRX5cqV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cWRX5cqV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9550C4CEF8
	for <platform-driver-x86@vger.kernel.org>; Sat,  1 Nov 2025 09:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761989021;
	bh=JuVdjKMkKPkzI7PuvMrb633bo43KqsmNn42fi2dyyus=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cWRX5cqVYOTImMD1it3amwxraPR9p8SnQXW61eE7IUSIF7XDWZ28T9Rx0XXu6saDP
	 DWrQHn7dQKH/OUeAr8jxNj5J0HPh3b6CieAVpwTuIAKPGeTwa3NGFVFM4/FHCYDGu/
	 xmGbZyWOM/N0oFpeH7nDGfArAcOJaBhOKRzmMX0/TMi76yny3CoxYgiSd0+Eu//N+0
	 //jPD3vyBqJ5YbwAYoSIenNRUU1JbBYr3Zd6fdc28PLGYl7K9W9GICQpzMAmxkSaUw
	 MMA8dOTQ2Z4XaRy1hAfwkReSEJBUmX6s5lW8HmMQGNkYSIoJ+3sAhDDnAIFpYCIbYd
	 tbq3t16CHfqFA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D38BAC3279F; Sat,  1 Nov 2025 09:23:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219904] pc speaker not working (just pop's/click's) on intel
 chipsets gen 6, 7 and probably more
Date: Sat, 01 Nov 2025 09:23:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: keyofblues@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219904-215701-ogR2rX5vHY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219904-215701@https.bugzilla.kernel.org/>
References: <bug-219904-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219904

KeyofBlueS (keyofblues@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |keyofblues@gmail.com

--- Comment #8 from KeyofBlueS (keyofblues@gmail.com) ---
Hey everyone!

Good news, there's progress, at least on the ASUS side.

I reported this issue to their technical support, and in just a couple of w=
eeks
they sent me two test BIOS versions for the motherboards I had mentioned in=
 my
report, one with an Intel 6xx chipset and the other with an Intel 7xx. I've
tested both, and they work perfectly, the PC speaker is finally functioning
again! I'm genuinely impressed with ASUS's responsiveness and the quality of
their support.

Let's hope this fix will be included in official BIOS updates for all affec=
ted
motherboards.

Also, a quick note for anyone planning to contact their vendor (ASUS, GIGAB=
YTE,
or others), when reporting an issue, be as detailed and precise as possible,
and make sure to fill in every required field in the support form. If the
manufacturer's support team is as professional as ASUS has been in this cas=
e,
they'll take your report seriously and act on it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
