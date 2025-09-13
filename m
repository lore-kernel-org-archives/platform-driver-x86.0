Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39153221F00
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Sep 2025 18:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757789049; cv=none; b=mWKJNgAqCbhgDdVlw3JSGKeTXnFB6n1eYQ+hmy1vEDSGPz5qg+Scej7zua3cnhE9QpP9/FyuPno6xP1pvhyBzQZMhTVouxXjrz1YVlEfucpcmIL2Fe1lUcyeb4adcBGDKQ2LLSvIpR1gHm/FgDixHq+YgwDEw0FrITTcAPZg/ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757789049; c=relaxed/simple;
	bh=gBLCSq5orEH6CV2yV/TDofXYoQkgW6Br9Rr1zZlT29g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fqBIIqP6khkOlGy4dD3otIKqUVw0waeIw6HaytALWTrw0uLw6xfnsmt/Op0WdlbZdkK9PH10lz4N9zYMzbykL+65ECS9ii8e7LhCoCllwxancMgFvaHhcGRdizXx6MoBsfqnUZ7RLwifVZSqdrY9zPXoMfeD3CT6cOjIDMbfE20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YyEU4Ggo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YyEU4Ggo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C808AC4CEEB
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Sep 2025 18:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757789048;
	bh=gBLCSq5orEH6CV2yV/TDofXYoQkgW6Br9Rr1zZlT29g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YyEU4GgoeldM1bZn3KhN4Z5hNGGOTWDOWO5hehASlzmvLzfaInMdmW457UNUhDmxF
	 q8j0q3Dkz8ZmSgWD14cz4Qy2XJ0cvt1qRkyzF8jhOUj6vyIxn5qFvzwBILNwSsF/Th
	 uMlQLU9DZ22blu2ytQIZdCvpM20pVJCT3+UgpteII7dFKhpegXMWU9nO2yxcRpwRoh
	 OSOvCvwJlda+8EWuN27TN7ffq1DhLIRwCfoG5aoaUzb1jlVXKmQhcZHNSf8wogelhM
	 qeXpEfqG8Rhfe5WU97Tac+G/6qITCc88ngIT7IKuOjzAWmDdkmtdyVncVXDoEKGN1v
	 vJjRcvuGpSuRg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C22B4C53BC5; Sat, 13 Sep 2025 18:44:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Sat, 13 Sep 2025 18:44:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: marciosr10@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-auQhoHq1Ov@https.bugzilla.kernel.org/>
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

--- Comment #115 from M=C3=A1rcio (marciosr10@gmail.com) ---
(In reply to Mario Limonciello (AMD) from comment #114)
> I suppose we could make a quirk for always forcing time before suspend
> entry.  I don't really want to do it generically because this isn't needed
> for most people.
>=20
> Can you give me your s2idle report that reproduced this?  I'll make you a
> quirk to for you and Petar to try and break.

Yes.

Witch report exactly do you need? dmesg?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
