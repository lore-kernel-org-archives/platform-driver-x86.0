Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C941DED7C
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Jun 2025 19:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749064034; cv=none; b=UH1/YW5qrr/L/MF8ereC/MJ6u2rmOVWpSFRAHCWHBAfZY91PpyXNpjyHS4qU2Xhte6mnXQv1CkEHh9SZVIAnCL8vKWL/Ntk98r4Apa+y8z60WwfnsVOLHDC7yw/fvgUP9wjZvjTpW9QgsnIBOwp42JVXlA2Kw7I/0r8RyROLlUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749064034; c=relaxed/simple;
	bh=GvSrndS6s8HDWB1mF56aty7/p8JkmQOHzaM6V1tni5A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kj3LJrQlENzHzxBFWC0SIGIFDQQztuox6vBBsF3qTi+9bRKbGuObmhuINocdyOzbg+Got9GgdJ9cdAeU2NTcI1D/M0R8cICMLOTRrmUUuqOmHjc92IP2MXNkqrI+wPnOicS1M2hBF4AwNBgoCErHGisYE4Hh/bFPgmtEqUOBoPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CrVtrlos; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CrVtrlos"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E887FC4CEED
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Jun 2025 19:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749064033;
	bh=GvSrndS6s8HDWB1mF56aty7/p8JkmQOHzaM6V1tni5A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CrVtrlosqq3xsIhZ9e55IlwAe4MDNOEh3HG/ztvkmR9mCob3WYtfx7/4ZEvuwEgGe
	 hnzs2ajjR96LkzC1N9KuFITh+2ZaG6F0sZZkJVKEBM3Hjpu7HtpLRzZmkvI8acSYMZ
	 cbeoOJQP0wbRE1iBuCdHaOJCZIi4wXL74sg1GmcNBautFFVPN+4zlrHeDBLQHhsvRQ
	 MnWvBPdNh6POqpuZeaGI832rOVBulY0a2zKx2C40A/1E41xeUNVClqiEPdUdRp0zYH
	 nOr2eHnvMsyw3UpPMpzcCojKcNUa5FLVhKDWcUkt/HXRQK5grOdcp/4EGxAogFKkLv
	 CJ0DWinhaYrCQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D2E57C4160E; Wed,  4 Jun 2025 19:07:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220116] amd_pmc - Last suspend didn't reach deepest state
Date: Wed, 04 Jun 2025 19:07:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ein4rth@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: mario.limonciello@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-220116-215701-x8iBGejmXJ@https.bugzilla.kernel.org/>
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

raoul (ein4rth@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #308205|0                           |1
        is obsolete|                            |

--- Comment #18 from raoul (ein4rth@gmail.com) ---
Created attachment 308206
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308206&action=3Dedit
report with 60s cycles

Sorry, you're right. Rerun s2idle with 60s cycles.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
