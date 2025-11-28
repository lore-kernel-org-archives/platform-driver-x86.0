Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76F12D0620
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Nov 2025 18:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764356144; cv=none; b=MZFDLsneZLB4vTsoEKr2HbyxBveMBUM7krCW5gNjMcN+nmcpT3M61+ThqXo8ck5X7Vd+BQxh5UQMSi/XgC+UvFFaz17EgpfIaGzcby61pWb2aSpr4chf4bMAxfhdN8KLy7+qY3Xkf1J9Tet5NlAYfImTo+rhJsVK/tXtQVSzwV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764356144; c=relaxed/simple;
	bh=wypWq08VU2ta6j3mZEvNUAhHKYeOmQWroqL6pezc5RY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iUHe1N3DoHLSsxDR7yxgxX69b3MHnNWYz4gi8EQPA1HD6UMfqeAtQ2n4+npbRBFFN0FcsDi1h6ZcSHGcHj7i7USg1P7hMAggYn1xNSrJmRDEMzd4zxKeIodLmg1+IeWtnswIb2k/d2VEEzuYv9ABvcbKpyHlEXKk6WeU6qOTLVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6rBnwIf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6rBnwIf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 960C3C113D0
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Nov 2025 18:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764356144;
	bh=wypWq08VU2ta6j3mZEvNUAhHKYeOmQWroqL6pezc5RY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=l6rBnwIfZoviaAt3Cr822vTG5H9KMCHBnD6XWcBnBw4HZXRO8/rsEtwrluL8sbyBf
	 htxtC7ZgGXoKcgLwnOO13Ax98iq5L8/RdtaqpEb/dfQVn6Cm412xztpCtWMbqaNxwy
	 C1Y72GIzdhPJlIWMrbW/7Vp87tMJey4X8Yz6uMDqLYdtwuYLNPO+jrWoxCJ6meQh/M
	 UTriklAxtYCKiiMfAP5F38ioVjY7Rts9pEPl80RR3438pSHhWKgPNmAUJQWAI/9RFJ
	 aVd6efoduo8EIzXKQlLBb100ji6gvkpbqvuXVxLX55N6Ba3DBkkPpJ4sYOvcd+FljA
	 5+KAVqIvnwTfA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7FA9BC3279F; Fri, 28 Nov 2025 18:55:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219904] pc speaker not working (just pop's/click's) on intel
 chipsets gen 6, 7 and probably more
Date: Fri, 28 Nov 2025 18:55:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: masterwishx@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219904-215701-4gwMuREI53@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219904-215701@https.bugzilla.kernel.org/>
References: <bug-219904-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219904

--- Comment #14 from masterwishx@gmail.com ---
(In reply to KeyofBlueS from comment #8)
> Hey everyone!
>=20
> Good news, there's progress, at least on the ASUS side.
>=20
> I reported this issue to their technical support, and in just a couple of
> weeks they sent me two test BIOS versions for the motherboards I had
> mentioned in my report, one with an Intel 6xx chipset and the other with =
an
> Intel 7xx. I've tested both, and they work perfectly, the PC speaker is
> finally functioning again! I'm genuinely impressed with ASUS's
> responsiveness and the quality of their support.
>=20
> Let's hope this fix will be included in official BIOS updates for all
> affected motherboards.
>=20
> Also, a quick note for anyone planning to contact their vendor (ASUS,
> GIGABYTE, or others), when reporting an issue, be as detailed and precise=
 as
> possible, and make sure to fill in every required field in the support fo=
rm.
> If the manufacturer's support team is as professional as ASUS has been in
> this case, they'll take your report seriously and act on it.


Wow, that's amazing. Thanks a lot.
My Asus report from support was that they will send it to team or similar
without any future answer.

So we have last bios for Asus PRIME B760M-A D4-CSM that I still not updated.
I understand that fixed bios still not released?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
