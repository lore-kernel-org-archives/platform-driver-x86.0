Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269F1199E8D
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 19:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734722093; cv=none; b=e+vf+AJ3gFXVe4xV6kqiU9/M1LdR5t1+zNrhVeyXvuzJOKSYMBv+AL/7OEK8XvMJH+A8N+sRVeX5VzGxE+uLjiczgUkgKBG4AOAA49x0ol1qVhGcgtJFnpUr0z7l/testZWB9O4nVJjYx66HFg/ILtwPkSvDtUVhzTWNOSQQHHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734722093; c=relaxed/simple;
	bh=uosoj3m4JFron1rUHeKRCvwW/LB1La1q0NHPuIwB75I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ujlkILLr2lfec2H/+w2S8ZrjcdZZCH5ZZzwbY29sPvHUXnMoXESBbd6MLC74o29fOs7vFK5TfOelN70SyCsRnLL0bDKUOQvQPFBaHNW1KZTuladhEqFuYzDQFbJzZ3uf9bJIA8fsBJorD82bQoXXDdlXQBO2mE2MVpRsYwvzOF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yb6FgNCO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yb6FgNCO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A877FC4CED6
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 19:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734722092;
	bh=uosoj3m4JFron1rUHeKRCvwW/LB1La1q0NHPuIwB75I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Yb6FgNCODEHnR5t7uqslNCqCL6zMMBBx3fJwGPMZ9TzUsX82bgp6G1RP/Flz+R89X
	 dcTlm9kHTNxVyHyrjqhjTelmY1aNnKWG5rDxtMQdp3zN4qG+cBdWQq9xpcB1avJs5e
	 HOG7gZpePJsfybW+OGWns7bTPvZO58SRSRlqelGX4RAKJ41f5e44+fAasp2ov75baV
	 rgtqo7/tswGuVBv+BtID31LUiTVsgwUCMyq7TY54OeyYwr8SJOBlJrr/cThslrfmSo
	 1/8HwatS83HYWpJDdVStAI5vJyfzSBubA2TPJOfXRAFttnvnz1pGtooA2CgII6W/g4
	 7M9Ev9mGt0Jeg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 980E7C4160E; Fri, 20 Dec 2024 19:14:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Fri, 20 Dec 2024 19:14:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarkko@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219495-215701-jvG0Yek9pf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

--- Comment #36 from jarkko@kernel.org ---
Created attachment 307378
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307378&action=3Dedit
tpm: Don't copy ACPI event log

OK, so this is about 50% done what I had in mind but kind of gives enough h=
ints
of the concept. Comments welcome. Now all it needs is just tpm2.c tweaks, w=
hich
should be somewhat easy to implement.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
