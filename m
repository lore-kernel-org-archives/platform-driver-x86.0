Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0993819D074
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2026 20:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789160158; cv=none; b=YjAEfrYj2mFgoac+w7uuVj45xEd34X1VMSIYjTAhZ7SkO/xda13PpEtebCz5yPnoR2PU2kFTPvQF9t0ncV/2FzpEBX9xBCQ9Xcgz8bQ/KGdJqe6jJfH6n56TXHFnRz+0YuEIWdlpfaIMG7s3/fRJfKD1852HcFoX5CP3w42ql5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789160158; c=relaxed/simple;
	bh=I/bmGzBtUL8wjhl0RQAtjd10z/ypv7/OwG+WKRMt0n0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K83BKbJoUHE5G3pU0PwGS8SMHoqUfzkT1W8HecnefF/6eBC2bXHivDAahkEq2vafKGpvJ/kTo5mIr468JXdvpMyY+0NaKzeJx1tPl45FwEmV4V2nUsK7hTiqxvKHOTqEnERBpXBvLXu+z3eoipyQaUZkugSE5NK0TCyANEjFn6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XhV4l0nq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XhV4l0nq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B265EC2BCF4
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2026 20:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789160157;
	bh=I/bmGzBtUL8wjhl0RQAtjd10z/ypv7/OwG+WKRMt0n0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XhV4l0nqfZSTPfYUzqEbmrl0YWwVlJdnbDpJByODzRcKMlonj90pdNsVW7J2L0BLq
	 OA31VdnwhmXAiE7VaXyzFVlfGcFuhhz7kxSGYYfuj/N01iJJ7uzprkFPHavitINcLa
	 dLfJ6jGxqmPdulj1tUlj/+RHGqKneLgeR5c3+8yrc6B1ncKHf1hvMwLp/Beog0H16O
	 gg1IkYIOj7AyKQ12JH6LW/owp1wvS7PD07mFhVjx6KJWlR4jAED8W9xMLHKTjkDhws
	 XmRfbVKT7Hdl69mk77mukF0t37HRq7ky9UREYmsWWE/nt0Gnjh2ahfwiG+uTRS9e7K
	 edWiGKDKbtMow==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 94663C3279F; Fri, 11 Sep 2026 20:55:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222002] [BUG] alienware-wmi: Missing support for Alienware 16
 Area-51 (AA16250) lighting controller (AW-ELC 187c:0551)
Date: Fri, 11 Sep 2026 20:55:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-222002-215701-W9wyn7fWEx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222002-215701@https.bugzilla.kernel.org/>
References: <bug-222002-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222002

Armin Wolf (W_Armin@gmx.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |W_Armin@gmx.de

--- Comment #1 from Armin Wolf (W_Armin@gmx.de) ---
The alienware-wmi driver does not handle the HID device responsible for the=
 RGB
effects. Can you check if your device is compatible with Windows Dynamic
Lighting? If yes then you can control the RGB lighting using the LampArray =
HID
interface.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
