Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31C61E9B37
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jun 2026 15:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780414991; cv=none; b=S7sKMo/uEvLnU1JKy6NVsWg6NoGi3l8Eik+3MnEoB3nDjLSO+c2OSKtzKS3t84nS9c1mHiIOql8sOkvHuA6nxlx2cEHEOSfwq5FqVrzjnAS/0MF/IoXacS+Xcy5vv0YFpoIA5rIgFyNLWMwE95rBVTrEkGUoJHqMvwgn5UmJuDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780414991; c=relaxed/simple;
	bh=EZ8gw4aOT3h/o2+PKSnSL4qbMUTGolnk8MZvMOpGP3Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jg/xMkj768nA+b+eGJDp+hhwog3LyLb0aBkvb645YEp8avLd6C83Ly+jLDqJCSK9UO9TipTiR95sweLEBgf4T17uHLoFrgWTdIGq/zLosAcFjXM/Y3QRb0WXDVEL7jlMPbQa5V5Q9arHf8+0dc6K+TrBIvNZ2I1v/cvP3FjjoR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KyFy2IRt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KyFy2IRt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88C38C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jun 2026 15:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780414990;
	bh=EZ8gw4aOT3h/o2+PKSnSL4qbMUTGolnk8MZvMOpGP3Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KyFy2IRtVlLoyv3LjThJFjuKhqBZ2G4IobjLPzS07mbiX/4DMvZgvNgNP+O9Teb/d
	 16y6s6wlHIF/lbxtCXHLjUkH0OUkVjLTOJYNwy3fHeDFmTwoHGmxjitW7t9xkvRkRJ
	 uLj4DrQftFj2rx4KQSiLHUSBQIKQEHHSMt7cWM86NFsujSzuX+/gRZZ23RsEfPK+TG
	 m59U1CgyEl/MTVj3pNl8wXqycBmdWAYL5EuEAk1QcsQVrtx0U18H2JPAQCtLwKu2rE
	 NridSFlpgHvoRBPokjDa6VJjXO5BBjLN107SCIh0RGnikswZ0NavspYZ5rs+baBXDy
	 b7jNM9pp/IO7g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 69621C4160E; Tue,  2 Jun 2026 15:43:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Tue, 02 Jun 2026 15:43:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-x4rr8keKVP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #65 from Armin Wolf (W_Armin@gmx.de) ---
So on your device the hotkeys will spam events until another hotkey is pres=
sed?
Do both touchpad on/off events come from the driver or is one of them recei=
ved
over the keyboard controller?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
