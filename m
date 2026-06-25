Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77FD1D5174
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 18:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782412037; cv=none; b=bZxV+6oIoaNpEpYLN+EshRA7EgxJj5QoZjJJoUqOQ4zOhxLg9Co0bIzrO947gKd1BMjns98iMd3Y2Wk8/+uOy2c6a8o+jn8Aij+AB8BqAuHKrWlQOKguz9XSlYuNtxN/7sCrYCcZNYXc3fAdVbAgULz69CJTBwc/NcDnNAe44O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782412037; c=relaxed/simple;
	bh=DdLLlFCaFokz+/eGLCEU765WyKybamARum028dx2Qnc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ef/8bU/y8TfdDIPLunKrpdu5VlusJ4nl6pqZnoPUj+RtDN9cF3jflkhdmjAN/57N72y/0z70RyEPMsr5ZT6UhbgmijFgCwYxiwM21n6ann0aOi0jhVkZh96ryu/5xbhZQoWfUZYEjeOE3UhpPDvBdVpqG1SfHbq/zMvSgvyaSfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mpP2Xwby; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mpP2Xwby"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7BCBEC2BCB3
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 18:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782412037;
	bh=DdLLlFCaFokz+/eGLCEU765WyKybamARum028dx2Qnc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mpP2XwbyZv/P0dHB0x/itdxv20M5YmRYhvYoEVTIBiXvklYqv2Odtnv3XOUFoYwSk
	 3UMLRsSLBAipA8jC7J2Kk1cwT5c10di2iwN4wOJXDrs/I7WIRLYPN3G5To27VZHTW1
	 p7P0uYuAuvwmN5lpyhvGCF3tyuuo4mE1BoW3oZb868XJ883gRPIdCGGJr/wRKCX2ge
	 /01x+H0xWr3h2qdmY4MN2JBL4D54Y48BsEd8Pd8ZJGJwD21RbCEoYYmbLbb/qroGAH
	 mSIv+APYH2l8zRkSCY+4UZ7Hz1anZ89dwH4DqG1aqqtNo8C9y92TVbea+Sk3uS+2fJ
	 0whr8veEWXldA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5E495C3279F; Thu, 25 Jun 2026 18:27:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Thu, 25 Jun 2026 18:27:17 +0000
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
Message-ID: <bug-221569-215701-omiQ54p0BW@https.bugzilla.kernel.org/>
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

--- Comment #63 from Milan Oravec (moravec@ukf.sk) ---
I'm on stable branch 7.1.1 now.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
