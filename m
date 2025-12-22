Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D4C1E492D
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Dec 2025 07:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766387133; cv=none; b=H3zikZHkcZL8R0JMfYiPgutzArnFd+/6mtuph4T34ZHuLeHDl6s+s5WNSdq8074lkQnk/RxnH8Lh0wkSWGQCl7/kZqS4VAki1FoGMkZs0RCOCqGpTxKqpUTxdJ2JjUMZD9KzVFngf+8RSvs/D4jA0q/j36xfscQJng472HaAEBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766387133; c=relaxed/simple;
	bh=maoHfwYvW9n9GO76us60iOA11XuCRH8aWvUUx/FB+jI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KYPJPhSIwXY7CunjIKDPounJ/rqUUhmamRmXwOzLP2C5h264TAsaSgnur/e4YTXSZklrkVPhqhYigjAT17k6BSfS4BPltXVqhf5CSY3O7YlSoJK5X21l1Pw94AO4A9VGenaLCzuebf6D60wfoBkNl0yU1q1YmcroWeP+2827PJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TAnR6oRM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TAnR6oRM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49F84C116D0
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Dec 2025 07:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766387133;
	bh=maoHfwYvW9n9GO76us60iOA11XuCRH8aWvUUx/FB+jI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TAnR6oRMehI+17gEvyzcSKffMInI7CjAJ1DdM9xK6ErfKjbYeRm93oJyXVYJegshE
	 NfsgZjaX7QAO5e0CIyuMGF98DAEBlrQ9QjSfWkj8AYoPGm3KQ4hWht+mlvcP+B+SLE
	 3tixNVRklDySXM9eprcQQNN2FfZ7cs819Co0eE7WbxLg5eQGb3vi4e3RKRIhzg9k0+
	 haglMMwDEfpSOgjOhsKwD11vUV7TutkRNKBch/b94XglsUUTHHGU9t0PTI8Ttj1nV4
	 Tb/ANXNSLpfTtjFc/h5FGv7n1K06ldvg1PXmZZihVmHZlalzVipt62AFGNRotQ/GuR
	 oh8A0bAm3nwGw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 40207C4160E; Mon, 22 Dec 2025 07:05:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 213029] [5.12 Regression] clock_gettime() a lot slower with
 Hyper-V clocksource driver
Date: Mon, 22 Dec 2025 07:05:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rdunlap@infradead.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-213029-215701-t5zLxoeA6C@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213029-215701@https.bugzilla.kernel.org/>
References: <bug-213029-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213029

Randy Dunlap (rdunlap@infradead.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |rdunlap@infradead.org
         Resolution|---                         |CODE_FIX

--- Comment #2 from Randy Dunlap (rdunlap@infradead.org) ---
Patch merged:
commit 3486d2c9be65
Author: Vitaly Kuznetsov <vkuznets@redhat.com>
Date:   Thu May 13 09:32:46 2021 +0200
    clocksource/drivers/hyper-v: Re-enable VDSO_CLOCKMODE_HVCLOCK on X86

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
