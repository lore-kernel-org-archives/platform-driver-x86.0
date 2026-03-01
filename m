Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1185C2C2363
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Mar 2026 05:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772343438; cv=none; b=Do8MXEHkMdCvuO1OWmCZeNI8ZpyzPLrbxpDUzBXxQ99P5TCL0gDsfk/z3/t1is9ouiUjAea3JbPCla6BzJDQ5XnGJI7Fx6qIStL4F002e7W8OuobNwCKvsIyBJ2Qjt1SXQ2xFOd0MJsSc2V2nrFtH16BYzipwDeMb/ZuL+atD3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772343438; c=relaxed/simple;
	bh=kiKdHh+ZxRNc2gseJYOvz1eRq5XLvY8qPrsAAefhiqU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=klKf8Yg7cUAjek18Msd57DsuBOr3Y7OE/NPllKzq4rLH81xeZjTPAlUsUosk4/FM1HrYLLb7oTRE6VgVb/OTk0xP9JprlFuf85LFjfddDpg5HVwy3uchp4F2XHsdxo3SYXnZrr+mLnnk2LDMnDMka8i3QZFufwewp7twdYMt7p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X41wQ67O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X41wQ67O"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B795C2BC87
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Mar 2026 05:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772343437;
	bh=kiKdHh+ZxRNc2gseJYOvz1eRq5XLvY8qPrsAAefhiqU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=X41wQ67OfkQVd5RzX22uBa/PZQuLDRdIj3MODr3hIpaYknQ37rWVZ7R/TT/Ie+YOB
	 OuGsiP2hanMXMmUS1xUxTXq3vaXKP05dQWzmZmlsGcpJFrOEb0Hi7M6lWnMecUqWQB
	 j05Gt7tCA5gc1sNY6ZfeBQYhHYBMo49aQcMelcuVtjI32G+O6ATDgwtC4s7/ftQXUM
	 GccEEsWeRRKHAXKVJXx8jwAE8bSPOC/7+qDTC/4dPk57ZJypxoSLC4F6/QSZB690f/
	 5GolahT4mkOBHB9tx+0dIGwfqJfL0WyLpQyOH/71su+SjlqvMVPnfq4j3FIHQnhrjM
	 oKc5kC8eyU70Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 88DE5C3279F; Sun,  1 Mar 2026 05:37:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjExNTBdIFtCVUddIGhwLXdtaTogT01FTiAxNi1rMHh4?=
 =?UTF-8?B?eCAoYm9hcmQgOEE0RCkg4oCTIHZlcmlmaWNhdGlvbiBvZiBwbGF0Zm9ybV9w?=
 =?UTF-8?B?cm9maWxlIGFuZCBFQyByZWdpc3RlciBiZWhhdmlvcg==?=
Date: Sun, 01 Mar 2026 05:37:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: krishna.chomal108@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221150-215701-UHET8YZmOV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221150-215701@https.bugzilla.kernel.org/>
References: <bug-221150-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221150

--- Comment #6 from Krishna Chomal (krishna.chomal108@gmail.com) ---
Glad to hear everything is working as intended.

I will send this patch to the LKML soon, could you please share your full n=
ame
and email ID which you would like to be shown in the patch's Reported-by and
Tested-by tags?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
