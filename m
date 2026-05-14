Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C3538AC8E
	for <platform-driver-x86@vger.kernel.org>; Thu, 14 May 2026 17:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778780362; cv=none; b=r2Brr/VIPgJd+n6ia1pf/o5U1EAiRrcW59B7XjYhOTvNA/HJeRZY0qlxUm/5umwC/rs7aNZTUx0NK65LbYzQyHzepfh56xjDvE1lW2wpbIdf84ZJXOh0UFElNuJLWByWtmY2tgLuiPQRptFon56R+sTZmghS1aVXpQ6shWqNlzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778780362; c=relaxed/simple;
	bh=2/8ZaGpSQI2tB6SESrq2rl/e3Z+1y2Nt0KVIXtlptYQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZT0ZGzEH48pPbX9awgyVULrVHaPwDY7yhMlDulJPtgH9twQRtoZnUKtU0Kk+Xfn9IBnbZ6i4oY7KH8budZMFAzOm+M82Zzc/47iSNq5ZerVYmzkOXUMeiMPyvFoNuu7KLObWqTjpa9BMq9k3RZ+b5IhsOS3I4lrIUbb4S+1ra7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RuNPLsZZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RuNPLsZZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B2FAC2BCB7
	for <platform-driver-x86@vger.kernel.org>; Thu, 14 May 2026 17:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778780361;
	bh=2/8ZaGpSQI2tB6SESrq2rl/e3Z+1y2Nt0KVIXtlptYQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RuNPLsZZ21MRZFOerjSSlX/ElWEi1QRGUCj/cF9GCBCkzIyU2hDygApgWuSWpbwHP
	 +cqZTS8X6a4iyaG+nAT9nKzUQYll4b8tQ+ciR4E0Yq2yQ86vZ1Y3ug6AInZ/gntoeG
	 j1tL2pm9mBaJohZmHLVgI8G93Blv3KQ0/oKkAEF2IjKOnAreG7kLUHPel5s4PbQkb3
	 QHOr/Y7HdxmkZVFsD50KD5TmTWFwdK/a4DMoGvweL1yK2D/Uyh3KwzNnnuGnZiKle9
	 whxkRgx0gRHLdVPh1Y6d0JYyo3Cq2erLdDxwrt5EvsWRVb+Ger5tbjRZSL+M65fZab
	 HAJebPYtyDRzA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4117BC41616; Thu, 14 May 2026 17:39:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Thu, 14 May 2026 17:39:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: rickk1166@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-P4VHwKZchl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #76 from Rick (rickk1166@gmail.com) ---
(In reply to jeffrey from comment #74)

>=20
> If this is actually the cause, then there are definitely problems using
> affected devices, since these very regular freezes of the whole system are
> more than just a cosmetic issue in the logs.

I completely blacklisted Ideapad_laptop on my system (using Mint Kernel
6.17.0-23-generic) and this seems to have completely solved the 1 second pa=
uses
every 7 minutes for me.

For anyone else with a Lenovo Yoga 2 in 1 Ryzen AI 5 340 (2025 version) (Mo=
del
83JR0002US) searching for an immediate solution:
I added file "/etc/modprobe.d/blackist-ideapad_laptop.conf" with the follow=
ing
lines:
blacklist ideapad_laptop
install ideapad_laptop /bin/false
Then in a terminal I ran "sudo update-initramfs -u" to make it active - aft=
er
reboot I no longer get the pauses or the associated messages in the log.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
