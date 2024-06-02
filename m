Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225FD12B7D
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 16:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717347519; cv=none; b=WoNwFy4+v74KtYWOnMPFVWa+GDjhpCbAAJg+wqmuF+NN4z4hVQbTRwfA2a07LiQHRQvLFGrX1xVoPsB53BVAepICFIdxdjr7lGzyYeGlZ7VoawE5utGMTfNSDmKtcb90CUAcqJDH5n/fCWGRo7Hz/jMNVlf3kgdODNL9GL1tCaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717347519; c=relaxed/simple;
	bh=ChjpLLAVqo8Kzd4QqgqsWscn1vwrZBP9eOd9N9+kHrA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DC7gxADQ887vNUi3b2cJoDKHIaLUezPbiV5GPtUK5j3eSlIshbvgftXepXR4prE4j3JuA4C33DxkzogqNwBQ3dYLliEBWhFjSw6lGcTO+/jb6fCvV3ohIWLyEV3iinkw2a5/Ci9WcCQ5ireYEbmJ0E3ICfSI85Qk9JqJaY5voj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I71GoRHJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I71GoRHJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8F29C32781
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 16:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717347518;
	bh=ChjpLLAVqo8Kzd4QqgqsWscn1vwrZBP9eOd9N9+kHrA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=I71GoRHJvaH67pgGfVJx9H1T9wCUZ6fA6FEuZ9cDsKHoyuKTFZBXQ8qWrz6lh4KKn
	 NCQAm8nN2N5b/qhaYiSeXBUpZSamgodQBVpV4thQGHbRL03OoBJ5PYNilbiI2WafBC
	 MVDR/kJv+4QOb3ep/uvosKN1zKs4rycJo/I3nedbthr69yQPYRjGjJ9Jmvwq+l9L45
	 fPd0iuOeQS7vNFIclbVCCi9hX49VQIpg7S2GjfISpCTrvWqQhX5Jkc29B9UnPYWbvX
	 Mc6t0TWKHqzx3Xsh+2tJJa73ND2Yo/NmCTMugIfK47RKsNvw9BNAIq4bLZlT3IqWK2
	 4NYeYANdsg1Bw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 92EC8C53B73; Sun,  2 Jun 2024 16:58:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sun, 02 Jun 2024 16:58:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: agathe@boutmy.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-0MUPKWVXAJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #23 from Agathe Boutmy (agathe@boutmy.com) ---
(In reply to Armin Wolf from comment #22)
> Could it be that one of the FN-keys acts as some sort of airplane mode
> hotkey?

I'm not sure, it kept happening after rebooting and without pressing anythi=
ng

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
