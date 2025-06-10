Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5025D247289
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Jun 2025 18:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749579821; cv=none; b=c6IQefp/gzdxFAaoDwm2jKiq5xe2a12V2vsJFm/qrI1oNzH8pxDjdyt2e2Rm9CwosUO/OH2is9TQrO7Eu+HidnclWHmHVeXEBU8YDY4qCsv3GQtrJXNfX7No114mBylpC6kPr8PkeztlDDcu+qa6ZmNGvbp3SLPRV63kxwazmYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749579821; c=relaxed/simple;
	bh=9yZGm+8qScFL6+fiUhEnvGfVo8V2b0Xcl/RXe8kQCF4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gSslW05EGl1i5K9c6vgYVHY18Se7yaX3yuqqHI6GMnaubDL6askUyTvGeCgxN/BvMYgadYnJtgmUYIjmV6Ac40o1gQUiQCnAu8m8xzV5CNw1c7cBwFLMHueOGJFK9xVqJOaHaqvTa8scCvJmMw3dbBWD0bnbKBybIT3mgTQVW34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCSOlPpp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCSOlPpp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8075C4CEF0
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Jun 2025 18:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749579820;
	bh=9yZGm+8qScFL6+fiUhEnvGfVo8V2b0Xcl/RXe8kQCF4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bCSOlPpp6Pyi8FeGwUz+FM+ecqRiQpn/kwxiqoKTjxsTfDpVjJXF7c+7QQA2PmaXt
	 zq+f2MStxFwTKopSOgNZfquZSR4JwN628M9ee046jKxLzTrUsXIH0dlm1+JBHSNW4K
	 DIF4VBLnLn13jq2Od8hkZGkLrcW7UXgevUarAlSFfgzploC4uikymxFM9NBG2GTjaL
	 f9XtRSCnN9EDFxpFiMJNpLXor9QyGNjpeZf+1GNVsLg0IvxzWTXdYYlfSDIwgnG4h6
	 JcXH7BTEuHi4cskA9qzgdTnv/SRBcYV1VSyzyYmyPPVeQdE7w1S0e7/mRxtPWMPH+Y
	 j7HfqjUQltsgQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AFB4EC3279F; Tue, 10 Jun 2025 18:23:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218771] Lenovo Thinkbook - turning off after closing lid or
 (dis)connecting charger
Date: Tue, 10 Jun 2025 18:23:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pawel.radziszewski@pw.edu.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218771-215701-FgzvI6B3Or@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218771-215701@https.bugzilla.kernel.org/>
References: <bug-218771-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218771

--- Comment #13 from PMR (pawel.radziszewski@pw.edu.pl) ---
I does not work, I'm afraid, in my setup (see top of the thread).

I have upgraded to the kernel 6.6.93-desktop-1.mga9 (a binary one, from reg=
ular
Mageia repository, not compiled by myself), which, as far as I could chceck=
 it,
should have this patch incorporated(?)

Unfortunately, I could observe an unchanged behavior: after closing the lid=
 the
notebook comes to sleep, but after later disconnecting the charger it turns
completely off :-/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
