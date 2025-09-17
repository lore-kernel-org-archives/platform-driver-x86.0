Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1969B1CA81
	for <platform-driver-x86@vger.kernel.org>; Wed, 17 Sep 2025 21:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758145756; cv=none; b=N2lAFm14sZzHo/68HNGTkyAVkj0lDPuIUcyQBCvpgFE7iaFEytcrHa8YM9GsAfpyZc62olyf1nt27pdN03ZfSL+vgrEWbhbe7usIyzja+azOt/HYdw16h/dWel7FoQyP02fgH/eLD5yYoegM0fUXhmLoZEaeGAnvMyFm61mbse4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758145756; c=relaxed/simple;
	bh=T8ebWf6DsGQXGC9dqUd+O6nl56jNJtTs19akr2sLxt8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y1EQbdNQQF/vA5ot10M9W0EpcXSrxe2KBztm6iqjP9Hf/yGYNRR9ZzSCNzDnMjXm5wJUlz5fYX4CezHlk8rEsy0KuPUcCniguVLwKwqIk+hu/TEXXvkZQTRLd5xbXwql8IHirbZW74g6hCv2cJv6mKcNBoprjC03qp9B+nPMHtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E5SVQBN6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E5SVQBN6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 992C1C4CEE7
	for <platform-driver-x86@vger.kernel.org>; Wed, 17 Sep 2025 21:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758145755;
	bh=T8ebWf6DsGQXGC9dqUd+O6nl56jNJtTs19akr2sLxt8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=E5SVQBN6pDH5GDfCQToMgX2LLwSMOpTCcifkYx7nR0ZeMu39ABgsuvhOZ5VLvYTtE
	 yvtrpavZOnUhoc6y0xnQlXaJN+UZhzoOrL1ThAJ7up0OuN/BfdTiqhAWiyQA9Pc/nD
	 EsVttJM1hM+4G8OSNIgmasDeg/9Z22eJ+FA7XGjh18HszWBibJ6JPwVtYuZEeRQ3po
	 c94auUwQqs7LP2nzGmlWQ4dMMtPDMYm8R9e7wmJsvKZkI5Psk11PCDztlYtIYo77IC
	 YTAAPkYZobTQKLMZnjwwUjiWgH0yrNDDoEFjj2Efle4T2iPWgeNrNns9HdhLadU0H/
	 NtL8chy2T8IBg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 911FCC53BBF; Wed, 17 Sep 2025 21:49:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Wed, 17 Sep 2025 21:49:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: marciosr10@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-218305-215701-RoZR5OSJ8w@https.bugzilla.kernel.org/>
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

M=C3=A1rcio (marciosr10@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #308682|0                           |1
        is obsolete|                            |

--- Comment #132 from M=C3=A1rcio (marciosr10@gmail.com) ---
Created attachment 308689
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308689&action=3Dedit
It contains 20 runs with the patched kernel and 20 runs with the unpatched
kernel, all following scenario C (procedure described in the included READM=
E).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
