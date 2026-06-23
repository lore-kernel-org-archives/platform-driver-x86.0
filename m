Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E0B3769E0
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 19:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782241219; cv=none; b=EYIDDrl5DME+Kw5jSq1peTapo9k15OWCL250lWfi+yRU8QeBcPJOeySvmn1W49ZrM7Rb0rny1RW7s2IarOFizJMGI3ZMJBdggNNwYPTfjLABAlvMcQF3yeI0es0zKhWYNVV8hlhIHEF28dgClzuteSUVGKttQ1+VOeH2K3ww/sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782241219; c=relaxed/simple;
	bh=W5GSfrLf7eI/YOY0BaT2yhGrWHlMDossDpM4VEnGTGM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NSQVoVyc+w2zI687o/WIessG5Ze2JhQVFVnkFFFBP9S5mGvN+59YiiuQ9uPPUzaLNeoOauyzwChIgI25h49+KJENG1wAqo4SOTr5N+gcw/LJsxuv50US9URC9HJKVRFY+Z/62QKTpc/yd+0WrPfvTWnRrdwOmk9ZsLFGv+Lcaoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JEjSwCM5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JEjSwCM5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63C80C2BCC7
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 19:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782241218;
	bh=W5GSfrLf7eI/YOY0BaT2yhGrWHlMDossDpM4VEnGTGM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JEjSwCM5cBix/LJv2T76tN9B3e/nT7wlNoeIoSmlwsrDFmHaKo0Sbp7rWzF68P2R+
	 imnCxTYh+1Wy2H8wq/4G+x50vfEqfWib36m9IK/Qym+C6hOiuzqpMhiG4lwtUe0T9k
	 yWv07PAfzyjofrqnS90gS+MRjDg48z3lbTrIf4ATL4gfJPYaMaiDoorN/y3idqtu7h
	 lvvQ67XGXaxDb58bE71t7Xy4DReY3rQlAE5momRR2/C07caaum6jezvw1qE5ORhzdX
	 qVZcZgWHy4Y0t463xz3XTpX7jj94JsZxWgC58+/x7pVtwG9OlYROCQDDBqLB8BxUCz
	 eSn7AhBfwSwmQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 42E78C3279F; Tue, 23 Jun 2026 19:00:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Tue, 23 Jun 2026 19:00:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-9uPy0aHMQn@https.bugzilla.kernel.org/>
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

--- Comment #51 from Milan Oravec (moravec@ukf.sk) ---
Hi Krishna, need I revert Marco's patch first? Here is dmesg output after
loading patched driver (both patches applied).

[Ut j=C3=BAn 23 20:57:08 2026] hp_wmi: HPWMI_GET_SYSTEM_DESIGN_DATA: ret=3D0
[Ut j=C3=BAn 23 20:57:08 2026] SYSTEM DESIGN: 00 00 00 00 00 00 00 00 00 00=
 00 00 00
00 00 00
[Ut j=C3=BAn 23 20:57:08 2026] SYSTEM DESIGN: 00 00 00 00 00 00 00 00 00 00=
 00 00 00
00 00 00
[Ut j=C3=BAn 23 20:57:08 2026] SYSTEM DESIGN: 00 00 00 00 00 00 00 00 00 00=
 00 00 00
00 00 00
[Ut j=C3=BAn 23 20:57:08 2026] SYSTEM DESIGN: 00 00 00 00 00 00 00 00 00 00=
 00 00 00
00 00 00
[Ut j=C3=BAn 23 20:57:08 2026] SYSTEM DESIGN: 00 00 00 00 00 00 00 00 00 00=
 00 00 00
00 00 00
[Ut j=C3=BAn 23 20:57:08 2026] SYSTEM DESIGN: 00 00 00 00 00 00 00 00 00 00=
 00 00 00
00 00 00
[Ut j=C3=BAn 23 20:57:08 2026] SYSTEM DESIGN: 00 00 00 00 00 00 00 00 00 00=
 00 00 00
00 00 00
[Ut j=C3=BAn 23 20:57:08 2026] SYSTEM DESIGN: 00 00 00 00 00 00 00 00 00 00=
 00 00 00
00 00 00
[Ut j=C3=BAn 23 20:57:08 2026] input: HP WMI hotkeys as
/devices/virtual/input/input52
[Ut j=C3=BAn 23 20:57:08 2026] hp_wmi: thermal_profile_get: ret=3D263173
[Ut j=C3=BAn 23 20:57:08 2026] hp_wmi: thermal_profile_get: ret=3D263173
[Ut j=C3=BAn 23 20:57:08 2026] hp_wmi: Registered as platform profile handl=
er
[Ut j=C3=BAn 23 20:57:36 2026] hp_wmi: thermal_profile_get: ret=3D263171
[Ut j=C3=BAn 23 20:57:42 2026] hp_wmi: thermal_profile_get: ret=3D263169
[Ut j=C3=BAn 23 20:57:44 2026] hp_wmi: thermal_profile_get: ret=3D263169

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
