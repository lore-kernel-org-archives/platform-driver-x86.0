Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A5A83CDA
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 21:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732225468; cv=none; b=WPF7X3yesBYD+j7t4aR2g3WL0I01+rQhF2GcnD0KP9+gM/4pPm5vTpBFvwiDJUiva/gi83vbLWQTRF9F/jZJEGVRtY+w8MqXlwBTuFQeCE1CZoPCaLo1W53w95Nz0V1mEev40V2hgzK1mszD3GRKIcOYlXYCJFlgjm6ZGAHU3eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732225468; c=relaxed/simple;
	bh=2QxgA1gXdcDV8M4QII83L1MSmcKEG3FKGLa08JNnsn8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MGyki9M452qiJKrd9IPrfz0Qs6urPydHOtO9sOKHWUT/a1pxYtYnB22Q08uitQ1qu5Y+PHymZRJCRFjIudVUYYsTaQ989TVL1jkRo4wCG5BbtEKQCOx/fvDnoru5rf2eLBjFYHJFF2GluzIw0GpmLhnlyhtpLmQKURRadiFAPOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q7Dwm+uU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q7Dwm+uU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBDACC4CED8
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 21:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732225467;
	bh=2QxgA1gXdcDV8M4QII83L1MSmcKEG3FKGLa08JNnsn8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Q7Dwm+uUdbpXvVf+Qumeyvegven3DQBGyp/vPCXZj95CkyQ0Zc4+um+XazQDd7YKH
	 XiSi6MNAZLAaAzdd7OAaoPBP2qjHiaM23Uj9z58VZSJGdqJ0F9nRO73nt/FsOOi9MV
	 u/93c9y/3Hn7GlPm8Ub1BJqfqrjHl9dwRe2RGW9eNPI7xsaFosBPZ+eeTlHz2kp//J
	 b5leZjqxvQJRbeY0gMOKWuCZ69VhVrcgqyyJXx9lBjv9R+xJMDdchvF5ddm0VbNkiJ
	 56+ETfW+LTydM4W7tBJMHgZzd+h7oOamnjhpc+kUXsiodzR+TC+o1ihniifAjZCb49
	 nE3O4Nb9Xz3Hg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BF1A4CAB785; Thu, 21 Nov 2024 21:44:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219517] REGRESSION: charge_control missing in 6.12
Date: Thu, 21 Nov 2024 21:44:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219517-215701-qSEc4pVxzo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219517-215701@https.bugzilla.kernel.org/>
References: <bug-219517-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219517

--- Comment #14 from Armin Wolf (W_Armin@gmx.de) ---
Can you apply this patch and test if this solves the problem?

I still suspect that this is somehow a BIOS issue, so if you have a dualboot
setup then please try to verify if the ASUS software under Windows can
successfully switch thermal policies.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
