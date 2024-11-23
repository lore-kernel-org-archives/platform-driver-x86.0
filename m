Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70518139D1B
	for <platform-driver-x86@vger.kernel.org>; Sat, 23 Nov 2024 22:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732400525; cv=none; b=RZ3X+Dn6QM4D826+KuGlkGul35wgoFLbmdwNx0NN8XDzLIcfdhkQCfRRW1fOtWv+WcVJ6d7Bguuj0T/8lnydgNaBIrm0e9So/UX+niEtIp2CBqQqpdlq/yLvHyhM+cHSuqCw26OptOgJuhGW4SZFPOa5li+FoM/ZBiuvqSOl5k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732400525; c=relaxed/simple;
	bh=bR9VYwm91ZhMWC1+m6T2o+udVFctPppRgaV3ZmXTBGw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SbPUhUl/i7GmKIg4Stu9uia/a7EbE2XLGZDd7zd8PWXbTCtmwMS7GdXjhyrNA7pMslew+tCZsvDL9Eu4XEibrxoKmy3RQbP/7fqjbcK9ppgkeFHRE4hGl6F95/JzlEUNV6GeVtEHEuTnfg3IbyNFg4wK1l76RpE006rjxoE+r/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H3t+UoMw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H3t+UoMw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2DF4C4CECD
	for <platform-driver-x86@vger.kernel.org>; Sat, 23 Nov 2024 22:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732400524;
	bh=bR9VYwm91ZhMWC1+m6T2o+udVFctPppRgaV3ZmXTBGw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=H3t+UoMwEvYUke3t+aDb5FPBVXxGQh8s+EWH0KWGOHczjiLlblK99e2n/EPasTMiL
	 Zw9RLCDQFApCRwhF3vTdRXYngRrtHptHQiAC+mvJGpOfRJmb/P75LpfKB8zl6JW6q9
	 ayNedDx2mtDoFlPbjhyLgzr6ZMcECKaauDY02sllFzIH2GZZMAqp7A0AJ8UE+a3yzS
	 KxUGBb7doD3WwrFh7yMPkjvyY4GgRB+JIv4LSOLiemy9oy4MkZysderwL1RyfoOLBZ
	 0CixxcQRMmaXgKU2I9dgUromrfXYSQclRp0iVWFOF2POxvRbpPil5eKPOHcna3po5T
	 pTXpoNaNuBESQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D82B1C53BC2; Sat, 23 Nov 2024 22:22:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219517] REGRESSION: charge_control missing in 6.12
Date: Sat, 23 Nov 2024 22:22:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219517-215701-lcLZlsb9GQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219517-215701@https.bugzilla.kernel.org/>
References: <bug-219517-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219517

--- Comment #19 from Armin Wolf (W_Armin@gmx.de) ---
I cannot replicate the issues with the original patch on the pdx86/for-next
branch, so i suspect that the patch got applied incorrectly due to missing
commits.

Are you ok if i use your email address inside the patch description?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
