Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5931331A6D
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 17:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771868273; cv=none; b=d58+LBZOslJ/j+itTmdGYYR5+t85VX0N3tH7a/fXSYQBhu/R2qVwYOGgzVHnst0XciM2E7QcsAOqWtJxHYA8A4acUanoL0dRpmDHiebxVOclYeSqa5tFh33UIzF+h6SfzFWzdliySLKpMyVHR6i00AfDrLavPoRmnyf8E2CI/GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771868273; c=relaxed/simple;
	bh=qT4GUK8br58w+aQNMANC6Rte/XCpVKhrstEC0UePxMs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EBIDTC+I7MgyfoEVSDW1qsBWpnyN9oZ6EmH0scxFZnv8O4dBP42zSlroCgDQMbVkAO7OYN3f7Z4mZUl9gAlaFXVdn9rXrkkL6UmdDYqOE3xDPfck2cXHlVgK/uUn5ef47IpJgBDBaaMIDqCDp1Rk+ZtCxdWs8XgNzJsWFPo5K9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIMt8G2f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIMt8G2f"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82371C116C6
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 17:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771868273;
	bh=qT4GUK8br58w+aQNMANC6Rte/XCpVKhrstEC0UePxMs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CIMt8G2fpw+z6OgBm7EhB9oFr2NI3P6iJ27nV7a+0g6jiyt4xg2w8WkKQ5oYjnZsZ
	 kpwqi1CuAdIEgvovKxxIc1jD7TOAUfbJbsDs6bAJn/CXDOknlW0doKWRHm9a+rPHxc
	 ZiHgYKCn70/07KCkq9AI5RVnaEytw9AMvx3gaNdG7pJXv5C6zGh8sWmoXV4k6BtQqM
	 wlT7t+IwSYPzLUek1Ge4+VBkgppQyicXqbivHdvYXr4mCI67TO35U4I9ZC12THrHxT
	 gx8fDfxQ0/ZT+mj2ePQFa/HMAYH97k+kIfmfrkh0qJ9Nrp/Bw1dHAwnP7HhUdOFDK6
	 ctUy+l9g5wkXg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6FFD7C41614; Mon, 23 Feb 2026 17:37:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220722] Non existent battery reporting for a laptop with
 touchscreen MSI
Date: Mon, 23 Feb 2026 17:37:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ggrundik@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220722-215701-8rWE1Fs10O@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220722-215701@https.bugzilla.kernel.org/>
References: <bug-220722-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220722

--- Comment #15 from ggrundik@gmail.com ---
> And probably also hot unplug it when the stylus goes out of range. I would
> say patches welcome.

That would not be possible: as I said, touchscreen just remembers last know
status, so if stylus goes out of range, panel continues to report that last
value. There are no event of "stylus is out of range", since "the range" is
about half an inch or less, and getting in and out of it is a regular thing=
. As
I can see in HID sniffing, the only event is "stylus current status is", wi=
th
position, orientation, buttons and battery status, all in the same message.

> Yes, fixing this in upower might also be a solution, see:
> https://gitlab.freedesktop.org/upower/upower/-/issues/197 for an existing
> upower issue.

I see. And that issue is closed wont move, since kernel "fixed" the problem.
Thank you for this wisest nuclear solution, oh dear.

> Patches to properly solve this are welcome

I can only repeat: this was a correctly working situation: kernel was doing
perfectly fine, forwarding device status reported by the device. Device is
working fine, reporting everything it has as best as it could. Handling all
this data with its quirks is not the kernel's business, but userspace.

So removing this metric is a regression, please revert it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
