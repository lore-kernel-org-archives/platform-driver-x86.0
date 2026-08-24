Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4083937AA97
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Aug 2026 17:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787592504; cv=none; b=cZpgA08iq3pw02w4IJbsk7hW1McFf4nk8kEA5jpkyY1Ehhi7j4JKTeM1yQeJAk+ly7ZrabeLz+QGTWO5MASWLihFyg5GD9ZplD9ONuHc0w9vs9XZniSSFNgDeE976GDcXrOqnrNyIrcGsurcKDzAXWEk5L3hB+pyO/7qY1iMEVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787592504; c=relaxed/simple;
	bh=fxhzdqZL5sh3Dh10+fm2MZeP6AIx5uaswbxn0T+sGuU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=feEhIpT4/C4/WQfOausAHF9Y5lhMgSXKbrBB1vDtr08uuOy3qVEyjVepr+7gZtHTS8R2BgAy7iMjPFxOPjJC+kBNC9K0bVmPLqiGri3SbrN5nVITsr9SAp2Ss+wUoW7DNo2OpNVU7N3+gCE5HEG/ozTP4zUR+5DaBNRogA34VEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W9LyqqVh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W9LyqqVh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA73FC19425
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Aug 2026 17:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787592503;
	bh=fxhzdqZL5sh3Dh10+fm2MZeP6AIx5uaswbxn0T+sGuU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=W9LyqqVhsj2/OhF7RsxDI179rzgC998RhjEYDyRSe1f+/tVbey84xQah+dsz1cXGU
	 2eBwvi20y2RtNgJeN5FebG+hcsrRp/xSNwOBnoVBVtmLUWmYzZRMusBW/X6JuO1p1Z
	 d7eia3BDPuEDKikcYD9vYBuSG9TzwTlZ7/JCupQN/RVn1V3CcP+Q1M4RPCP0r0CGfa
	 pPrJOnAjBoaMqfTuIE+Xcj5PIOUREJYcR/OxQqrwbxfI0wGamacvK7vroDACHmGVn+
	 YXOtiZAMwTTK+CiGiEaEeDbHPPEtLnhRneFSubCDTW0yEsTuiJ3jaC48GGyzqOXd33
	 bBBAhUuuHEUjQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A8739C3279F; Mon, 24 Aug 2026 17:28:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221905] [REGRESSION] apple-properties: device path parse error
 -19 at 0x14 on iMac14,3
Date: Mon, 24 Aug 2026 17:28:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lukas@wunner.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221905-215701-CYd6uRPBgy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221905-215701@https.bugzilla.kernel.org/>
References: <bug-221905-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221905

--- Comment #3 from Lukas Wunner (lukas@wunner.de) ---
Created attachment 310721
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310721&action=3Dedit
[PATCH] efi/apple-properties: Silence errors caused by disabled iGPU

Could you test this patch please and report back whether it fixes the issue=
 for
you?

With the patch, you should see only a single line with KERN_INFO severity:

  apple-properties: ignoring 2 device properties of disabled iGPU

... instead of a splat with multiple KERN_ERR messages.

Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
