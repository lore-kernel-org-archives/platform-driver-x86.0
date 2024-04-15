Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FB41DFEB
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Apr 2024 20:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713213797; cv=none; b=rVK5FO75VX8Xccrkdaiv4V1rrnF5RcAg4TmhOZIhoJnygrSRi/LNfj+1qDH6nq0aoVjJtRvefCoLEUK0DEABMQgcg5Wqteto5xKEPM0QkzZcHJDdn5ZxEykw7R7OpSDmh6NJhQZ9fSlUxjz+xjRTEJBmotjiqhWHmiD4HBGkctU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713213797; c=relaxed/simple;
	bh=lGM05DxLS1V3PH11iUaTnJgLaQWPPrS4OnWyqxblcO0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZxoH5LmxXTeU1MoTQwmtqgOBcbO095N6fXfc7xZlQ7BQBUvulqMLV8wOt5wnoPnMP06/142HLhWEayaIawVcIYegZnNyVCax+UOMaktx883VVBV1Suv7MyGaFbK/dzlZWkJJtOsiPoqjuROL6kYwuZvupaCtNJgYCsB/Sc87CSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQ2IwUpX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQ2IwUpX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02DD8C32781
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Apr 2024 20:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713213797;
	bh=lGM05DxLS1V3PH11iUaTnJgLaQWPPrS4OnWyqxblcO0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NQ2IwUpXGdV1IsAfDcLCt+iWJ18AUR4KKACIrWn5UZiPrD0CdBFVJjOCnk+cDyqAC
	 jIZug6qnRssCqDWZHGFqOgXcLEQJOEnmiSIxkMvSq/Q2nBZlyQ37MLN/W/4h+MfLPc
	 1hXqthVY7SsJBU88FhmaFFf4Y3M82A3Fq7h3FxGEnKNVmERAqw/0MfktN6wAu9Prl2
	 dRLx239rHyR34irCEm/44rnzns0micpQpj4zs6c/6/FaljCTTM5I0KMUGnr2lKmZwK
	 EKEwSf6FpXHTcCdCQh84zY57HrdKLQxeiHEIsY6q67smLD5mO7oUDxtanax9yJIALK
	 KJ/DY7irHERXQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id ED70DC4166A; Mon, 15 Apr 2024 20:43:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 15 Apr 2024 20:43:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-Gz4Q6XNSJR@https.bugzilla.kernel.org/>
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

--- Comment #53 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
7950X3D is a desktop SoC, but IIRC it has integrated graphics. It's a deskt=
op
APU.

But that aside, thermal throttling can be triggered even in CPU products fr=
om
the EC. The interface the EC uses to do this applies to both types of parts.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
