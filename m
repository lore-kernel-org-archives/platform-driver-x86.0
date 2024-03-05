Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78005D267
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Mar 2024 16:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709657836; cv=none; b=BJktDKNpjUXHiESQXPhENxahUVoI1JHHDt2jJoUSQix+UbiP3wN3vOS+FbPBwm3P2n9INsf9pjBslwtLFrcn6fJyQL09Sc/O4kL7BJHDUV+7961l6nouw5ETFkAtAVlSG1TbVlUuZysEWURMoxWhIvn/DBBhuwZrk4WfMpskCJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709657836; c=relaxed/simple;
	bh=0LocczkcY4tRGl1cZQafSRZf8IwYAm95XlkIPp9Tghs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aZorhSekYxHRf+5gouNELglGm2OXq9kxQ5I6dnz7yI3+MW8Qr9/++STlvWEcff5W4LO8km4xQhvx7fZyCC34NGJTvLv5OoKADJxiUT1LUxS3bFrCJvMZbQXp8wMXfVDQq+v51qSm8ZRLRnXckbpCvax38EAOOfcCXxfLf1FvF+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iLi7GENL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iLi7GENL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0B92C433B2
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Mar 2024 16:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709657836;
	bh=0LocczkcY4tRGl1cZQafSRZf8IwYAm95XlkIPp9Tghs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iLi7GENL7g/hAJIm4BvoXoXIafafUYKFqnEIQSoNsGv3Mzw4cQ9EZ5ZE1dRILf2G7
	 bJ8w3+fFpETtiLW77mwfK06BpuqxKHYIjEoBjg1/PNVDnpSCPbwwaGoasMxbTjvIoF
	 Dbkm4kN0nESODF2CZdZew4p9Ds9QY4RFLMzmqssS6W7DLdXi0KwHys7INlnIBCqgi+
	 eWwZqQQ/yeUkYV3zPko2EZjoGUkYkqR9GdK8AhAZlAYlcsRJgx3igYkY0RLDXReSgy
	 H94CkUx44/dRs+IE1yOZpWilgeKnC0TodWlGgdH9WQvod4kzA7OcDjKkd+WR3PW7KF
	 M5igG/HamWAmQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DF64DC4332E; Tue,  5 Mar 2024 16:57:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Tue, 05 Mar 2024 16:57:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: blocked
Message-ID: <bug-218305-215701-qeKXXcHpD9@https.bugzilla.kernel.org/>
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

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Blocks|                            |218557


Referenced Bugs:

https://bugzilla.kernel.org/show_bug.cgi?id=3D218557
[Bug 218557] Kernel regression in acpi/ec.c causing some AMD platforms to l=
imit
CPU frequency to < 544Mhz
--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
