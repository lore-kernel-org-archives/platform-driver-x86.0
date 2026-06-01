Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6452733D6FC
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 05:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780293573; cv=none; b=MBaXYmWGmD8KuMvGk+TOMqyeK5wtRUPtb1RA4cazayETtWWr/AeJQrqTAoIkh/9fHgoFfrjR135RgMzvXPMzDtAXuzBGbGE+EfOGPGm02pEs7cg64qNtXZmcrdhw5dYnlCuxSJxrZ7Px2orLe/2S+gpsJ5LJzjcGu8tj3ipdzn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780293573; c=relaxed/simple;
	bh=cBIYF7190DK5jzLJzEz8dBxGovp/nhEtObAkSmrFcEM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nHP5FhVcw3lkSVFvstskYXUqOC58UJGrO5t6DUJzZGTxEOyDjZ8SW9tSNveGd3ZJvSsvfoS2ziEx/hZYhtXINDrC0+gtYv09IbaEd8+DfMoYCkx54VO0tJ5bcU0m/ME37ps0bEWu8GLgoE4o02WfDGriCbgL9MwixutSXUrSUaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r2UnqTUU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r2UnqTUU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F364EC2BCB8
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 05:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780293573;
	bh=cBIYF7190DK5jzLJzEz8dBxGovp/nhEtObAkSmrFcEM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=r2UnqTUUS5DNydNZV1gjFTagHOYq8i0jUwFAcqriJ1FyChB7pT+FUkXM4mViCLFsg
	 N8MQ5Yxn5EoZhLjwo9kSlU398L2GpX7EHg7X6+a89A71SykOPlChzhsc+NSGNStZ8P
	 pJPQnP7iJFo13/GGwsH1fcuq43WXk6ioPrVWSo5Ph4IU7QsQN5Hys3JigAS6P25xyo
	 SbFikX3zbSaupcZI0sBbNPMPypXAepFuAtxn4chawwS51wI2FkPoucofclZMD5sHPm
	 zx1CbeHCPHBXJn4uCFyAn1ynEjoUxx4DAboc2dcfT/MLptyXIPC0D7a3ALk7CTUPuq
	 sRsDck0H/HCgA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D6205C3279F; Mon,  1 Jun 2026 05:59:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Mon, 01 Jun 2026 05:59:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-kHsatpFtX5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #8 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
Thx. Can I CC you when forwarding this by mail? This would expose your email
address.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
