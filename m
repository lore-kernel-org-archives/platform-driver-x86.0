Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084D8143895
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Jun 2025 17:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749059626; cv=none; b=rg3NJgF8fT/mhtP/ww0uUWUvJD0DaEa9s4SFQbY9fU3vZDMUgokjAW1ImmNToFzjwWfUomlPDf43MNMNOFtj4zg1khjsz4f8YaBaHqGJPtbzyEN5ar4uAd20XUIbi6MfMWGYKjOld6On9gyAzN3ZCahAp+Ex+HQc20OLsE3kJOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749059626; c=relaxed/simple;
	bh=F5o2YAd3RJ3RdTDKjdCyXz38qbooH6ZgosM7CthvpOk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jgCBu8QSZg9NOL0JLDU2vfu0YS6iczJaESswa8gZxZl/aK+4PNeBZGzQMsrXCehJc13Gqh6UmMtwYVmsnM+qHn0klo0bEidM56lAbXJy7jtg9GvvrK2wxTD3a0STwpdsbgQJfJFBTwwgoEakM1ZkZ9WID596EOtkGz0efylFx+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QaD82IDi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QaD82IDi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B75EC4CEED
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Jun 2025 17:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749059624;
	bh=F5o2YAd3RJ3RdTDKjdCyXz38qbooH6ZgosM7CthvpOk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QaD82IDi7S4dLfp51PGUdNsI209/cPYQmg/Q97bAe3Th+NJI95cpcuZCQSJ1qJIm7
	 tfQ/GmD550NkGZ6zYrZ49/ZZiGxXNcocisJYPANmhnfj5dv5YlsNJUmoC5c4ypQmaW
	 6/SDWV8KqMfqK0U/AE5/7X6ZibfZalXhZyWfbSuiJTtj2md6XpaJxPTqPq5Xt8kGI2
	 Jk2aSqfSAFm7n5nNxOlimWDYhj4X2CPVJ8h8hUwlHvJ+4qCo/rvkmglpoCAvYela/q
	 h5HHtRVkiVRodwADsOGOcUcoprZTcYD2qAkYe9sIBMAVAz43zBdBwIygt2GIC9GZUQ
	 UHijQGYlCgwKg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 63F98C4160E; Wed,  4 Jun 2025 17:53:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220116] amd_pmc - Last suspend didn't reach deepest state
Date: Wed, 04 Jun 2025 17:53:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: mario.limonciello@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220116-215701-p12uKcVhEj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220116-215701@https.bugzilla.kernel.org/>
References: <bug-220116-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220116

--- Comment #12 from Armin Wolf (W_Armin@gmx.de) ---
The AMW0 device seems to be associated with the custom EC interface found on
devices manufactured by Uniwill (see
https://github.com/Wer-Wolf/uniwill-laptop). The notification was likely ca=
used
by pressing a hotkey button.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
