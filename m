Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C36F19F101
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 May 2025 13:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746106906; cv=none; b=aJ5eWs8T54JGLyx3XUjRZkYoPqyetweqpyPcVnPwiV+YnkOeuPanaycn6EMZQ+gdgixmgwFUMBAKDSNbYaItXOyBoT9ldIeYgb48bomyE9hmAHetBMPaR2nsAGr6EYv2mncldv1OpbXCUFR+vE6VgrNBL7bzlCcUfwxlyuYErwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746106906; c=relaxed/simple;
	bh=fj7FOgTbKBl9qsRbgAkUZUld661FZOmQCkhN3xs92GE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AD03PUiYr34V129C7X39lYSoqpVbSUqPYSFD3oXPag8aLdRzuulf/ML+lotb9ZqIm3VC05/KiClgfSoxZ7BFz8Ul6N622IXn1m/3xk4YKt9amtImng7QLpmwoXVh4zgZB+GKWzuzXH9Zw4ZqlZwqGjQEDo6iHXrjWafCZt+1CAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pwcV0O/j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pwcV0O/j"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4723C4CEED
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 May 2025 13:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746106903;
	bh=fj7FOgTbKBl9qsRbgAkUZUld661FZOmQCkhN3xs92GE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pwcV0O/j47bcpfMCGgdxO+lZr2Omq5OqyqWqQ1+hT9F9GzJpqK4ryuPWOHLpZwNGL
	 1/rLfwTKSujO9FX1mN9fDJ76FbQvMQCjlBUaM2/vKRxhcBMbFtXHXvGgawaOAy07wo
	 DCf/pcx1cvjdJJwYqOLlh7GgBlwfAjVxU5rl94KYHNqL5/vxwt38NCxj23Q5v11tTM
	 QaS68dVRmJNc50XRpt9iqw5mq9itGOorihvGwstHXhVWKs2O2gdrCWNfs4FksfCbMt
	 8PFXmsBUvkzrb8BZ+G08nrgtKX+Q2en/84VMz+tgT2IT/ZTsJufBttqJ7LDpxEPRsf
	 AcmYXemPWgahw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D7A48C41612; Thu,  1 May 2025 13:41:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219786] asus-wmi: WLAN is permanently soft-blocked on S5406SA,
 but can still connect to networks
Date: Thu, 01 May 2025 13:41:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernel.t8jyh@passmail.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219786-215701-ydhBWC2JPT@https.bugzilla.kernel.org/>
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

--- Comment #16 from Charlie R (kernel.t8jyh@passmail.net) ---
Interesting. Yes, that was in GNOME.  I switched to KDE and all works well.

Thanks for the patch and the quick feedback. Works great.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
