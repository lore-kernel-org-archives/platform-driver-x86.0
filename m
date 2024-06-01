Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E578E386
	for <platform-driver-x86@vger.kernel.org>; Sat,  1 Jun 2024 20:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717273794; cv=none; b=mW+7KRLxoTo/JMBzUrPHvOxcPfD5xUy2ic6Jxbk87kbVESNy9l77NhQmkO7cvZTQq1h5oOEe28OHvzfRp5HKRNZ4K6+vypRUZceYQvURzoZ+bFLgYcF/WsOroNOfpT/iGWRODsTPayCSjaD5HOLhytePPDu+ykKDjeKDVqSnNME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717273794; c=relaxed/simple;
	bh=iZIayMEkpi3Bh70kcjRPnhB+oQs7DBGIOl9jvEty8E8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SK3U83HeKMXC9IFi0YGvcB8wZNvMNECUdsl/hqtND6wqrr95IooUiIaIf9wqh/hrxnhASSj4yLLXX7PGbQA3uMmtA8aXuOki5ube1JRyFJq6ZgqQSM+4kbHhUue4rPPVicki0V2fBKCU8hFKpwPV6sKA1GKrSZOvuYnhjOJoPt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uiuDv1fn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uiuDv1fn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73D2CC116B1
	for <platform-driver-x86@vger.kernel.org>; Sat,  1 Jun 2024 20:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717273793;
	bh=iZIayMEkpi3Bh70kcjRPnhB+oQs7DBGIOl9jvEty8E8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uiuDv1fn5FAOCqi5Im44txKU2Rg2DiMlqovC3liE+wjpRWMIFOCG5FShX2U5mnZBd
	 p5FMeLDep+S8FHCNL4NkR7THMq0VuUhsgk3jQLnbYhZBdA8Q3obmkAEC+Xmi5Kdza2
	 DCnexN0H8URY6GR3c2g0fVOKiFTTqLWPcQlX9BGfMrf3yo/g7Q2EjM+PBlSXKG2IFd
	 gKjNNo2Q0zhoNaZpZ2TTavcPPsHqpLbfexDQ1wpDSNi9Y4IqHWGGVh+11gvvaoBp5v
	 QYjwC9B/TV7N2coY5MYfPfI90nx3Wr/vX2GVTptobBV+W29grVcbLXuEAvRurTkH3I
	 SWIKkBxXN7u0w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 62FA0C53B50; Sat,  1 Jun 2024 20:29:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sat, 01 Jun 2024 20:29:53 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218901-215701-CkpMDrNRz3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #9 from Armin Wolf (W_Armin@gmx.de) ---
Created attachment 306399
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306399&action=3Dedit
Prototype kernel module

This modified lg-laptop kernel module should work on you device.

You can compile it by executing the following commands inside the unpacked
directory:

1. make
2. sudo modprobe -r lg-laptop
3. sudo insmode lg-laptop.ko

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
