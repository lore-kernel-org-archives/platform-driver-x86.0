Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70B623D7D4
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Sep 2025 04:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757565251; cv=none; b=moe6Y/YYlmEQuj78j4ln4jL44kwByAdg5be/iR7c4j7sFK76picz998waZUyyJhbwRf4980GHgJVeX9lflFKW0j4nht1xF81rmA+OhLkPdVx2cvEBEShAWFs5LlIKn2xCoxbppNXCm2c6rZJ8+OAQw6RaqiFPk5n0kI/bn9f/K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757565251; c=relaxed/simple;
	bh=7jPp5lctn8xHCVIGbW97Q802tg3uiEe6EdRYhgVK5Rk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O4uA47fUq3TEwe8jXGFJQbnPo3I6mlU20AfEPsFARfylOI5xB0ZoMYa1rzIeSxENjTewJ/0rUYh70k7YXQ1U2ILnSs+wIoKL9CIAGfO1EW73xZRtJ9BY2ifIO2Im0pxlRcRpMBJgmCz8iUYEk43ruEliQFyfUTSPTWnK7DFDxF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JrioVHm3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JrioVHm3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 659F8C4CEFB
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Sep 2025 04:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757565250;
	bh=7jPp5lctn8xHCVIGbW97Q802tg3uiEe6EdRYhgVK5Rk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JrioVHm3N6V3ttm6wpsjLYNPNv8C/OKXwZWVS4hdOfdMtY9wTFC8iv0SdkSW5e0wf
	 OK7fL0s/mBx+TtK2FVgH26aslQnwGmyglT9skRup/1WMpUSd+n4NszTHanDe5BHgC9
	 x3dFl2y7StUvR7VGtBI88ll7q6VeLFe2F0pK+hLfAbi0MNWUQmCsqJA0XxqOVnsO9k
	 MaEwQePkNaKOv6kyHZ9Ka8cuYf+cGzE7uIzx4cUtE1ufhV1oMuvxgjSi13Uof0aUQZ
	 3oA2Bme+SPeL+ssjUG6lfo0yAirXVD5WlsC65O6xN/l2knfEoiaEl7hnFFB69vKOZP
	 Un+tz7ooXExlg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5EB20C41613; Thu, 11 Sep 2025 04:34:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Thu, 11 Sep 2025 04:34:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: petar.vidosavljevic@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-8RjNNrUPL5@https.bugzilla.kernel.org/>
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

--- Comment #108 from Petar Vidosavljevic (petar.vidosavljevic@gmail.com) -=
--
(In reply to Mario Limonciello (AMD) from comment #106)
> I notice that pretty much the EC is stuck in a GPE status bit loop.
>=20
> > No notify handler for Notify, ignoring (PMF_, 81) node 00000000be324725
>=20
> Can you try with blacklisting the PMF driver (modprobe.blacklist=3Damd_pm=
f)?

Let me know if you need me to try anything else.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
