Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763A748B39E
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 14:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778853976; cv=none; b=c1mR5BEp1pc1aSPCEvVPkjzpARBFsJFOraU9TRa4Y+cODpcDWdDLMqgEQfr93lLRLzVbsaFVlDWBYFkMgJKbsSrAs9lanlDkEixr+pexbuzGtMlvRrD4lUMkSHE4+EOsZiCgCJhR08i8L1Q4vzeQjcvttVHDeGG8qocuJAbS2NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778853976; c=relaxed/simple;
	bh=5Yr7GkOYInWc9TQ2fLqD3EghL2ZXSRZLWXTP/2Gomf4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=caeuRKxx3o42uJGFfoZrn9n/Q5bgVBIXwhm3MBIW2I81lDktPCHkHaH0Aep7rzy6vCb4uRlGg+yP44wRk4PtqGMf3nCZkSB55ZUAuRcY9DCemz2ca12+w2Umv049alTnvYHbbKZruCbvwMbNsvTH/Vvdwm6pH5CU+l/AKT4XU+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQegUeot; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQegUeot"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EF312C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 14:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778853976;
	bh=5Yr7GkOYInWc9TQ2fLqD3EghL2ZXSRZLWXTP/2Gomf4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fQegUeotl8S2lZnr6w9EnW2yflJHslSbMzjwNIf9X37gJKuegeo0p/gLiuhYmFk1S
	 m42vshkgcuWUYd8+DiQ3ZoGDYWFLjpNdJ4H6CC3RoifmLjIxuRPQNQE7LIyX0nUj4L
	 aZzONKdBHvG9YM/F3YSnegViQPV6t4BbTKx+HpwcArzmoaOABY/ApTNiDaUI3ppRIh
	 a6p+KfVfZS3qvFEBYDsByujrPbQYGREBBp95T5R6KJXuiyqAQDEYY9skTe0PUc5Rcr
	 qxhskI+4wT8w8Irgg1oC6eZJteG+5eqY8iczp4960KWrk1Yiijd3XVuf7eUmrLXsms
	 z+amNrEsjzi0w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DAFFDC4160E; Fri, 15 May 2026 14:06:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221523] [BUG] hp-wmi: OMEN 16-ap0xxx (8E35) - fan control not
 available (no PWM)
Date: Fri, 15 May 2026 14:06:15 +0000
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
Message-ID: <bug-221523-215701-1CqphwHYNZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221523-215701@https.bugzilla.kernel.org/>
References: <bug-221523-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221523

--- Comment #3 from Krishna Chomal (krishna.chomal108@gmail.com) ---
Hi Ahmet,

Your device ID 8E35 was not present in any whitelist, which caused platform
profile switching and fan control to fail.

Could you please apply the patch (attachment 310134) and test the following:

1. Check dmesg for successful registration message:
   "hp_wmi: Registered as platform profile handler"

2. Verify that fan RPM is readable and controllable via sysfs
(/sys/devices/platform/hp-wmi/hwmon/*).

3. Verify that on changing platform profile, and it does physically change =
the
amount of power drawn in the CPU/GPU.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
