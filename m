Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC0D3644AA
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Oct 2025 15:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761838883; cv=none; b=uZOwRHuPGciv+8nFkqbM5kmGY/6RPHzrTcFywAK/fJB3ux5X7ry6PYphYZumxsn9FbHPh7r/h0h1Z+e3s04ijg6lUdziXdIJ8tpx6TElnURsqkLKuky2o0HCA1PoKO4upGGr6CzlThzqod6ULpIlV4IDciv+LiT1qijd4Haphow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761838883; c=relaxed/simple;
	bh=7XAPhwEBpgMkN97lMt024GhriyZ8rpLl9hdyeRRmrYw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cLhBr6dWWA5LHfvbsD7jUx2G/Vwq6qHp6zdIGQZHtjCZ1AWWtcMBcDqdRgE+mq8N9B1ojcpbi10BGWtNaX0+LXy6EFB637LsTwUFNRrFSY1WGP4h6WnDsp5nQe3uNPOaP9Xumq4bY5W3PsyoZmoEBpJFGWXrxl/bVZGbIL9IP/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oeSll0Ck; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oeSll0Ck"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57150C4CEFF
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Oct 2025 15:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761838883;
	bh=7XAPhwEBpgMkN97lMt024GhriyZ8rpLl9hdyeRRmrYw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oeSll0CkwXTVAQM1AMGSoeU4LF83WLeeFlalL19NSzFZoUnonwa9c0s73Nf2VewM1
	 WxrnhN5ps4j0NnJkRMmxzC0Hiu1TBtSQk7oAwaAeCa65QF/552Nmnf0eDexwLcfBPP
	 8VeLRrpN3ZwBMod9HwIAP8MICw92fzwRvfqhF7ctk9/WTxguxEcyNfWHDv0C3g2qaH
	 qU7FQIg//SV0s2z7R5ZNaiaTVI6OaRQ77HvTRK/iSBTi/OcvnSsicFpHhriaPvprg/
	 1rkru8y/PVKLgN+laI4fGMfXSLHLpWjlAxJjNkRArAM3Ufy2N3+2YUS86nqSptqg4O
	 X019ZmqsGjwdw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4FABFC3279F; Thu, 30 Oct 2025 15:41:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220722] Non existent battery reporting for a laptop with
 touchscreen MSI
Date: Thu, 30 Oct 2025 15:41:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220722-215701-uqltQM2FMx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220722-215701@https.bugzilla.kernel.org/>
References: <bug-220722-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220722

--- Comment #4 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Created attachment 308872
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308872&action=3Dedit
potential patch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
