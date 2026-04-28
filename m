Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE92149C7B
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 04:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777351166; cv=none; b=JdqEANIFOHf2IE226k7kFzzgrMIBG6VWpF4ci2wgko3gq4JKAJcduCBOQCzf2rb0F5qJOo4VpP0jc201BoqOfiz8/JfwbnryMMl9ZBOwfbaXqYGdaOIoVpBMyifGcPvY7Ez4cDaFMujOUzW+gVDWGpWZ8EIAoQ88/mtgv5ZGOmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777351166; c=relaxed/simple;
	bh=BHcJg6Wh+f7g8TF/wx1PWzNxSAHqe3TsyuRjv2iTZUo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uywnCHByg/5XUO2RGyDZEGXPoD6wSA3Irfx9/V1FnaGJ/uQlvDE/okcM2kmWMqext+wdKRXNQ5IMEXKrE1OhqP61fqTUHFofz09LbMjNgosSic1ot40e77uiwTDz0fsA12PlUiWW9WAFJGcfanD/ozYtrgsN0LzGoqlyXVMhb0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f1FPq/B5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f1FPq/B5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0968EC2BCAF
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 04:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777351166;
	bh=BHcJg6Wh+f7g8TF/wx1PWzNxSAHqe3TsyuRjv2iTZUo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=f1FPq/B5ILlBJLZC3SuUKYOZWSKFLS3BJ/QSS9nA0O98MjrAOlPzypGik531hPSMD
	 EOQ0PamnPXLAmXkuuymUK4sfRBZSIwRXBhYUZdwmdDNNX4UNobYuKhaCQLp/iHZCsY
	 Awrg4mvtdRojc/YHRxgyd5O4nlV1V2yb5sbfyn8idwITVUHBJBqPZEtrxBRAc1NgDS
	 jDRSFrqGa5adSXkk4U+Wy874ZMO996v65wJtJuea4Q70Su18+hpflDWjshIZlkZ7Rk
	 jDj/MdFvD6D9mbWc9+XvyEYQ4wX1jkHU2i5aLoGmuQOMN/60CFRGsitgnxNG2e+Lyp
	 /dtBgoaIc/vmQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 030E2C3279F; Tue, 28 Apr 2026 04:39:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Tue, 28 Apr 2026 04:39:25 +0000
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
Message-ID: <bug-221383-215701-eLzX9C5jv8@https.bugzilla.kernel.org/>
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

--- Comment #54 from Daniel Gibson (metalcaedes@gmail.com) ---
Created attachment 309976
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309976&action=3Dedit
patch adding the delay_suspend parameter to amd_pmc

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
