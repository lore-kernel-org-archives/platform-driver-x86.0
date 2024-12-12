Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435411F0E57
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Dec 2024 11:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734003543; cv=none; b=fWUgpCcO+VQcKGG2LoDeEi8XkdnY2xXiIhyGlBbe+BrcMM/xCqZHem2BXPzxljQBL52/90AGq7P2TG+h13kamNxXIwt4DrFjnUk/JVuJFP4Dj93bxDj8HM1jJT/u252aoXYm4R9JUcyKYkBPLcVvgIPnN1HURuqXlBwfriZrq5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734003543; c=relaxed/simple;
	bh=94FE+mAnCK8WK1+MsoFhVnnTiZCbA7lkVK4qlW5qoJU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ER6J95mTzo2n8iAYWZk3U72K2XouoPhsGJovke58lwpTWqkUnDGmjBcXPnkfEwoZwn4Vqi3ryzLJJ6IdZo1hgcRTZ6jSa8/Nc0uiuHfUlIlIndEtDqHXP9wHYhj72YSjqF+DnE6wACdIRS0GeO5POcmCRfzfIVkCJcVLEqCbImY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R2U3RW5B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R2U3RW5B"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20BE7C4CED4
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Dec 2024 11:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734003543;
	bh=94FE+mAnCK8WK1+MsoFhVnnTiZCbA7lkVK4qlW5qoJU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=R2U3RW5BRal/N2AEaMJKahA/uaKOtlzU6Ek0UjGpl8+hgEa+Qd0NOqBMm1HW05K63
	 5OL3GljRhyFMT+/hS2GR1IjkVH5ps5/iM266TlpVCWq1Ugwn/aXmQclHd3wRtqUU6Y
	 i6C899iL0LQgnup3LQJXs4RDsLzk2Q3t+mlql7Y64FoMrFoZYSrWdAIEiQbXDlVd3T
	 Hlyjy4QioRKFCj34IMo9O0BgeNUu8FfuMw77XBIACUzyGFEjZ+NCQZETDym6p5lDWi
	 t5f6l44np6FmIemPdcPLLBErkQ13GK2iDOTzFaSDcnJ/BcOmruMlHI8IIvTdv3i3LY
	 GtwaDaJy+2YIg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 17E3FC4160E; Thu, 12 Dec 2024 11:39:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Thu, 12 Dec 2024 11:39:02 +0000
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
Message-ID: <bug-219495-215701-sf9EfRDVXr@https.bugzilla.kernel.org/>
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

--- Comment #22 from andy.liang@hpe.com ---
Created attachment 307352
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307352&action=3Dedit
screenshot with kernel-default-6.4.0-150700.1.1.g45e5524.x86_64.rpm

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
