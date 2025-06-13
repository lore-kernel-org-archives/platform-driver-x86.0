Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E73D7F9
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 13:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749819675; cv=none; b=uc2UiK9eS4c4ER5y3gFEJbuHFXkwjKLypao6jpzXY6cHB+QE/0YaYBi2YJBFrRc1BkKSd/rXUtJjBgCgP4ROVq5rlSAzkSUdysSEosuiwqQJlTxRJpb4qmQxVHvrMDu+E53nPk1JaUdIs52kINtaXnnrtpPMPZzuKQszF6BUlmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749819675; c=relaxed/simple;
	bh=uJ7p4zdHTlXz9FHvdlmCt6b0SaKUQpP8C4ye7i+3LIU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dyI7d2dRptRv9FX/wfc1Wekd9W3HVz5372EwwevC2UjEi0Ul1TshINj5LXpFWq9RROdv2P/FgH9uVkaWa2a6/1nv8ouqyw3tZcsdODFyXGZQFTS1yeUmN6mjvn0f//aJhgCL2iWtDOGL4g9pzPyZ65lTK1BD/yP7Q9Eemycq2WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFn5B5/1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFn5B5/1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71FE6C4CEF0
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 13:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749819675;
	bh=uJ7p4zdHTlXz9FHvdlmCt6b0SaKUQpP8C4ye7i+3LIU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dFn5B5/11stzIXn7AqCf/hbNqLVZocin9gjd3aT52HdKlH25czn96Be5yqBz0e/N0
	 r7gSy2ctgbV1I4O9VCQ2WfmBX0x9EqRzbj13QWdcYz6FDEtFI/PXvxaJVZPzPldp7P
	 w7y1JzM4fyVKig7XRQyq9b3Rtj9fu/ybtwd1+l9mdb7CzktD+ny1VcBfV0XI3cxAJe
	 uvJEJc771JHifev2FfxTFO2y4VY3pTjqWBpsEVTNDuV3uOcbRBstmS8TxAooRImC1o
	 VWb1wRY6WlKzPrDxUhogV0/kXtmjNtRNTm8FP9NXUcgNmDJLOSDWugJWqKgFcHL3QN
	 oyRSypBFbJBmw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 69722C41612; Fri, 13 Jun 2025 13:01:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220224] Kernel 6.15 causes crash (general protection fault) due
 to amd_sfh module
Date: Fri, 13 Jun 2025 13:01:15 +0000
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
Message-ID: <bug-220224-215701-4oNMzBdZqq@https.bugzilla.kernel.org/>
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

--- Comment #9 from g.molinaro@linuxmail.org ---
Created attachment 308243
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308243&action=3Dedit
Output of journalctl -k -b-1 for the failed attempt with 6.15.2-cachyos

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
