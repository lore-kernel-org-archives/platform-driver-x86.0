Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FEC16A395
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 10:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771065349; cv=none; b=uDwOAjYkg09glHRNePtegd8MCrjQXEIP+2fOcB9va685cvt9IPdQJp6ePP0pzRGUs+X5yObjd3/We1ZKTTLEf9CFoGCFI6oBqA//si5IDD7AbNUbkw6MZrHJ6UBtACjoWdOxeH04tKgHC6oLnJdf+jbxy2Jh3y0TZOinrFuB1BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771065349; c=relaxed/simple;
	bh=KRwJjoztBlNsNTxtJaGTz/ZAIXtcM8Z4ayOmn4qNhfA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dRt0ot5hQDNlahKBke1B3g7I7QuzPSUf7yjjNSJVY234AGCatgBgq/RFXu4snseuDZCIr82NyqL0Ye0GLrZSk49kHn9eCqCTgu1yBpZufkH9dqXwl3NmaWzWsaiSaqwYnqhkTYRwY4MJuRs9lvn9ydxhk4PvBWbS2AoZDgPtZIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RR6HjcRM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RR6HjcRM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9FB19C16AAE
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 10:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771065348;
	bh=KRwJjoztBlNsNTxtJaGTz/ZAIXtcM8Z4ayOmn4qNhfA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RR6HjcRM0lI77EiEwSnAr6eL1e1Ir2HRWoG9y78X065C7UcdWmfi96PV3VxMzKh+2
	 sxVURmqAJ33GKPU4YlGUBZiX8O/wMJCGlato/r5N6T+D+MBMKSfoyknSh+Box5HXpF
	 keodI9BV1LhqCB6GdY5THEhPIXqYGR344jN3snsDaSu1/0OQCodIrrRXr7g6RFzUX3
	 6V3JwLWTlKAlc4+J46FmCNJkuqnZ8F3SjM6kfeliMls0FZJA1bkpI+v7B1tX2ipJ3a
	 nDnbMOC51KgKWziwqasip8E2tThLp0MWzwdDMvLHFcjKeRGSr3qDUK1uN6sJtmOULz
	 n/MgAdtzMDbFA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8FB0BC433E1; Sat, 14 Feb 2026 10:35:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjA2MzldIFtCVUddIGhwLXdtaTogT01FTiAxNi13ZjB4?=
 =?UTF-8?B?eHggKGJvYXJkIDhCQUIpIOKAkyBmYW5zIHN0dWNrIGF0IDAgUlBNLCBCb29z?=
 =?UTF-8?B?dC9XTUkgcXVlcmllcyByZWplY3RlZCAoaHBfd21pOiBxdWVyeSAweDRjIGVy?=
 =?UTF-8?B?cm9yIDB4Nik=?=
Date: Sat, 14 Feb 2026 10:35:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: juanm4morales@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220639-215701-lhLcHcPH7P@https.bugzilla.kernel.org/>
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

--- Comment #13 from Juan Martin Morales (juanm4morales@gmail.com) ---
Thank you for this patch, Krishna! I'm also glad to see your hp-wmi patches=
 in
the for-next branch; they are very helpful.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
