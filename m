Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B2B1A9F91
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 00:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777336474; cv=none; b=rDGiaYlpCBhWe1lcxfAfAvUJ8Q8VKWCcn/qatxHYTH5CxxAWXtYRS5qEO5SJErDAwibGEkBthZ2kBReW+NcrA8oumDDHlPzUTauZdfsL+UvJJUbgLdhdTj16E4a/qsARcfGt+Ytvv3ergNq3+ERA2zKvSjDQa43lz3IKQN1o0Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777336474; c=relaxed/simple;
	bh=icL9LNSzaiZHjXGQIkV0sHU+f4u6eZNOY1Ztaf7E1qU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=emNMyWhBIfvOFCIxs4r2ojB0K9gjhJST2wekhCr4/okSBtYXG1M4DkcNchPmnjQjuvrfyMq9/1VWPO4FvIuknptFbNnQDCmVgahmtUVJTGbCQQsReVsk+ci6xpx1fX1k5iLihE2CETKdcPFmTNfv0IH7annOfnzqZpIYH2WzVd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6R1kOGd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6R1kOGd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38DEDC19425
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 00:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777336474;
	bh=icL9LNSzaiZHjXGQIkV0sHU+f4u6eZNOY1Ztaf7E1qU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=l6R1kOGdH7NOT/DNRoP8kQYKwoTD8qeE+xvTYC9JLm0MIBvYBNMDIfvEdi2o35KJf
	 3Qiv8ybCA5AMMhnPT0krRcpanrve9xlEGuRr+qdiMGdmPclGOf2hZ+jcZ1xljEDNPx
	 S/cRajOENpUjMGNFEVPqDHLT0SSNEQfpbVaVkOL7reuFbF26dFOfmT2rCRLxgWfJAm
	 eej0DofXCk1ubsw6I+GflVlGbnrf9G5vzoEm4Mcl3egc+STmPcFAnpiBMUGYhzTBkc
	 CnGIGmtu4nr7jofBeHTHeP85ivqiLMMmsG3dkIfJdWWoftBcl2yvDXl/+A6I2Hy0v1
	 e9CGGgJRpCeeg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 28E36C4160E; Tue, 28 Apr 2026 00:34:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Tue, 28 Apr 2026 00:34:33 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221383-215701-kCfmkJdF2m@https.bugzilla.kernel.org/>
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

--- Comment #47 from Daniel Gibson (metalcaedes@gmail.com) ---
Oh, one thing I forgot to ask, in the ideapad_laptop kernel module's modinfo
I've seen
>  parm: allow_v4_dytc:Enable DYTC version 4 platform-profile support. If y=
ou
>  need this please report this to: platform-driver-x86@vger.kernel.org (bo=
ol)

presumably so the users device can be added to the quirks list, do you thin=
k I
should do the same here?
What would be an appropriate address to list there?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
