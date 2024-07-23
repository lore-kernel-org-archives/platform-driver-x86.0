Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2707C13B58D
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jul 2024 21:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721771187; cv=none; b=ifs19aW87hfMyQ6rMyyK0fIOD3r77YSFfVDJWOiOX4f/zGsSOazk1G64Z3Wt6HUcJVPE1bzfBsSqZQerFDOgdr8HqTtinFBg9KmBT6ZKAXmaoMHPr1mttPPA4Ks16B5hSg7fEqYe0vt883SGLf4t61yw/5RqEsxrQEIQxRNlT0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721771187; c=relaxed/simple;
	bh=9au5NeTdcLauQ9nu6febmuYWJ0+TEh9SEJSxdxhXezg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XBFQKvXAZkcLaw07Oq9ElO7bRz1d8qqq3nCOHjMlE1UCpKrdSIz3DCGp9CcE22kCgJgz/fGo5sZsh9MxRPcYy+orHWPf0mnLgPgFJgjgsFl3O1jnhWZKPoQf0s/9FT6mDVjvp4L2I+tBnhVCX6h0eMCkk794Y9MBB+slDidu51M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hddWMOjK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hddWMOjK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2847C4AF09
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jul 2024 21:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721771186;
	bh=9au5NeTdcLauQ9nu6febmuYWJ0+TEh9SEJSxdxhXezg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hddWMOjKNe09ql6Xol5nE4YmdoecXsa+nhCsj+e5jiW6GuUxo2BJp4ZaAUgKNIBV5
	 UbxOEsbyqINYeap9necIzE2UOxmZqJtGWqps0VQ2ssAG3GZI3LYZcDVMQ4yStsG/HH
	 OVaeFtd3rlpkYjRYix/EClcJrKXHRhT2iPJmOesV8w1HmB6umnWR26LYbceQBCIM2T
	 SVuO9yaBF931yuzeKmxAcqMRLYZR1gvusv/CEGvv+i+yIuh0XJJKqXQfLpXv4KmZTG
	 vLOrTJ4SLmZr2LIG7cJjmQAmtUbzJM/HZ8xVMB/0AGBmREH5vgySsDzvydAb5T8VNZ
	 yZg+jqNmXqPlQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8EFFDC433E5; Tue, 23 Jul 2024 21:46:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Tue, 23 Jul 2024 21:46:26 +0000
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
Message-ID: <bug-218901-215701-LZYw8bkQo0@https.bugzilla.kernel.org/>
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

--- Comment #50 from Armin Wolf (W_Armin@gmx.de) ---
You might close this bug report as fixed then.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
