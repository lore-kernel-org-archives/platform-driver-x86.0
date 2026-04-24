Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CD0347C7
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2026 21:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777065687; cv=none; b=lIoMLSGW3MZpZtEJNeWC4eAegi+LzXNlZGpiGT2J4emNIyCznLhZHdnCv3CkwU2Nqstm1J0IvB+oZunl6nL90+0D2sHuHo8mnwa9OvI56fVOM2ab7PC7kydZPJQSHpsPgrywfFjdLlfMo6FhD8jAPyYbxRFTD+4IizmexVIwbJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777065687; c=relaxed/simple;
	bh=Dl7oAOXUAVUPE5pnRvF7XCQQFr1IYunmF1vQK+z9YW0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Do0xtTYPq3RztY6z5vlDP9/OU28iHB383rZWAkOz9LZhs5cfTiF5kBv/pP80qXvlhUCCPmaRzxKquVUkQsjhhXW1k7npGdBCQxZYkbu2dxFBkxu+2po3C/83wA2GgT91cUjjps9jQG1aeMgPbjP0yG2XmtJTaryhrfA3/WQjOdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YbgFEjUR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YbgFEjUR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07106C19425
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2026 21:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777065687;
	bh=Dl7oAOXUAVUPE5pnRvF7XCQQFr1IYunmF1vQK+z9YW0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YbgFEjURlpkDgR57pcA39/qVtRMwtInx5SnZHQfOeCYCLCAVlrzFPKRPOGg2+fJ5d
	 ZmyFPT30X+VWmsz1EYa/x50OghZmkzH/oOnACCMNRgGxXZ/uGiMEmX6Evg1A6dKawZ
	 EHbcHCNtvWuEo25q41HK8YfroEgZUdh3/Zva53rISXzi/v9aYVDOcB1+Ad15dmHdjs
	 cF4awH490ilxEZw73SIrvCI8WMa2rZAFM7LoMd8pA/uIyfU2aCtkqg3EuU2/8ZmRhY
	 uv1yA8TJ18tvigJRSrUDeDYiWqv5EG1g7qfzm5PBsfcBni8/mp3NOb/Y/ggzfx24dn
	 7ndFCx3exCZ3A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EABE2C3279F; Fri, 24 Apr 2026 21:21:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Fri, 24 Apr 2026 21:21:26 +0000
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
Message-ID: <bug-221383-215701-eFg1IYqddk@https.bugzilla.kernel.org/>
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

--- Comment #30 from Daniel Gibson (metalcaedes@gmail.com) ---
Created attachment 309943
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309943&action=3Dedit
First draft of a patch for amd_pmc, for testing

Here's a simple patch adding these sleeps, for testing - @Sindre, please ch=
eck
if it fixes the problem on your machine :)

Right now those sleeps are always done, I'll make them optional via a module
option and maybe a hardware quirk list later.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
