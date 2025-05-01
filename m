Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73D63BBC9
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 May 2025 13:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746105491; cv=none; b=uAiMkUVXfyQ2Yx7VdKc2WQs/cgYpJQxU2tlX7bhHdTm8seeUtJ8cYvAo705RqfO1SiTuwhrbpDe6sT1LfvnLWGlN8w80DPAqsMGJKMpoaUV2LhTu65nDW9+QGC8xM3yyrjKx+RxZS0uhakLE009JSgCN/0FvGgxomyAt5fMmzTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746105491; c=relaxed/simple;
	bh=BpXWR2v/6aD7XqeLW7/t++6Nkepn1wrzcL61vZ1cPhc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cUmCe6rruYxl/dgkqEYWfdP2j7xsvLnOv4CINUJQh2PS5iaryagTYIX+GruuiNWIZzhb0gsbukfjJJXSfqDkkgJIl2Sy2YxSOdEy0wJxRy+NmVHTQHjsmEs/LaHYuahQthj0yhucSJCaLiqJ4fOLT7Y4Ziu0UXUmaCgrjXLjxtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VNCY4yUg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VNCY4yUg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C38EC4CEEE
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 May 2025 13:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746105490;
	bh=BpXWR2v/6aD7XqeLW7/t++6Nkepn1wrzcL61vZ1cPhc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VNCY4yUg/LiNCn46OWr1fA7nLx46IGrltaftrhxHbdvIzsSp+yr8RuPMZvZnlN0zl
	 baJ5CU6Ee8cnL1NqNCpQZbo8zQbzG3DGzC8bN95E6LihBuvQ9qYWy5MMzhYU9Ie4bI
	 6OxvEpXoEttf+qKZpbuWdrGbT5+c9OZeDH+xD7/hRNZIn7EZWgyg+OxDbOEfAgiP2W
	 ZIdFbXlx+FLZz6EHDysf5E4aAg1Bzb4thAmQ5VMQiMIJernvX3aMunGxJGdXtic2ma
	 X8bzIe0sZ+64S8CgmkDyXlGGuPRsGittne0v7cqP4PBGMzcgiO1Cnjqt/XHHP5O7A+
	 hFVHNM5bntdrA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5FB5DC3279F; Thu,  1 May 2025 13:18:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219786] asus-wmi: WLAN is permanently soft-blocked on S5406SA,
 but can still connect to networks
Date: Thu, 01 May 2025 13:18:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
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
Message-ID: <bug-219786-215701-9sHlY30ZGC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219786-215701@https.bugzilla.kernel.org/>
References: <bug-219786-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219786

--- Comment #13 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Thank you for testing the patch so quickly

I've posted the patch upstream now:

https://lore.kernel.org/platform-driver-x86/20250501131702.103360-1-hdegoed=
e@redhat.com/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
