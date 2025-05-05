Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4C2156F45
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 May 2025 21:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746480454; cv=none; b=B9UYRJ+3P4IXDv6IRLhZHtatnnBdqZqYjoRFcvKqbO8502MRZYzDLEJnRu8r103bzA8EmLmZ6WT99ywRRjzGkgvZtPD9MMMJDQDGzDLIQTbH8ak00eNbyj//SpIUnCe60oq/quZl5xfit8bEMaBQxFE9QZyNmWEAQvz0im5JXn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746480454; c=relaxed/simple;
	bh=bzxtKwOVUYZvjDID7h2oWqERyMQ8Q5PnEhl8VGEFRm8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lBPWmPvnhZv5/rexHAkt33HrfV7HXrhVoszDdOvzItIh8f7e2ravU2pOO2k4iAzJQc55l8lVPUN9sfdS+pzo5EX6Daf799Wn72VZ36QWCYdgyX+3VCIdaeKeIDSUYdAo7YHboEY4hUJHHcSJ+wq68ZDhAUCsjanxGDF7AlynA0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KlzY6VLz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KlzY6VLz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90116C4CEEF
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 May 2025 21:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746480453;
	bh=bzxtKwOVUYZvjDID7h2oWqERyMQ8Q5PnEhl8VGEFRm8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KlzY6VLzLqbGoCN0DwrSM6+VHYeVupp3+df6ghZ50VHv5Ho2fAd/9/Qv7b+gOVXTP
	 fJmd2JOjm8cBcM6MXR95E5LJJqkvFUo/TZaccfJ05Szd1Kx2Ac6R3t4v20Y3wwvD57
	 YdTkIDg8wixry1xxlE2XB39hOUe53e1HYg39ssDwdXcFNj+TZN12wlE+Iwq8+9Ysky
	 chLe9e1xIox3Jby7WQHBRGUEdclmhzz95/a0yj7c3vBaUUUovpFNZ8x/RgEWbQK8vE
	 4yhPN3vxOtfzH3vo5HpRSO/AckqjhCdy2avdcahIWXq+1Rnjo5S5Lc7B5jAI+GFXqH
	 /mN3lQrTik7iQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 843D2C53BC5; Mon,  5 May 2025 21:27:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 05 May 2025 21:27:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-hxnme4Efze@https.bugzilla.kernel.org/>
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

--- Comment #94 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
It should be part of 6.15-rc5: https://git.kernel.org/torvalds/c/9f5595d5f0=
3f

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
