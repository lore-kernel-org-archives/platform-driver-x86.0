Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7863C328616
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 16:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194799; cv=none; b=W3iCYS5shMgF+0IqjUMxgQXxxjgzDn27VgeikdqcvpA7WzbCXXfhZqa+p86AbiiF4dRqM8FDHvUT7py0qp3jT8/JHRYotuYX9BY4hB3LRDZqJitwlmi0LOxnlYprI04cWcDEg4HspOZcphiR5eEjCOsjjdh1k4Bwxa4IGpC+06s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194799; c=relaxed/simple;
	bh=+MHL9yISqbKwjikrXIiJXywAejCefBDum+JT8VXRv1Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ROWCPcLyv89ZjbQ+EJwR+7w/S6ZFJDzKS4egPqqLEcmUdbAn1FWy9KITmqIkFARCJ+oYWjpClT++n1ui7prNUy44jA8JUS5NVbvxlqYwmCoDIutg/4jjygvamMkqIW0xp6fFz9RGy9wqByALn7F78TGL1+xIWcdjGLWkFC5ykVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PVcXoAiz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PVcXoAiz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27DBBC4AF0D
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 16:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781194799;
	bh=+MHL9yISqbKwjikrXIiJXywAejCefBDum+JT8VXRv1Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PVcXoAizKGkh2HzQ/2s9fSNCSDMilMybbMN0FBdCTMtDHUz8bLIvzwfaYebYD38+U
	 /X9Nq/as+6ZbWxL6m806w7+6eFA73blI4xPvTIeAnNeKrUT7KwRoSaE3ZiIWkJEyYb
	 hcpFQbPvEaJG1+oe03A6PmGi2C9ky9V04SBvWg9BtahTIco0YTwa1kld7d37bktw5f
	 hJ+on7I6NSFXFuGveh0jrBuyDjLYAXSfws4XvaePq8Zp1avKMVN32FfGI1jSE2Nj09
	 Yeyd4TfYoU4aw6aDpdpTTqZmuS94izTT/UNndiqQQAiT1eXmahiSVH1kvLs88XRDyH
	 Sh7ED4qecqWZA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1E090C3279F; Thu, 11 Jun 2026 16:19:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Thu, 11 Jun 2026 16:19:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chgenn.x@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218901-215701-hy2Id6373g@https.bugzilla.kernel.org/>
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

chgenn.x@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |chgenn.x@gmail.com

--- Comment #85 from chgenn.x@gmail.com ---
I think I can help in some way. I have LG gram 2022 16"
i7-1260p/32GB/2TB/RTX2050. Currently using Ubuntu 26.04 LTS.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
