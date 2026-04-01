Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3306D4035AA
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Apr 2026 13:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050524; cv=none; b=Jt+Cp0sHzdCSlEYtDn7Dt31jDFpwdKtr7Pu/UUpey8xL3/SE19DfRVkmLClL2ANZjiF7awainB3tbMvUnT8kghbn3fMIXzLpUgPfHplmU0LftoBVeUispQjAvz291Dv0b6RHOGTje9SG1e3ZtnX12ZCzKK1+igOfQEFUXt4lA10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050524; c=relaxed/simple;
	bh=0qLtJ6fpiGJKRs3aWZm7TA6BkWjxtFx9g7Qa8gDC2Bo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rJL99x6CM1n7XsQKFXmbbdy3fLkrBNWA1CmMsCfmt9ra45EwclmU3QL3tK5by/ZtkrK+oaKDsL5CqC4u83KUbUZecXainw3l7Hbt8JDUV5Hq//KbPLC3JUr34/y/1NeGSOXs7SKxK4433UDXcSpXgA2wmabgK9kqMyI6bvbj2ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OpyrQ0Ou; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OpyrQ0Ou"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6125C2BCB3
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Apr 2026 13:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775050523;
	bh=0qLtJ6fpiGJKRs3aWZm7TA6BkWjxtFx9g7Qa8gDC2Bo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OpyrQ0Ous0ZywMrZMcno+xclL91GgAVtUE0++xl+gGCuX7vj6Ja8hd5Sa4XSYCq7j
	 QC6k8Wks9KxMB/4AytIl8zwcXJxEf2FCcvuXNtVe922LkUpr5rYJcuw586/0OPWcvi
	 8eP5hgQyF4qa3lYcy5Ccamh9VV16eMBGZ1C+V+/0mjZzE3V4tkttVV70P9Kpu7/5Jb
	 IAbPq+4ihXBQodLxZQIbBU+wzzkv0WsSJoJmAXfPMbhGq+vqB6AreZaQaeZ7QZ+AhP
	 /4TdlRvQsqCT9cFD7zueuvnDEty2F4+uzwH1TXRYy6iEhKVHS5iJW5HB00LJ/cbXbf
	 eAuCVsHJTt4vw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DD4BEC433E1; Wed,  1 Apr 2026 13:35:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Wed, 01 Apr 2026 13:35:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: anhollander516@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-RYJsmGRwTm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #56 from Avraham Hollander (anhollander516@gmail.com) ---
You should probably install it anyways. There's a lot of security fixes in
that update. There's no mentioned changes to ACPI, so it shouldn't have an
effect on the issue at hand.

On Wed, Apr 1, 2026, 8:58=E2=80=AFAM <bugzilla-daemon@kernel.org> wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=3D221065
>
> --- Comment #55 from fililip (team@nitrosubs.live) ---
> I see there's a new firmware update available (at least for my laptop):
>
>
> https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/yoga-ser=
ies/yoga-pro-7-14asp9/83hn/downloads/ds570271?category=3DBIOS%2FUEFI
>
> Is it worth installing to see if it fixes the issue or is the root cause
> still
> under investigation?
>
> --
> You may reply to this email to add a comment.
>
> You are receiving this mail because:
> You are on the CC list for the bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
