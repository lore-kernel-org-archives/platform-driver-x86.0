Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8D21714AA
	for <platform-driver-x86@vger.kernel.org>; Sat,  9 May 2026 10:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778323699; cv=none; b=bnq085gEsWP8lg7DE4SX+8v6zeSysnsg51ychl5Q9DR8X01sH2Xg4lbIXakSmBHg0giTU/hS3nfN/dJcc2XdIFE28sW0yRG003JLvY/2eB+OAM5rXBMWH32RivVtjb7g7n226ocyTrFBo8Za68peTgfyJmugmN5V2G8iz1hsiNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778323699; c=relaxed/simple;
	bh=3HYV7DEa1FyK4KlY3os9taZOMqva/iQ7xEjuEJFBvas=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q3ITUgBbjwclWFGrDigSwVvyTz7GB5cnvKVC6gMkvSU7/y4PB0FYZotiRRO0EmtcG2lqK1ONMV2yvysz5Cf8CX29SwONFxsHgiLl8+NdYU0EMU2sHpyO5N9GtkxGh6GwlNI3qQp/2fnKGAQOr9QK9LTlIhZv4K8GiDaqyikGBnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RmRV3utV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RmRV3utV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2C54C2BCF6
	for <platform-driver-x86@vger.kernel.org>; Sat,  9 May 2026 10:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778323699;
	bh=3HYV7DEa1FyK4KlY3os9taZOMqva/iQ7xEjuEJFBvas=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RmRV3utVKOETnU1Jbl7fE5hL1Q5O9B6rnKfPfBrZWfpk/WU6p4t5g6xy+4SctR6s1
	 diuu/tfHNQFC7gyBAlx95m3efmzmpEkcwYv5i/3Bxe4YB3gXmS8+dH7IYh7ngLvcdO
	 eDyLtTAjbouIqyhwXDFiQkHlGjLz5UMqUTBymcSTxYNymZFQKtxX3lFxuopVl1JO5n
	 PIMJHNjP1/cQcIOYyuf/8dJLIkNDruJvHeCB1lNuwaNE4hzEwms3T7YbkL38Ll9HSb
	 7U76fF10hlSKsnCnQL5B9SFj9i8ejJYkryA1sZkVxOEEJsmspghf1ZKj31n69ZKwmC
	 OCgag45ifcADQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C5534C4160E; Sat,  9 May 2026 10:48:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221419] ideapad-laptop: brightness keys require continuous VPC
 polling to function on IdeaPad 3 15IIL05 (BIOS EMCN60WW)
Date: Sat, 09 May 2026 10:48:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ladha979@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221419-215701-6tl43MeK8g@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221419-215701@https.bugzilla.kernel.org/>
References: <bug-221419-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221419

--- Comment #5 from ladha979@gmail.com ---
Because initially my understanding was the sudden fix was a proper fix, but=
 in
background it's probably polling like crazy, numerous requests every second,
which is why the cpu usage went crazy.

So a slower manual polling service works much better

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
