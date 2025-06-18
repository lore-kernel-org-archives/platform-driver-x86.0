Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F65C2FEE1D
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 16:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750265936; cv=none; b=Ne6HY9CXmUPaD6sg9A+h7/qOK7P5f69jH6mEdotpb0jSWzXtfvxIyR9KfIqFCdlrdydhgvfxeKew/6BKNlwsS40YtYCnTBkzSe4o4u8LZ07T/XO9avLRWvoWgsdj+xrs+0oluIilOA8JMJfe5tnGJBvKLw+p/UcZOVap8H3SSR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750265936; c=relaxed/simple;
	bh=RPrKaSIN/Q5Vv0ayzGQSsu+HAh/N79OqfGwwhzzwmfM=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=SS8y7RuthCS2iBheFv3AMciHNIHvcy4e2WcjCFqmyvY1tpc1023UQyN7RL2AagDj83IzKVW3dsfmln1QSRVVlizVhqD+a4gHZRcy1FX+KA/w/XRUVNRnu/fZXyQJPRnGgoTZ5SsgRTXm9MjQx/+lC1y3wC08dXhKJ0o5B58nK8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9o28cwB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9o28cwB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3B07C4CEF1
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 16:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750265935;
	bh=RPrKaSIN/Q5Vv0ayzGQSsu+HAh/N79OqfGwwhzzwmfM=;
	h=From:To:Subject:Date:From;
	b=j9o28cwB5Iwki4i3G2m0wgZLBEAn39pbRU8f6UmRQ8O/RrlJ7cvU9W9D+IfsCkYMS
	 PXVA27E3zogheu81eVWizS5qbYYijg62pLCOK2Mm1sillAJQoewAwt9KgZbWAxfNDQ
	 BBGJb1VUl03k36VZZh6JYarWMHgn29u8bX7F7yzQ9qkbW/xkbr/WdYYraqbYopQXr/
	 SzsBk+xvJgERBABln1QuHYACgN7gBCKhjyXiecg9DK0zeDotqS0Kju1eyQkmPqdDcX
	 Ef4h8at/ABbV5Hv56WrybQKu8R/KQ9XQxlxGPRT0EDVuc7A7Hmk3h75glbziuKh4Fr
	 BX+HpJhwW9l5g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C7699C41616; Wed, 18 Jun 2025 16:58:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220246] New: Dell Latitude 5400: Mic Mute key stopped to work
 in v6.15
Date: Wed, 18 Jun 2025 16:58:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dimich.dmb@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220246-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220246

            Bug ID: 220246
           Summary: Dell Latitude 5400: Mic Mute key stopped to work in
                    v6.15
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: dimich.dmb@gmail.com
        Regression: No

Mic Mute key (Fn+F4) stopped to emit input events.=20
Before v6.15 pressing Fn+F4 caused `libinput debug-events` to print:

-event8   KEYBOARD_KEY                 +21.508s KEY_MICMUTE (248) pressed
 event8   KEYBOARD_KEY                 +21.508s KEY_MICMUTE (248) released

In v6.15 `libinput debug-events` gives no output when the key is pressed.

Meanwhile, heighbour "media" keys, such as volume up/down, backlight control
etc work fine.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
