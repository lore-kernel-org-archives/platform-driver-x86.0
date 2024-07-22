Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5562E1429A
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jul 2024 20:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721678628; cv=none; b=e3xCkcyMyGM/Lds8ExTr+oOxB48VhSy+6GGDqXgA/DDah5xBHa5YYMROrw+Q7h/SfDuQXgUxYI4oWi9r9iOPqFnU5UpTXovxhglgVT70ewTTEg+HVyB/dgH4yrENFQ0SL6HvsXgMVmyRyTqSdPvrgP5SOF5BItedVLAarjuMeEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721678628; c=relaxed/simple;
	bh=a7Qtj8zRcT+AggIkzkgKb8ZroOctSW1p8u4ixxxiNpU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AEJmUM+Zizige4R85JtoawyIYL9UyNZl6mK59qb7azmS/JKs+U0b3e7/TJ5lxqb8UpWKHRfwy54qu9U20phcgRe4hg1WU5V76k7Xc1pIdldNsN+VgQTpLdGwSXco0smtfNXOo0MaNmBnwMYEmXfqoZyznDGQADDR6WKwJArrl6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RU8yV73N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RU8yV73N"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFAD7C116B1
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jul 2024 20:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721678627;
	bh=a7Qtj8zRcT+AggIkzkgKb8ZroOctSW1p8u4ixxxiNpU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RU8yV73NRRNJ5dBqHMbGzrPOkMG9LLMlUYfHC6ekH8OqNQHRR0D9GZHnUu0jXn7RG
	 D/t9/Pzx3dFrxwyH+v87+qzheSUPiayHnquu73Y+GOpQhQNGnh/Z4KtNPz81TjMWfs
	 87XeSoRoanLUsy30TXEy/LxBhgjOVgGk9fbR8yYwLHHzCv4fuKXQylQCR1Ztg4dMS3
	 w/xoNkylIH4gy/t3J7KCMS1ZWpXr3N+Wbaa/vkcFUEqu4N6tzE2GpxzD161Qe/cYD7
	 NA4xguOy2JLE1AEG7K8gr+Yn80KFo1r3tMXozG/lWpHLHuSjf6QKptlzuWyg1mrkpD
	 So1htwAOPT0NA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AB942C433E5; Mon, 22 Jul 2024 20:03:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218863] amd-pmf AMDI0102:00: ta invoke cmd init failed err:
 60005
Date: Mon, 22 Jul 2024 20:03:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: shyam-sundar.s-k@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218863-215701-xjEHtNKhi7@https.bugzilla.kernel.org/>
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

--- Comment #25 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Shyam Sundar S K (AMD) from comment #24)
> I see that extra debug logs, unfortunately that does not provide any hints
> on why you are seeing the TEE error.
>=20
> Can you please dump the policy binary and send the debug output? basicall=
y,
> I am looking at:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/
> drivers/platform/x86/amd/pmf/tee-if.c?h=3Dv6.10#n463
>=20
> for this to happen, you will need to enable CONFIG_AMD_PMF_DEBUG.

Could it be done from Windows?

I cannot rebuild the kernel currently.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
