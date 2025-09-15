Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C63216E24
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Sep 2025 16:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757952711; cv=none; b=SPxlVi+J+/90YenEIXYf9f/vGcl8NbcCN3Ql29kMhi9TfnoPW8BlbsFbt7UHMdFpLAO3RRh6wfhIUgDcJju0q/GbVMv1Qe8h9EmVz7tH7LmvVJxmVVpgmh8vd64WjWyEkG5fGH9cq0xX0+ly39PfNxb4D8R1Wb3BfD5UEdCMYVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757952711; c=relaxed/simple;
	bh=3uqcrd68MmEdvVNVAhDrVdBgjk0zvsCI5nVCDgq37NU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L1u1B3L2ZlZpClN5PxKks7XhaYr1KaIb+RIYDmarQyV2txpOGtHbzl63+3Z+p0Ux20aNjCwJNmdrRjp8xYHppyLRxm6AEz+fkmTPtyPRq4kEFU27E+YMDRLzEyC9WHkKeE2rQ5oEectrDIpiuqYejp/Nd5hxpXuaiEfMNyt0bxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CsLXkvX8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CsLXkvX8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12D70C4CEF7
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Sep 2025 16:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757952711;
	bh=3uqcrd68MmEdvVNVAhDrVdBgjk0zvsCI5nVCDgq37NU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CsLXkvX8II3/4X8cTrsrHOrk3A4aPWM8ypwmHdPgDWTqAMsfc0VCm3wi4laOboQy2
	 6Iodvl6kulPdnOLd1Np1RUfPy/GxjRWNAE2uk20D4+UhKB7oLn9hoXUXvwkvNp4gRb
	 VyWhfBGvhM8lgj1xUUyVLdRCMBgpB9NU/ES3pghPqZbHOu5ZlXAPgR4ZLyIZuI5HUn
	 gTDkYJsRHy0bJ3jUPWqhmv1Pwllr8JLlFo0qITA49XAtVMizybEMbRMaUWQwE5rVDl
	 4dvL0HVHohgtt8hKuzhav4CPcDxwJbcXnec5ygwleBh6kOIKL6TsdGZiCHJL7jb8Cj
	 AzaYAgRr5piag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0B4B5C433E1; Mon, 15 Sep 2025 16:11:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 15 Sep 2025 16:11:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218305-215701-geffcAdNUQ@https.bugzilla.kernel.org/>
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

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|INVALID                     |---

--- Comment #121 from Mario Limonciello (AMD) (mario.limonciello@amd.com) -=
--
> I never tested removing the patch
> (https://github.com/torvalds/linux/commit/4dbd11796f3a8eb95647507befc4199=
5458a4023).
>  Is that something I should do?  I'm happy to do additional testing for a
> permanent solution.

If the quirk patch works for you; I don't see a need to do that.

> So just curious, what are the next steps?  Is this going to be pushed to =
the
> mainline?

Let me re-open this so we can talk about what to do about it.

The OEM's EC is an opaque black box.
This /seems/ to be a race condition with the Linux kernel and the EC.

* Upstreaming the quirk is one possibility.
This means that every time we see this we add to the quirk list.

* Adding a delay for all hardware is another possibility.=20=20
This seems relatively unfair to other hardware not affected by this issue.

* Look into whether there is anything different in what's sent to the EC in=
 the
delay vs no delay case.  I thought that there shouldn't be anything differe=
nt
since we're in the s2idle loop, but you can double check this by:

1) Turning on dynamic debug messages for drivers/acpi/ec.c.
2) Run sequence to reproduce issue on unpatched kernel.
3) Run sequence to reproduce issue on patched kernel.
4) Compare the sequences and see if there are any extra events in the patch=
ed
kernel.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
