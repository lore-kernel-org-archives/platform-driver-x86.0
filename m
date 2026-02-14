Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891A31D618E
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 06:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771050501; cv=none; b=t68ZL//8jKfXLGT23WJZ2KW3n0qFTXWrhWiBFKmFZgY1T6qN9dRCqXkOD38n5yBfDWCuHpzqAL1fyY1PEEJTFqfCrHXAwywLHPsrpNrS56rTGygCzERV+OBbH7l0DgYMF/bvzUiDDxn3PYQbaSxppKuX49pl+twISGXYWfMwGPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771050501; c=relaxed/simple;
	bh=Dw/69hAaqHkkAnlAiRGD1P+6rKMQXOYyA6UFJj/pmAA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VsH57gStUUD8hVxXtL3+h7/oFsyyoQLSNMeiUrva5VhVPKG0ATXL3/N4VmAs7XcQPoBFOc0D1frZLUFQVnN2APLPSfOT6kJYN26sFuRzYDgZmzdvyL03pEfsSEG/rzc/u0VPgbHq7fZXPpg4oRbWYnlCalrK41B1D/uxCDJGJvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s0wx3agJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s0wx3agJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 107E3C19422
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 06:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771050501;
	bh=Dw/69hAaqHkkAnlAiRGD1P+6rKMQXOYyA6UFJj/pmAA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=s0wx3agJ/skd2xfgxsvZ0FlRSY0XrSvBV8Kpz2zE3aV1fWQmrylEBLHJJBqK8+Q8H
	 KvMlkrZ1n+qdsnHn6MGTI3HlDteexUoJmxUzb1FMU4A1j9jF/mBMGr2sDPDVQObNM4
	 ztFpMu1hTmwdZwpAvmUmZw6ne4q3CtbshYKLisVq1JyLM7DWLRM8j4jQOEjqH1U8On
	 n5Y/ZOpvVEN0eCRWdQwWPLvy2Kj+rI0hznXFNP80ELQjd0CSBUIUe4PGc/BE/Dek/I
	 J1wPBzrskzBzJOnK6/89Zh8kcyRVdaIEF5nDqQE5qOqjHGft2KFki5tsKpWiXhDeEX
	 UkKxsGshv155g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EFCADC3279F; Sat, 14 Feb 2026 06:28:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjA2MzldIFtCVUddIGhwLXdtaTogT01FTiAxNi13ZjB4?=
 =?UTF-8?B?eHggKGJvYXJkIDhCQUIpIOKAkyBmYW5zIHN0dWNrIGF0IDAgUlBNLCBCb29z?=
 =?UTF-8?B?dC9XTUkgcXVlcmllcyByZWplY3RlZCAoaHBfd21pOiBxdWVyeSAweDRjIGVy?=
 =?UTF-8?B?cm9yIDB4Nik=?=
Date: Sat, 14 Feb 2026 06:28:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: krishna.chomal108@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220639-215701-uQ5o7PiRvS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220639-215701@https.bugzilla.kernel.org/>
References: <bug-220639-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220639

--- Comment #12 from Krishna Chomal (krishna.chomal108@gmail.com) ---
Thanks for the detailed report. The logs confirm that the fan RPM is
successfully detected and manually controllable. Regarding the thermal
profiles, the data shows that the limits are successfully raised to 130W in
performance mode. When AC power is plugged in and performance mode is set, =
the
CPU/GPU will be able to pull more power during stressful tasks.

Since everything is working as expected, I will proceed with sending this p=
atch
to the mailing list.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
