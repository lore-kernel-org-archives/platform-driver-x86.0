Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FB73CB567
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 11:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374317; cv=none; b=piVLKjayoyPrBr7wyjQOiAaOpOS5yjCGaqvCmWITjSH1y96YCAnj3vKvME9KG2D4MK1c4Nrjza6jSwKpfbHxICaR0XLM6+VrL6AmylGfvZYrkJIs6alNM26CUd4oVxLKoFaYA4lAdccbWA9R/uhJC70sVauwWJrEtMMD2VhoD2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374317; c=relaxed/simple;
	bh=SDeWc913r4q0UMCILk3veNIL4m6at0wR0L3P920VQok=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YauJvM5Pa+kKXle7euLJjJL1b3x7TOSR3WP8/cBx4jooon82TnmhzPkTZBNLXN7+wKxtgmvwCV31Ubr22IA8dog6UP8NGVgHnR1cNN93Ly7A6+bogUQv1FjX5buv/rU6wgHLZYuhCc8VT3vwEbviiP98sHpvZ35Wk9wkgv5hd8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lxmL4My9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lxmL4My9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCBC0C2BCB9
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 11:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791374316;
	bh=SDeWc913r4q0UMCILk3veNIL4m6at0wR0L3P920VQok=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lxmL4My9eLUwl8xIoFJw360xPs3ZdOVZiKK6SUW+o/fIRXxHR53aeitSga5JR3klC
	 ZZkMhZ1KeYxqRLaEJwiQaL3NGiCsT56OxXymZWd35aCH2ccqwoIPBC4mu7IyFupEsS
	 SW35osv4zNqftWai4pmc5MV2Rt8SVRZAau+9aDmZ59xVpTVFKkd9kwxMaL1J2yBvhs
	 Bz/iEJZ+iIjc0yu80wknFLpEfrVSLBTN+KGIR43WUrQTmxFdte/QFYCkvkPITNJPTc
	 I0S7Ak2+RyPh+RrjDTH/xyw7jyII+wOKG84io2qMqw7vLCnpVVbG+yiFydI8kCtSlg
	 7Q/wGLzDXrACA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A70E4C4160E; Wed,  7 Oct 2026 11:58:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222102] [ASUS Vivobook F1054ZA] Keyboard backlight missing/not
 working on Fedora 44 KDE - PixArt ASUP1200:00 controller
Date: Wed, 07 Oct 2026 11:58:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: roberto_comandatore_93@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-222102-215701-yt5UHo57cT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222102-215701@https.bugzilla.kernel.org/>
References: <bug-222102-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222102

Roberto Comandatore (roberto_comandatore_93@protonmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |7.2.8-200.fc44.x86_64

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
