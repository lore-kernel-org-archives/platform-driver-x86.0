Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5D836B
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jan 2024 01:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705888096; cv=none; b=D1RRN7B7RZ6ECcNy7EE8jdZ3cR5vppKUbRB7KR+pDKVtp3gY+THni87t6fLytFtQuR+FN25SZmiOGXRJ0iRbk4yzQNw6gl1kQYfXfIfsBNUbXFIE5n95vpv84ll3r34snG7tNXapFpN7WHMI+u97GXZz6FoPAqUxn6sSVcuETuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705888096; c=relaxed/simple;
	bh=llOQ7Ag6qJ5XZjSQCng2JwPgluzpQgMFRZ1tnBRmjBo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CvG+S27QWJ+N+8/SXoeZdrzfSA54FwII138DWjpwRHLShKxyn1PjiSBcy3yLAnDAhSJdEkuGUQzqwXBNFjLiGCJnx9FUOxj02HQNfo3WkglZZCjHkwgHuC0QG/XO4BgHqUCcU6OMEDlidL8WaI8tDFAJpd+5TF0A7Ob3MjAHttg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oBiVIRck; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oBiVIRck"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A6BDC43390
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jan 2024 01:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705888095;
	bh=llOQ7Ag6qJ5XZjSQCng2JwPgluzpQgMFRZ1tnBRmjBo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oBiVIRckRBNf7pTjysvBMyHufrj6+c2Al8eQEax4i09wpR7TH7D9eYpeZwjfVulcw
	 hhk/UNt9dzuQFwaMLJZWzj3Kw1UWZhn2Y2aeezp+5GGlYiH+PvdpY2dcSvywy6mnMm
	 PHiQTg/hepciSFlZSXhfsEGqOfd06rUr6wqB0q9I0+wtJWEr3SsA+iilgygsKJXxKz
	 qpNG5fCUGB+BkKGDKmTVHkC4WcteAun+73dBT5+UdY5aX5tWHqduveVHLKmNb4QXfS
	 vibTD0YPumShQWPeKjyflkLsDGG8M8HP05mZJlrlpgkHTEw6CZw8Q3tBaAeJBPO2/E
	 R8p4zrGQDyl8Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7DA66C4332E; Mon, 22 Jan 2024 01:48:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Mon, 22 Jan 2024 01:48:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: dan.martins@zoho.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-ntjrpEAVEn@https.bugzilla.kernel.org/>
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

--- Comment #22 from Dan Martins (dan.martins@zoho.com) ---
(In reply to Mario Limonciello (AMD) from comment #20)
> Can you guys please test this and see if it improves the situation at all?
>=20
> https://lore.kernel.org/linux-pm/20240119113319.54158-1-mario.
> limonciello@amd.com/T/#u
>=20
> Thanks!

Hi again Mario,

I tested this patch against Fedora's 6.6.13 kernel and so far, after 6 rebo=
ots
have not been able to reproduce. When I switch back to the stock kernel, I =
can
typically reproduce the issue in 1-2 reboots so the patch seems to have hel=
ped
so far. I'll keep using the patched kernel for now and let you know if this
issue occurs again.

Thanks,
Dan

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
