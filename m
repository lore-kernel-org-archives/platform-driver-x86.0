Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180CA27FB05
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 18:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781204082; cv=none; b=mYyf79NSv3p4r0uJGXNv8IH98D2Pmi7b/I06UV9fMUFbTVXZvR6R8brW1DWuyPkUqLGxLAcVuettEpFtqhInX7Fp914pRz0xfpjT0jqg/M+7l0sZK2l/k0MDdN6Azg7bRWz3c1bsA1R9+BG9Z3b15HqNaILijpD42D4Wz7gYX1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781204082; c=relaxed/simple;
	bh=0Y7uSMIK00NcmDSc7kAt/V83qIIFNaoVtLk35lmmmBI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eo7kRWvLx/EvWICcrQE5DGb6Whs+eDC4sA537gqBmtvNO4ELwoX0IFp0GniKt4U8AWGVLXzxsdzAyZvl2/GggHDNgW/Koi1hhteTXaKl407AjlmN51ORDXb+LKPAP2L7W4EtI/iU4zKxvNIL6SLXRi2cKDo0+pPkQJJzxOC1j8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TJp5C8ZA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TJp5C8ZA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97A01C2BCB8
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 18:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781204081;
	bh=0Y7uSMIK00NcmDSc7kAt/V83qIIFNaoVtLk35lmmmBI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TJp5C8ZAaRnTTrH3JmbFuTtjeoD3WHxgMqBrTtOfD6yIcmgS+3AX2JDSmGqH+2BSX
	 Z/lkY56c9sgxrQIVSWu+7KdIQO3oKcUkeDzzCU+5UVGDUkA1XZrq1uT9AAwOTGG6N5
	 zU9lIbexkmTAP08vQtsV9YwZSoHRJfk9wfv78NhCtWfDS6Om/DVvVhEKRNZeQFWlxI
	 kCnSRVwnpD3T4ePhHpM6lUKEFqb17nVAx6glb8G1DfM5swNk5Gimwju7vOkGV5buZg
	 M+iHaI/7rxICquX12hUTFvVm1ocjMpnO/JU5eCik+MfDapiu2LlN7iX7JUqJKZEvy8
	 xQkwHNUx+ME9w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 75D6FC3279F; Thu, 11 Jun 2026 18:54:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Thu, 11 Jun 2026 18:54:41 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-MTZutIzn8o@https.bugzilla.kernel.org/>
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

--- Comment #90 from Armin Wolf (W_Armin@gmx.de) ---
Does Gnome show the current LED brightness? If yes then i would like to know
what brightness is shown when the backlight is at 100%

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
