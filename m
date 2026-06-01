Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4759334846A
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 08:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303096; cv=none; b=LGapOOkkoeGepKbTMIWCLoYyxG1VqO2n5r56RRc2wngtrwS2Hoi3uqfAStekr9zChuMbv/QdywG1Rm3/9lftRBWcVAwmS2YBxwkL7xcknC/3Z30ScoD5ZSzrW+IEVuPMx7IRkQQcZhS/DCoo9uGJA9at+VFimJDjwNpqp1OEgTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303096; c=relaxed/simple;
	bh=OscI7e7on1CUGZcrPgulcdn93zKNDy5uZgyu6lhZMmM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jIsss3m075odp8kxAXZB566JCojcmIo3LVpblB2FkG2Er/eHIyA6Asrc2a0OVF/HIGnc7RS5tMzXEPBBWMoNanQf4k8tMg28i5A+X1/nMRjVQvsZJDjDx2RCGW1bI0fzRUOdBkJFL0St8Z+m/mCjJwRCX717zLczsYScrF5L75w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hstuGY4h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hstuGY4h"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F77CC2BCB8
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 08:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780303095;
	bh=OscI7e7on1CUGZcrPgulcdn93zKNDy5uZgyu6lhZMmM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hstuGY4hFEVypqfdYKvfAzy4D+9WOZgFUb1x4Gke0n4HEvg6YYByC0BQo0AYX8xaE
	 f9BdZ129Wl+wOC2H2LPwzf04QCvxMPPnFZxzDCfFu5kRqITkZ6n+DqseExhtW6WwYC
	 MQjQneiIfXZFbW6kKyTnppV5qqIHhaT3WWlMb4Letz1rZsmM2t5SGCJFWLrkkiBwBQ
	 JMOAle7f8rO86LDJr9LEXvJbfuDfKQOJRicQ/PjqRgm51rDIHIVoJxS0Qcgk9uW6/B
	 NxBFJztNzuHnoLTedLsC4tmF7p+6MKBlYqCh+SD76j33IYja80Bzkesj7kOnV2dUc3
	 PxOTm23TRvHIQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6F5E9C3279F; Mon,  1 Jun 2026 08:38:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Mon, 01 Jun 2026 08:38:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-9QmoFgSIju@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #12 from The Linux kernel's regression tracker (Thorsten Leemhu=
is) (regressions@leemhuis.info) ---
Please also check if the CPU is using the sleep modes (powertop might be one
tool for that) and running in the low frequencies when idle, just to be sur=
e;
afterwards I'll forward this to the hp-wmi maintainer

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
