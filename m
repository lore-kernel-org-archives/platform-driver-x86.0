Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3BD3264D5
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 16:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786897139; cv=none; b=k0oG1Gv/PqQGy7lBRoNTSrBgdEIa7kS5P4BFzcHxQdkfjkzKQWzu5olDNJ9t80jVeJCqPwf1+UDXceaAFBRStI9JNVGuD+NrAkJMxmaD8FfwEQ2ppprmGjYoQ+seSh4XkiQ/bFcagerYRTeEhfOlO2c4Ends833+X8E+90YBNFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786897139; c=relaxed/simple;
	bh=mQ1+M3E4RclpHWExHzHVMgnz/XfU1LwHo6U1KZNKqVY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PcUTvrLPWOfHtoL/1GSqkEfKhdbKtB/+6ARGh2gbFDHD9ph22yj2Q5nAQVVPghmXA2bEwcazChtRyasfacrkCyBX1nZW/cavJFdQtk3TJzzXtkRHEQLpj2ll2hh862UYqleZc7TCKrfozsprpSM/++HEr982cFV4BGyxk20Ig+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ETs41vaR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ETs41vaR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0CCBC2BCC7
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 16:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786897138;
	bh=mQ1+M3E4RclpHWExHzHVMgnz/XfU1LwHo6U1KZNKqVY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ETs41vaRm/7r95/GrJLVXjc/nn6bOd9IDo/FJSp+YpHmrjAidSKFwRBvcZV+fZvgl
	 Lg573kdt+1zH3pnX5ptZXa+yME4rhoj9QqGYVArkaT3AqrHKq/EXS6zDFz4CyEZosx
	 G7uCfGQe2/vkPb5m9SebfE517YQ3h9MDYRaoRvmz60ehMHmiZ73NIfZRShk5WAfpsT
	 xlIKiSwQfNR7RUbN2cSzfkxSTMcD71Cl0xDDNjSOuUw2u2RZfEIXBbKPagykkOCM8L
	 /IoGGtXLC5m6Y/jPQYFs78nT8zP3MU4XYnw3B8+XRyb/a97dw6LtNu9GtgEMPEYqjG
	 SkuT3zLMnCv8Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B5AC9C433E1; Sun, 16 Aug 2026 16:18:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221893] amd_pmc - Last suspend didn't reach deepest state on HP
 ProBook 445 14 G11 (AMD Ryzen 7 7735U)
Date: Sun, 16 Aug 2026 16:18:58 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221893-215701-v3AhKIWaGH@https.bugzilla.kernel.org/>
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

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mario.limonciello@amd.com

--- Comment #2 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> ROOT CAUSE

Are you sure your agent got the root cause right?  Does it fail every time
without the patch?  Does this patch fix it every time?

I would prefer to see an amd-s2idle report to confirm this.  You may consid=
er
using amd-s2idle to stress both patched and unpatched cases too (it has
arguments to allow running a stress cycle).

>   amdgpu 0000:05:00.0: failed to write reg 1aa89 wait reg 1aa8a
>   amdgpu 0000:05:00.0: [drm] *ERROR* IB test failed on gfx_0.0.0 (-110).
>  amdgpu 0000:05:00.0: ib ring test failed (-110).
>  amdgpu 0000:05:00.0: SMU: No response msg_reg: 1a resp_reg: 0

I say all my comments above because this is pretty "unusual" to be tied to
suspend failure tied to an EC issue.  That's behavior that resembles graphi=
cs
not being ready.

> Created attachment 310660 [details]
> hp-probook-445-g11-s2idle-quirk.patch

This isn't the way to upstream patches.

Can you please submit the patch to the platform-driver-x86 mailing list?
https://www.kernel.org/doc/html/latest/process/submitting-patches.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
