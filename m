Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2F91B6CE7
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Dec 2024 19:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734290884; cv=none; b=pCHvZJ0WKZkKJX+nyCH66W2ECDXAzkllhVjrIHnDEoQnpm73HrqyfdJG3ST5W6rD9IrT9VjAIHsqQVV6WRCP5zeihnhgzm8HPnKfuIeR1vfO/wlNCUu2KEc/P0+KXrvdynlP/otLU1awgZiev+QiN09kiiqPtRU6iRdo0q/VIiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734290884; c=relaxed/simple;
	bh=Qi8rzijVfkyIJc/BVL5IP7OVyk0WfKd9UhaYn0VM2kM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u7XMfJxuCrkk5WJ2ASMGK9o8etWNI9aSUmB42AyVLDe+60jmepG1tSct6GWQ5In2u+btOY/8mvr43Or4zBdiKapNNYpctSr/uQJtef3F/56jyGgs+KBQxy9K8Jp8i70dGqYnd1+u1tFRQCbHJ33TS2yRwAyb/oCzffBTETIRHzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m16X3UCO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m16X3UCO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 255E0C4CEDD
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Dec 2024 19:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734290884;
	bh=Qi8rzijVfkyIJc/BVL5IP7OVyk0WfKd9UhaYn0VM2kM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=m16X3UCOOjvxhIDrOpLKCI5rKd5PPzNrUbem5YX9pMaCc7iN9zhRQzZ5kcwUUwuOc
	 WJ+KSdJXJ543Tw/U+adSIpjymyOXUN9AGhm7qbERKqm+gjzaMjCd1NKMbqyihC6WH+
	 5F+F7k6Fwi2zI5kM3TT6NHg2C+jw5lJmqalLyqyWslJfb1/OjqtLz0aHfXkoPOKJs8
	 fAxDFr/do3X1j2Lk+lUbsQNQDOtWN69AvjFQFWlMqU4wqTpjZD9Pgf2nkBeKDGfMT6
	 8asUqr0SmIwG60WwWnbDqHXhszFqHUHATW8gZMG3twC4gb21y/0InpH665FLQOqIEJ
	 PNIu9+9APWkhg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0E863C41612; Sun, 15 Dec 2024 19:28:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219517] REGRESSION: charge_control missing in 6.12
Date: Sun, 15 Dec 2024 19:28:03 +0000
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
Message-ID: <bug-219517-215701-tqJRbUc0c5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219517-215701@https.bugzilla.kernel.org/>
References: <bug-219517-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219517

--- Comment #22 from Armin Wolf (W_Armin@gmx.de) ---
The linux 6.12.5 kernel should now contain the necessary fixes. Can you giv=
e it
a try?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
