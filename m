Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1631C680
	for <platform-driver-x86@vger.kernel.org>; Sat,  1 Jun 2024 20:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717273827; cv=none; b=S+FMVZjKF2cUHsY4u5AzFfJjoYT2CfWpSgqR7jNeea2u//2/q/sdYAcffG12fs/7g70lJG0tRf2EqUkhQdyZL6og6+gIMs26SRp9A+/wHZR7g0G5UAFnxYwI+luTtNRehzWUFBrK97jFQlPUWQfRvuTPcUYsOjEGWZQUsYACebU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717273827; c=relaxed/simple;
	bh=Vf6QbfQvlvdFYPepM6NiHkLQLtFh9CriSuFlv6MkOnM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bcy03mvnhR/EfazLpH6QwuL24RyD3+xjbQlkp5G5BQcZEjzqUGnvK+GzH14VdqxSHuL2mHzeQ0KcYfIrHsxZp5WvDDIxzMBRT/pYbbpf6E1HiBA7mnwTtB7E2d/ddx3suDewvZZ1Pww2ia5b0EGs46xAm+HON8eOdheLpeKDDI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tMXTMtQ7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tMXTMtQ7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BAF28C116B1
	for <platform-driver-x86@vger.kernel.org>; Sat,  1 Jun 2024 20:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717273826;
	bh=Vf6QbfQvlvdFYPepM6NiHkLQLtFh9CriSuFlv6MkOnM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tMXTMtQ7RlicaHC4WMUcvkX5d9+ex/hkBvul/2PhSc1D7R04jeEQBLhahW7kc9qrZ
	 Saz7FiHT6tJcn59vfxrTtuWwW5QdOFgmVb5DQYYHqQh174/E7LAHkffg8V+907hzcl
	 7zJntARBBzOtOJY7e3wjBZqP1omhOiXYpxxL/gPulo9wHFK9qX9WJqT5U5FB+Miaz6
	 GphBAI8qRsClDh2Hu+tcxx3F605UaWHazQqRYEMZqjpJs7KwmxGKvh1YALmqjyTHrr
	 w0kBlQART3l2OqtlhEsksOuFz3u04DWAFnZDrHcFbKTEVNaGqlBUl+aXwPn57ESohm
	 +ymbuHUbjV7aw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AE067C53B50; Sat,  1 Jun 2024 20:30:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sat, 01 Jun 2024 20:30:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-AH2p2CTuKJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #10 from Armin Wolf (W_Armin@gmx.de) ---
Can you check that everything works now?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
