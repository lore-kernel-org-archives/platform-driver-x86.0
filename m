Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAD01C84D5
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jun 2025 15:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749657382; cv=none; b=J3HIKqeZPmk2Yk7OvogPwSPi5dddPAI369qQJoSbAfh3qeQ2Kz38TAxIgR71FcSnUBt1It3Rh4LwRcZx4byowMUQN+RVxZZ2BJ6B+u0e9Ejs9q/kE9TAKcpj1/BJQrjAUg/2MG780132HDWRJKaX/YmzwrnuRAbkEricTuL5yp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749657382; c=relaxed/simple;
	bh=KxbwhQ6472Porqq/s2dOIg9VFB4mw1qYjTjn8SBTNQU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OmAtgh3zcCps2FJ+dWL134sSxThTVnZOObs0eyPNc9Ff8YID00saPBiI4b6w2cbWVdfFgqRL4pUXJw2/pnTcEQQ47A/IwZTTAq2F/p6KBL0NHejqMdwIsIkZ8sA+Mf8/s5PIh4QmXHe926OX86Zjw9nH/VBtWPTrObl8/GLlOsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gxuqbnat; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gxuqbnat"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 375AAC4CEF0
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jun 2025 15:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749657382;
	bh=KxbwhQ6472Porqq/s2dOIg9VFB4mw1qYjTjn8SBTNQU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GxuqbnatHMfSnj5bTRhOhYvKIWsK7rJ11JZEz0fQTXzEiKzdjOfN/Ys3CD5N8Nit5
	 +3WgqnIsviBavX14PMv9/5h6YF2cw1tGdM7ajLYf1eE5Ttm+VKqGCp60Nr8pHKE39w
	 F0pB70FPxTPPqh/P7ZMc1KhCNTqDpg5OyEzvoGae61v28kZCEH6GhTiZRZtO46TscO
	 OlB66oXYu8DtqqmTgWRupjjkk41XS8U6sLbkrZh2JdPK2TSa76Sikyg2V6buGFiCtA
	 TmI2ijnaVfCgyMkCXXkrCQJ8UENCRCnFPD/zlJiZSERZIlKgucBQVJIa82UI7YLB9C
	 Z0aPUXz5/ePSA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2EE48C41612; Wed, 11 Jun 2025 15:56:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220116] amd_pmc - Last suspend didn't reach deepest state
Date: Wed, 11 Jun 2025 15:56:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Input Devices
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ein4rth@gmail.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_input-devices@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220116-215701-WUIQ5qtPfn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220116-215701@https.bugzilla.kernel.org/>
References: <bug-220116-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220116

--- Comment #29 from raoul (ein4rth@gmail.com) ---
It works for me!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
