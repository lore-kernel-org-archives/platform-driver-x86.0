Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3311D149C7B
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Jun 2025 17:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145153; cv=none; b=dgL+sKaRW7VGEoMttYPGdRcrhMRDaGRv3xzljK26uyR4mWjZW97ow6vswvkSOWwkGFm5B0DA1YnzEFUfZUd7p75yti1WJIlxepTgin9VckXeu+EJa6EzX0PE4/n8OJvC5IXLc5btL4YzErpTGEYAICQWYHYtmTu4INJ2flSvEvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145153; c=relaxed/simple;
	bh=xX1/BUziq1f+959kemRnFpu5GVfCr2Ht8V7cKApVuEw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fAzJ5/oM8CwAHQiRykEs2ixE5mlXtxzgrkVDBaKC3fYaII7pkcrCWC/uFw5LwSC2zYsq7tfbVsgo7uwjekAdGP1KLPMBRfIe40yUJdUra/0Gb9Nnk5iSMkAP3d/XuVExsria0A9kBeAtBgDUPYIsxvPpbGb6n9dlXEgiqI88ozg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dLTC9DoJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dLTC9DoJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4FE2C4CEF2
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Jun 2025 17:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749145152;
	bh=xX1/BUziq1f+959kemRnFpu5GVfCr2Ht8V7cKApVuEw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dLTC9DoJr8mIYtgQXJnXrZ7miY8t3KqraYpNjDYzzGFSmn6Ia0xpaXOJ70JdufxKm
	 Fiwu6wfMK3Ix+0YIe3WjhcJe11/1XrB6OLrgjC5TytqeosDzzBzNYiSRoUvOIKLbn6
	 zlWdsEC/f/OmYnjuT2saaY6HTP3gZf64RDAVNeF1jBa4b0QHka8qzqt/Ks2VL9jCvx
	 ZnU7EQTEnn1Ncy+nDzTwQb3o5wIAvM3l3vV/xUANjfYdQ50v1XO6tBxjWd+cbzltoW
	 vVfoC17nnOmwCysMAXN2ws36l3IFdueku89pfgvx0oLDIzZMjhgoC/gM9vEQ/mwjKr
	 bqiGwsVgrUPFg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 98947C53BC9; Thu,  5 Jun 2025 17:39:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220116] amd_pmc - Last suspend didn't reach deepest state
Date: Thu, 05 Jun 2025 17:39:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Input Devices
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ein4rth@gmail.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_input-devices@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220116-215701-0aPAqzXZpz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220116-215701@https.bugzilla.kernel.org/>
References: <bug-220116-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220116

--- Comment #23 from raoul (ein4rth@gmail.com) ---
Thanks so much for your help!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
