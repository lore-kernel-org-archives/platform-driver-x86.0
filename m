Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCD4207DF7
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 Oct 2026 14:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791555269; cv=none; b=JqvMnZiueP6BvK0dZoD2SERIb+WWHirGbfbNrg7Uyp82TbFDexsQMxdgXIXvCc8VGbxUnHavRC8oirYJgSxGFPmIceocKtpVH8th57gu7KeVbojsviVtUdLBLtN5d2BNiHtXuIhzv8t/uBZIauLKruYhLKZ4Fs492UsniDSGVlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791555269; c=relaxed/simple;
	bh=aHLUwg7lYDqPbHZjMYrG7c1zWUEU1+wq5Sspik6MmbE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AHhCBJ+fgQQ12ar2+YgK8YILTPVkF235Y/yHgeIW0YbA26JBq12S2pky2scO4TT96ck/QtKy+hGOjHUXorCPdUvkbQXhKcc94fTt4tGGHYhXt/t/Si89WwZiZMU6JNiDtRhk2Qi41ldXTl/0jeFJr3e+Zs10/juLiFkJzW8XOPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IzBSkTOM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IzBSkTOM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7122C2BCFA
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 Oct 2026 14:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791555268;
	bh=aHLUwg7lYDqPbHZjMYrG7c1zWUEU1+wq5Sspik6MmbE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IzBSkTOMiX0LpWqegZdPPP58MKNjM4b+b00h/g5JWfzZWnd6yYFOpsmHSI+HKy2ua
	 C+fLHJrKT62H6dC1vWqp3IusolstleibEZjrnpHsTEpSoYAmPDbcci98aWPIgDAxbc
	 WWTG/O0grOmXWl/2eiCtMWUSWg636GC+NXVnJCYXeD31r8e+3eYdqA3YP6CUKlFlju
	 sbbQcpbLOPyCpYk3CuzgRVOKPzVgzlpO+zOMw7mPMX8ZgSW8eQgWjzdwLNoCu611tp
	 jW9RJ+Dtzua/EKgzeN28xQQS/Jr09NpY2qz+e4Z3ppLvL0hkcFqKQ2Zyi6ODj4kb4f
	 HQ03wFF86Dw2Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C42E3C41616; Fri,  9 Oct 2026 14:14:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222107] hp-wmi: fan1_input and fan2_input always 0 on OmniBook
 7 17-dc (8D9C)
Date: Fri, 09 Oct 2026 14:14:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: krishna.chomal108@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222107-215701-p6CAmYMbDv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222107-215701@https.bugzilla.kernel.org/>
References: <bug-222107-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222107

--- Comment #2 from Krishna Chomal (krishna.chomal108@gmail.com) ---
Hi Jae,

I took a look at your ACPI tables, and they seem consistent with your findi=
ngs.
The relevant HP WMI methods appear to be stub implementations, which would
explain why the fan-related queries return PASS with a zero payload.

This suggests that the issue is likely on the firmware side rather than a
Linux-specific problem. If the firmware does not implement these methods,
hp-wmi has no meaningful fan-speed data to retrieve through this interface.=
 If
I am not wrong, HP's official software on Windows would also not support fan
read/control behaviour.

For now, it looks like relying on acpi_fan is the best option. Proper suppo=
rt
through hp-wmi would likely require a firmware update from HP that implemen=
ts
the relevant WMI methods.

Sorry I don't have a better solution!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
