Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBB2364D6
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Dec 2024 22:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734907291; cv=none; b=pTFGf5onz1/kNEy7gkj/6JYRH0xfAxTDcRTF4XnI0vleP622ixzooXdk2yLR8suyAXtDf6zCfVNHnXX4hYuuxRcawUL1U2/kq9AUZlRmKV/Mqp9hg7B9uPCe124fn7RdTMiNoYCXnCNQz7Y25k0rBovgo38PzFx0FY+e8J0AQdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734907291; c=relaxed/simple;
	bh=9wzwmINeULq07Axz/u5/iuXn/FmSQo3SSaNwl9fRo50=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K11xAYdnhIiKRmZ18ontnWP9B0cpOCSkV51WqCatYb4aHMZMos/RHUjPHSP5a8qq7pHEDJA9mMdqfvhKr7hpJ2ax8lGpeiJHLTq4fMwlJNLHEEqCMDoPOwk9QXJ4WkwwRne1d9OGPAT6GR0P/p+lY2FRxMV30hjc5ua6LBvn7ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SeaaM2m9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SeaaM2m9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6BF45C4CECD
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Dec 2024 22:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734907291;
	bh=9wzwmINeULq07Axz/u5/iuXn/FmSQo3SSaNwl9fRo50=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SeaaM2m9TEHGQZlUCTf8nytwWKfx9Vds1vYiknQXe8irHmdww4zNMXxpdaTGUBiG6
	 w7kuEd1nrcfkjGH/lpea4F9+lJMiz7k8/76EggRYmomsSzF/YGy7MfEYDcvvq4fXZI
	 tBRfppOfNPpMIDXYmF7Y2diDjADdSd+LopvF4Nv06g+pNUJE0Kl4GePw3BsOSZbRKU
	 g3jtVTpv+KMIa1v1q6js+KB2w4pA6BTIvQMGFhpO/ggoBOwWfEEDqCgyq3FZD/GoIk
	 spINP9RfzgIChtYi/XU7K3pv8U6/ygRFXWJwrVxKeJ62T6N35Bo8w7dBlSzHHuvd97
	 Sev34V72CL5/A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5F4A2C41613; Sun, 22 Dec 2024 22:41:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Sun, 22 Dec 2024 22:41:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarkko@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-eJGMtsdfrE@https.bugzilla.kernel.org/>
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

--- Comment #50 from jarkko@kernel.org ---
Please put TPM2 table as file instead of image.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
