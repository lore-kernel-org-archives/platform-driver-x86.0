Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980EE4F201
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 May 2024 07:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716880835; cv=none; b=Pgm8+TwaBzp8nVzZHK8TPIMiPrzEoU9FlmDtk211bZvznV26ulQYxvdDVyArzLc+kBW4OTER4Qjm94nJGVqh6Qa+Glh29tHy/XCOFRYat2b6j7jfhgmtt9ez+Zsjb92C2anJQbUeiubIfBUDzdIPRQbj43NNLwehe76HRZFlk84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716880835; c=relaxed/simple;
	bh=Vk3vZzyvL7uqjFwzy1S9i8o2rmQLkbV9F4cPGNHUKUQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p/f8o80KFLoQ7wIXUx3qh6VjQ9XMmWITp3DY9vyRfB/uD+Bjd7/qw9p6UAXu9y01c4nmvwZeeDAjudenpUXKlIDccB8PJc2ICMi1hTDT34Fe6X0hwVOzd5Jr7kC+Y+5Be3a7xogozvDtX/80j/bFTQYksukKL7ASiRo5ca6agC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BfhHsq4f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BfhHsq4f"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17FD4C32781
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 May 2024 07:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716880835;
	bh=Vk3vZzyvL7uqjFwzy1S9i8o2rmQLkbV9F4cPGNHUKUQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BfhHsq4f7s/3dafGq0rYyhi+AXi7xVCq7LBb6qPpdgzzG9jomiY0tTAeqZJFG7Dlu
	 IlcFhSqnFo31VuUzCXj7Lhp68SRwATcQJQr8YiYLLJog8IVT7jV50OI0+/3q43SW4C
	 Ht+WBnncWHPe4Ne1qwvHoX+Hv1YGG1Kcj0SzpavoQMLCbOI1P6d0zM+RXxJvhqtuBQ
	 oDeMgT/7yDiiGerMdTQUh0kV6OziJlkGaSh1u6h0Mn1nzxGFfZu8FfRCdAxD1B0Vrm
	 epPM1+Lb3rhCCfgbQtnKnv/eDE4NqaY3gU2N8oxBTiS6SB5MOLafiL8c64DsbZ53hf
	 IktN53aS+arlQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EAF68C53B7F; Tue, 28 May 2024 07:20:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Tue, 28 May 2024 07:20:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: agathe@boutmy.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218901-215701-UsAw1rEezJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #2 from Agathe Boutmy (agathe@boutmy.com) ---
Created attachment 306358
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306358&action=3Dedit
acpidump

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
