Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A597835FF73
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 13:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770988929; cv=none; b=B7sJIhytBgc6sEFHGZrmDe5jbTZ9Hag2KTMmdjZOGgSS1USs6mppzS1WvLScTTZwNlk4yQSjFljcxQb4CQuZpqY8zkSrULU2vKKZepU4hwo0jROZga2jX9PlLfON7y1oB8lfogTmcvaiDUcRobFEyVOVuT6/7pYgouuZ7Nb24i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770988929; c=relaxed/simple;
	bh=5AdEdwiWtq0lQWpnHY+X45MkMnbZ8m5peof/8R6l8DM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EEqB+dm+YWPKFGCehxykrTHBfWV8SgRhZgU5AiSX+a2SueqkcVaJ8EMIDUyQ7si6J9T473LwBBa9B5iE5LTZGQmnJQkaubNS4ObegoJ8RFkr1wI1Bys28Gw2zt3QTnJ/HDNnlMTZXwINu+bPh45lgwX18ysb2sQBBAMCGuSuisE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYN/NcNU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYN/NcNU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54B15C116C6
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 13:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770988929;
	bh=5AdEdwiWtq0lQWpnHY+X45MkMnbZ8m5peof/8R6l8DM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aYN/NcNUxL4uJ9TYaztyvwuB+qRD/MW56anW/TbfY7RLzZpIePFzTIqiXNopoulZ/
	 SKq+bDNrNo0hmqmyBIyqofuKa4qZxoxW0AT+8G6HPNNviIFHONjUK2FNZkWH+3sy1D
	 UuJV1pwkv69g4KpmZIpktszNS31XwNT7Zx4B/fOQyTpVakdg1pgh+3EnfsA0QNRbKe
	 qo+7fT8vUkJm0C9PBaBYpWg0sCGultYX2sWKpNpCP4bnj87G7sU2L2hudF9LGksZTC
	 TmnNH5pAJggHBuGLVL5yummBn2F+m/3BSZs4z5YdCp5NF8aY71IUE64anmQvUg1jSB
	 366dHkoG2WDGQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4849CC433E1; Fri, 13 Feb 2026 13:22:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Fri, 13 Feb 2026 13:22:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-ntD13SCh1y@https.bugzilla.kernel.org/>
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

--- Comment #34 from Rong Zhang (i@rong.moe) ---
I also found some time looking into ucsi_acpi and the AML code of the ACPI
device (in SSDT17).

Two helper methods (\_SB.PCI0.LPC0.EC0.ECRD for reading,
\_SB.PCI0.LPC0.EC0.ECWT for writing) are repeatedly called a total of 25 (!)
times when handling a UCSI command. Their timeout for acquiring the ECMT mu=
tex
is 1s. Therefore, it is not surprising that some of these calls will time o=
ut.

Considering this, it seems that ucsi_acpi will cause significant pressure on
the ECMT mutex, as each UCSI command acquires and releases it 25 times. Ins=
tead
of blacklisting ideapad-laptop, could you try to blacklist ucsi_acpi? Doing=
 so
should reduce the pressure on the ECMT mutex a lot, so other ACPI methods m=
ay
be less likely to time out. Again, this won't completely "fix" the issue, a=
nd a
BIOS update is the only way to fix it.

Moreover, there is no way for us to determine if any call within them has
failed, so we can't trust the UCSI ACPI device anymore -- a quirk will also=
 be
required to disable usci_acpi on 83DR.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
