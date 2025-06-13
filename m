Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6B31AA1DA
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 15:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826859; cv=none; b=afmy/nhexspmE2y9pODnExQHIjAh1VrCwr704Y8kLMJqCK8EUSnhyTnSzCKrSh3Cu3Ja95jjCz2Vq81McxUIpx3GCmhsqdr7mJCPOTxsZLt2NxaeNBRRk6XaIIUUqZk7hmU6eVZkABpuqFEL/gCDozZnG3i5ntbS+FIhvgCotz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826859; c=relaxed/simple;
	bh=18ydkP5eFinqpXDht/e1Q1cIgA91SM6ZT2p0GZ7xlTk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZYbZr9gtpApaTkeotnFeem1tD6/KLzqyAhoDrSXq3k4hvIl6oFR9tZpm8GtQNV4gHIgIcEMEXN/mk11qfCSZIteiHnTA0BMg4k/whkVHmokc43EmIoPPYBJ5kszYbThzIlNIniYEchbvhExJbUdSFfgzY5fsJPRXdb0BO8jnFCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WErg8w1h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WErg8w1h"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D22D5C4CEED
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 15:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749826858;
	bh=18ydkP5eFinqpXDht/e1Q1cIgA91SM6ZT2p0GZ7xlTk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WErg8w1hz4uRUKP+yb5LlsKIPuG3gKfXT0GL9WoP0zqQ0kc6EPgznEnLdLM12pxGA
	 t8x6FPy5OLD1kQQOhPRs2pdpVWRZ5JLz1/2UK+YEkTTD/gzLIjXW6BjlC/eMKjToo5
	 rBN3Bhu/mPo2aXLuqjBaO2W5WB6WHBKXHWncZEM2gl2WnsHw5C/pL3vsjjUdBJWVSG
	 qL2YBwfsCBWz5J+28CRbf6TJCwupNjkFdzUy1SDdAPLUOoq+/B8BAI3S5nGAsLplo9
	 K9K2I0R0lg2zivGwefzTF+5JjHYFv5sMhspcnyi9Vx6WtFJczaS/Uo9j3AzGdDbs/P
	 rHJeMO1Yiu3Rw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C7B04C41614; Fri, 13 Jun 2025 15:00:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220224] Kernel 6.15 causes crash (general protection fault) due
 to amd_sfh module
Date: Fri, 13 Jun 2025 15:00:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: g.molinaro@linuxmail.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220224-215701-2C4J0mSLQT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220224-215701@https.bugzilla.kernel.org/>
References: <bug-220224-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220224

--- Comment #19 from g.molinaro@linuxmail.org ---
Ok, thank you.

I'll inform downstream and chuck the strange behaviour of this morning into=
 the
"Gremlings and Black Magic" bin of MSI's UEFI/EC firmware. It won't be alon=
e in
there.

At least I know I'm not losing anything by running with the module blacklis=
ted.

Do you think updating the BIOS is advisable at this point?=20
(The update is from November 2024, but as usual there is zero documentation
about it.)

Again, thank you for your time and patience.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
