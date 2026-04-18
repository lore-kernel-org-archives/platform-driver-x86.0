Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BCC27B35F
	for <platform-driver-x86@vger.kernel.org>; Sat, 18 Apr 2026 13:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776519611; cv=none; b=RrVWodqoe4osTEIolYCFsM5pnPvRi4fihu9s+pFVbnmn5ErAv1uFE4I37Gdzb6SxqadGIezfxMCEQGhqRLoSEkYXiATb3cCZ8MoOxmdAcPA0y6n8SezsS8yt6yQnWTSkWWPVgBTht82371Id/53XX1CVlvbKOvOf2RgTipCdDLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776519611; c=relaxed/simple;
	bh=x7paqauSxt5F5V5HOu/QAKSWWGhqnAb1X4ioP0UybPU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PHThtj1QVDLhDHAb5RTukrFhfzsovhKvkd9M7a3xK0SgrvCtEmWYgFFck+XXXJCztX0cOwHp+cq1GCHkjOGsU67QS8KZwxbrq09xZCEOOVSRIWQkgeCFPCNsAgRxnzKmLGQDWD3xheA6klIZdL4ymzPwgC72BW4MrrvCKEwEuks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/jtrHe4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/jtrHe4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3257EC2BCB4
	for <platform-driver-x86@vger.kernel.org>; Sat, 18 Apr 2026 13:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776519611;
	bh=x7paqauSxt5F5V5HOu/QAKSWWGhqnAb1X4ioP0UybPU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=M/jtrHe4e1z1yQS44G5+zcnTG6oaNezI/+a7B1sJCQa5vTGtwAgUw+HZ0wFFTL0SC
	 TYOz92bNQjcaJaaaoAO9lT8iigxcigLn2WwPvThF03ekC+2qoUjmWFtiL8neySUPcs
	 0rxZv7jfTLv1wlWIlFEKGbCrRdz/w8yP4iAdEUsU+UWgCkv273LJf44K6ZSQ2O9Oq+
	 XgY6UBq82uE1Xhh+rMlP78o3+sv4a5KtAkTFe636PxkC37r7XOt1I3WB9I4VxXYH/z
	 fr46sdNvxJs1QuksX5aMLNe0iEt84xGm4nmRIU+SSQ7tDVm732VbW/MUBos0JqEP4S
	 /JREjw8zhBwDQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2E7D2C3279F; Sat, 18 Apr 2026 13:40:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Sat, 18 Apr 2026 13:40:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sindrehenriksen93@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221383-215701-2npDZMeQJz@https.bugzilla.kernel.org/>
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

--- Comment #3 from sindrehenriksen93@gmail.com ---
Created attachment 309898
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309898&action=3Dedit
evtest on event6 (mic-mute, rfkill emitting)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
