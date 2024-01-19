Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B8241C98
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Jan 2024 12:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705668349; cv=none; b=XnK9+Vum9AfrosmztW25MzyPPFWdqN8OnIbfAd+wnmJdmLEB5ikGiVJ7XL3lP3LMX+gCNLzTjli6zmNXpYy+rfkRibCLFT78BvUSo4IUeocwHqo4zta1/x9DtMb8Tq/BO0jON/7nQs0dpxQPqn9INrSE2MLJHaiGzyfUdQLPlBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705668349; c=relaxed/simple;
	bh=aRq7T6bFGSjhEzvEBCCRClCU6sat7e26vNz0xKdv8Vk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NCaefW6dr0hdDddlmLUBhY1/1vEO9JDNMhNdsfLr2tySrj5gHqXWUpUiFRiwgbrEHdXcf843D6Dh7jX2QQzIT71OtgpjAO8+1BQLU/iwZfG9Hh0Wu9m0WxIBld4WGsKODJfCmTY6fVErkQkw243kdhl2nC0KkFjrdmebj9Q6ZcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+Fn6NWT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+Fn6NWT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D77A4C433F1
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Jan 2024 12:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705668348;
	bh=aRq7T6bFGSjhEzvEBCCRClCU6sat7e26vNz0xKdv8Vk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=f+Fn6NWTPbjlqzTBr2OeqcmgNh4w0WDtwIdYYZDBsf0IMvVlKvoZE2++9MRKqVIJI
	 tQeEB7tiUKcZWm275Kjo96netTvp60kujPBr8snGekehvaiuIf1t/1bTpwYpUAIMj+
	 8a9WoybgE+XkH9bWWjmWus17WrGDZmXqK405zhRb5Hw8bMoxboPE7Ii92V2D//AS7c
	 dyK4RAgrjjFWpSkESkZ+54meXMNWprpE59dCjWdxQoO/U7avXFOyL2OSFRyD4+Hhj3
	 It2HI369boln8ePtPRkY7bPsfVlsoM+cU2GhZxJ/Zb5tltk85+PE/kXohmhiBYMWIq
	 12xVx+MSOY7/A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BA187C4332E; Fri, 19 Jan 2024 12:45:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Fri, 19 Jan 2024 12:45:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: dan.martins@zoho.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-Vf8g0O6lYZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #17 from Dan Martins (dan.martins@zoho.com) ---
(In reply to Muzhi Yu from comment #16)
> I can reproduce Artem's issue on EliteBook 845 G10 (kernel 6.7.0 on NixOS=
).
> Also Dan's workaround works for me 80% of the time, with only a few times
> when I had to reboot to lift the cpufreq lock.
>=20

I have since found that I don't need to switch to the performance governor =
at
all. It is enough, in my case, to "reset" the the scaling governor to
powersave. Just "sudo cpupower frequency-set -g powersave".

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
