Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD233431E9
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 09:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770628219; cv=none; b=kXrzrjryKz0FkhNO15Pr2F7vof5f+7bVcRGVJppJrH8mwnWWvkD7zlAc0P0f9+mWWARmMxCQdLnZ6W0bvCGjPwqVyNh52vJ8Ba1CvE+YPFs5nC5B/U2GE7Fg8uW7Aovx8w1lIH4s+/pkHIl6SCi6r4NHTV9YraIfnfhImZFDfsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770628219; c=relaxed/simple;
	bh=aRtLYhfuHcP8SBmHICHNYD2tmgFTK14RMoqbYHiktiM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hu4f4926sdY8odTe0qZHXGv0Hux2+UfmQKuuHPSuHVucMRAIkyGQf4KqjIZj+8EXoi7yWFrcKeEOM8B7chzF6vaqury8EwY08I9xCVfQDJ3eoNTN0Iu0M+Ppo0uPNNc1DZDgtTczYMagCwizjraUZRCV1imBIzohr5TIYJGkBok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z4Bs1bBG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z4Bs1bBG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3DD3BC19424
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 09:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770628219;
	bh=aRtLYhfuHcP8SBmHICHNYD2tmgFTK14RMoqbYHiktiM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Z4Bs1bBGA3FdHhWxeY3/9CmsuWXgd/HOevqo2n9ieOVmLmzJE2jaStpdoUDB9Mavo
	 ujxZybBRK3yvzUVsOSu8i1tbJYYDb6hfaO++Ekr0bTw9VrICrObx+suJkXWhz28t0w
	 o1Ek2uaEcrzIyEdafRanf80H3W/lGD0Hg0zyCqj0D1rJ7RNv4Vc1v0+zaXwRA0/e+8
	 IlCa3wSU3v4QNsZAguRxu+uzaIiAZ5ufh3wrkiMWziIW4Guy+ndgGnoVSMnmjiF7+0
	 6+39w6nTHdli9vW5YKVQHFYxhttsO329KYWhOjzlTHUoOzbIcWlIZJNFk0vuld4z0m
	 lTRllKYvUq3aA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2B654C433E1; Mon,  9 Feb 2026 09:10:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Mon, 09 Feb 2026 09:10:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: rbitton@linux.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_regression
Message-ID: <bug-221065-215701-TkR8xtwRX2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

Raphael Bitton (rbitton@linux.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Regression|No                          |Yes

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
