Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D423E3C6A
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 14:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758547; cv=none; b=Jk7aTZLbu/0kDorn8zVOhTXZxu+9E+1rqYSGNCCtXJSFFUU2pGd/mm6ORDUr1cONgQSU/P780crmU2P4rOD5de6R9UW5GY/mgRTuHOD/7ER+DaQ0w+FLTosX/CEjB6XYoUNEId+vkkiCC3LkVuIyxIZ0GES2S2fkYc+eW/vznhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758547; c=relaxed/simple;
	bh=LTp4XziqGl5Cy3RHFluRXO8Or8jNKnLB2akvBHZqwpE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KMwAKfc/KyEtcBC9IViPNAdxONOTxKN6iZGaHSQIBfKkz2oHZ4GwIvIPL53+1s48sFtaWLINxh+Tyq1iCC7i7Dj6+LQYyZXeWausVafBAIeIga7a2umJILCisdYHiYxZkTrN6Il5vVM7kHMhB+9t9MOAI3E320ahgmkxb5cyNR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WfH5W6QW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WfH5W6QW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95D95C2BCB1
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 14:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773758546;
	bh=LTp4XziqGl5Cy3RHFluRXO8Or8jNKnLB2akvBHZqwpE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WfH5W6QWhTq+W8O7nynll4egWoVXwPaV5gEVGfyOjQ3hafwmgY6pHEc1UHf6RWiEp
	 IHr2kl/Bv29RR0/5rRZ5b5yKH0B0KRI/FxTz1uEp6y8nRna3X1zOS8tEvJFM5sjtAJ
	 Gl29lNUluLmTGBcjXpfCOPQsDnjxzDKgrAWNegCiNndIIEWwOf690gBptQYLjvTFyK
	 Zxf5VbVuvKG1F57AQRyYmee3yqLTqpnroodscPO91FMVj0Dv5h2zqFvo4rMJMzFI8b
	 uwsaTv3odn7/zKwM7f8w/YY1p1Ymg/XRGSk/COsppCk5PcSqruO/7xN098rfqwCixa
	 WhMdwu5ilEUaw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8F8E6C41612; Tue, 17 Mar 2026 14:42:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 199715] hp_accel: probe of HPQ6007:00 failed with error -22 (HP
 Envy x360)
Date: Tue, 17 Mar 2026 14:42:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: mario.limonciello@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: assigned_to
Message-ID: <bug-199715-215701-JAG07aYHbs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-199715-215701@https.bugzilla.kernel.org/>
References: <bug-199715-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D199715

Andy Shevchenko (andy.shevchenko@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|drivers_platform_x86@kernel |mario.limonciello@amd.com
                   |-bugs.osdl.org              |

--- Comment #70 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
Reassign to AMD people.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
