Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CECE13BAC7
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 May 2024 14:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715007130; cv=none; b=mQnzl3RETm68szCNEuwQkhQJefCD0StqSZAwBnG/7OL3ziwXam8H5qzAbGF2uWJUk0SuYkkdA/hvPnqJMT/MjdYtZ3gdculw9LRRMhLf8KEoBsD6yBh0VaeHGhkl9nqkZt+oX5wwJin48V+AkD0361v8lN5s2z2ZPJj7E356ny4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715007130; c=relaxed/simple;
	bh=p+fVD5BmJa58TlJgBtXrKBU0EHdNlhzyO79Zq3/YpRg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bNnQ5sqggofviQiRJEbhcHJVYp9Obb0wngV749YH7RWi45KnKS8PFh3LVfGKod99tEHIuWyxyGF7us3XF1ZxCQ6X49YvoUQEY/0UI1tmp+MRViaAYg69FeX42mIsPNKTfeKHyeHwIugfCw26dVTQcd3HToOfb1vV5/JO1k+4vwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n973t/1O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n973t/1O"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0613C4AF67
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 May 2024 14:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715007129;
	bh=p+fVD5BmJa58TlJgBtXrKBU0EHdNlhzyO79Zq3/YpRg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=n973t/1O5pwmqv2S83hOjJNZTI7eAnjl+GtUisZrkoj63BqWUvx5Q+uZ3ZkRnXp3L
	 nIvwsyRo+8/T2LkWxmQelLpTJZmRXgn/9G4skl2Pa6PVl/ToVSGUS8XXe5X2HOytsT
	 3HOHtJZMMxRZAvVH5frUpzPV+jpbjD/iymzaoqwbRGoMhox3AAAbXyFdiiTnOCZ6qI
	 4z1Ti7nnKEZIzhu2lWh6OLtupFdV4amiNugsBUUNWQZeSzWzRerUzyxcSeTX8H18Ys
	 Ea34iSjnJ5ojKe5mHSWkQrDckoI/9VoJVibxL8f1/oPdVbnHPvQ4ivVTa1SXbgR3UJ
	 BS+G5tPFYaklw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B41B0C53B6D; Mon,  6 May 2024 14:52:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 06 May 2024 14:52:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-SeOZw2PvZh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #56 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> Mario said he would post a patch to reset the EC on resume and that should
> fix the issue but I've not seen the patch yet.

Eh?  I don't recall saying I'd post a patch to reset EC on resume.

I did post a patch to this bug that could try to adjust the timing that is
waiting for testing though in case it's a race condition.  It will force
10-20ms more time spent in the Linux kernel when the power adapter is unplu=
gged
over suspend.=20=20

Also if it doesn't help, please modify it to make it 100-200ms.  This should
rule out a race condition.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
