Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F1E1A9B24
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 07:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781940111; cv=none; b=m62TIRI+QxuHxS+C5UJZk5iOpc7qE9T22aiLFfiQlmqhB4P00AC+ztPXpdd7Xp0YhookfeLQ3JJq8iuC8zLerKPtI6cEeBKyBm/osVi7AjrPIvV2AflrMo8tRbAuEAfl9D1GTT2tNAP3I0045grTTKeuMMUjtp6PwH+BAMuuhaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781940111; c=relaxed/simple;
	bh=ibbVP7SjQZRPlr2K5ZBqWy2nNJQTpBdYsLF/jHm5Rm4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WR4VJ4hsxdRe8YWTmIWP7GWrMqqlArgnUY2IvyNd3JJdYeeoqbJVOFAcsJ9YSmrLhJCaXoYumxG48SkY8wiCWSDaHGePgU0tCDl8CTjB0ED2JeewuLoV4bwfezmZDab6isal/1I0J3VeuLnN+xVD9E6Kr5o/NRMXmfkqR1jchcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jvEk+rjt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jvEk+rjt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98009C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 07:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781940110;
	bh=ibbVP7SjQZRPlr2K5ZBqWy2nNJQTpBdYsLF/jHm5Rm4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jvEk+rjt4baBzoo2MnvSZ3dfOSgKmu3aOlmQcInblk8Er2o3zFQ9AZVzRn2YpeXfB
	 qUzYeZyvMGkF/ZdmflJS8iELwkMV6BuZuSvAMT8ihaJ/W7R4Xp3vI8htO3GUvGEsV7
	 7X1f4OG0dWW5C4YhR7Iv55AXrhvf5gjampy86GWNnx9WrzHBRLBXSnLh8G7t+9/bKl
	 Ap84QIdjcu8erfhXATBm90w0gDA6oyd+TavgZ7hv6he1kKaWKLavncY3Jdx4r6JJEk
	 uISwd4NfCv3bwpjxkQCtsCvixfqvefORgQyj8KRcwUjV+5bj6Rg45OZaJQlwnVba+E
	 jOjM7Zb6wTC3w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8F062C4160E; Sat, 20 Jun 2026 07:21:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Sat, 20 Jun 2026 07:21:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: scardracs@disroot.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-IuHRmNp3VL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #24 from Marco Scardovi (scardracs@disroot.org) ---
(In reply to Milan Oravec from comment #23)
> :) Thank you! Patch applied against 7.1.1 an compiling now...
>=20
> migo@migo-HP:~/build/linux-stable/linux$ patch -p1 < ../hp-wmi.patch=20
> patching file drivers/platform/x86/hp/hp-wmi.c
> Hunk #1 succeeded at 1650 (offset -12 lines).
> Hunk #2 succeeded at 1670 (offset -12 lines).
> Hunk #3 succeeded at 1700 (offset -12 lines).
> Hunk #4 succeeded at 2014 (offset -12 lines).
> Hunk #5 succeeded at 2275 (offset -12 lines).
>=20
> Will report back.

Let me know :)
Unfortunately I hadn't a proper hp to test it out: it worked on a simulated
virtme-ng machine but ofc it's quite differente compared to a real one.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
