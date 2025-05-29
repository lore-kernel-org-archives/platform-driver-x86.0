Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF232DCBE6
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 May 2025 07:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748504149; cv=none; b=ZvePB8hmebKFf2HH5wukGlJHn4EL/7Q1XEfDQh2BbnlAIGyPmrEZFPCOCXfhExHdqQFEquA4x6YYM41lVIVGrJRxz9bVTuZmLWumzWCqxgMmanz8a7rIk3OqdzuEYs4SyaiYodJWaFOrghucIAOddc0Fk3Zm9OHW9ZvTJRGukEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748504149; c=relaxed/simple;
	bh=RnfpRn1p75B/j3MCxr2LXvimc12Ccj1amRcz6LvuBBY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nHuzkRUhVkKpUF8t957trqmz9JHRQuldhocrPRPPoLdMojVDmhk0jRtoGhDi2uyrt9CNpAsm0TXcUKp20kj0zMq57zXNXWJnhRmXlnZTDO1YUYuKt/Y2qkFcaE8YfFQe2URTzH6X/PSR+uHGpytPaVHK0S4FJT4YgaNbdn8+xOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OrobauOY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OrobauOY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B6C9C4CEEA
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 May 2025 07:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748504148;
	bh=RnfpRn1p75B/j3MCxr2LXvimc12Ccj1amRcz6LvuBBY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OrobauOYEJCod7F/YobvuJDV6eTRna1KBDoU5boEFW47SIyO5IFO0tc/2hGWSLA8D
	 S/s1tpZBTnjVDX1q5iBPJRQiVt3e9t5y7EX/5WYcFawVLE0Ove586A8ODGFKmU8Ykd
	 yzgJ2blzSIxUoku4mER7vACFFNcr27aN3sYABgpfYn5nYntPzJL+1Mp5mVyNtDbYuT
	 0JPg/o200iwUg6gH7UcZOCeeq080+3gMohd20K7JiTy0FxBjJCbenGHOs/e+NmNU9G
	 fjDYfzHPbZ3JzZPW1MkwZEqcJ6luyTfMeY95sac+zsHIGdC54nyPnAnkLEUTnSQy5M
	 pfhNSnuDfON4A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 64122C3279F; Thu, 29 May 2025 07:35:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218863] [BAD FIRMWARE] amd-pmf AMDI0102:00: ta invoke cmd init
 failed err: 60005
Date: Thu, 29 May 2025 07:35:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: blunted.tip@proton.me
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: shyam-sundar.s-k@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218863-215701-fHYwkf1pcY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218863-215701@https.bugzilla.kernel.org/>
References: <bug-218863-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218863

--- Comment #39 from blunted.tip@proton.me ---
On my HP Elitebook 845 G10 laptop, I haven't seen the error in a long time,
possibly fixed by the BIOS updates since late last year.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
