Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4DB1F1313
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jun 2025 20:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749761360; cv=none; b=pXzfhnRgFT8hOC/ssE3bgZA6WWfnUooBxSgqpp+Z1TPMsfdnv7upi56+BNftIXqI2AYn6elSrHt8pjG54n7xRvEXf8+1q5OqwYKkLd/xAJ2cpP6IJxCZqq3GMjNpJ4p09H5zHN7DCz+8ZhPrFlsVpDtZZk7d6ddFpADod5EJaOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749761360; c=relaxed/simple;
	bh=Yv+zxsca2XeuX8TfPtj93MO4H0dQpdgY/fcAmU/hQ9A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aN3frONtwV90uC5XuWUEANRuf09qSO/OkIp0LJ1cfCYZaa6reEp4Pt3Td2SzIF7jttszRNHf5HDQ3kHXRx28C/GAu4LpDC7LiKl2gLuL0uaJroFWY9K07+E8mh9rtt2uQ4tAd3q9ICkZ7IKV55XXH2OjWLlczz2KUxuQJo0s8TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kVa+WiKM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kVa+WiKM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AFD7AC4CEF1
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jun 2025 20:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749761359;
	bh=Yv+zxsca2XeuX8TfPtj93MO4H0dQpdgY/fcAmU/hQ9A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kVa+WiKM4Cs60pvQNG33A7AMdPMxiRexeY2DVDfY6S1peJCdDcIpTTZynT+S66dlk
	 UJRff5NfkKRDCEcmlqir1dJYWDOTee22+BqERkQRLU4TVSU243FnbtX54TseZ6FHHH
	 o2hTyZfNrsE0IvwqXLd4JNdO2YtS1F20GXCDGFJfXzL2TBP2IYnEKqk18sXRA06d4i
	 Kk506D4w8wfFzC6cmzq2UnG2l+r4051skKwyn8uwYUNWxVwphx7StXc5b6P0RtL7Gf
	 7xcrM8c/14kK7EHAZaa67ddIXbsH0Tjv4DFyaosMtSc1gDoC5H32yN6nWcnOFqyVg3
	 HAj3MahO82YzA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A1356C41614; Thu, 12 Jun 2025 20:49:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220224] Kernel 6.15 causes crash (general protection fault) due
 to amd_sfh module
Date: Thu, 12 Jun 2025 20:49:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: g.molinaro@linuxmail.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220224-215701-JU6nr42BLu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220224-215701@https.bugzilla.kernel.org/>
References: <bug-220224-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220224

--- Comment #1 from g.molinaro@linuxmail.org ---
Created attachment 308235
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308235&action=3Dedit
Picture of the Kernel Painic

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
