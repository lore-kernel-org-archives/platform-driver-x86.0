Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AF030E852
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jun 2025 21:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750369144; cv=none; b=hbq2cXRrDOfCqJEanTi3oPB+EjqBiG0G9OtbloRw/2jK8+/MBF+kgT4S0ZDc9/usydXqh0g+uMIbXAAVxSIrXmrXiGdTYz8WjtCR/Ks2N15e0Dx5pqMTK/2KmB0SjS99TQ2+JcBpeVdBUFe2n/8NWNmUPpZU7UgCdcTmdDbIiSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750369144; c=relaxed/simple;
	bh=4465e03fj3SlKJuY+L5ATurM2nUPKBOgBKVWPsg1DtM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lsbNGU/BOhUJwbJJBTANMw++33lRU+OIJxCclXXEHT2XUsBp1kAuTyu0Qx0jdsWN7rpDgGeyzIRVBQAMNPtJD3iVbAIQ/12ZZPKtJxQSIip0vvh4eaNmhi4NXVagkPS2Q5Lahz49RBwF2klQ2T5h4U/dJxtZ4TYn2vT6+VNcAGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rJiHlb3g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rJiHlb3g"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71270C4CEF0
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jun 2025 21:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750369143;
	bh=4465e03fj3SlKJuY+L5ATurM2nUPKBOgBKVWPsg1DtM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rJiHlb3g/2uIXEwV8WZniZddWlll969MMuM+NEKYRk1t9QohBnnyzUOv/PSDbJ3rS
	 E5boFhRzTs/3rNAmhgj1BqMPBCDVLXYrPwieXnqUkOn/PCyzfV8QUhcrfiuatzCE66
	 5RI8BW1MrZjEkp36MG5MjQuxeh0HC424Ud/3jy5tukhXa2xq6XzBkAaIk7je8G6n51
	 3iPbz0xkTJuBuXyFE86w3/fIJ8998RPEuZH7F9mPSufmR7yOoRpBKFmyT2GoAYIPrL
	 Xw/yGxdO7z5FP6YbxlSm1VgetnCrI8tO0SefQgLJMQN2CR2kuf8gfo4xmoVvecOA3b
	 Ex9uZSu4mbDLg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5E898C4160E; Thu, 19 Jun 2025 21:39:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220246] Dell Latitude 5400: Mic Mute key stopped to work in
 v6.15
Date: Thu, 19 Jun 2025 21:39:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dimich.dmb@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220246-215701-50HzIaDyHZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220246-215701@https.bugzilla.kernel.org/>
References: <bug-220246-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220246

--- Comment #19 from Dmytro Bagrii (dimich.dmb@gmail.com) ---
(In reply to Armin Wolf from comment #18)

> This patch should fix the problem. Could you please test it and report ba=
ck
> if the hotkey event works again?

Yes, the key works again in 6.15.1 with patch applied.
Thank you!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
