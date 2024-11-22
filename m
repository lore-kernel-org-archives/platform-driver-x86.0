Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE22917BB1E
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 Nov 2024 12:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732278088; cv=none; b=BzkoEiBoglcqJAXmuFDITQcjoyyyYgH6u42sW9dAAlN9ms/ODwVekbENm+fpxEyn6++DOAiBo9xfozDYYMLKQEbjHAmi90ALsuIZ71QNUamdZpIsh5TbEsvZwpRk7gUcQWhpvgtgqZQC3EPjRu2Bm8f1ftwLI2w/lY8Biqd3yro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732278088; c=relaxed/simple;
	bh=FKB7PuVp98N14wMH9mZq4jBvU2lUu0/rWPV8UYldkr8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f+sdi/Y61UwUpHUN3iREPC893O35TTo4u0QPUIWXCJmxtM7BT+zNuY4P0W3EKP9lNF01PTIjMzn+l+HIcEg0Koho4Gxd/lHXRH4ymKO5YU02wlM1QzcOme74sbOymf+vbwFVGFf81CrV5cFBehGNOO66GCB1gcjyFWJWGSAcn44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7kXdfz3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7kXdfz3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37C31C4CED0
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 Nov 2024 12:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732278088;
	bh=FKB7PuVp98N14wMH9mZq4jBvU2lUu0/rWPV8UYldkr8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=h7kXdfz3OgQX/mjhMW9Jr97hp2ieXDlnE80B5yaCLFPWoL5213lFlLs/JEYQzXrev
	 uM+6OhIbp0tWc7vGJCw0OvCi9gGVLXJ3/hiqYE9oXvzSgrg6h4HBfI/XwOw5Y06Ga2
	 vDtXboq7wARSWdx9Dn6wjMuyWGMgC9clkybDiauwJ/wFPQYDKdByuCH9CI+2UfRe8+
	 Qjz3eaw8LIPu2W0UtSDoAsKTQTgU1zTsx5A9EQgYQNRCJ0DVIJeawMVZndh+LtgIFN
	 GnnRijGM33tGpR6mwTHg23Q5b7glzu0xIyxW+vLB9d/4XGE2mZil31UepCrXe6knPV
	 RahYy205VtBNw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 21D7FC53BC2; Fri, 22 Nov 2024 12:21:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219517] REGRESSION: charge_control missing in 6.12
Date: Fri, 22 Nov 2024 12:21:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: auslands-kv@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219517-215701-JXLPlPH0T4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219517-215701@https.bugzilla.kernel.org/>
References: <bug-219517-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219517

--- Comment #15 from Michael (auslands-kv@gmx.de) ---
Hi Armin

I cannot comnpile the module. I get the following error:

drivers/platform/x86/asus-wmi.c: In function 'fan_boost_mode_write':
drivers/platform/x86/asus-wmi.c:3116:38: error: 'retval' undeclared (first =
use
in this function)
 3116 |                                     &retval);
      |                                      ^~~~~~
drivers/platform/x86/asus-wmi.c:3116:38: note: each undeclared identifier is
reported only once for each function it appears in
  CC [M]  drivers/platform/x86/gpd-pocket-fan.o
drivers/platform/x86/asus-wmi.c: In function 'throttle_thermal_policy_write=
':
drivers/platform/x86/asus-wmi.c:3699:13: warning: unused variable 'retval'
[-Wunused-variable]
 3699 |         u32 retval;
      |             ^~~~~~

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
