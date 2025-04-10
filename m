Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6AD1EEA2D
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Apr 2025 19:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744312009; cv=none; b=qSv0rN6AAYFZgfnIGtD9w48+scuzg+ZnW4dVgV0fzFGPAxmu3CVSG1jvcEduf33dH4cBhnRFHyCQKfUrKcj5rQKT6qT1lKbRUk1/hDwSp42vsh7C3Lc0bqZiOlm7wsAemcrz0Iihn8Qp4H04Iscp2AtnUsi+Sh5wo+Hl5ANRlrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744312009; c=relaxed/simple;
	bh=Ay2EOzCpJkprqq4fXiRWuj4yYWvJoDa5fVHY76QBYKc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EF838f3paXjmWLHmEo+OCrvAlAKx7tsPVk/Xtyl2orhPITB1u8F7WjxfS/eZ2qqoAXKu7enXAce6Iio4q3XQmTapCetJaD4KYNtey9hAy8Dl+G3T/8INpE8E3Xky9BVyGMMzDfeQ32MLrv25OXsdVRHxOmqtK7xEMAMGzD42lr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=byvf4N7E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="byvf4N7E"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C53DDC4CEEB
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Apr 2025 19:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744312008;
	bh=Ay2EOzCpJkprqq4fXiRWuj4yYWvJoDa5fVHY76QBYKc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=byvf4N7Ec12+yGm23keP61qQv4k5GpO0pomCZVRGoBuOqJWUi1ViU4pUF62Py1USn
	 UzEKy/EWwz/7HUOhOnIy9cmX9rbgDDvkWBgBCYTrJs7gVLim0IXM0ARYigh49JjpD1
	 zdpyyg6BLO4fZWV4jLtXYHLxHqsYSWr0cGjkAVKOAW7Tc/T64Gx7uLfwQVdiNkQFBy
	 S0BuDFWAgtwa1MBaELN5wtgPXaKWDV2q74g+Vymn5CFER9QygQvFcEpk45ijNJpa2Y
	 yOQbDtnb445FEPW3CzODv1xTzr+6DLxY3hwk7xugJhdVCSKU8mMtBrzURBRJQ62suR
	 Vq6NCddtK5B2A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AE0F4C41613; Thu, 10 Apr 2025 19:06:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Thu, 10 Apr 2025 19:06:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-dLBrg4YieE@https.bugzilla.kernel.org/>
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

--- Comment #90 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Thanks, that's exactly what I had in mind.  I wanted to see what the very f=
irst
Notify event was - and it was for battery (BAT0).

It's interesting to me that there are notify events for C000 (Processor), N=
PCF
(Looks like NVIDIA device) and PMF_ (AMD PMF device).

The PMF device notifications will have some patches in 6.16, but I don't th=
ink
they'll affect this.

Thanks again!  Look out for formal patches soon.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
