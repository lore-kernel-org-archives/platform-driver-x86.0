Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4A0140E5E
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 18:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709748206; cv=none; b=hR+fibDOkEHynV3tLSa7NPMsWm+8tbyBAyeTwkfTl0swLGKUPXJ3YetBxPrfP4sM47moV2fo2eySGND5RFWFSj1ArcGPrFnyH4sqhNUA1+qtAs54PhzX3U5+fBo4Hz785EUQ8bvAhTg3xgmH60Fhu0txyjc+jhQSySRFJ2SYPDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709748206; c=relaxed/simple;
	bh=nPvWcj99jxyZVH5Llp/w07/nTnapKqGNP3OUzXKB/Lg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=estUSBMlKJMq12GwE6isn5uSyGuiro3qfheSKBWPEF4JRVihhPYwDYDJMU0t6Z9U3+dF8F6ZcCgj2OKeghlFUwQDWzuItbd9FjjdGIsPgHGqMLoMZ+OMoil3cAbKCD/oMMsD+8JSb/uFYxvWEVHxURrWpg/HjY5ScHwqVyunG4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TXSI3eQa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TXSI3eQa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D1D5C43390
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 18:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709748206;
	bh=nPvWcj99jxyZVH5Llp/w07/nTnapKqGNP3OUzXKB/Lg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TXSI3eQaR2rrcj5qyMonyKC9pcXVCW7AUK7Hkt8fqxZq6jJiqUzjqU2qwU897Mkj+
	 dK9LzBW+Ceyxe6MRP5anEf/YVDHX3jAaKfFbjdn0ztE+/4FI9YluLDfh77goKen1mC
	 m5MzMhmHQR7Gqg/n0wESDSe8t+liIxklNeStyODPvWl5eh7L3hV+WEm62q7SrC0pBd
	 EnmkQY7PHThaG+RbULFX4kEaflus6/Dz9F/EErP4nipksLQZELWIaRHQ/V5RHeBvfQ
	 vhIfFYvzVnH9+0DlhKz+JvlhWXmNXDGeEvrfrDyZR+M//rdhAI4muNIMCjUsin3zqQ
	 4d8mtaYPJ8xtg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E2BDFC4332E; Wed,  6 Mar 2024 18:03:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Wed, 06 Mar 2024 18:03:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-STFtuUb6KV@https.bugzilla.kernel.org/>
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

--- Comment #35 from Armin Wolf (W_Armin@gmx.de) ---
Shouldn't the driver generally restore all CPU coefficients after
suspend/resume? Or is there a specification saying that the CPU coefficients
will be restored by the platform firmware?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
