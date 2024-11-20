Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E2F1474B7
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 21:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732137581; cv=none; b=oprOcfH/UrtVKQIs2HczWR6eVzA4O+kswXfqDWBTXeGw68OjMAlxqP6SdIrwkw4Z3uI365I0YbgtAwe57y6RRuxDcPTmxBYs7OAv+Q0e/TTmMAFqJmK0yWyCTzOA30ZLTUt+uftfj18L4KK7z4gtgPdZ8irHqeu+nFn0uAwkP+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732137581; c=relaxed/simple;
	bh=ZwS2zh5VVR+qUITppID7pXNGTtnqhXRWOfTmKbG5f/A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=grbgX9aJ3Iy36F0mVWJYA8eJZxpPok4fSR11zYFAhYeVuvJxEqzjN+wpa/iv2rkmrOj2e7Bwx5OqJqWTh9it0qDnhwd0VZeqBVR1G9fYBQV9AyGX2G0/ykOadtL1Hpckn6RYRrhnR66yPKHoqP31g3TdIQDnWVz2odm2UsbHjHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uSbr6bmQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uSbr6bmQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8568DC4CED0
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 21:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732137580;
	bh=ZwS2zh5VVR+qUITppID7pXNGTtnqhXRWOfTmKbG5f/A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uSbr6bmQg/librU+81kdXnF49fSVRni1wXHBzyZUqCRiSlB07kbTZ95Vdfu/FyFZs
	 Rn/2amMgu2BYzcY/VV64wl/gb3oYj+CLLbukh4Dp6uGfJEbO4HFu1NEenLnH/2TGcd
	 iTGqlf9L7M34Ob17HrxmZX2MLAB7N87e4/J/csPs6mQfin2uuY4lQFTzJfYN5xvfNc
	 btWEmpm+cHRmgT3QGxVX8sdkH3/KBqnLafconawPxnxRCWuDZ6UC5DwWnf7NtBx96U
	 DAIB9L80CEx7/mQs6LzMy+WYLxC6rVDB5tHq26dGFWyUSD1H7VuLnATLYpNUJgfp+H
	 IcdbcGaOmUAbA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 74F3BCAB784; Wed, 20 Nov 2024 21:19:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219517] REGRESSION: charge_control missing in 6.12
Date: Wed, 20 Nov 2024 21:19:40 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219517-215701-DJJhSws3Jc@https.bugzilla.kernel.org/>
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

Armin Wolf (W_Armin@gmx.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |W_Armin@gmx.de

--- Comment #1 from Armin Wolf (W_Armin@gmx.de) ---
Does the asus-wmi driver even load with kernel 6.12?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
