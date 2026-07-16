Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D136346E44
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 21:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784238427; cv=none; b=B35q36CUbxB6YegqFnfZa6GavIQHyQ5FGRqh6rO1m5r1d/dHSejWOhofB8MA3oLiiEZdfGUtNEoQ0IrOo3ouYZybwvK4cVvMtQ7DiOUWn3hXSkKFk649H0R/jeE0V7nhbs4QX2wsswhdoqUdal2ksXcJRHNZ5ZhCJi6dtAxSnCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784238427; c=relaxed/simple;
	bh=wntFdVTQ2IvioSao0fduLqzD3a5ldRUIMLT8m3IOQvk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GO5fQeptw+Q7UZDmhTqKr00Rr3bf7SHYd28x/1XM6C1Mgd/wOknvR7SoZr3CEzcYAngtrWBsNszLH4FzrIYNKsEm8tpeLD2vhPY48T9v689P/A5fS17X8SD3NllBR6c44ymD5T1pE4nkoKEQMgu81ZLnSeezR7vw8fFxZlvKgbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bb+ob1O6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bb+ob1O6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91DA5C19425
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 21:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784238426;
	bh=wntFdVTQ2IvioSao0fduLqzD3a5ldRUIMLT8m3IOQvk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Bb+ob1O6j4P+wbgSIf3UCT+tlVAHVLHrth5ZnOs/6rP5raSuM6FmPQDuw5SEiFiot
	 Gf1LDyEIEkLQPf+07cRhkC29nX6iSuApbdkzQM8UwOXphvT6NB9XiUmeC8hSxgbN9m
	 MVeVV9Pxl2W7dpeiC2vYZQdZ7ppcdflGMvmmQh9Hk+Yn/Xmoi8wiAggJYQ4VOP8uPo
	 9EA3gim/c7Vp/Pz2/hNVYcilpHVPqv0zD5OuIGXX/tcvDCzhEtwpKLh/DVlje8NxCX
	 Cl37K6nu8SyDjBN5ciqxSX5aRpjTvcPsFnrxkHWMDbntI9cmH28ld1mio6ep6Ys10f
	 mLfwk38CxpDgg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 72B5AC433E1; Thu, 16 Jul 2026 21:47:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221759] amd_pmc: failed probe leaks LPS0 handler registration;
 subsequent probe hits list_add BUG in acpi_register_lps0_dev
Date: Thu, 16 Jul 2026 21:47:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221759-215701-QfmwOPhspQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221759-215701@https.bugzilla.kernel.org/>
References: <bug-221759-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221759

--- Comment #1 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Created attachment 310465
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310465&action=3Dedit
patch series to help

Have a try with this series

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
