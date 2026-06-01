Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE734397B09
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 10:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780308675; cv=none; b=LghXbi+UoVlZUgU/G+Nw97MpTVOmMbTM7S6rP/AWcrJYj/V8dJ8dQMOuqMDd8nYgnbVFyyYtog33NvMOHcojJNR9Cr6lDLkCiOZEIxR11BCPIUBx9GeKcjaXLHSF7OV5Ggv+qIIBTowHZLOyjW24RvqHfbPL9zbnh/c1/k8soMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780308675; c=relaxed/simple;
	bh=NGMuDAj3FVJJjE0fUTuRn8/MgwiL3dA4B1EoZgNThm8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BGZx32Tuukf0Ucf5j5liVqetGenvn3zO8qRHEe/2LwJyCCDgCia6KApcKyadAUwZogYUKODUSTiqg1qT8AOhpb0jijmQOCMl6U0P9jS5GGjuclKlxzK7kwjplyIi3yRFnLJuEULh0orFL/CgOjFRj3Gvg16BLdHAVq2GkvpWjQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OAUbRdxm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OAUbRdxm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D65FC2BCB8
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 10:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780308675;
	bh=NGMuDAj3FVJJjE0fUTuRn8/MgwiL3dA4B1EoZgNThm8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OAUbRdxmxww4kCXl/OoAYoIxlNgA+Xmk4GYyrBSgFF+LcJUYALw0yTmIO+JCWk3//
	 5vAReYuO3hNeYC3pNAeW6LSwnWk+9VIBc1YSbXrxQRtSEvQQudrGBSGcZ6TrMAvnC5
	 rOzkzYS6vLHPZ+mmV24thmoGsr4bdRN9j89SE2m7ItL7SS7ubtKbc3Oori9RMQmFwy
	 O/6PegWHs161JYWONkVfcTDjdhiSDdj2JkcJeS6LIdWQIzy3Zf6/MxnfdxHNCgZnkW
	 KiXjTwVGXdLJ1syO/WbEIlinUVO/nb+yjcIblPbA8S8EsIil90q25VrsDkMmIGtNBd
	 rNc14xNWa3DnQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5215AC3279F; Mon,  1 Jun 2026 10:11:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Mon, 01 Jun 2026 10:11:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221569-215701-vzFxDVYcgO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #18 from Milan Oravec (moravec@ukf.sk) ---
Created attachment 310229
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310229&action=3Dedit
Powertop stats 7.0

Powertop stats from 7.0 tree for comparison.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
