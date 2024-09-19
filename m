Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6A31990CF
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Sep 2024 12:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726747502; cv=none; b=I+cu0XSczg9xmt47o/ph1s08yrugt532iq4vKTK7Zm/7gRaUMLjTsltesHLWl/E/K6mqh/AianQbHW2Lv4WaysAQ8pwOwHnwc3IlfZxXnLYglpq1BsCcfV7cKQN1M9N+xiVYthmZOhNLjJbd1G2ZXcRuoC7ni8q6ElxmXT2kKkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726747502; c=relaxed/simple;
	bh=gZtZLXsDcMfiEdEJwlH3aBr3lvT779m66ZTx6+UAooc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FWPlPYT8b+dsSB0ifJaucMzdXoH3pvru0spvG+K1yHeUKZQhGhWLrHMC8KLKf6PCaU4/vp3fEhqe+6F3WlsBYLDQPNbzy5uhZNReJ4j4lFGnzV8uT3F6xWq9ahVgAX8O+8e7mR+qgyELfTSfiFkvMeevs+gnYyT4lfO++mLwIiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AM7l194o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AM7l194o"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 977A7C4CED7
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Sep 2024 12:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726747501;
	bh=gZtZLXsDcMfiEdEJwlH3aBr3lvT779m66ZTx6+UAooc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AM7l194ofS5Qk/6bx6HxYL/0C2sQ7xwuKtsfGv0mwrWUXN0C2EMn9YstQL1CVu3TE
	 DLviJmsr13Zue/T/zeVEQwjCAOB7K6CqnFxUb+lptnCt/lKC8ELsvliXUewd3G/cf2
	 Eloy/fK+ipTReFwED07GcOSj/LooOSyuq4ZaZn+mdwn1oPrVLFvVJSiNqtsiBj40kE
	 Bim9+7P+kLBJ+NnpZO248fjs3SBPxjqHKPS65cIkYWnCkVJ65Tv0l8sspHCJxWqh+8
	 juWFAH1Q3YZkWpyudWPIsB8XkFcPEej83kqKW+NCiFdt183H8l7xcvrePiJtoqe1YH
	 t3YVGLYAAE8pw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8CFB6C53BB8; Thu, 19 Sep 2024 12:05:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Thu, 19 Sep 2024 12:05:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: vanoverloopdaan@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-05fM2KUWk7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #75 from Daan Vanoverloop (vanoverloopdaan@gmail.com) ---
Apologies for the false alert, it is not fixed. I was just unable to reprod=
uce
it when I wanted to.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
