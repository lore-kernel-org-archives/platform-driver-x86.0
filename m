Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960A013D24C
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jun 2024 15:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717513488; cv=none; b=Jhk6ZDr0l7sVCFtrGVdHM3d4t1td/QvnrD7MaQSJurqYrTY5TZxnLZPrutleFKDAKgp/OAT6HTV9KNengWlylazgAaRO784qHAGLbMWDULl9S2HAfa4MN2cGED+W0NibVvhWy3S2CX4Khuse6Bq8JmOg7XySHh0ALk6MvK0QBbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717513488; c=relaxed/simple;
	bh=5Kzi5rQ7RURUVInlN7PBkstcEguVGZAi0hGDvcxZB7A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kb2s8TDa0tanfo3sIfbbJxyEKf/M+oTBGJ47j+t+6thaC30chefGEpUfvb/8laKbrFskxTrvRMJEL+5NCnYohixhgmTtVBQnFyS4ilJBaTrPPmuttf+WNcwDLt8v1qnkcK3q9loGquYiYQSBWj7Hdri+e5iX7Ovi7KKpupIQD/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QCKF5QXa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QCKF5QXa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79340C4AF07
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jun 2024 15:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717513488;
	bh=5Kzi5rQ7RURUVInlN7PBkstcEguVGZAi0hGDvcxZB7A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QCKF5QXaKytS1lrfk9OD64+JNH/3EojhnGSqVaGXMPFFz/tWRDBUBy+O8BgjofCaG
	 ZUi2g4ordMzhdbe+b5eziGGF4Mh9sKwq2dODbHnUaeEqWp3rsqK6aQX4C/z74NQs1D
	 oH0piX2GPmsrUcNnXx+KP01BAKdq4Ep6w2GqIZr5nyoyhUILn3enRqBkX/h3tfMlTH
	 fKQpwXoQAoc71n/jX9/3co9V2DmNLCoE3y9BXMIa9C1shk7x3DKo5+R8z7L19NhALl
	 UtO7zFYY5aMj2/E9//MCG6/8EajCay5u5Je53EvcWvcoj1YhogAJqI2XAjEpmLT643
	 P4nvQOou3mwfg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 552C8C53B50; Tue,  4 Jun 2024 15:04:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Tue, 04 Jun 2024 15:04:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-kZb9DjaMd0@https.bugzilla.kernel.org/>
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

--- Comment #36 from Armin Wolf (W_Armin@gmx.de) ---
Which HUD you are referring to exactly?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
