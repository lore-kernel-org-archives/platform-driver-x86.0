Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0BC748D
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Dec 2024 19:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734897319; cv=none; b=FHP1fWNaTibmxezZ6WWH0lidQilPPCNjoFmpRa1nCqRHp62KmhQ4QXq8+i0vzVBL20k+FDFwJ00OyO82CQloq2JnvZGqsPI98aRfD3wZ3CHpPU6WNc2MxhH5ScUam2HlCHaE5F7otgVQEG/XFpIohfxzlIGA5kW/c/g0XQz8G7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734897319; c=relaxed/simple;
	bh=Faz61xJWfQKD6TvUZ7ww1ljagWbFlSI7VJgZr3S302A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OC8+ZP4RHAVu+eiQ2wjbIipTtrdIgbTKQgtxBdyz97HKgobgkPFstkpNqRlxYJF9uhKu4s5YRYz+J5ML46kl5MwPyKbqbCNER9/4yp1PLnSVLipGK6Orl3AwT5zuZJRHVcSk/z0RCCvA1MQeNuPDaMf/sO3K3JOEdSzL77i6vBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pqTHkR3L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pqTHkR3L"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5A18C4CEDF
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Dec 2024 19:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734897318;
	bh=Faz61xJWfQKD6TvUZ7ww1ljagWbFlSI7VJgZr3S302A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pqTHkR3LHUILgO4y7uFSN7DCE+hug1HuzNXpy8aT2SBRU7q6cqsYkA2afH/Mmt1g5
	 9SMeZ/N/tFoAxLgirdSxw6v8M2b2Zo/Z0MKwwmCPQS9z0W64RrcGA9Ws0c4SXDlQQy
	 RK/y4fFpRrYM03c1DX7AmqH/XCumrKuW31e2DoC8q+g92pOGbCy8Fg7oQqWxSaZ4Zq
	 rW2Tph6lKEQcLRpu+1fIwGhGja4WORMgzLV0b05CfZc8CGClqjfMxGnHYYyCD2kg4X
	 IeS0MIBdxMVdHHaJEkAae2YHrMgOjjhYF/d+21jnfGOapI+Q059oTJWjqMgRLTITfi
	 ZNQ679l6Xvigg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AB72AC41606; Sun, 22 Dec 2024 19:55:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Sun, 22 Dec 2024 19:55:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-tOqSHROXCx@https.bugzilla.kernel.org/>
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

--- Comment #80 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Mario Limonciello (AMD) from comment #79)
> > Mario, how come two unrelated vendors have the same EC bug? ;-)
>=20
> All I can do is hypothesize. Maybe they licensed the same EC? Maybe they =
use
> the same ODM?
>=20
> > Maybe AMD released something buggy to its partners in the first place? =
;-)
>=20
> AMD doesn't release EC code, this is proprietary to OEMs. I have tried; I
> can't reproduce on reference hardware.
>=20
> Fwiw I have also tried to reproduce this on a Framework laptop which has =
an
> open source EC and can't reproduce there either.

Got it. I thought the EC code is sourced by AMD.

But that makes it even more suspicious. Why would such a critical component=
 be
outsourced?

That almost sounds like a recipe for a disaster. Possibly even a security
issue?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
