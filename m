Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4597C8F66
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 May 2024 14:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715007309; cv=none; b=YAhmD4H2zAu6Oup7MEzXzHeDaEkmWTW3EMZO0Wt6noQ/slg0dnK9+k59pd3CiLLggEBKrBchRvOMtukvV8ob8gzehqK2UoLWjVpjHhDjnz5l+MU1UGs7FFa2/uqarJ0WvunGiu7yPd7ZdaFrxpkymivfuHP3v0rrOb4VSqp81Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715007309; c=relaxed/simple;
	bh=E5YSpf7aTmFWyOkxn7bxQSkEVTSPqgdotICcxMmWgcM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TRoZHAgjyjUyIHNnt5GKcBurCHmGVu0aT4muoeBP2I8y7ru6kxTOtGBfzeAaa/pdMLOG04DaQo2NeQ6a2FDBbaTdTgTAykfgtoj9DRj/0oCSzELNbK83PdZQt/ffcBuUCQUcmVmGGrKr7P92AuFyVtPt+nsUglZ0bmx+4bUin+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Avs9cv5M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Avs9cv5M"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA443C4AF66
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 May 2024 14:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715007308;
	bh=E5YSpf7aTmFWyOkxn7bxQSkEVTSPqgdotICcxMmWgcM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Avs9cv5Mg8RXL4Ia7dnPkWW0SS7lRHbE0vXXwvWoQLt95Vg0z7bXsETjqq/Z5519/
	 laVCVNcMNG6/g6mV5wwmbCiQ5K/eJjV4QhaG2lPnx19vUO+B554elShAZtjWMgwlWT
	 maQ50zh1gHBh1pzCJJqKRvAM/N62/JolfHlX89qI5NRHSFf5I6KppTvmdufBPR00NG
	 lpmR1yc9gSiHagbWsToKxwLts9Ptg2SCeP8bRKkw2tTpwEhlQI07t2RABMcjx+M+pn
	 VtHMPp5GJ/8eID2QaxOfAjOh3cpVTFVadiePI/lvCPVgYI9yjvZ2GxDEI4zRWOvXlI
	 o5cs0Xn0loWwg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B077BC53B6C; Mon,  6 May 2024 14:55:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 06 May 2024 14:55:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-qpWFbhXbxZ@https.bugzilla.kernel.org/>
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

--- Comment #57 from Artem S. Tashkinov (aros@gmx.com) ---
> Eh?  I don't recall saying I'd post a patch to reset EC on resume.

My memory is faltering obviously. Sorry.

> The Windows equivalent of the amd-pmf driver on this HP system uses the
> features in kernel 6.8 that I've been asking Artem to test.

No, kernel 6.8 didn't fix the issue for me.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
