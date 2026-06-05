Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D8236F419
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 01:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780622814; cv=none; b=UzLtHUYnk6XhoZIiidCAFavM36v317J8td3hCHwiKRXj1QdotFNBbEb3cpKnWslpv4wjYKRdIQa7Jr+nexnpLQZXglhOU13oh1K8x66e15eRxRdN0ZDC5OLA/vGIdaPbiGGUhLptaJWEPjrNwFgUMdHi1aTxVSngxVebz9Zjt5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780622814; c=relaxed/simple;
	bh=Cc4YQOxbFG33NWsvlLNk52DBEcwF3RGmdE1qzao9dig=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IpLZtb5fvnY/kmurUcxGEVZxLZVlN29thMQ1BF8sDni95aRXjS6gEjQme2Q+Fp+UgCL/bOCXnbtynpVO28C/M61RJdSkp7APIieq38T1tfTrW1fKD0wakEJ0OOAgpQJD8nDSlginKvDoayW/uZ6a2bVApbzFhV6FrqJIv/aWhmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NE4sliZ7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NE4sliZ7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BECEDC2BCB8
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 01:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780622813;
	bh=Cc4YQOxbFG33NWsvlLNk52DBEcwF3RGmdE1qzao9dig=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NE4sliZ7lbeSGpgPuqD3IQDIxKWH2Kkh3q3AUNPZXdvD7FiZHfZeMRR8EPNrw8RnK
	 Uj5dia0CR0FQe8h1R6O4Ita/EHbmJlGBYWNMGUUhAj3YObLdD33eQ1PoVKS2T4wGQ5
	 IjpPLRH9t+TV4IC1GNokCb0SvdeCwsBJjw8mzk3txpetJnJAYv5PvXvyWkQvb3n0ty
	 UxAX/NB+06fWwFF/no+uSWEmyXmEZEVoHcMmpVTvdNjHmtRsNehjX5AbsjYUnxj1Mv
	 zc0Dx3MrO3Kx0/XNb+DIBDl9Z2R7NmUymfJuw9+BCIUyEm/pwtBBrk6XWgyOt7/1na
	 CVaFINSOxGBPQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9B81BC41614; Fri,  5 Jun 2026 01:26:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Fri, 05 Jun 2026 01:26:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tacodog311@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-VHCzYdWC2p@https.bugzilla.kernel.org/>
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

--- Comment #79 from tacodog311@gmail.com ---
I forgot to do the dmesg for Fn+esc.  Here it is with the latest driver:

[87525.536597] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371904)
[87525.835418] LG Gram Laptop Support LGEX0820:00: Received event 130
(1073938433)
[87526.003610] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)
[87526.009485] LG Gram Laptop Support LGEX0820:00: Received event 130
(805371905)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
