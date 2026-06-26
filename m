Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF95B3CE0AE
	for <platform-driver-x86@vger.kernel.org>; Fri, 26 Jun 2026 10:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782470559; cv=none; b=Ie2EAaw2qRE8ts3CUBQJ01GFgK/1K2eAbII6LdGqUmbhxLViC6FRRo1ZjnhrQiBwXXzWgmv7PNKl5PUQvWzv6nCHItlkXvmXZs4gm8cdzlKa/PG61YZH3LgLODYWV/oweAN5bpVc+EmYzFbbRGhcJa+2phg4RizGN7OrNMrfIyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782470559; c=relaxed/simple;
	bh=DB84vAoyM79c4o4BRk/I2G4ODhVJ21XcKcAKq2IMyE0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JbG0oPdHq+FTH/JMuHmnD8ZhGdzmni8ddXwoa7bSqM/I0XBuxVSVaTQaJxySqgaDahZ6QmHcqND9ObGV7R5avZKlqaio9WQ094pPy0LA1iprVHzXoCAKNisPQ1pMcIR1KCjcxLy9jOCBp4PTlweoxUgL1nokh2NdVe/6aRtaKGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCybU6c7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCybU6c7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5AF71C19425
	for <platform-driver-x86@vger.kernel.org>; Fri, 26 Jun 2026 10:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782470559;
	bh=DB84vAoyM79c4o4BRk/I2G4ODhVJ21XcKcAKq2IMyE0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WCybU6c7EPJ7mogExSUWrMHufS+Otw93oKIm/66zpEEzmD1gdyIIb6p44TI/c+Hcn
	 7SHUxht0Z708VwO1kdv0C6xc9glP81+uIRIlB0ZUAE6EJ42dnddowd8ZnYSA5o6KPg
	 v6vpjRTxGouP6WIgIq7k9/aVM9YxTuVj4uW/d9RorlwqghhJ3EoQqxCV4DQ6BbGlru
	 1J/GWkxCf6kSWxFV079j3JRIhhHhXhxn5FkhDk4r/NvE6WIKLOLrDnDaM+b9/9KO2U
	 FsWwfaNpBCmEItWErprvLICaDMlFFmCjtGWvN64ZQDVJ4e/I0HGJPLqVl6+dftRkWE
	 wD7vMpTvZ1Sfw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3DC5BC4160E; Fri, 26 Jun 2026 10:42:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Fri, 26 Jun 2026 10:42:39 +0000
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
Message-ID: <bug-221569-215701-BVS2JspIyV@https.bugzilla.kernel.org/>
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

--- Comment #64 from Milan Oravec (moravec@ukf.sk) ---
Never-mind, applied that one missing line myself. It was OK after first res=
ume
cycle, but after second one something is still triggering this temp. jump. =
It
changes from around 50 when in "normal" state to 80 when "broken". It chang=
es
in random intervals that last few minutes. It was observed by this line in
syslog:

wpa_supplicant[]: : CTRL-EVENT-REGDOM-CHANGE init=3DDRIVER type=3DWORLD

but but temp. is jumping without that line in syslog too. :( Strange.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
