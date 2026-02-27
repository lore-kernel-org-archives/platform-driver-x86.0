Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7B318C02E
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 14:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772201442; cv=none; b=IZ6qPNIlixG8gpOm0Q0GQbOEnKg46pXFNtXl+pW53oyJ654EtWhX8DfEHniFhG30FPW7vQJiGcMg8gmD/ejQaQAyevaCKPYYquCcQLL+7trCMHS3mO0V4aGaeYdwYD3Z9q2tLA2CeEQ5FXnlLgkz3f+p+F237IpWTqDz92ZxKuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772201442; c=relaxed/simple;
	bh=83Rplfkhv0D1Sn+v3I25uXZM03wscCPJa8q8Q7/HEH4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=spNI7MtaHQ7LU63jr650ZBukspU7Sg+DiV10BwmHrolC2jydGCANoR/Okhrxx6o9lcimVkpamCUAPx8X9bSyMiHJvkGZt/vyeTmR2Q98YyW4h58pUUTsi5CD5mR/XVtOYBHFW6crn/uMLX2rgcZ1hR4HJKub7lqt38ssLnDfU1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=byR5LqVD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="byR5LqVD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CEE9C19423
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 14:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772201442;
	bh=83Rplfkhv0D1Sn+v3I25uXZM03wscCPJa8q8Q7/HEH4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=byR5LqVDA9NbaGnWGse11oNjoFk5A2y2u9T80/EMiccW4AA9vKCi03bc68xVVKUj8
	 s6A/Vzd9vmFP2HoRxtMrYnbVDFzO5YtwYloS4tMwrUXlrci9Mf3sb18vIhZGGCZSMI
	 5rJyTrjXlfWitlbzaTy3hGDIf5LK4r7FbzHEpvXBxOSy78Q0adZ5ft9j3dUz/5gSvB
	 j/LrIl0vVe0xfpfS932zw5dNpXkuX3g05gslDMMhOXK5YwuMDEHL4sTPpD++naN9lJ
	 NrNVBmyRDlifMnWLcb5SJNT/gtA9gpszTD2Kt1O0p7CVzhw4au6Dk9tNYyF+tU8Ppv
	 4FMMQPXYXrI3w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 668A5C3279F; Fri, 27 Feb 2026 14:10:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221149] hp-wmi: Fan control fails and RPM always reads as zero
 on HP OMEN 16-wf1xxx (Board 8C76)
Date: Fri, 27 Feb 2026 14:10:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: krishna.chomal108@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221149-215701-N8BjxFY0Fu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221149-215701@https.bugzilla.kernel.org/>
References: <bug-221149-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221149

--- Comment #5 from Krishna Chomal (krishna.chomal108@gmail.com) ---
That's great! I am glad everything is working as intended.

I am preparing the final patch to send to the LKML, and would like to inclu=
de
you in the 'Reported-by' and 'Tested-by' tags to credit your help with the
diagnostics and testing. Could you please provide the real name and email
address you would like me to use for these tags?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
