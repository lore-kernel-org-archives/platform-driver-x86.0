Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB563F9F20
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 May 2026 12:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779798797; cv=none; b=oJKKnvn29I5jOTbc6rY0nVrdTt3iw+Ku7xZsPw6zQ6X3n3QQzZrI3h4hNOhxFQ6IX4p6Teaa9UUxWk6C7CcLFHB0bVn90lOdJ5EckObnX0ULGmf6J9R72JN9UKpIjCAJ8fOoFLQeS4JUWveI2TkCCkk3hhOY0DEMt+nrtCU64O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779798797; c=relaxed/simple;
	bh=Kop/UpwaXBStOXCiexCjXu47jpPFqI5iyeGyylV1z0c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GhscFURdL7NrHufi00jQJdPFGVvcacU8hvoajngvqy9WEAAjhoLnXu6N3TCxbF25PZ1QG40WSBLw0vuAZdARAodLatuZs2h+wIBkpOOirdRwT9VUWdkqt4b7rIZWQHWk9FQ6sHAAhbUqjILjHVd3WbomAHJyEH7KBb8DihdZUPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YudP0Ee3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YudP0Ee3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88B39C2BCF5
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 May 2026 12:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779798797;
	bh=Kop/UpwaXBStOXCiexCjXu47jpPFqI5iyeGyylV1z0c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YudP0Ee3R6+K0U1QuPANdKOa+FZZlFY3S0N4jjIqhmrFYadBoBnsw/5sHI9ESBSXc
	 W4DeVHhYjg2xJsLo+L/mVw7hkCmUHhKmKKX/THtw29k4+f5U49fXG0It3vsRwEuP7f
	 xQ3koj7uzX76euuNoL4su1UVpi7ObFb2gwZ4kiShu18XKMY7GyKCD3X7bTi9wT9f2F
	 mZ3RIDYXpOIDrQCI8OT1raZ7MwKfpknR/g49uJ30TIhWbw1MHRrmkwfRqNCALDed0p
	 4NIqumJryGVlIuORhGSMoOkZDI4QUxCgpeRlzMLUd1ZlfycfXDgDOua8+CCwA/POYB
	 hZHZCCPrKDSOg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 808B6C4160E; Tue, 26 May 2026 12:33:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 26 May 2026 12:33:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: jeffrey@waelti.dev
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-3k8KiP6n1y@https.bugzilla.kernel.org/>
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

--- Comment #95 from jeffrey@waelti.dev ---
(In reply to Rong Zhang from comment #94)
> Thanks for testing! Since it helped fix the issue to a certain extent, I
> plan to submit it soon. Could I have your Tested-by: tag? If so, please
> leave your name in reply (I can only see your email address).

Sure, you can put me in as Tested-by: Jeffrey W=C3=A4lti <jeffrey@waelti.de=
v>, if
there's anything else you would like me to test just let me know.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
