Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D041DFDA3
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jan 2025 13:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737032815; cv=none; b=fWf/MCrV+S60LvCMJfbMivSfFAsYprcktYOYuVzp6/n6GT5RKzImQ/uk3TuuGvsPpzxiLLD9cjP/I9CiiIdZDibzsAEKMXwjlD09DZWGj+DCTvHOJh5gY5leykWnK0GDT08lUt+4qX29oxiIb5Emw5E1EkEi7WeAO05XvPPEOF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737032815; c=relaxed/simple;
	bh=9/m/JxEi2svFtWL1kMEj1j8323ESDgcq/K9IjRZnYUI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vFIWNJHx1jFLNmhqWEifZRJUy5xibyhbpya8EKdix3NevGV5QRFMmbq7wT/ouv3v9y3TLoHXrWB4uM7mLEOPqcCPI+Du/jXi692vOblzaiswGdrj3KiKrTKNlybMOiXC9Zyw6ldcUVV5N90VLMyBaO6hsP6DdMbnb3ZpBzLvV3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H82kPIX4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H82kPIX4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94978C4CEDD
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jan 2025 13:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737032814;
	bh=9/m/JxEi2svFtWL1kMEj1j8323ESDgcq/K9IjRZnYUI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=H82kPIX4mDAXPXiXIWSbESTYnn8U3Ht3tQosqpEzp97pyRMHxfbihlIxBz+TZqlaR
	 G9z1bs1x0PXrx0ouFZ/mS1bh7tFcWmQ2bzv0oJFO9TNWsrwBl47GKA5l/C/oaPblN3
	 rzwtu9yT1j9IqrqUhN+BEzGDWJsRWK78TITjQgv64iY50C5yxUt0ur6e41Zk5rLND/
	 1gDo9nxujJU43ydH+dRa6KquMiOj7Wh35UF9ZzbwDT3AiboOYB1n9v7reG+l0P89Ok
	 5A1tQKPL14r8PyvS/2YiJc6IDlnd+NR5X+ybMGdXdzmMdeeeq1c0vWJDInq23FDqie
	 2cT3sB95LGpjQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 86D44C41612; Thu, 16 Jan 2025 13:06:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Thu, 16 Jan 2025 13:06:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tiwai@suse.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-31I1yqQF8c@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

--- Comment #68 from Takashi Iwai (tiwai@suse.de) ---
Andy, test kernels for (open)SUSE with the latest patch in comment 66 are b=
eing
built on OBS repos.  Once after the builds finish, they will appear at:
- for openSUSE Tumbleweed:
=20
https://download.opensuse.org/repositories/home:/tiwai:/bsc1232421-v4/stand=
ard/
- for SLE15-SP6:
=20
https://download.opensuse.org/repositories/home:/tiwai:/bsc1232421-v4-sle15=
-sp6/pool/
- for SLE15-SP7:
=20
https://download.opensuse.org/repositories/home:/tiwai:/bsc1232421-v4-sle15=
-sp7/pool/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
