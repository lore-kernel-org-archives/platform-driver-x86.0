Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1952FFF8B
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Aug 2026 10:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787396314; cv=none; b=kFzfN4hLre5CaI82UmSN+sTCd690BQM+LtQpTP5KdnQXOfjOWavUHxKn7Utv9rCt4zNO53gffSLC2UcxMYP18Av/5KnTq9eZaf7F1TuZ/9ZDMLw2ZTmle/frzoZmYQ8ew8YTf/yhwqeCaI0DD70t6uCfAymI9k78ATIAo+9EOrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787396314; c=relaxed/simple;
	bh=hTQ2vr7SWb1KRoGEZ7zonXRrcPrXltUoRdomYxyFXPA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Org8PnMgTPyJbX4IQh8lgzDlBrPH9nNa6SWEwlPk49/8y6beHVnoRQC/KlHMzeuM1uNlGDfm0CZkn7ZB7gRj/D9+EFLHrcCcn2GKLsbN5aygw7vMQh1tIR65qEmeajqleP87LkgdCSniN4RrtNmrIQnuQd0TFIT/fqqcFs7r7L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qNyZCIXS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qNyZCIXS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB492C2BCB8
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Aug 2026 10:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787396313;
	bh=hTQ2vr7SWb1KRoGEZ7zonXRrcPrXltUoRdomYxyFXPA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qNyZCIXSQeB5c6Bfu1lrI8TiBdnB+uNkGVe4oisldem8w1GbvtUK/SXUV/C8XNjYA
	 wOykFpMkrlZxkeQYyAcxroE6+NucAV+/FRmFsrbUu2dIourL76hZJWEYqj/Zv/IMRI
	 A6+XF/UHyGKtMBqg0jzjzm+mMxCpnTb0q/AffRtj+r6Xctg0/1HCg1c/gWJTTZjYzj
	 Nhi4NLRLXPOm4bQjTGwDFC+55rZyYu/Ljvf5JkG2VdoUv9AfqCLSWuweM+qrBpyBVI
	 iJeIUFL+997C2a2//DnH9ROHMweCPs1ohStdKfGiBU22lrXcoOl8y63KIX5AR4AbQn
	 9nLu3gx7KWHkg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A202CC433E1; Sat, 22 Aug 2026 10:58:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221908] platform/x86: lenovo-wmi-gamezone: EC fallback to Quiet
 (blue LED) desyncs with SMARTFAN_GET (max-power) on AC unplug on Lenovo LOQ
 15IRH8
Date: Sat, 22 Aug 2026 10:58:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ginebrine@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-221908-215701-IIU5lzqY33@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221908-215701@https.bugzilla.kernel.org/>
References: <bug-221908-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221908

evan (ginebrine@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |7.2.0

--- Comment #1 from evan (ginebrine@gmail.com) ---
Additional kernel testing note:
Reproduced and confirmed across multiple kernel releases:
- 7.1.8-1-cachyos (affected)
- 7.2.0-1-cachyos (affected)

This indicates the WMI/EC state mismatch is consistent across 7.1.x and 7.2=
.x
branches on this hardware.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
