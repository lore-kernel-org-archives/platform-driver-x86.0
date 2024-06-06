Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4B93A8F0
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Jun 2024 05:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717650119; cv=none; b=qqI75CG07uxX8pddQtpQtMqB+GnE+ueNxaRKST+X922t7ONXa26Dm4Pj1kNmrhcGsNhXg1zK2dLillZJSWtmiJoSRZlji0UoabmIO97blKpVKGr6jB+j1MbdzvLu52MHmgN7oeoh1k0qwcuaU3DmnHWuVCHnp1pd5zN/cU1IsfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717650119; c=relaxed/simple;
	bh=gbMnxmOgksh5joQvcIPA2aZo622gTlnwbObxroyebRU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X1UDERT4/fi0oLSYu+nh+lXlJpmSGmn9+OOoS7QI5bt1xo7GlLp8yGsbuel6QUm8Kdsoa+3FhYbR5BdKaoze/l7xRMCsS5l2eKDruGLvC8rlQjJ96ISSG98M0zmysLfryqOmqEnLlxhdijQCbWYtUP/yDyUnB12DDYUtl1s5zaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2+ypbJD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2+ypbJD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4921C4AF0D
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Jun 2024 05:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717650118;
	bh=gbMnxmOgksh5joQvcIPA2aZo622gTlnwbObxroyebRU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=X2+ypbJDOVOQ+e+x/73gG6HAXd/iwG/pb6P4Yr4fdHJMTRbSPyOJJSb7KyQbH1VaE
	 DlmoBaOSRI2ofBh1N+UKQ207UKuyut+HvfIzLXR4E7ELt1EZTIEvznrVFDlXZhWkO7
	 FmFK7SlRYzfME8qhl2kcaPZpcIllG6MeAoohVYUEk1Tx0di3iy5J/8UJ3Xg2A1lMVN
	 bZuLVqskPgYmF16ZRYPirTvK9cXErnCvlwcfDY+RRAro7BZnxfU0HoOrsXiWNSoczM
	 L0Q4hxeXkKXOa+35FR8u/3LlXipEmrPipKiL07vBKPAxMlC1SpdD3InIt1ojrWnjN6
	 1SEs3moIsGWRg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9FE9AC53B50; Thu,  6 Jun 2024 05:01:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Thu, 06 Jun 2024 05:01:58 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-218901-215701-rBc0WJrB6s@https.bugzilla.kernel.org/>
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

Armin Wolf (W_Armin@gmx.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #306399|0                           |1
        is obsolete|                            |
 Attachment #306402|0                           |1
        is obsolete|                            |
 Attachment #306403|0                           |1
        is obsolete|                            |
 Attachment #306408|0                           |1
        is obsolete|                            |

--- Comment #42 from Armin Wolf (W_Armin@gmx.de) ---
Created attachment 306424
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306424&action=3Dedit
Prototype lg-laptop driver v5

Final prototype of the lg-laptop driver for upstreaming.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
