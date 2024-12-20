Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D45A21A438
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 19:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734722230; cv=none; b=MMSAWw7cSNQiN///VjMFuCHyg5zueKHwachp4bKkfbjRN8ie0otuFI+JTvcGi3uO39wmV/e7ruVGFZ4unln90LByOb+isML/IcOTHMwT7M7GM06EHa8aJuZB3kwfLajESD/Dj5Xdpq5UXJmUiMLdYd3PPihFAqJcDC32iBoKXHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734722230; c=relaxed/simple;
	bh=pUMV6hfpoaf3XW6R/9+77CdzyjQGELtGixR/Pgi3O+s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jEDdrBM2aeMgIOeZn/4seIe9eX7Y8QE8rHUeA6YiiS86sSmar+b9O+HTPSZRjHuxT98aPV/Zo+dVM2ZmZh2B8wNov2+Kr4eMmChG9Z+Dyd+10uGM2O8wKyAQ3H4E7yG4EGdC/xhEfLgzJ34gaDpdkNGaOVgrDK3QqjDBqqdPHjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZmZysnWp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZmZysnWp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23E28C4CEE3
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 19:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734722230;
	bh=pUMV6hfpoaf3XW6R/9+77CdzyjQGELtGixR/Pgi3O+s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZmZysnWphyv21HxE74DZC6kbWbgK1PDf5QY979/y7/ObayBBydbyaxUKBKTUVMJSK
	 OMxbssZvRcETihjT9Ovxl7Wo7VJG638MgCDI6kDlGIo4EbWpaC9zRb/KMF4FMBINFr
	 hpY2V/cxhAR7iqsl8/qSl6bFHR3XlHIuLAhZfBgzIPdQUmip7i4DWqOpGse3fKWnxY
	 MzaniNItethzpMDXzQvFN84+hF+2M25I+gFr6USPCAfblyO4puuqgSNtB7/oC7xNut
	 ycLdt5u33vO7pEBQcrXEsJMzNmtEkXvB+AYV73jUXEo0j7ElWmQ2C7DLBvSbILMCNk
	 xwy32h4Z14khg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E70C2C41612; Fri, 20 Dec 2024 19:17:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Fri, 20 Dec 2024 19:17:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarkko@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-3QuWc1k4h4@https.bugzilla.kernel.org/>
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

--- Comment #38 from jarkko@kernel.org ---
Errata 2: missing:

chip->bios_event_log =3D start;
chip->bios_event_log_end =3D start + len;

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
