Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDE615B541
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 11:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712749933; cv=none; b=qQX6JNnWM8vlAqw1o5RU4bS8671wBm+WHTmQ0oViPB/WKq7rcpzqtLAKR8M84HHcvxMg6/0olkydqLJJG7qR7Xf4RvC8LBbnnVgPIatYEcG3oc0c70rum+VS5EpTtVcYZbXpixtxNL8qlZS6tj5p4xFg6vxuB1UghLJF14YZVfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712749933; c=relaxed/simple;
	bh=vRSWwmxO0DNvN58YD4Q+t0EyCAGGrgRY9mjFnTlaJxQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bdez6g6k4xZZTwtExiOfzQRfnHQ+kX9DW5x4nMVq1nA/b3UIyI1zZ8UoyUALtxCZd/szSvAG79BwMZsLikhKtrol1ImxVNKUrxaX4JQy+HcyHnxtKzXVRdRWnlthXsyOfl/rVa9kwNGjfyUqBaipPMuxBz65NSaGWUBJcbBpMuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vQDWpu5q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vQDWpu5q"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68703C433F1
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 11:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712749933;
	bh=vRSWwmxO0DNvN58YD4Q+t0EyCAGGrgRY9mjFnTlaJxQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=vQDWpu5qW8r5oI2okbl7q/kaqIuU8OHACcp/EfmPJMEygZA+pEcYSqxrTz5x2L2AP
	 bNQqUgOXFBww/06La7nf0Gqp1TgXCki1lyqejd92W3fFrkAHXpiHAi6ZPR7HPhfr1K
	 oD40++A2G4k5NDLxyl3asGM2rbOKd+/4XtFRKzpLGVy3Hcz9e8Jsbj0+SMrFgjfVPR
	 E2wvsC88OUxsSU6ZqTL6RgZEBx3vKgbh8rX/5rspf0GU8x7VdKX5byR/+jA/Glt5ME
	 MP4JFzISFafSxTpbhsDwMtNZGEpMH3gv4lLIMVVlxvsMkDh5FF/nIo4jLdxlBHfYtV
	 a8WYJDEGbsLEQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 57280C4332E; Wed, 10 Apr 2024 11:52:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Wed, 10 Apr 2024 11:52:13 +0000
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
Message-ID: <bug-218685-215701-SZZT1dHpGe@https.bugzilla.kernel.org/>
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

--- Comment #30 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to Mario Limonciello (AMD) from comment #29)
> I did do something a few years ago to let multiple drivers react to profi=
le
> changes. This was in advance of amd pmf driver existing but I think the s=
ame
> concepts can potentially apply.
>=20
> https://lore.kernel.org/linux-acpi/20211026180535.9096-4-mario.
> limonciello@amd.com/T/
>=20
> It "could" be dusted off to find the rough edges instead of quirking.

So how would this work in a case like this where one platform-profile provi=
der
supports "quiet" and the other "low-power" (and both support "balanced" +
"performance"  ?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
