Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C669B3195FC
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 15:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782400243; cv=none; b=qldwFrVorOJwF9LT6wqL1OyLm6ODjhCgpCxI93nGUZ6hejGt+l0L3EMxxNUjPyFSCnRNc15u50hggzLtzdfdT9h64V+O0/eFvy4F8ORgaSXpIh+qQUX6Lfy03s1DcipVJWW6c3DYRKBvyvhfiMozEKLptKXjTc7x6kmRL7usZRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782400243; c=relaxed/simple;
	bh=NC1fe9KKGaXZJY5m64pyswpBkJTVHyi+Vp3MjCS4VEY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oQfz7r1CznIl2yHUqTgaghgV5GQQmiDpPBFHzji7liKqn6zMzrdOGcrxuW0ac8BwH9P5QVMDleGrPdrDLs8lc9DQspGcZcwIxeTtpvy7t3DhaqdI1TLffGo2+SbBBsm+hBA5UjOIAbggQISilFIaxEOxO3la3OKJDdKUASFvxtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dToUzrEA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dToUzrEA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54517C2BCB3
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 15:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782400243;
	bh=NC1fe9KKGaXZJY5m64pyswpBkJTVHyi+Vp3MjCS4VEY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dToUzrEAaNrDjprldp8EVlE79aWQdDUWa8fgG0EKURpg7x5hg9lfhA9FKqFkstWl/
	 nuLlNH+y8T451iPkXtno9n103LBZgq08IRh8fD2qMCs9gWt7fI1bqfgKv9VeRnXpTH
	 4SLlfAiQ+soLbHEiaCrVMsomY1csjuaiIoS37oo/WDI2NQkHs9Ykn5A/uEqNkDaWkS
	 eonAvICKCQy1gbZ2NJYCTFPNFKVaqkC0elFQS6tAyIeQls+2ebj5xGnNVvRD3htWeG
	 qq87cAVs5aB+riNGw+NuRz49Jt/lQ+Miw9/ZE2zzjk4KRJyJvZ+4/LlEP6GWM0h0iC
	 Pvate/2skuggw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 35215C3279F; Thu, 25 Jun 2026 15:10:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Thu, 25 Jun 2026 15:10:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-yZMKpja7op@https.bugzilla.kernel.org/>
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

--- Comment #60 from Milan Oravec (moravec@ukf.sk) ---
Thank you, will try it and report back.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
