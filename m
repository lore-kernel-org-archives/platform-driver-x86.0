Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645D970810
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 13:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749819898; cv=none; b=bszIy5lPcfEwg8dhciHbsWDin21yOQUmA/Vt6/ZU2mQsbhM/MqQwmsdzmVr0zXfbxDspUFStcF4YME1DX5uVlolaRkeLTB6eK7VaJ2+ESDJdPa4YYTsysm3L1kCeRChq8W1fCTrTeK9Fi1Rr0b65stu4xoCQ98RjrIP0R5L2H8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749819898; c=relaxed/simple;
	bh=S8SUJyOFjas8S6xK83NJOxc18cQ1a2vcOqLU66o2Jm0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iZ+SyUnQjUhW9h4tiWuEuqOuU8WIqyagr/6zSUnTPHxitg8aEWnmoJk9tffq/p6kulQoInkZqX13YQ+BxV98qqLyS+rqQEvBLvDPYVkzFr0ZbWStjD6lKgI7s8gymNm+sPGlQNYXgKzINOWLUsb6WPzkj2AfhxluDB/HfchYeTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kJTC3PtH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJTC3PtH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1CEA8C4CEEF
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 13:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749819898;
	bh=S8SUJyOFjas8S6xK83NJOxc18cQ1a2vcOqLU66o2Jm0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kJTC3PtHz7cXTbrdo4rZMeBBj7XBMAwqRN/wBYMGw2ggRLqwb+eMTnb8lWdqeDKdZ
	 8NOMO+mv4OBuxp6kWEvCTB+QYCkoLkzJYpfQRwt356bbr9z8YKGMQz9JLuAxl8scuv
	 Ei1Z/L4DsbcBhL7+9k6U8UKslRKnLLawsvuEnIzHifr/E9WXRImvG3EHAqJjKHNXJB
	 o4DKC6AKNsKME2mVsjMcPCNMyD1+dcVHph2Ha2cD1eQidGWdIHSHmFbKPgfZS73J4m
	 T0Uxm1HNnIX45+XVwVnTr3Gi41w/P2d3iYFGHU1M3Zn+S8sVnr2yoAGEKv57FSwVUC
	 Ao+wz2Gmgo/1Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 157A9C41612; Fri, 13 Jun 2025 13:04:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220224] Kernel 6.15 causes crash (general protection fault) due
 to amd_sfh module
Date: Fri, 13 Jun 2025 13:04:57 +0000
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
Message-ID: <bug-220224-215701-cAieXL36Cw@https.bugzilla.kernel.org/>
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

--- Comment #13 from g.molinaro@linuxmail.org ---
Created attachment 308247
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308247&action=3Dedit
Updated Error Screenshot

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
