Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD44364941
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 08:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303712; cv=none; b=iYv+1UcooM04Pfgl+54USTgWPRX2XsHhNh/88AH5cD0CfyqkfdY9qzxyvH8D7Tqi0OPaUddG1WEqQqgjiO6YYsjvs7PvC9/nsVLLdPOsb8O5dSRJOHMcW67ToL+XAmWyrCf1CcP7NJYTSHZdfwq+uITItAkkta54nH90tbIwzRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303712; c=relaxed/simple;
	bh=mizTYkE8GGGlOx9dm7j0jx5cOnfXGLvYqPm4fhzwUYI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F8jEuxgyH6d4YyZNDkj68Vhx3cHpEljMmG8gKMZpuSHd//T4sVy+pfb3sJoOwJUbzB/5j+4xRn+cVo0VlZmVRpeBTYiTxk7O08cMkvJDYnCRD4eJh9D2WaC85Dm2RZT/K+2gXcf4k4YqW3ZQyrJolSc9Uei2VVWtzz+VVOb8Onw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E27z/Wox; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E27z/Wox"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC491C2BCC6
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 08:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780303711;
	bh=mizTYkE8GGGlOx9dm7j0jx5cOnfXGLvYqPm4fhzwUYI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=E27z/Wox5Tk8jRO7/zNEP0ohO33WLKuZinFNQeU4tNCk0fImhLfv/RnCQQ+YdduMq
	 0h2JzEfUc6bRHp1wXkDw2UsgYHm1h3Tz/zH6aENXBc6oCmbqNxkhJvWEs7T0zO87qd
	 nQCXUAWpMKQd+Az7Na/T0n020TfenhDkQBbAyWtoQIdT0ms9Vnbz7MwhEIqc9+usnr
	 6delLIhXolOvLU5nX+Mvqr7HlTNiDTu+GiZTYSvnlfKpRR+i9oerqixjjraaZ3gf60
	 jNmmZFa4Fd/8lYyUh454RW5gM0B+JhsSUCTosts0PldmrgbY/HLjT+XYOkcEFgTRPA
	 lW8zj2JiBHW5g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8D4B4C3279F; Mon,  1 Jun 2026 08:48:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Mon, 01 Jun 2026 08:48:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-6wjdqMkH4K@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #15 from The Linux kernel's regression tracker (Thorsten Leemhu=
is) (regressions@leemhuis.info) ---
Please really try once with blacklisting the wifi module. It seems this is
reproducible easily for you, so maybe a few minutes without wifi should suf=
fice
to detect if that makes a difference.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
