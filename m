Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310203E5A19
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jun 2026 10:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780569698; cv=none; b=MXbGIYJqUREDxtYQ8kib6H+wVZENPkXxKzaE1bXuMn5e4n0rIM2Q3p1enp1AnX0GQlHDcJSrkj+MeCglCeDk8CtkmQNxRowLl6JnAfKml0Kkg4CCT/HV/H7of37gbcXZy3J4ScBuNyCiqhma+XGwQewBZONHLoutoutRcTZGox8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780569698; c=relaxed/simple;
	bh=89Ug5IBvmUjyXb+X7assm6UXzpYsK/COVXChTzOxHG8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p+mVDnd9JbktlhUFG/vqP1fRkECqQfDps2N0N3EVMn2cOXTWWAJLHqac7nID4jd53oNXuhU3TENNXQqbU1dCmyp0aiFGwMUgYLPpqepVNEVCAOSO6GiKUKnJUZVF+fNcKquktF/DfIn+3Si/0vPOCd94FxY4RblZc6n9eGHbaKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qwUBXPEa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qwUBXPEa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D97CCC2BCB9
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jun 2026 10:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780569697;
	bh=89Ug5IBvmUjyXb+X7assm6UXzpYsK/COVXChTzOxHG8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qwUBXPEaPX617B0TfT1euozCI//U5NEgIeD1O6U7qTqs6CsSk8cLwwZJ8jvzXvtBh
	 2NqIERajd3W/xlNu2P4QYkXpmV4kxDgm1NsDFAC6s+Nk8vXC+2pCRk0bbpWL71iA9r
	 g4epY7ztTILLW1pmsirvuIr6CEvNnl1DmuJSNrNCiMqzoIfEC/9TS/DouWfcFZGhCw
	 pHXI4AmgpOrKX4yWxr7DzVNhBhKbso+fmx+T0N9uX8uaTv8STlMqYSpiOpSiAC2cq2
	 KynuGsPn/aXwBxwds9pIeMyVAvn/GsaUXg7yM3OdeQRkh1+O85KtdcLOEPxmLw9sv2
	 OZzD8TSdZx3Dg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B9D21C41614; Thu,  4 Jun 2026 10:41:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Thu, 04 Jun 2026 10:41:37 +0000
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
Message-ID: <bug-218901-215701-IBlazleivS@https.bugzilla.kernel.org/>
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

--- Comment #73 from Armin Wolf (W_Armin@gmx.de) ---
It seems that your desktop environment already mapps KEY_F21 to "Touchpad
toggle", so the touchpad indeeds gets toggled twice. I will check if i can
detect this somehow.

Does the Fn-Lock state change automatically when you press Fn+Esc? If no th=
en i
can map event 1073938433 onto KEY_FN_ESC so you can intercept this with a
script.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
