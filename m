Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7243338D
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 01:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712711725; cv=none; b=M8JmMpXPrjFnC2GMNuCWCmSJAmxhXY9acY4VuPIlcXSb/GFGw38HBqaUm+2LF6lchMSP66bddMnYWdWLDV5MoGTkFt3MiOtEP5WGZ70lspxqavMnlb6b8BzJ4WjGVRdMK1bDXFsGmOMEzQJdNhTZfM5vqi5IpAuoYw2P8jBYdE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712711725; c=relaxed/simple;
	bh=5xMdEwonwllKD9ENXMQrkmfG4ImVUVR1V3+XCWjP/64=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m7MiMG1imu7QIvyZucqV2VdA1tYc+ueb8XORz4vLIRwNLAzf3ELXjYLddr7oUMdj8lJH8rCodyYBXVS7IQVaVdmsqiJOJK/ptv6G+dNfEZlpKQiC/SH4WaIjL1iaZ0YEkSFSbFIIFiM6McN7KOY0bD//y0uRi3Vrj6KXyoZS8Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lC5rJaho; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lC5rJaho"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1C36C433F1
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 01:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712711725;
	bh=5xMdEwonwllKD9ENXMQrkmfG4ImVUVR1V3+XCWjP/64=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lC5rJahowuOv/NMBe8JoAlB2hcU138ZU4HAkxXxWqGeJQ99+3w/5PcDzDi5Jvf3SW
	 8KZIM/vO4OtLVTTAYWVZYe6y4mNb28fTxW9Z7YOPhlr3RPSRLeE0MXMcHGWeD2D7tG
	 ir2+oNgLSilgafwRZO2DIbtADFbC6hmFmUZWTfd4soI+7MtNnZn2+0rA6ROp4ZqOwC
	 yfsHSSdbnLPHBI4qqY1i52tJgPPWHA1UjrNhxvi53Iq+vpK6w1x9um9P3u2RIdLMi0
	 FzOG1CzNXg1P6vn78PWqRJ8T5kzcQt2oTP51V8Cx//FLczcjnZfuq7cS6N1FyVT9Pb
	 aK+TWN7F/T2CQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A11BFC4332E; Wed, 10 Apr 2024 01:15:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Wed, 10 Apr 2024 01:15:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: al0uette@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218685-215701-HsllrvBRsz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218685-215701@https.bugzilla.kernel.org/>
References: <bug-218685-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218685

--- Comment #12 from al0uette@outlook.com ---
Created attachment 306115
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306115&action=3Dedit
log of amd-pmf

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
