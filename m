Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B0C30E83A
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 04:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776917986; cv=none; b=cCdqWbJUyMVIrRXvQcsNkek4n9eGK9/X4i99zA1WexCRseprNvTkfLLBzbnCvwZssehzdvY6gofCQCLQvskm8QdyOA7YX7M32T+jUKYR+w0x2MjZwqIiqHfuwQbfEhcrV+8ZBeNl5zZ37/uYhlwtVNbZcAlMjdn7a0gUXuPhQRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776917986; c=relaxed/simple;
	bh=h20ylgMzWK1Gz7chflPiaFCxJAnDGazv9rK/HrTuwIw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ck2O7Ge7Tbj74ni06BV3dA43cgZAp6L6k7jO6dbACr/Vl+GFFwgI2Gc+WguBqatds7GnCcZuBB0VrjzMKUO14NWYaidTuHvhYT56Svsu6CNH1wZutcIeYb8bkD3DG7oh2i5P2jEDLHFGB6GVnd5wiDbY/nvQhg0MHKM8LafQ7AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZMzjW8Dp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMzjW8Dp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3EF70C2BCB2
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 04:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776917986;
	bh=h20ylgMzWK1Gz7chflPiaFCxJAnDGazv9rK/HrTuwIw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZMzjW8Dpl8hSV/r/PJW8/rjDSoi71NX9BtkjNW3K2VJGD9aMUI02wetvl90yAeuWc
	 +WxdDcYGkaAT2fVxGvn0Nm56HwlV1SMm6r92CXneoxa+S28H8BnPGolX+GPxjvmFC1
	 44gP+5yUAMmawnSv1fKQkm2sl2rHS0Rz0gvMCQ+ojJWNVpB3FdrTkHLfKuk72juAv5
	 hOTfR1FEFTs+yd7yeLrfC/WdWZVumGzGrDFXfK8tXOaz1V6ChaGdqKDU2lWyG6/sN8
	 6G13lN0kSoFf/+hYOyO8Shs/Eskk629txkWrL8RNf7lbBMuRpeRzmNDQiGLGcIf88i
	 4GJPR0QEcOmVA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 36FA3C433E1; Thu, 23 Apr 2026 04:19:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Thu, 23 Apr 2026 04:19:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: metalcaedes@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221383-215701-wibS4cYLgu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

--- Comment #19 from Daniel Gibson (metalcaedes@gmail.com) ---
Created attachment 309934
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309934&action=3Dedit
Daniels patched ACPI table

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
