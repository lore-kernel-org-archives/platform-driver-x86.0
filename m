Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE54186E3D
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Oct 2024 22:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727995663; cv=none; b=Ak/divZO4ZYALRrl/WnASoEufiEtZPLPbgyv8YkoHcNkyv+5UmLVcQK+2yTB8FdyETREKQCASVztNIqye/GT42nhF7Utwt/MwniYarKH0/fdj690GotTFUKmLu5/fjvLz4KxwggXeYVI//yHWTbRuJ6x5MbilMIE9TuZ+4OswU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727995663; c=relaxed/simple;
	bh=cBcQu/sV4TPUrHpJIQ+iibzkP9uOpNlccaG3VTwyYPI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b0Wk4BotdFp7NXUItL4kLRRJNFDU0DVeZgYPdF5qQe1Fad03LG5+gGvvDpMtbzbUNkSpZZSfTDPQyjKfW99+CzNjL9VJDTwaRDLrI/LHDWKjslOUQxwnhLQHD7A+bNxGEZHTjALixz7nr6BmLG96++uuFwgsO1Na52QjnNyu/kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eE6V3+Fd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eE6V3+Fd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87346C4CEC7
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Oct 2024 22:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727995662;
	bh=cBcQu/sV4TPUrHpJIQ+iibzkP9uOpNlccaG3VTwyYPI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eE6V3+FdKm2TErQYV9hsOlnyFnTi9siip0d/0TLFBS14HfNvlJP3r6OfKwLoKHsXt
	 SwvGXPKrzAS9I/O5S//O8N4Pt3DDxCFLE17Vjm/VtlSUhOIZHTcarcZ4w37AqvuuE9
	 X9pWLRev6Ov5PHqgn6+gMc4gSJqJexch2GLdsIFePQUsPvnFHaqHggSfb9iL9PwkgO
	 gM7CXqD3HB8If8T6PfMS1n3eDL4+OnDrKOp2KpnNF0y/r4ltrdhl4SRtmYTlN0UUEU
	 4gjOu9kPT8cD9ErqSeyCUxQbrFBJedXk54QxskEhzGi/TnEiD88zCxZoKtnRfnG5UQ
	 KTTdFfaeFeBNQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6C78EC53BC1; Thu,  3 Oct 2024 22:47:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219346] [BISECTED] Disable ACPI PM Timer breaks suspend on all
 Amber Lake machines
Date: Thu, 03 Oct 2024 22:47:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: todd.e.brandt@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219346-215701-NScL5kbfBo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219346-215701@https.bugzilla.kernel.org/>
References: <bug-219346-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219346

--- Comment #7 from Todd Brandt (todd.e.brandt@intel.com) ---
building it now, I'll have it tested in an hour or so, thanks.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
