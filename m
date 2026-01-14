Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A76322A1D
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Jan 2026 02:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768359450; cv=none; b=EyDrxXGKu7AQF0QNpi1VP/tdlMCrlnQFevQtdELiQAOFjzDZHyPnY1p2SOf5VhZkWFJ4RzVbHZVJZlzacPc+CeL4/hhY/qHjnLP1iekLqIMd+CQg6SyuF/Ac8LKNRMYfwUus+da6Tw9BV2xYqI0v0PwBy7jISDab9WBgX4qaoV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768359450; c=relaxed/simple;
	bh=y239RiRoNKNfTn6/k34y8lfTpzb+bqal/U5qnFUCWdI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RkOX4dpJ8Gv4hUf5VzJwt5GzlNlW06W15/S+kyCCrTELNcNaLDc/7pcPnR5ExMBaBAmraZKCYB1QaCWFFF3cvdzwAAPxR9Rx+D/lwvr6Clv9TVCa3VZfJii+HldGW79FkgKHtC9+ezJyAPF6i2JBWTJfkhL8Ymlt1Jibat7KfF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lp/RWwFN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lp/RWwFN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50374C19424
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Jan 2026 02:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768359450;
	bh=y239RiRoNKNfTn6/k34y8lfTpzb+bqal/U5qnFUCWdI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lp/RWwFNYbZcKVS/IfPgT38PFK9I7X8NpuKhewclZY45HSxy/8vQha/rFnnKiEWnP
	 LaHNH3nc+NkrUzMXUepGhlMKF0Q7PAiEXNdhFU3VJn/5vTY1aDRXUnnWD0Bs0w8lnl
	 KS9EgOTr+GAtr44ioPKQgwlKuNCbfFTmHz5n0K89KZ2c15h3Rc0zRj9gsg87i0GrD+
	 Kmcr3z3MHBIqkfdPv488JqT703Y5DDyw7no6c7hOh3GxtMGmLa69m5ACsUF3XIzNqZ
	 QlwiE6f0tfhRmtuEbQ4+0iJfZ6hDbqc4Ojl+tNTWctBJXYTngpsepJ8ovLzT/RngeR
	 DhwyoBW1Cf/Jg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 47CE4C53BBF; Wed, 14 Jan 2026 02:57:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220978] [DRM/ACPI] ASUS VivoBook TP412FA: Fn keys send unknown
 scancodes after resume from S4 (Hibernate) on fedora 43
Date: Wed, 14 Jan 2026 02:57:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: monirloucas@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-220978-215701-NzJJeMG9K3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220978-215701@https.bugzilla.kernel.org/>
References: <bug-220978-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220978

lucas (monirloucas@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |6.18.3-200.fc43.x86_64

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
