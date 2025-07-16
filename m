Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913FF19AD5C
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jul 2025 15:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752679960; cv=none; b=C9eqmb1AI+rfwTdlE9hXizaOjz3Zs7rsTaXnc7ggVgJSY1aZurBc9AhoFWIe2h1mNFw5XPJZZ7H2cwSQ4swI3jI+zQQANDUfReKfURIbkHL4kk1+SrH3cnTTUQ4DtNt0i0bgQUnGGo9hh5Uvhv7/j2UtXlFXYtZVGGfB83bMHrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752679960; c=relaxed/simple;
	bh=sKe5f19f6aID9hukYe4CKhyS64zZLGiWlEY6gVzvAx4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=boUWUm8B/Nq0suf3ucrwr+5PeH9T4U0MBzyb79JcSzZ+hsnP4G49bJZTK/8qvbkhBZbZuvJ+U9hC+TBb7CtqBOgkrEElSya7p159O4x4ggNoP2Yra0doaf1TSbTOGfXr2I0t31e6bx4TygwoHfRYeXMucrOr4kKK2RytqTNYBNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aFxqIG5k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aFxqIG5k"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E1CBC4CEF4
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jul 2025 15:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752679960;
	bh=sKe5f19f6aID9hukYe4CKhyS64zZLGiWlEY6gVzvAx4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aFxqIG5kCrrFGxATxvYZTBQPnco+HGCN+920ys/nAUnIXFnjfiyWQrlhBSO9+ygOw
	 HD2819I0ZZ1CdOJKJzSWFuuZJRVo9efvd9gFyEGMjzLAy+TMLMDd2DcXRxldqa/wqJ
	 wZBoSAZsveKKqZmK+w7bK8ZCQk5Gwb8IpaA2V0uuVALbLzQVDsRnzhwq4PZSoHhkxH
	 rkBBwINuiwjXCK9ZjJEi1qcu/y2s+xmK+ysu+is1gOgdfudlAFs0Evt3NE2eWDa5x/
	 PVhyNxfMxGZrGjH41JJ85JOAGM0Qtm2s6Nk6ClWENsP2mLuaKP92U7SJcNO/12JwnH
	 WKj0QKUg3ZyTg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 14349C433E1; Wed, 16 Jul 2025 15:32:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Wed, 16 Jul 2025 15:32:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-92LATRfGlg@https.bugzilla.kernel.org/>
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

--- Comment #96 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> 2025-07-16 12:36:40,946 DEBUG:        bios_date: 08/23/2024

You might check for a BIOS upgrade.  AFAIK the actual issue here is an EC
sequencing issue that Linux races with the EC.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
