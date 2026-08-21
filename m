Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A28E2F0C74
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 18:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787338493; cv=none; b=uH7siYkvXQv+yLe2wIFp8v+DKXDJm/lkmfHWw/fgeqiYYDJ0BK/Cahj6bNiGWLKT8DyFXM7CzioHXR7c8r57Ty1fOVmK35kED/l3m1vVoX9XxhdOqwp4+m/+IYzW2G87oGcEEneZM6/HQ7yjZDusjmSQ922LqZou7YmjBQt4LIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787338493; c=relaxed/simple;
	bh=ux2O2h8ToD/xLRbs/OMeA7xecLcEE1SToORORx9V1+Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tf9GJm3gA9p/ecHL9hvQ2u/Yp4d5RtW2S8hgoHIfLNhkcgCSQpdiFK9m0iQPv4gUfIwezIFHE8pz3As2SHludJWovqQtheQtOEluOKD9bNMm4PrRA2y9u6Vdgj/F2aBFdpqm736dAw7uJUHXZFCS4qtSX5up+RW1QaMAgtm5yQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uoFhNDnR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uoFhNDnR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77747C19425
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 18:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787338492;
	bh=ux2O2h8ToD/xLRbs/OMeA7xecLcEE1SToORORx9V1+Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uoFhNDnRIcSJL9MUFeFCdlPHngEFtIgox4EyJx03ksrBfcOG3XzPTPC+ay9dg5ihu
	 /W5xwy38sbDl/GfoPqoPepA466Iu/a2xlsQU1QHweTx3HyvuInqp6IpRXOPAK7tYYS
	 hmFz8c812oCtBnwNWej8ltW0Ypy3920goiX/l88PRDIvx9A4kYCgjar0JXjlPZmhDC
	 AmMSvLcemk1UlDJn7oKy75vFXum7WjlFeJvxZTYHTY1kfIl86+xwH7KOS7/cNNCM9r
	 WXhPc3kJRlxOKNcuEvZ0CO8O5cXQSOPSPR1LNGaWCxCHnfPkWpiRzbB6dee4W7Ax9O
	 kunPYWKpWZT2Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 50A2DC41612; Fri, 21 Aug 2026 18:54:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221905] [REGRESSION] apple-properties: device path parse error
 -19 at 0x14 on iMac14,3
Date: Fri, 21 Aug 2026 18:54:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ch3fdan@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221905-215701-sVxGc0IxOy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221905-215701@https.bugzilla.kernel.org/>
References: <bug-221905-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221905

--- Comment #1 from ch3fdan (ch3fdan@gmail.com) ---
Created attachment 310706
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310706&action=3Dedit
hardwareSummary, dmesgFailedBoot.log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
