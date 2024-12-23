Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBC417E473
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 08:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734943406; cv=none; b=kd7yZMLKmncHHvyEzVXV0NXcFkkMnEkFcsXS20bmBggL+33MLu4P/esRK1UYOUdC2opevLi9zcgKGwnhRUs049rGHw+WfLdTRq4jf553wpVSZGJ54Dws18L+wqGouKaO4cHg80z2xDi012sdYaXdL7X5gnqyZ6p2j72s8QiOUGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734943406; c=relaxed/simple;
	bh=EjD2CVEVPBevb+r/PkSVY1EUp4S1L87O63J4wJ/xObY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bfTurExMNlXauVBPEtShFoBBp2N8CDq8LEF1nSBB2vLoYlEfUeoE47S7M7lwxZI6pmjR1Z3c0BwxPDzV0mvzps6/bMetFDKfjOaibezarelYobnOyr4a6llJpLcL3reptTZVsGeyPCa345E6lL59DKF01kZDU0ViJY3cLHEH6r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RiJ4uiVB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RiJ4uiVB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36A30C4CED4
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 08:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734943406;
	bh=EjD2CVEVPBevb+r/PkSVY1EUp4S1L87O63J4wJ/xObY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RiJ4uiVBo8nBcLhaKd5LGTWb9+8/tloRxnBUW8q8Lfzny9bK8BZqnbwlyV6VHDrP4
	 Eh8zJ6UFONDITQ8IxZMhdixdZJQsKGwxiayumua+EvZ/P63fiSLnluLlwYV7kQx2bQ
	 9ItfmPjEXQhPFrcTKHExcZcwjgSC2asb6n6PnQMaDjVDWKa3zTi9KhRfuS9rCqHp02
	 7EW51cS8UrYeY6E2ErASqBebsSRgymD2RRxaXQQ+Jhgyah/IuXrYMXtlSxiMgROqhT
	 eP1T3Onc87fIuqEaqfClGXuwtG3gXr/1zRI+M/i3NuA+SZGlBrArGcxrtarh+YMLdi
	 F01h1O1M4vQxQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 32B9BC41613; Mon, 23 Dec 2024 08:43:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Mon, 23 Dec 2024 08:43:26 +0000
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
Message-ID: <bug-219495-215701-0wycrsJV9s@https.bugzilla.kernel.org/>
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

--- Comment #57 from andy.liang@hpe.com ---
Created attachment 307389
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307389&action=3Dedit
v3-patch-binary_bios_measurements_kernel-6.12.6.raw

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
