Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EAE40803B
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 07:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791357143; cv=none; b=QMhyFng1vtCKGUJT97bdi2MEcMIrAivKT7KryKEcQH0+meVcL617Wb13AcBWdmimlyFGd1MyAmCT9RLSBaxp15o6IB4lJbElmshJMtKiCKxSPc4Ofwz7kpGPhT/b1m3X86Ocb8KBAC5s9rlHUXZWy4eCQWR/Q8oMQILr0DHLCpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791357143; c=relaxed/simple;
	bh=3WgeTo5HjL8uyC0mMrlY55NyBtwVEZzwK2NQWw+uUrE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CPdEdXM845ZhnKbSukEyQsuiFNNXgm2nB5ivGPa7U+4HL8AwNB11W8LtkOE96X1hCge5c/LDHiwPOy02Z0ZL/JgJJ/JYcT4b37JdYn4JjahycPnplPHEgCSa4urb3ptKt95Vmi3k1ov0SaNORXidVU7mLPyjgT6fMHodZQTFqSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KskqRljy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KskqRljy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11D64C2BCC7
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 07:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791357143;
	bh=3WgeTo5HjL8uyC0mMrlY55NyBtwVEZzwK2NQWw+uUrE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KskqRljyp6dT52ZbY6KyLvgooYY+Ld4k9pwNKoKQ1B56EqlQk3lGtkKa5A8/cMb9j
	 K1Z2bTuxXL+o/RU9E/2Y4Piocx60bJ72bwUIYiPJye6mjoBlxQc1lr1N833Wp2SfwI
	 nSJVR0nvC2dY+51NXbmTtiereEwQr3v/WNy3L3D5I9dLmtstK+b1IXYLJQsWFX4L7a
	 9FjCdlWRn5G9n+tOa4bsSbwxz8j7TZMe/USR/JFyUIGgz2s0OOWHFDPY8vT+9/Wasr
	 3udoLuWgCoNMHItztUbjnS+hUu+UDVJ7kQmFecq+XvPITyeW71OMt+LuEHG+T85eM1
	 XgOfvApBGrxAw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 01520C433E1; Wed,  7 Oct 2026 07:12:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222044] hp-wmi: Mute and mic-mute LEDs not supported on HP
 Laptop 15-fc0xxx (board 8DC9)
Date: Wed, 07 Oct 2026 07:12:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: neonblade018@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: rep_platform
Message-ID: <bug-222044-215701-sPVWpFlY5u@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222044-215701@https.bugzilla.kernel.org/>
References: <bug-222044-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222044

Piyush (neonblade018@proton.me) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Hardware|All                         |AMD

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
