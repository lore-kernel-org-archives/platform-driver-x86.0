Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0466721D5B0
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 11:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770637668; cv=none; b=N7UsBsndsyllpjonCDS2PauM7OijGaoxUuIIzbHs90C+tSAUIwaR2La623N4t4kFsBJK/bxloaYy1uBkprUzonT/WKA3XMdWyNjfLRZ0qmdlH8SyNNgsqM0epcgw1BCobuWtmEoE/0nnfpVpyLUqEMjTEc59qkEDcu9qoPWt8+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770637668; c=relaxed/simple;
	bh=jV98tQYiyNYVxrJyT8/PwhoCLtkMuoS8N8fC8hVCmF0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HfN9x1cRabCffXjlv+lUHN1HhfkLNJCrJnvO3/EhMGHg2hS6Qmg1L1WOIIsk1csnhorox6atjyf9gDLIw553tQngLdA5Fw7hQlDcf/ow2qx+Nw4FlfwG1O+qm6NKAMQKIcOydRSqClfjfnbtmsvaDu4hH9yExATkez6+kk/o268=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1QOlmFq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1QOlmFq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87AD5C19423
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 11:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770637667;
	bh=jV98tQYiyNYVxrJyT8/PwhoCLtkMuoS8N8fC8hVCmF0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=B1QOlmFqTa4tYyrXJ/8mWCMBDwnb0s6it6Zp5dtNpH4oc6te2+xqEBQKakUBkny+h
	 ZmsiG+TVL1mQVJ/0X6nGO+s/U9EQfU4r5Plpwv54J79ooorNHWZ1Tzp3q91zrO8XaJ
	 NPiuuSG82uTCTK6bsoyMFILWtUy8XzepaFRwJ/pTCwr40NHMzIH9zdprMtFxl+Rg6m
	 Ss9dcctdg+AnP7dRFYLVGyrzmr00L9mARCo5fNJBt21nG9MxwZKleWsrrQMtjC2MbZ
	 hIpbH2i6JR9u1xy4z00aZJSaP7SpHXmhRCF0ZAekbH44FRFc/Y22FifTdjjLcd85Nq
	 38jx0Nvzq7WmA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 74C59C433E1; Mon,  9 Feb 2026 11:47:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Mon, 09 Feb 2026 11:47:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221065-215701-Ou7UF3fNko@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

Armin Wolf (W_Armin@gmx.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |W_Armin@gmx.de

--- Comment #1 from Armin Wolf (W_Armin@gmx.de) ---
Can you share the output of "acpidump"?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
