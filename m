Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0844723BCF7
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 05:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779859541; cv=none; b=O6ZggmqatfOnATKJ/ZQ0gMtKYRZa7Ac571hHcpYkjDsjN5uwEgheoJM7L7SGAN7H6RTrO2UePI3KgtcwU3fbH1iWwDDHxG7u4HcstJ2sXG5z92xhzVwHf1fgED/KNXmrj76OVwAQdHnfsBauj0AEi7Kl2vjGKjnBhXNUxgkR65I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779859541; c=relaxed/simple;
	bh=UWXLLv41fO9oV/Iaj15eMve9sibZfd59ZaLt5LMCELM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rn1QZAjhvOPgd/mfiNm89BObagq6SD0lnwQ6JYv1m9XFiU+J754/MK3iFKgB75HWZ4tPibKxcKc8FkD7mjvUjpADZUIawOOXgFsexVmdzGQttKZzMT5NjcYT8ITNfBPDxKhrwDpb+4tZFuzyFcjfmH3FOQQLOERg+uL8BJDk5mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XBk3GfT1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XBk3GfT1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD335C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 05:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779859540;
	bh=UWXLLv41fO9oV/Iaj15eMve9sibZfd59ZaLt5LMCELM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XBk3GfT1PjFrsuLiyntXpuJytY2UF8plYQs8Bk9J3UwvH0NZ+l+Fsmn+2Rg/KMch/
	 jF/Cl0MV65WC6nCav71PiGpPsoF8w3/Jscfa+KqzK7ZluW2PF4jEnNjyvhyoruiaiQ
	 ggrLz+Is54NFxBCi5XHqpvsR5xE5k9z15sD3orELkIYHENhT8paBOCHD1bUwhNNbu4
	 ercbimMe6pjRwcu6X81NMH6V5mzqkCiKr30twinGJIYs3J9g1SleXqt8Qw0D7/xfCZ
	 76P0YLyVPSQXgUr8BEVarEq92rO2YwRjvLpVRZxwmhRzX6RNdjhZOYMmjFgi9bPLbE
	 hJh7Ol3jIV4tw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A275CC433E1; Wed, 27 May 2026 05:25:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Wed, 27 May 2026 05:25:40 +0000
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
Message-ID: <bug-221569-215701-FJeprTSJNQ@https.bugzilla.kernel.org/>
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

--- Comment #4 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
Can you maybe share the full dmesg from 7.0 and one from 7.1-rc, too?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
