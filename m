Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5983C230996
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 07:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731481578; cv=none; b=fp8D1Oqfklnu30i8XbUwBPX3Nfy2HtJIn2+A43nfpG/zYVEiwuon9dABn7RMYSQb5FC9v74/OKx+DbneQHfPhOHN7Fwlkd+g18LdpLwXIkCfc7l40mSoMInEBimvU2J18YluRfseEReQmHNTpegq+DIAJXNiV3pq2JMrLwfJr1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731481578; c=relaxed/simple;
	bh=gjLIgo26P7aRBgDiHQsPnJhoix4hTMITAB7HFGSV2X8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KkjcP0qzX1vUekMy+1vqgDj3mv+yytB4mb41ivUcoeP0ygPFKatdE6YJu7Q0n64rVCxRidQKmNFfzXZsj+4Q1MHPer3dwj9KIlt3LTd2bScBPIDV80TuDOObm1ymturjIxOBfVp96Rlx/HewsP4lPDzME/0oC5/qWAygMRpdK68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5mEHmg4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5mEHmg4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC175C4CED0
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 07:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731481578;
	bh=gjLIgo26P7aRBgDiHQsPnJhoix4hTMITAB7HFGSV2X8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=G5mEHmg4NpEZHoVJJ/bJj9Mxvb4SZLj+etkYWZ4Ac8G6a6+C/0VGXZUA2hVsac10d
	 g9aYsP5cfHitAgMAIlKhahAf7jRE2O2q8uXjP+Gm2IVY0Jrha6oWFLAuOOCBTTerHv
	 qHUp5XAgahobCNBnoVETWr/B8HIsvQ1EQKvpO0Xp/aHyRba4KPyTcS9a6FZGStUMZp
	 4FKimRzcSouLYlxkgX+eKJzeuMkSdcVxK7wB29Y4BSxMeo89Jb6/mqZh0DR40v20Mq
	 1mreLrif4NmMg5tK+0LQgvFjyjkno9uUi9MbKa28y8RZ/hBqv0hTiTPxwo+1z5Z+EL
	 +t/qnC267vEgQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E633FCAB783; Wed, 13 Nov 2024 07:06:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Wed, 13 Nov 2024 07:06:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.liang@hpe.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219495-215701-l9Z67GKse9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

--- Comment #4 from andy.liang@hpe.com ---
Created attachment 307214
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307214&action=3Dedit
Kernel.log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
