Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E453446C7
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 06:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780209756; cv=none; b=cTsvAwLuQTRdrkhZIrYmqPzlbx0dcA3P616TYuZtjNVYlygk8/+MKw1HIErFOX3kub5IMZsm8oOzID3gOls7gm/f/0D3ZAvjB9F+pDxUyNEB5OzLN11wvjmSSDCmXL3gh7Z5owjBRMRv7F8J8OSOqa0g06AtSNnbVSIzBTYosGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780209756; c=relaxed/simple;
	bh=jOJ6m28F8yNYY9lAFBOIDKdBs0AvKc/OJM+s5UjBWBY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iw/Xx3FIfuXJ72D5DXXCDB8V9HCRP0Vn8H3wtVAXBtq99NNx4t/xRlRNyS0z/XQ0vK3uR42c7F9rtrutntnb0iCZV3tx1XeJHoNxtA07FF/gMhydhafyTtQcP2Zx61WhN9OJr79MgiJDW0TbX5+6LWRNY1v5LzfRX01nmt8PIaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ayK8zCLG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ayK8zCLG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AAF21C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 06:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780209755;
	bh=jOJ6m28F8yNYY9lAFBOIDKdBs0AvKc/OJM+s5UjBWBY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ayK8zCLGtaMXsNcE2h0LjF2zmM4fhkzHOjzGgnDJCEkwPp4vzcJ130YWW1vztMn2V
	 zgDQYXLarlMqce9KB3HL+cmAeKpR5bqqEbNPucPs2F4GszSMf7JFEvGiKrTr/hHTVK
	 WD3iMzPcrg61BK87HIPMEvoJOjcSJSiHOwW2O4wE9y0GrxARHDOaH1nCXfr8hVXyaF
	 0d5GxO5gTOCPbgfXDryXvTVV9VDygHVPRLyg3c6ZkLwAhX/PvMJmfp10tLZSKCR3Ae
	 fi00H7kPkwtT2d11qLSUQCU+JsGgpRHcoyRB6848wFMsCHsZMAiynAwTZyCkU2YlTw
	 XOuxdRKYu+feA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 893B4C41614; Sun, 31 May 2026 06:42:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sun, 31 May 2026 06:42:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218901-215701-cE7ORZobSF@https.bugzilla.kernel.org/>
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

--- Comment #60 from Armin Wolf (W_Armin@gmx.de) ---
Created attachment 310222
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310222&action=3Dedit
Prototype driver for improved hotkey handling.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
