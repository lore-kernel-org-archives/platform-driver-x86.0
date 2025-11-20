Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C517260F
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 17:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763660085; cv=none; b=X1IPaqWlfY2o1GXdAUKswjWHjbDRjk5wYIeZuyYnTivHYYP2w5xBmzzThDrzJLvVkL+9VqpD0DaigngI/5bRihxwIbHQ99azyRSISK7EpAX7Y32SpY1FeY656x37sosyMWJGXLjKCczxpRiKtPlaPeW0L3pZDir42mXhl5O1qkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763660085; c=relaxed/simple;
	bh=ZsY8W1z0o3kA6+BQEf93CLkzcRheofvLmR1BJBihz5A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qKdtxbKCx44gPmxg0wTAhbyqmY8m8sRWOyXh056E9Bjtiyh4i9DhdbiOFVIOe84yIoDoSMzNFp08vpitTSsGxcEt/ZoA3pv+i3P3OWPpRis8nn/MfMmavNIITUf3DnaXxBoXMfb1FRLmngJ688Sch0rOp1ZHOCTEAaTCWT2BnTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0qbMVKk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0qbMVKk"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E981C116C6
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 17:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763660084;
	bh=ZsY8W1z0o3kA6+BQEf93CLkzcRheofvLmR1BJBihz5A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=M0qbMVKkjqrS6hCCivlJqCDvX+ihiEPeZzIMN5rfoD1nXSgD43kQMHDCuzIL4muMk
	 ggejoREAlqZAcRtKY2I7n0/0z+O0vsPhVjjp6uV7y4kJemGaBFVkl+eG/8fuS+SuIN
	 bG7+zu8uc7UooJ7lApYWoKv4YPkC2nShKK1dRDXRyxz4N94SnQincKGjCikxT9icqQ
	 ZnrPfyKPSEcOdIEInZZuGcScIaWF2rsLOqJ9Si/uVWQSSzDHRBRT6zsNnqMomq8ZLs
	 LQSfGjkzBqXzsGZ5+v2iG2xL6Dw79nPRHy3TauORlphhSIRYZee7Lyf4f07ptipGz2
	 FXopFOH7sVQTw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 886FAC53BBF; Thu, 20 Nov 2025 17:34:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Thu, 20 Nov 2025 17:34:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mail@lukehmcc.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-kchpHKNL2r@https.bugzilla.kernel.org/>
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

--- Comment #144 from Luke McCarthy (mail@lukehmcc.com) ---
From HP Support:

Issue Reported : experiences a critical firmware-level bug when running Lin=
ux:

Thank you again for helping confirm the behavior we=E2=80=99ve been investi=
gating.

At this time, there is no permanent fix available.

We have identified a confirmed trigger: the issue occurs when the AC adapte=
r is
unplugged or reconnected while the laptop is in suspend mode, causing the C=
PU
to become limited to approximately 443 MHz after wake.

Temporary Workaround:
Please advise users to avoid changing the AC power state while the system is
sleeping.
If the system does enter the reduced 443 MHz state, performing a full system
reboot will restore normal CPU performance.

I am escalating this to our L2 firmware/ACPI team for deeper investigation.=
 I
will provide an update as soon as we receive their findings.

To strengthen the escalation, could you please share the total install base=
 for
the affected model(s) within your fleet? This information will help us
prioritize and push for an urgent resolution.

...

Good they are at least aware now. Will keep updated.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
