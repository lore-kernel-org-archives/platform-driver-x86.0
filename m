Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516CA10E5
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jun 2025 21:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749762895; cv=none; b=oZTdIy/ClqoDkT9IVMUF+FX3tVOBHBc1fAe9+isvmJJZU8Sj0LebmgzyH0VGHl5B7EdDdnDgrdxvmIugGl+ubkxwqpBFUJm+pL/wkYu379xJ4CG83dKNrsCgO/FC/Yc+xI94juR6m5E6lnaqPqkmLcfWcJBhnmhI7tiAVLgznS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749762895; c=relaxed/simple;
	bh=xec7PAzJh8jF+6nBgPrIic/BR1GzUxY7/GkFYdOJcPQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J9Nc/XKT1m9ON7I2zQPaV4rmE61uY1d62KbAm9ux6GW8PIBUH9sxXdJZyPuwJEn49RDpbRCQ/xkS3n3vDx1nnhtbbu1x/xtCdPWsZl4ZKWjBR1VyRUKH7pglGZRo2UbCIYnnQI+GzO+mXLMFL4b5VzeXPp52kdMmSqcRudieE54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i3ceY7h/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i3ceY7h/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33C0DC4CEEA
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jun 2025 21:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749762895;
	bh=xec7PAzJh8jF+6nBgPrIic/BR1GzUxY7/GkFYdOJcPQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=i3ceY7h/xUQ8vqKFaSLsermaWyXymV5csRK779VcQl0h3iHwCRI/rjazBKzmEgnPF
	 I9tckAa0+4w+ZVHH0G+unAw8bKAPis3kYErVtyQMF4yTs1IzfEUtRqsOqpqJy1PevT
	 Ks8kCAKgfCKLwh31Mll8oKttABOK53WCt8w5VJtxgrPXvs2alOaEYLyUxqwnMj3uc0
	 IN3pYxEuO27z0yP2WfivSRhmWlfoj4aZG4KgVhGDzm6kYT1Tv1vXtf19Q95Fa6x26l
	 +oc+6G/F/StYBWhVd+YVIqBVjtxMqArG63+uwzDjsEy1OjdiJxz/Zg7q6QEr22M34T
	 9BlxGHGz16YOw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 28C5CC4160E; Thu, 12 Jun 2025 21:14:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220224] Kernel 6.15 causes crash (general protection fault) due
 to amd_sfh module
Date: Thu, 12 Jun 2025 21:14:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: g.molinaro@linuxmail.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220224-215701-bX1DyBrWOU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220224-215701@https.bugzilla.kernel.org/>
References: <bug-220224-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220224

--- Comment #4 from g.molinaro@linuxmail.org ---
### Downstream Tracking

This issue is also being tracked by the CachyOS kernel maintainers here:
https://github.com/CachyOS/linux-cachyos/issues/483

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
