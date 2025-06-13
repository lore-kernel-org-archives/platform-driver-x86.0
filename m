Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4DC433D9
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 13:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749821778; cv=none; b=T9T/dj6S6S3QgqDQg7Rq13fwBDgFbYZFofGsfeHRRkvfLZA7a0wlbT9248/D2EeImRPoeQjwUWgK7CuRaA5qN/xtdmtG50Rr71+zehz4VTu3VZXkd8MA/KsKr/N21StVvimt7WvByE0inXL79tKNzvEegpOxbXLkqsjjCDK0Cek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749821778; c=relaxed/simple;
	bh=aivR4Fm+B2V3vLjd2o8Xdfory2bVA/H+mxXVmRn2Iqc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aJohJdaqtVsGeKhhcWMxl9DY3MZqA9jHVQa51gPkjEXPcQe8n5z6ASJ8ZnT6CpXLYGBOWlm/bdfTd2VsCKPg3b44RkqQxRoYN7wNbJsy7sa72df5paaB0YI1y9yqaVtmNb4hyuwAOceoBG0uV2kwjWfPFtlPLjhyNs0/LDKt88A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSw6lBwK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSw6lBwK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A827C4CEE3
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 13:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749821778;
	bh=aivR4Fm+B2V3vLjd2o8Xdfory2bVA/H+mxXVmRn2Iqc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SSw6lBwKoavd4GBCVcFVEKLIbWKxXxexKJ23vdSrzCSEyNNsvqCe/jqsRjthHfX4I
	 3/TwzL4B0sWNQ0LWXOyHzoy2YJ74pIOND7//RM6IHRc8hx/1+q8asVyAabpX/NSLvV
	 9+G2QPuuP6scGciKaINAIvRzuV1nsqtxJ6zKsxQYCU+va+lnMa5orVpX8HeAjW9nGu
	 UKuq14QxyQpzHm+aNCyCL6rwVssycyzrw9EkfECnrvIsXatOmSJtPX13iwKhrXcmcr
	 Ur5diMGJde5pkQrOBHzUp3CA5Xrrl+b9bRY1XWqsJHPm8XzoKFoq/bnWOHlGOAv49u
	 yj9nX3gpvE3Mg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 60377C41612; Fri, 13 Jun 2025 13:36:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220224] Kernel 6.15 causes crash (general protection fault) due
 to amd_sfh module
Date: Fri, 13 Jun 2025 13:36:18 +0000
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
Message-ID: <bug-220224-215701-k9nzejtxww@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220224-215701@https.bugzilla.kernel.org/>
References: <bug-220224-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220224

--- Comment #14 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Thanks - it looks like your previous boot journal caught the specific crash=
.=20
The specific work function that you got the page fault hasn't actually tang=
ibly
changed in any way in recent kernels.

The crash occurred here:

https://github.com/torvalds/linux/blame/27605c8c0f69e319df156b471974e4e2230=
35378/drivers/hid/amd-sfh-hid/amd_sfh_client.c#L101

> 6.15.2-cashyos-2 : DOES NOT BOOT

Can you double check that CachyOS kernel doesn't patch amd-sfh-hid in any w=
ay
relative to upstream?

Another thing that would be helpful to check is boot that kernel with the
blacklist, but then from an ssh console run:

sudo modprobe amd-sfh dyndbg

This will tell more about the sensors that were enumerated, but it won't ge=
t us
down to the detail of the problematic sensor.  We can make some debugging
patches to output more information, but it needs to be reliably reproducibl=
e..

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
