Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B797A18BB8E
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 08:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734943430; cv=none; b=Ivt8A3nNKKAVXw9JEwBkUzj2HVSrCm5sH2Qn9tPnzoHW1x5Lw/k28VRmkKMazme7vUDmiPDhqF00HMQQBgKDHNeOkpPvvol4YjtzwRtEegwIwCd+o2vkLaqt3gFJ1WLy46TIC9zS5GPB4zvp6YYzHzB8ANqNmi7P2EhE9w0yT5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734943430; c=relaxed/simple;
	bh=4N/vyBtRT2QWT0iePRCbZiXG5/SFr7jlCgHl3rG1CL4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uURv51gLFRBrzmLVeqCy0fZsBEVMdqbUeQcMSAxbkwhpU1/XO/wNVeknXXoAl6ZIs6nRUy1pMc3PPkPaJSFHI0lLzr/Wi9aUGxo3CjV8YVtLNOamHGKgED2HVDVrsFZG0PjynLaOs76diK9A7pwM/tqKlLp17ZvotDpDJe8t9Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LHiRmrNL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LHiRmrNL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4EB6FC4CED6
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 08:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734943430;
	bh=4N/vyBtRT2QWT0iePRCbZiXG5/SFr7jlCgHl3rG1CL4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LHiRmrNLdcUiesPRfXNex5CnEWPR7jVZHxVByopKepuYKOEzKxIpuq5IL5o/hFHiG
	 2DyOkdy4OCF7Q3FNWpYcvTVHEjvGfCS9NxCr6V7DE/OpHXr2ufQAQYEDlRcbysngsM
	 CaccujgGnyCyOJUt5XClEQ43OuzuWnSnsGqsPV1Nex/mUtADpIIdGelFiuXVpMKPRO
	 I5mIUGjKocOOByDiOCtx48pXRoiwsDT8xW8LHqvcP/tEK3YiCSpA/0E4O5X3KqXllc
	 9c6u6sUko/hhPYw0rK4rkeZxPJJ2zvRhHuL5Ji05H4VI/Aoms/q9lXyah80i+uSeuF
	 9Vzgvmvq7jy5w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 48591C41613; Mon, 23 Dec 2024 08:43:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Mon, 23 Dec 2024 08:43:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.liang@hpe.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219495-215701-yxIk8MEXKy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

--- Comment #58 from andy.liang@hpe.com ---
Created attachment 307390
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307390&action=3Dedit
v3-patch-kernel-6.12.6-lp155.2.1.gfb072de.log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
