Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA971F947
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 May 2024 21:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717106185; cv=none; b=i4NhReFjinSTos+/6xWgLukrxxuxeNZ4OO4Hb1IpNYi7RFf5ZyPigM7Rux8Z4yXWAcSpaDFRpo2eJt0UiBNK1GcpLiGeF5QnE4Q8qwZHDoPLSu8jdzaCqF1A3zI0epVi58H7FutLMQ7w8DWRoisIgSxG5m8tBOui0sgzMdRn/YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717106185; c=relaxed/simple;
	bh=rG00bV8NMBjxCzfIAY28DLytlu11GFUMaSbxAPp1BJ0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z0igK5pnkD4cdBt3nmYNRuaqsrQnqV9w1+e5DRiE8bO+JaeSsUTEi5nInh0sUotAhPVfFcBdJLrl6CUHk4596Wcy2/QOIA+8ves1PDStyGOGw3L4E03N7OZGaMPYBv/T0vzuGpmzDdUs/HeDVy4QQ3zrI7uzN+fxNygLD1zr6iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pq74rHnj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pq74rHnj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B44AC2BBFC
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 May 2024 21:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717106185;
	bh=rG00bV8NMBjxCzfIAY28DLytlu11GFUMaSbxAPp1BJ0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pq74rHnj25w+HblvabdzEPuw2RgffVDlV40E+pEZ/Qlg4SmlTEHQwgktWT5ioqnft
	 xb9OIWSKvgEo1RAMb8L4XM4JvjQrXWvLse988Ji2DBOeHg3/1uCU+eB0W6VPXMNp1x
	 ioiCKsEGsa0L+0wvp/f0g6973cGUaOjTED5KVUwjKRunQW0FORbfP6tyK221pMQju+
	 GGm2uXEXsrJhxEOedwjGBjtw+N/C5YwOFYi/zTr7lnPCQQkOpHoBBH51v07PU7DBW0
	 ulKa3/j9CmGCS747yhi8P5typA7m2GZun10HY4KKlxjXsm1k1FPchM0LqO5MijteSl
	 51zXFNvtXY7Cg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EBFE8C433E5; Thu, 30 May 2024 21:56:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Thu, 30 May 2024 21:56:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: agathe@boutmy.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-Sk8KHWsoYY@https.bugzilla.kernel.org/>
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

--- Comment #8 from Agathe Boutmy (agathe@boutmy.com) ---
(In reply to Armin Wolf from comment #7)
> I think i will send you an modified lg-laptop module for testing.
> Before i do that, i have some questions for you:
>=20
> 1. Does /sys/bus/platform/devices/LGEX0820:00/ exist?

Yes!

> 2. What is the content of /sys/bus/acpi/devices/LGEX0820:00/status ?

31

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
