Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345152BE7AB
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2026 04:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773893094; cv=none; b=lkYVmJHJBVTLHU5DQiH8Dg94O3xNRWIbBgOYaQrjZ3oi8cyVeBPevfUNIzm0hROgFL6ifJyO7i17ho94OfdFX8o4ZolI56IsRooOmlQ2T/iG+okhIIUgWkcLX+yKm+bNSuOBiQJbD0DeNNrq4yPznKYC+NtREczrXujWrJ1Xm00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773893094; c=relaxed/simple;
	bh=INOUlFK3esi6Y4SmX5FSOWQVZugXU/Ay3WrrDg/nj7c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NsB9Qy5wYjN2oWLSVfRxUnVUXHPHzpBNNt63TiHXySVG0JmF6OPW0Ce2DKwmp9uocsBtGDUY96ISwS1C8+iahz8+cQvX1mE0l27tzrgMU5mPJv9IezabzTWkRP+9+LluZlzowQs8Kmpigjjp3cTrIsfUH3IZu27Y8RyBfFgbmfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQ4zmouv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQ4zmouv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5E09C2BC9E
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2026 04:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773893093;
	bh=INOUlFK3esi6Y4SmX5FSOWQVZugXU/Ay3WrrDg/nj7c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bQ4zmouvbS6MjN0VgEmRn3d2aXPjhUyUQibJ4Z9Ywsh102aNZxIojX22eyzEBPb4o
	 P1gh28NC+cc76f4c3dHnppBxsor1lTzs0AWfPtQXNioMzs8b20CXDdwTFVOr0nOeyl
	 I601cGa+fmTYwhUGAwSSuz1Jmp9XGtr/O/MnPiSlB0iloSplQLKmwMXFTM4VBWZzux
	 /2ANC4G5MByB3IxfW551OAKCJ5tbHKcEXGUCftoAxpTJDCbzpzqfCf2AUhmq5RSn0Q
	 XGMzEm2JYgJX1RGWMqnkU2VKLpKKv/o9q/QlKeX5sRCKT3f0NssJvRM6CakGBSkmMV
	 inH8GOe7ADWPA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CA1F6C3279F; Thu, 19 Mar 2026 04:04:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221238] lg-laptop: Spurious ACK and dropped keystrokes caused
 by ACPI method calls conflicting with i8042 driver
Date: Thu, 19 Mar 2026 04:04:53 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221238-215701-dBhQmLMZli@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221238-215701@https.bugzilla.kernel.org/>
References: <bug-221238-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221238

--- Comment #6 from Armin Wolf (W_Armin@gmx.de) ---
Can you check if the spurious ACKs still happen with a recent kernel versio=
n?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.
You are watching the assignee of the bug.=
