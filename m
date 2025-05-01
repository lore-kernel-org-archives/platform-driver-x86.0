Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BC519A
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 May 2025 11:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746099400; cv=none; b=dzsoVw3OdhvNeZqfKwhcH8a5mvmw5R1qQLIbQ2SpodW4zo2XYZFB4nRLH041AtRNfdWxLRHvur5m6gYzmoT2F37fIs2kMegOkpY83H4FFxyVgV71Lqcq0Sq8qqk5XRfHvR62h+KIUm4XSN2AyneZIxfS3dTc2XR+nhee6o73yQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746099400; c=relaxed/simple;
	bh=7lzgUfENsHZFKLMjYe3ZCjW8cELVWaQrRDqS9Blvjl8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NFYZovSLZ2IZtHCh41KTP1izG2PrWPGlmPM9ajjQiwzXKOMUxozzBDa0uhSst32FW5XseYBrABxS1nZUIbWlQ/T9iGejD36rY7Ue2pyRU6+ZVluPhrHgmQGkUckxfpXfOOVPEjiS9ZYaTbg+CbDd0ry3rkGaEWd3knjWmUnIc84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gs1YNE1Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gs1YNE1Y"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69C5CC4CEED
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 May 2025 11:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746099399;
	bh=7lzgUfENsHZFKLMjYe3ZCjW8cELVWaQrRDqS9Blvjl8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Gs1YNE1YIN5o51v34zyP4uyvUOtYkI1f5Hb5RryQQKETyiexMBCuzEagAuAVFLJmL
	 xJsuxp+Ck8LXnyOu2b1NpWTiZ59ypEzREd0saGsDaJ8iv9lkjMHNDNjIhYRT2GyAuD
	 zOdDWgpPcwxv0ls4bOvS9npNW60lPFCbqpPu7fesBPVpwikN8lo1VAXmvcQZcUzaVp
	 LnL6J5zfLyu/Meqr7lY4ww5K29sjx+grN1pD3aoLidN/niciyC1uWcDnTRODDh4pTV
	 mp+4uLR6KuLcbNOHQVPxTfx5QeFBb+QTZsm71kASipMq92vAtFTQd8DN+4gM4SVLjJ
	 +QZsP9hdIq7DQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 64CC7C3279F; Thu,  1 May 2025 11:36:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219786] asus-wmi: WLAN is permanently soft-blocked on S5406SA,
 but can still connect to networks
Date: Thu, 01 May 2025 11:36:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219786-215701-N7JUpg5OUD@https.bugzilla.kernel.org/>
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

--- Comment #9 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Created attachment 308064
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308064&action=3Dedit
[PATCH] platform/x86: asus-wmi: Fix wlan_ctrl_by_user detection

I think this patch should fix things.

If you are seeing this problem, please give this patch a try. See your
distributions documentation for how to build a local kernel with a patch
applied.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
