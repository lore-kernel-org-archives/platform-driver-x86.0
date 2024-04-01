Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFD34087A
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Apr 2024 14:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711980869; cv=none; b=fM+6BgjoqtsSzszOJsFS8YKZUVuo1Whq9QTamQLbMIlfYp0ESGKPbou/l7qnkB3o3+auHoY9z1fl6arWJsxj/0nMmB3oTeHH3KDiqONZOYhbt9m+mjFSbEHoLGY0d+jzFWTRNb6YnpNSnReBYGL7AsmErW4x38QGIkQhVDi+GEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711980869; c=relaxed/simple;
	bh=zBwJ3UGKRO6rLVe2vj4BUdpaKwHgIp2lmQTp6q0QWgA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G4XxF9pF5gDSKS5SfyhjywYl0lo6KSphEDukUwduRBhQSERtvKfDMNhO++OfUIDRkLWnbTG1aVy6AmPMsHFg3pKd8U1VmhBMQshWtBmABaEDiQylWO1dv9ceOT2gN8GSlY4cjim9Gu/KY6xdSWGfB2JN9YQHApkEkBmRb39e9Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HfIDXurm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HfIDXurm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 709EEC43390
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Apr 2024 14:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711980868;
	bh=zBwJ3UGKRO6rLVe2vj4BUdpaKwHgIp2lmQTp6q0QWgA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HfIDXurmYa1QQ9i9aX6xlsQkdZorrt01GIU50GRjm+46oIYY4NGH6i4EOFgH20FAP
	 OuYmFdlq9bFHH6BKgS03M5POIn7c2eRW2cQS+27UTPGDljw9H4X7miu2yLAhZ80zer
	 20Ygj5zI8CO2TacdqRKipQHS0wf2T/Tjbdv+SanVS9gzSM1Smn8kzuxWKF2vfvWGMc
	 folc+SobGgvl5MAI8St5/MGtYyiJEf91djOGmctAwC6z+HF+jJPaybVGSFJITKYlF6
	 gWo/bhrKu80QS6qNjnA5GDGnqRAebhes3ComYqsQ1bONXHIhjgvEmrq1v8lHn69R8R
	 PJEqqWldgmMQw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 60999C53BD2; Mon,  1 Apr 2024 14:14:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 01 Apr 2024 14:14:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: ries.infotec+kernel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-5T7ncsKbiD@https.bugzilla.kernel.org/>
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

--- Comment #44 from Peter Ries (ries.infotec+kernel@gmail.com) ---
(typo: -Resume-) Suspend was done via "systemctl suspend" command on my hot=
key
"Strg-Super-End"

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
