Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1F33161BF
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 20:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781208342; cv=none; b=aaRMSE+WCr+a7LegBTfvybI62UjWg0coOwkBYdIP3Av/mADcxJ8wsAssRyUo7Qw9fpBCvttikAk3z9cAFddiWb5eCB+lFLkgh2iLirB26bNex9UVpeqx8+YUJ+VoBvZ0eHueKHbjHwQ2xq81hbT9s0pn1zfUyV78fWzmBvVOejE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781208342; c=relaxed/simple;
	bh=82v0vsGQ7MdAiK/fVOobqMR0UvRyRoNHwiUkEbCt0VM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CQO0P3wtg4f9CMUEcvO1R4oYVQmn2wgW0KtFEtKyYtt9StQhDfQJksoMGMpdJ9O5BBJZLKKj2wsPYKj4tCsP6bV8M/gUSEOZddAgaF0TJ+O1E1PH1fWa4GIlxCHR3KBsHKyuRFXlmRE84hCffy+VsWQRsQJ85WMymOMCtTvY1MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VhyiMAmL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VhyiMAmL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2014C2BCB9
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 20:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781208341;
	bh=82v0vsGQ7MdAiK/fVOobqMR0UvRyRoNHwiUkEbCt0VM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VhyiMAmLXE/DKauG+EolONXe4IevHzq+qqSXwpL8GCCYfxPntrR7Mxz8KIXmH7aig
	 KTbEuTYuxHcSydIox9Sk+BzYvw4FsYTAJK1YHj3pHeCF7L0gcnNIFDZkOo9Y719siM
	 ikYV8OVRvbedZb18JB81UrlPfylzM1dKgzUp3AtgmqQPqpXdrRsVgG2zairES/DdNb
	 ioQje+4zKLYusEtt5swSnqWhfQtsU3613iQIq5MWz2rhV0LNz3Kmr7BJrGKFo3Z5+m
	 8UQmBS7tx569aDh1GTF0ujVQrv6eh+kswbUNAlFsjN1nk0IpTY22+Ilxd6hjPvkELx
	 DYVYH1cCXvqsQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A8E09C3279F; Thu, 11 Jun 2026 20:05:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Thu, 11 Jun 2026 20:05:41 +0000
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
Message-ID: <bug-218901-215701-zkcwzTFOhw@https.bugzilla.kernel.org/>
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

--- Comment #94 from Armin Wolf (W_Armin@gmx.de) ---
Well, it seems that i need a bit more time than i thought. I will try to up=
load
the module tomorrow.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
