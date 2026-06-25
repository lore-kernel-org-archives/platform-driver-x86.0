Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F162C3DBD46
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 11:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782387345; cv=none; b=mYARqcdJdVmzNQy013akiGkV+sX1tnWC4M4bFr8po8cfyZ1ZU3QrSPuNoLyylKcXucTvPwEhKOywpqpxZQ8UykHkqyT3g9EcnYJfz51pNS476Ss1CRMuesVDblV86f+/aVOC4yu1Xwu5VALm5pVAFYTgUv7WBG5EUvSW/KkBUL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782387345; c=relaxed/simple;
	bh=VjJNHhj5A4AEFOgVpi3X86rqmgV3O86SssWucKxQlZg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oRCLvslchzu5zN75lSP2RSUWBHARKB63NzUMWzmCBnX3CEHkKdpBnLa9k7pudP3vZfUvAX5cPrliCv64Pmqj6p0cjD5nmifmqpIVBRvZNcg85LhkNQMBVBMLxEfIOYa9om1Ageme1vd8z673TZwmljcqov/wmMXQfj7xyDtOw2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPzwXfbP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPzwXfbP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1EAFC2BCB3
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 11:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782387344;
	bh=VjJNHhj5A4AEFOgVpi3X86rqmgV3O86SssWucKxQlZg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NPzwXfbP5kIcc7RPQB74kgoIzQYrinJ+f2qdOEwb3imIU0/TUlp14HYWS+UKgIU6x
	 AV0DW839Xg7IhmIDpGR1wm2liHZPIm4+DUTQVg5qLA+ooW1YKjjbNuSzAUDSB3mTJv
	 ai0Zgmmk0HrxdJC1OQqDeCngpWaGn7l7+dF8Lxu0CkL36DByORiIZA8hZg/67mDBC3
	 cd/+cxmb05tV8HtLXW1Lof4cXHBZQ1g0ZU0maXxbYK57Oa5ZxZvhug2V6PMsuXbCaY
	 F1n4xyK0yhseVh2pBYx2edjpPlgdJxXSWHGMg6tduzsR4r2cGgKexFOZNgR+7TwjBc
	 xSKg5chgNOHbQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0A64AC3279F; Thu, 25 Jun 2026 11:35:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Thu, 25 Jun 2026 11:35:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: scardracs@disroot.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-xOprqqUXsx@https.bugzilla.kernel.org/>
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

--- Comment #57 from Marco Scardovi (scardracs@disroot.org) ---
I need you to test one last thing from me. I wrote down a small patch which
should fix your problem with the resume. It is intended to work along with =
[1]
and [2].


[1]
https://lore.kernel.org/platform-driver-x86/20260619220911.7542-1-scardracs=
@disroot.org/
[2] https://lore.kernel.org/all/20260620081548.14143-1-scardracs@disroot.or=
g/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
