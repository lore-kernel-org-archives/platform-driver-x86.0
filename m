Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206831A38F9
	for <platform-driver-x86@vger.kernel.org>; Fri, 26 Jun 2026 07:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782459234; cv=none; b=PgQneDRjELB8JQGplpQtnYppkcqeR2POXXiLrWqoMRU1IoZPISbMwV1/2Dfj94WONA+xJMmC4OSAuLcT8IYLyO65pJeRCUlgleZPy5QJPMIOMLr6ygR6fZBf/cu3qET/0UpzlNADdxY6NpYxoYvzHJ0To5r6nQb6H0/iP4bYugQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782459234; c=relaxed/simple;
	bh=EJYAXG4lTqPZAdICNurcDY600th4mps5vj0tN7Xv670=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XjEenRKElAY9DkL5r+PtMaHJfrnqx5HOJvW9f6AaANsAn4Z1qwFvX+ed2hVrFBUc33BVooh5e3TrLbvOy2eUnIh3p8mmgI7qFCCIyfl/yrh4YOG0CO8CjqoYHuyFaiSfpjVEYwnfslbVQLtoC8po+geyYY3Epp/USGOyc5/d8y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4XEYzMd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4XEYzMd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8D0CC2BCC6
	for <platform-driver-x86@vger.kernel.org>; Fri, 26 Jun 2026 07:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782459233;
	bh=EJYAXG4lTqPZAdICNurcDY600th4mps5vj0tN7Xv670=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=B4XEYzMdyOd09ehk0Ea3AQiFSFgNVvJlpW/aWH9B7WOi0AimhUZfkEmOIan6WVyzY
	 Ju/BuKOd59u5a1FksnfAdvSSACwnIhzBqqJS93pW2teQFMK3bP19Ls2YisQubJyFhl
	 2Sp8SJYzIDeP1/SXxyHEfbluUWJFdUkIRB/X6/7yP5i1G7xHBOn81HCnfMPoTlOT8W
	 L+08hLFEeiW31Swf5vOlLXykoBGwc3r9nUzNPqb8jKqxLU8c1bm9d0M2jt6E4dKKa3
	 rqo/geZYl0rDzN4xPxiAnR862MHDL6UZbLjt5DyQVgy3gI6K9EevceWntP1yaXi4uR
	 IekVw1vcJ4ZcA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9AEF1C4160E; Fri, 26 Jun 2026 07:33:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Fri, 26 Jun 2026 07:33:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: team@nitrosubs.live
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-Tn6c9GT3cC@https.bugzilla.kernel.org/>
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

--- Comment #96 from fililip (team@nitrosubs.live) ---
I've been using
https://lore.kernel.org/linux-acpi/20260611-b4-acpi-battery-notification-v3=
-2-f9390382c5a4@rong.moe/T/
for a while now on 7.1 and I've seen zero errors when charging my laptop us=
ing
long life and said conservation mode works fine (stops charging at 80%).

I also updated my firmware to the latest version (PSCN23WW), unsure if that
helped to an extent as well.

Maybe it would be a good idea to ping an ACPI maintainer to get a review?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
