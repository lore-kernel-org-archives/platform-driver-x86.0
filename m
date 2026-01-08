Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAAA155C97
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Jan 2026 07:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767857176; cv=none; b=mJbLhVjGl8BshxzmhJNLCPq+vE9kUaT5q6ZaeX8MzcAArProRzBdo5RGxWzXEyBAzMbsGQys0KAsHRLRlL1s86CZzRRPrqWvm/xdyPC+yO9mcxy9V4Wxk4DUbHEqiXYmkwERkDlG7foss64zbnQwS4eOHUsVFd0Clg+Mp9RU83A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767857176; c=relaxed/simple;
	bh=ZzS9UZVnVbGP2nIrHq0aJnJOptoyFfd50Reof56PuIk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WkhnbVkC2HsXahMs2VitdNm65whuxI2KQv3jXuSfFnKU9qePhjrrzgnD1BhJQJqSBPe4lrb3VfIqYfHSg/9Hj3t5geFmdRbyuQr3KMEtl237MBRXobrps8g2ttkJRo2MtvOyFNIFx8Gd8Y+jbb+NVFg7mMawQKQK5atXQm+DkBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q1m7Ssoa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q1m7Ssoa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 414C6C2BC9E
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Jan 2026 07:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767857176;
	bh=ZzS9UZVnVbGP2nIrHq0aJnJOptoyFfd50Reof56PuIk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Q1m7Ssoazn/NqQLdxAuLwXIUiF0pvkp2dIU08AcAUnzspUubxATiLwo0p0ZOE7fKt
	 wCRukNDyy40ny52Xv0esJ1yFiogWigd4JTWaDOoZPj4/JO552yel9c5QnVkPxz9maP
	 z52aoFKwPYZ50eNgpHMqz4R7bOkGwH0kl2XZ8AmbBxWfbQejBFaAowWlq42xV3dpkl
	 laC8dKyiBtiZXVtb61LBn+Gx/ig3LmvX8Qdfkv5tzVqCIfRCN/DyFzuioxRMW/7j5Y
	 8ZxL9lxfE1vPsO7+djDC9tmlkzwosH7OJUQ1/7KW1GsaoOKuQdNAAiCf4xvsTRHaZE
	 gm78TK3ql/iEw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3BDD5C433E1; Thu,  8 Jan 2026 07:26:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Thu, 08 Jan 2026 07:26:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218305-215701-LJ8pzRSlQx@https.bugzilla.kernel.org/>
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

--- Comment #147 from Artem S. Tashkinov (aros@gmx.com) ---
Created attachment 309151
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309151&action=3Dedit
HP EliteBook 845 14 inch G10 acpi dump.bin.xz

Here's the funny thing.

I can swear the previous BIOS for my laptop (HP EliteBook 845 14 inch G10)
worked fine but then I simultaneously upgraded the kernel and the BIOS and =
the
issue resurfaced, even though the new maximum frequency is different - it's=
 not
544MHz any longer, it's 1101 MHz, as mentioned earlier but even at this
frequency the laptop is unusable.

The current BIOS (buggy): Version: 01.10.03 Rev.A, dated Oct 20, 2025
The previous one (worked perfectly): 01.10.00 Rev.A, dated Aug 18, 2025

But again I also upgraded the kernel in the meanwhile to 6.17.8.

(In reply to Gergo K from comment #145)
> Can someone upload an acpidump output? Thanks.

Here it is.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
