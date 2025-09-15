Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B803B1AB
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Sep 2025 16:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757954316; cv=none; b=lz4tD6CXCenTUN658wbrxuzSpRijWjWhXyGM26GZjbdj6p8+kKG2TFs7P1iUa+vpXviMOIJh+5/5UP8c/F+AlXOnLhiLE1FzJ0Zx3Ko2Bobdo3eyry/g1BbzvRqejwDecdlbiIyB0Uca/bGBrb7F/OmJJlOMlS7kGbP3DBMj4cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757954316; c=relaxed/simple;
	bh=6YL2HZ7PNT9LH9xr9pRYAwHymkOGI8krC6RYRgiyNyw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cKSQRj6YKcs8GHpkzIWoH/cFuI2WaHk7gVt4WUIfeFNkbwvHGICUxjtf3bhFOgVIL0PxgKEseA4yAENIcUPHlvPVjpsI1OZMcYQ/Y8lRvBBucwZy8oW8PCgUGRaKDXy3zWM8HA/Ji57lIdLTv8Zm+bBsz8KDI7w0d3BMapSQIuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z4sxt6sA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z4sxt6sA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 748D8C4CEFD
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Sep 2025 16:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757954316;
	bh=6YL2HZ7PNT9LH9xr9pRYAwHymkOGI8krC6RYRgiyNyw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Z4sxt6sABfSy/eHqPs+6XoasnQlYyvviNd5WGdmz5waMCENPA0DU6POZFEEcYLukx
	 9Zc5PDt9ms4CG5936TOEpjdvTwkVnihI5F3sjZaHlMiKTcSP0dcQJBKjVOxnxXfLNw
	 A3OYNFbV6esMIY4PH+rRD4hK5mONtxiAPaJVwY3jR2GhIIL3APb4y+iZOXm/a4E5lA
	 BGQ52Xj6Inrg8aMSiliCRk3lKUnoUiD6HHI3op1W+pgf+6CA5Ox17f5JKtSZqvxe5p
	 8ZMJuvIYZ5QY7cvrgIXM9CGq9qPBhemlWbkStwWQcd0Mmf+u2kQ47rSY3wfJm4FbaL
	 ToPqHhSa4MZgQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6B3EBC53BC5; Mon, 15 Sep 2025 16:38:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 15 Sep 2025 16:38:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-PK8gjIkbmG@https.bugzilla.kernel.org/>
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

--- Comment #125 from Mario Limonciello (AMD) (mario.limonciello@amd.com) -=
--
> I'm averse to quirks and I really hate that the Linux kernel already cont=
ains
> hundreds of them, so at least to me the solution with a delay sounds the =
most
> sensible.

I am too, but this one is too visible to make generic.

> I guess very few Linux users will object if it doesn't blow up everything
> else.

Well it's a pretty big behavior change.  I found that when it is in place i=
f I
close my lid and then open it immediately I can't wake up immediately becau=
se
that 2.5s hasn't passed yet to even start the suspend.

Or if I close my lid before putting a laptop in the bag I would expect all =
the
fans stop before I put it in the bag.  Well now you close your lid and the =
fans
are still running?  That makes you think there is a problem, so you open it
back up to check.

If we're going to keep "some" variation of it around for everyone I would
rather it be on an interruptible timer, which means maybe putting it somewh=
ere
earlier in the sequence that interrupts are still enabled.

I don't really know what could be different with what Linux does with the E=
C in
these two cases, and hopefully that gives us some insight on the best solut=
ion.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
