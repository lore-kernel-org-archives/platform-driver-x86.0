Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75367416CFC
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 17:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780679888; cv=none; b=ZiZKPo8o65jvQ11H3LCpf2Y1vrG6bWDAn10NtI44nTXwil49aLBMakiAWC7c5Xb5z6XG1y6GABQAZH1nICbatgafqpkfkV6I4ePfBmm777mO8r5pM6KQlesplqJqql77lKowHypZHscj6yoIbHc6ZM1mGT+LiZpGbb/QBCb83Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780679888; c=relaxed/simple;
	bh=dWkjyppZ0HoU1MQPzwzyVYdBpXRa9GRCTXU63kmaVpc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UcvFW3o6lYeUwCY0wKe++fMrVTM+D3o3m6P3BkpzwgypQAW2Cnqts3DSdZUT2gsOrVprr0pO4B3CFYVz1x91HJqnfctAWjk6pDAwL1TcYdS+lSFu5hZNIuXY3gLu4vVSaNkwoNEpOBIdLHf6eo3KAs/yZF6SCfKC1Pddev9t9hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tBvSeTjp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tBvSeTjp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A32BC2BCB4
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 17:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780679888;
	bh=dWkjyppZ0HoU1MQPzwzyVYdBpXRa9GRCTXU63kmaVpc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tBvSeTjpcjd3h//A+mx+jQoiyyg+bj+9ws3IVSQ13Z/xkIvgA4jVaRu9lQhilpmp2
	 Zp/0V+sr8jrxzHJM4mA4r5pcy0oZgp2eY8TvhznisgNDVMdEgj8npk5ceWqdslLGdz
	 oXunQ+68atJ80Pn1QT7aqzONYgS++eSv9rgh695AcjmfSSbASqNEBcRGuGHicGJOCT
	 EwKHIRdFAZP+qf6PdZ65f7YCQeLLw2c2/WJ+IqGqq8HcIdsdkuAiJhSujVhfPo5yli
	 DJrKmnKLowhC7EARGmhbjXDhdbNEMbiuSVLA7yyjIaz2rZUrBdt5mGdZkzGjuo12wN
	 1AMe2ZHFpln7A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DBF2EC3279F; Fri,  5 Jun 2026 17:18:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Fri, 05 Jun 2026 17:18:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: george.stafilidis@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221583-215701-NjXDNttknT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221583-215701@https.bugzilla.kernel.org/>
References: <bug-221583-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221583

--- Comment #15 from George (george.stafilidis@proton.me) ---
Sorry for my poor responses. English is not my first language, so there were
some things I didn't fully understand. I also used AI to help me with certa=
in
parts because of the language barrier and because I haven't had much free t=
ime
due to exams.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
