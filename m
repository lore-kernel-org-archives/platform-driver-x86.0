Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205D53CB542
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Oct 2026 13:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792243608; cv=none; b=VvIhigQcgi27NPxIeUE9rlSCdqk68Rq74LuzJ6Lx4HIMrjKPpP9qb/EoJ1m3Zjbpn4uEVptffUTANCcntWiyfmyooHmyAgn2Uzl8NsIYaUz9NBeKjs71MdyDZx54DBu2T2KZ08dJaea8FHEknJdWVeMyLe9GWVJYyRV9XUd44GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792243608; c=relaxed/simple;
	bh=ccXZ6C2mbXUHTGJ5S3AN3iQvjNRuhZuQirDC9eFYLE8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A3sn6dDF9g8zZdr9T7MqIv4BtdoFF8qVxrJL/IKXEEb8NIg745BkFq9aBesDfq71+Wl8ydjhJITGmGcZlffHgEa4wjMqm0wvg3ntoiRYKlwxtuPKWic66pMNr7m/n+7h09VtsoyMUoyXz0PyJqo0uGthLXGtRP6P388KPKuQr4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=izxcpjfd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="izxcpjfd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7102EC2BCF7
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Oct 2026 13:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792243607;
	bh=ccXZ6C2mbXUHTGJ5S3AN3iQvjNRuhZuQirDC9eFYLE8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=izxcpjfdobS4xAQLt98nsIw5LBWduS7y670WiDWNhjYyZlfegOl4IIeHC4ERiLMgI
	 humO24E9IBG3lxDbQQIYcAC4g6dfyZaw9ZprZargKSX0BbXy7ZGflc1PjDuqE6iHfv
	 e/gDtSj7hThUMUDI1Nsi7a+XvWxqV7nNj/51j0fXBlkLXfDAQLDnSaqgTbtryk9QSr
	 PoQJezmM5Iz/2q4ZXyZpq/UHFA6Qbuc28w6lkUKHFzYieCiIP8wyIyhRV200ctXrHf
	 d2/0OhrIQFzT42hRJNmIq/x1XsMYvKPivp9f8jn1WOLxVp0z5bIojhqi0RHrkCpeqM
	 nqg632G/w8Agw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4A80CC41612; Sat, 17 Oct 2026 13:26:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222138] hp-wmi: HPWMI_GM queries fail with AE_AML_OPERAND_TYPE
 on OmniBook 5 16-ag1xxx (8DF4); firmware WHCM never calls GMCF
Date: Sat, 17 Oct 2026 13:26:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: krishna.chomal108@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222138-215701-fCZERJvv8c@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222138-215701@https.bugzilla.kernel.org/>
References: <bug-222138-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222138

--- Comment #7 from Krishna Chomal (krishna.chomal108@gmail.com) ---
Hi Lorenzo,

I have added your tags and submitted it here[1].

Thanks,
Krishna

[1]:
https://lore.kernel.org/platform-driver-x86/20261017132421.279522-1-krishna=
.chomal108@gmail.com

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
