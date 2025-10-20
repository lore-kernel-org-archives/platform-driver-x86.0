Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C632F25E7
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Oct 2025 23:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761003177; cv=none; b=X/j8wVOH1b9TIVz472scjyq6CvMniNF/aYifSn/i648QUYznoeEyaC16BpTuonMrk41OM8gsHP/oWyLZg14u0Rs/4Mys9JOdmQgt1l1NpZu29NTX48t1XCuexYKPbFASWekk0neF+b438gnKqilnZQhAE/d0JFKiWkttkNTQx4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761003177; c=relaxed/simple;
	bh=7wu8dPisdmsEz+CEvvX5pmbXW7IrJ0wciIquVP15XuQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tAObIZZhgO7SkPawATJdrEIJZNtinbQYo22ZtMtcIF8gWXGXpV3H7XgFraXUAjF8wr3f4cDoAAlkirI0mbz43/ZSGktdDw8MO9SfnRjp8MdWmQH+TamVt1KbzGZbo5aPHE4oDlaDsRWvJ+rGUNJpyEQ/qmGMGgPmuHLStAR9wRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Py9J/k/C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Py9J/k/C"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9D17C4CEFB
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Oct 2025 23:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761003176;
	bh=7wu8dPisdmsEz+CEvvX5pmbXW7IrJ0wciIquVP15XuQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Py9J/k/CTrffT+VWj/cuJ7FGucXe9YQIY63fPa+5ifKO164+N0kanKNA+wjU3b4QJ
	 tKIviW6nUpcAp9++Z69O4ZrHuo/Bs8gBrKsJ7uzk+5QiwRuPVsD4L0C9eWdpNUkrGs
	 HKv1PkmUTfnwSO/FQoPy1Uj0m4glXiQs2CqnZ7V90qh0CAO9KmmnqZHqprKjAIz7jo
	 oapjwlZszyDNfGZ3FAqk3LXCnJJNzpGJE1rRtQhuMyZN7YZiGiXWxb2f8e2rdqzmPL
	 NK6XyJrDKS4zJ0HRQp1Bsr9i/YfZIDbWfOtZVd/CsMn/YuvwnmWfpeal/hGC4dJoXV
	 2tbFUxA5R6UBQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A9D9FC433E1; Mon, 20 Oct 2025 23:32:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjA2MzldIFtCVUddIGhwLXdtaTogT01FTiAxNi13ZjB4?=
 =?UTF-8?B?eHggKGJvYXJkIDhCQUIpIOKAkyBmYW5zIHN0dWNrIGF0IDAgUlBNLCBCb29z?=
 =?UTF-8?B?dC9XTUkgcXVlcmllcyByZWplY3RlZCAoaHBfd21pOiBxdWVyeSAweDRjIGVy?=
 =?UTF-8?B?cm9yIDB4Nik=?=
Date: Mon, 20 Oct 2025 23:32:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: juanm4morales@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc cf_kernel_version
Message-ID: <bug-220639-215701-lVp44AkocL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220639-215701@https.bugzilla.kernel.org/>
References: <bug-220639-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220639

Juan Martin Morales (juanm4morales@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ilpo.jarvinen@linux.intel.c
                   |                            |om
     Kernel Version|6.16.10-arch1-1             |6.17.3-arch2-1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
