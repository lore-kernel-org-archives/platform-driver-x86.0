Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE30A95C
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jan 2025 04:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737087299; cv=none; b=KAYBUHB0G0ieMfKDBg6hVZKAVXMSLpravPO0fYTgsbBN/9xmJL2kVaTwbMCn3EIMGFyRcZHzVucTG+f8E/FVnchiJWsGFL0+tvzkwbdSZvJtqGNE77TVbnTZXjh0MqNTgQm2m4Zn4CvmiqoQsfQdTLijFyjv7gLdyKJASdpGffc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737087299; c=relaxed/simple;
	bh=0Vi+5Y4Ux6bIxAgkLFFZad0MRwsyR7FxKsV8V5SAC3U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hduWISK4OpIeP5jPpmRj9gmbXT1NKn1NcVmLKdpBzTdsv4QPzqnuOKsWAowjBb22Rh6Bfg4auuhVyP01tIHyaU5QWEofxtSa0+btLqTTXfNXWrr4MfLXW3TQFyw6gJRAwesddVfRphYxPYd4VfpyW4In06sP+D/60bpPCaAP9hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2afntZu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2afntZu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D5D6C4CEE0
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jan 2025 04:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737087299;
	bh=0Vi+5Y4Ux6bIxAgkLFFZad0MRwsyR7FxKsV8V5SAC3U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=X2afntZu3YkapX+uk2q25G0gbxTQ1r4/9FSbC9iYvNtT+pUORI/1r9xt2mZ7hLIkD
	 +IMsSAbSaMG9sYrQvg3JXmeXr6MZEeAMqop8EdrRS4xkGRYzaUpP57ZmhCuPQgiAea
	 UVRuj0MVnqJ5mmcHlKNB77llWD7xLL8jP+HIzVSlELyr1oscN7W8Z3Y21FiDOL+vIB
	 dcNqJv4hq/A9XKis9A56jj3wDr24Dbb98zEE7CdMN2NY4OO0bJHFfgr0ieCNhxL95W
	 d67fODEfJUBRZlgk0JiKXtGWDVkCfQReML1CMxNEMpf1W8fjD0GK2daMWtAf801pxS
	 ptdACKWu+bggw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3FD52C41606; Fri, 17 Jan 2025 04:14:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Fri, 17 Jan 2025 04:14:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.liang@hpe.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219495-215701-v9YCBXnvgi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

--- Comment #69 from andy.liang@hpe.com ---
Created attachment 307498
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307498&action=3Dedit
v10-patch-binary_bios_measurements

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
