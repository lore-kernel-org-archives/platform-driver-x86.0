Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE93311587
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 11:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770721439; cv=none; b=k9SXR+7Bi0UVxdHNHU1jCDrQN6J/5diNYFMxAXaHr6kvVOLRMg7ZNu+Oz9edxHzaNsnK1GB3SleUcWdRhJOX49HpnprYe+nxKKVKKMo+lSpgUcUOPvMIO5+gZDpqr+YibYBpN+/88y1rYTbrPot2cOnAMlWadDA9j1Q+GgjTOrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770721439; c=relaxed/simple;
	bh=uC+2mdgwah0SPfnZ9NFYUlLItAL+iyA1tdQXc62eQt4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kvHLuaMXLL5wMKI7R0vDMEBXS1XXdhrw5nKE6JWU3PskSDNvQGAqAe/MQwFY7w/POMGIEnnJrtPfsMUk4Tj9vSnzljqHxXX/clDen9x0XlRcL5P1kQ3qAnffRkMtS6+sNnCvhLrBAsMzkvOeAbvmbBoxQX3dxEmTxI1MQTWnsJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AtzQX5co; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AtzQX5co"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5FDAC116C6
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 11:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770721438;
	bh=uC+2mdgwah0SPfnZ9NFYUlLItAL+iyA1tdQXc62eQt4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AtzQX5co+Z2j1JieyrZyQ7kjwH/0tbjqO3tahF4BAT0ucSmqxb6OpqoIxN8PffceW
	 cursBbuzLdaaGrJpjYmIqoBSIaLtz5AjP+5KZkrISjTgTvpPilMN1GhLcX5iFQCbYZ
	 B6XBWsf4ZoYpIH9DqjVnOFHydsI13mNYhoYlJr/jXE6O90E8OC7eVkOrOY9kLaYSIL
	 Ng114Q3VGChtPndAf/5zytE4zkrHM55EPzGQchLYsRx+DG/CnV6Z7CdEuvUIHwmjZY
	 tQTyt+H8h1Eo8QpwFNoJ9ReVVP05glTZqSLThXQNawZ1QZf7RUSmVlPGh4EfKqUrO2
	 TeMrQqsAA7crg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 97AC1C3279F; Tue, 10 Feb 2026 11:03:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220566] Lenovo Ideapad laptops wrongly assign "Cut" intstead of
 "Selective_screenshot" to the corresponding hardware key
Date: Tue, 10 Feb 2026 11:03:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tomashnyk@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220566-215701-QxhJJMjAxq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220566-215701@https.bugzilla.kernel.org/>
References: <bug-220566-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220566

Tom=C3=A1=C5=A1 Hnyk (tomashnyk@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #3 from Tom=C3=A1=C5=A1 Hnyk (tomashnyk@gmail.com) ---
My patch was accepted and released in 6.19, so closing this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
