Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13A115AAD6
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 12:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712752137; cv=none; b=GYMdbZD1mY5GCNfJsaCKSVMQp7TGy4kcKlQwru3N4JNmSzFu3E8VzTfQVstik5OveigO9n2GQkk4TjOlnjt/rWn/DKD7vMcPk0Rd9HIPMBo0Odcfxk3EsnO63jkZw+O/a217IfK6j0IqPyYVOg+g1DDPIVSWwBsop8zbij2jm+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712752137; c=relaxed/simple;
	bh=KLr1VYvqcp9N897shjX5fW8Aoz6DkCU7DXN0pZY5JHs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ka3Y/hvPK0ykvMOxJSNCWLZceqHgmvwsJyGJ+asR6klk6o41pl+J+mXbK5u9Q2mtZ+75H7zbms6RemuDpBvx2Zy3dpOpRSIWNxuz+PbRn5jRTocPHbMim99fsdqVR1vmNdEgpMZE6BJ+mCMD05a4H8re6MeP58Lb9Bq+gRQjRkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u+gNu3C+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u+gNu3C+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 539DDC433C7
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 12:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712752137;
	bh=KLr1VYvqcp9N897shjX5fW8Aoz6DkCU7DXN0pZY5JHs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=u+gNu3C+AmzLANhi0DUDHhgjvfeKtaRa9RRm2qScmpho7FxJoIOSOKrSV3hpz/tpH
	 LBSy9SGuPuByvT+rn6+W2ab9elyTojkrq42HVU7O3NDtJYhN/ZKn+TNHt+Wo4PRhXF
	 CgvRxmmCNyFXMAa3c6SWwrjWDumg9d9a41JxNR95zeWin20piShWTCxC3AqYQdlFp9
	 urevUJBsBYSys/RgG5GXCyizYeQYGCoIAlY/iFZVmWL46xPxnXneksbbvMYPAB41kY
	 IUDVvEAcgAgH6Przn5GcOqFjSHnlXzmNM/9eU14IVO3XIO0hXciJhiiSNntI6awN1M
	 6cJ1ZI4a5y2Ag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3C8F5C4332E; Wed, 10 Apr 2024 12:28:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Wed, 10 Apr 2024 12:28:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218685-215701-WpXMzb2eM6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218685-215701@https.bugzilla.kernel.org/>
References: <bug-218685-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218685

--- Comment #32 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
I'm actually unsure what the quiet profile means compared to low power. I w=
ould
think it's better for Asus driver to use low power.

Note that the actual CPU power-limits between balanced and quiet do not cha=
nge
on this laptop, so I guess quiet chooses a fan curve with less aggressive
ramping up of the fans on higher temps. IOW quiet !=3D low-power.

Anyways this is exactly what I meant with how allowing multiple providers w=
ill
be messy. I really think just adding a DMI quirk for this hopefully single
broken model is best.

And if we see this more often maybe we need a way to prioritize one provider
over the other, e.g. pass a priority level when registering and if a higher
priority provider shows up unregister the previous one. Although with a com=
plex
driver like amd-pmf getting an unregister-platform-profile callback for this
called from the core might be tricky to implement.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
