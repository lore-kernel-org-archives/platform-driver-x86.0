Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501A315687D
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Apr 2024 19:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209755; cv=none; b=YiUVZnfihiDDD+3DDgh2jLY9EMdw8e6u4Q35cpZzTg9WMUuec6HP/Oz6zDgvHc9vJDtmn8FS5pSPA90vJXGtVhtAb0swPMTM1Rw+mfTTGOx/hRdlq1bGWCG01MCY8gTHpLAEmmTeiFiDvd1TMCUALWmVqf4gmeLX8AYZ0IX4IJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209755; c=relaxed/simple;
	bh=XyZchZMbq2G2Z3p/f4xWaSbqjEAzVoppxnP/38PwPvo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NC/rr0YG98YJ9bIbvoRUMRlotzBvrvRl0wEoQnOiWPPOhqUyddnCe7qjkGrVV0vjoLXBU0jp2SdBwCvggbTPp+m5oW4gSjk2Q3whGSVmd8dm2ddsbAbCjQIfGA/uAsVEYw80xg4d+uVrI2mB0zerjyK/PrfYM6fteJa0pkcV9is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DTgI1wRZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DTgI1wRZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C10EEC32781
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Apr 2024 19:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713209754;
	bh=XyZchZMbq2G2Z3p/f4xWaSbqjEAzVoppxnP/38PwPvo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DTgI1wRZApAv2YhENxfR4kfJfrxNmN4kQIp4/k8Bn5ANAINUu1td6jgWgrtUooQxD
	 dZR+GV0QgMtLRRlrhDEunXPUWvIKgCyTci8Mq4GgXOjnUOsHzfETpLu69l1YZFgQKD
	 EIqp6rQ4gu/cMWUTwUBoKZb7h4BAK/lA7X6oHKHkIE3qs0gLNSCw5BgqQF5Vfr/OcO
	 FlMo09PLACpRCXVJcKCk39175CIAq1An7sdsBfDcTYhBfsqYWGcG6OTj2ZUvGNrZeN
	 EmRZMwa7bSkBwx+PQQvbt69fMWaloEOotkP6GGdlD8Nbenw7rXHQIHnkR23sWjH/tC
	 YbGj3wKYFylwA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B77AAC4166A; Mon, 15 Apr 2024 19:35:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 15 Apr 2024 19:35:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: voidpointertonull+kernelorgbugzilla@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-Wccgdxw5Me@https.bugzilla.kernel.org/>
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

--- Comment #52 from Pedro (voidpointertonull+kernelorgbugzilla@gmail.com) =
---
I believe the other issue was supposed to be strictly about limiting max
frequency causing issues, and I'm definitely not doing that, but possibly I
missed other fixed, I surely didn't keep up with everything.
Understood the warning though, but that's exactly why I pointed out that my
kernel version might not be helpful.

The main point was that while all discussions seems to be about APUs, I
encountered an issue that appears to be really similar if not the same with=
 a
desktop CPU. Just wanted this information to be added as I've found 3 bug
reports where this problem is mentioned but with only laptop CPUs discussed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
