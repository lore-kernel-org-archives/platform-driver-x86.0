Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3EA7FBBC
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Apr 2024 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712656314; cv=none; b=Ik+2jdkgm92lUDQokQsezQGKhWUxpyApbAL/lwsDChvUUCBMy21lfo91fqr8ZW5avmLio3Z3Nlj1o8Bmxz4sktkU2zvvcV219zFl6hFdFDrK7wGpTSm1POY9anbucCs+sp2bwuHFxDIzNbcdkG5nUjbvvz2Y2VCKpZhYF/7jUUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712656314; c=relaxed/simple;
	bh=G9Hrc/HqRUPLU86xabRv2CUy2whfPtp0bM6nLIFVxsA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U0YbePiUagwgnh1GopDXiDxelMZnl9rk9KNdTTKBlSHAV9p4Z0D3c87TQPC+PH6R38dCP8kGW9FGFcbwq48D7/wuzCtxpp8ZjxmzxzIPdJ/TGQn2S9jagD7mfrTPJVgaeNYmLPxjPinopzvxwGNrAyPbmLf1NeHmqVrHkCRh44M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISiUNzQo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISiUNzQo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0DBCFC433F1
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Apr 2024 09:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712656314;
	bh=G9Hrc/HqRUPLU86xabRv2CUy2whfPtp0bM6nLIFVxsA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ISiUNzQoqJ8+8/hCDLaROceagG9MHT/fW4he1iB4MfAUQicHjgzIwYpPKRq2SLZ6T
	 xegMkfVSfUJkwhxZDLgy0ICp1OZv6yDq1lEyRs+GJv+St+Xn+oMtOkR2c5TGpVmsix
	 p0ZksaaeXWxWZQkADQwrH+C4LLeBWALfcMgMcvg5YjyhWenFh+OOdcbxg0sm7daklb
	 IeWlVomiBGtjcr+C6oVdghu9Vo8/33urFnYAafu4Iwr12OGky5qN4dqVrHWOxcfhq8
	 nIXbMMS4u+2CPDtIu+N1jjZjcajguLMR/rtFhBc2XaO0F68Ys7sIiYwcP16Zp1Uj4b
	 b8gGesmZ6np2A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E508AC4332E; Tue,  9 Apr 2024 09:51:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218696] DYTC frequency scaling deterioration and event spam
Date: Tue, 09 Apr 2024 09:51:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mpearson-lenovo@squebb.ca
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218696-215701-ad9Y3UMtWc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218696-215701@https.bugzilla.kernel.org/>
References: <bug-218696-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218696

--- Comment #2 from Mark Pearson (mpearson-lenovo@squebb.ca) ---
Hi Lucas - which platform is this on?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
