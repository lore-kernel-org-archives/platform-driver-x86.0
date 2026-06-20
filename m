Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26598233954
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 21:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781989677; cv=none; b=N8h4oqdfGdEmMJgBJR3tg2vCcqGyYseC5BayBlWPM8kr+Sg4zJqdfy12O4NoOGkYTwksYDEc3vQzCOVUe3vtKDmv/Zfsq0aP64tDPUSOS3ZNH+49UcYhlkNI0HreDX5QagjSZzYI+K/zzj+IrRnL92h4RWejQhnYsqEDKdDQsSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781989677; c=relaxed/simple;
	bh=Zbn4LVE7aP904NJjtPVoYTf7jw5Or4MWLIJFaQwTZ94=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=COCRXOOAwt8Ez5NzwRdHNKYBixquzthrfpchCqMb26NdWmvYKVrQOwSEcWn7qTBH9qbAhXfO0bnO2MF1Srjpn/Hq9KXOTnYZDTNN6fGZkcKAxNWb71a8btg4i0S1GADnkaGriLw/TWlx8blEO0S8o5SnoDXI0+PWHnpLj7Ffmjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TdOWd5Te; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TdOWd5Te"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFC97C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 21:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781989676;
	bh=Zbn4LVE7aP904NJjtPVoYTf7jw5Or4MWLIJFaQwTZ94=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TdOWd5TeWndYotHpzLjjlVSbs4f4xzID4zZ4DId0j1N+wTMs5hVRn2TrGwn3qly6U
	 qSDYvfvkUGG5rtKh+VF760wLdTtK4u5JFoWbg1BgcDc1wlH/F9p/iVUH8cW8hhn5fE
	 StzLWhJR1/rUuY5950W4jdT1RwFrssWdAJNR9OErdEaICYMkJNFQu9sieLTSTash7L
	 i1t0ttP7vrkMmePuLUSFUIT3E9hp8gfmOhXEMRP5enrg538zowAomfWrnoHPXMBOGX
	 R9MIXpv3eAEn3x4bLkW/Wvn8C7OCHbcuhnhwcFj5Hf9HNiu41ysyCnI/ph5WWvfUkq
	 pkJaeWFVR6n6g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A8E64C41612; Sat, 20 Jun 2026 21:07:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sat, 20 Jun 2026 21:07:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-YQoCfCGXxW@https.bugzilla.kernel.org/>
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

--- Comment #105 from Armin Wolf (W_Armin@gmx.de) ---
It can be that some features like reader mode are not supported on your
devices.

Did i understand correctly that all of you can control the keyboard backlig=
ht
using the sysfs interface under
/sys/devices/platform/LGEX0820:00/leds/kbd_backlight/brightness?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
