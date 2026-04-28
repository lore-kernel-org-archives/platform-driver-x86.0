Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872BF43E9C5
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 14:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777388078; cv=none; b=pY1/FKnyhYOqQQ3w2sTJsmChEy9V2oiik1vxsovK9S7E5DmTMGUo/StLxS+Oj60C8cUEORGVxdpqAwrzaZcq3vamlMWkcwtk6PPBd99nmEHDg0QmMMlToHMRIQ4C8OY6NBT1++H2xNXIkZfLl89UekShL7LnBQN5I443Tz84tqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777388078; c=relaxed/simple;
	bh=cBwko+yQN7tB2I3Ka28F3qZju0fMRxylmkBJjVwIYT0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mqLZQyRKRbanlrqcmszvYblJmaSVBn8A8KL9L3JRr3Csg5982adgcDXUAwfk6qFPNMpeOAAxpumBu3NCRocDUKBqiwZ+smMz5Qq5oSs0LiEA4kgGa0o4dWgO2AqUf7HecEYEdktFqq1uF3ZEpVa7KZ71SHLWtkgRyFZt5GF++w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=USsW9i+W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USsW9i+W"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 228CEC2BCAF
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 14:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777388078;
	bh=cBwko+yQN7tB2I3Ka28F3qZju0fMRxylmkBJjVwIYT0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=USsW9i+W/upqBu5FyERUxT8bs6lq59LmVWw83N4i6gsJy9IMTrfr0iIGT1PxO5Psr
	 wgXLxqXnmTw7oBwbRSdK048zbiRrC6RNqwThYW1KEnGE/k6OwyDbyE5Ad/6xTb+H9i
	 CuRkkCneeTMnOHqldM1XBWc+phY8+ss7v/mEgeH0t8JJasvDRMqFwR59QCIxAbNdP5
	 33IJGxO4wbxNq8Svhekb3/cz8YvZ6hp2xJ8mK7s38QGjIOS1fkOYs25jk6tjWSRx5Y
	 CWOvDtdaRo56seTmmdLo7o1zNKIhR9fqjl4bvfOKRbpFCDvmxX+KOlvPATHC84aM96
	 AVYO4iUMOCdHQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 141F3C3279F; Tue, 28 Apr 2026 14:54:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Tue, 28 Apr 2026 14:54:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: metalcaedes@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221383-215701-VKQPKYTKCr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

--- Comment #56 from Daniel Gibson (metalcaedes@gmail.com) ---
There are other AMD-based Lenovo devices with those product family values, =
like
"IdeaPad Flex 5 14ABR8" (82XX) or "IdeaPad Slim 3 14AMN8" (82XN) or "Lenovo=
 LOQ
16APH8" (82XU) or "Yoga Pro 7 14AKP10" (83KG) or "Ideapad 5 2-in-1 14AKP10"
(83KT) and I don't know if they have this bug as well.

Searching for those devices +linux +suspend indicates that not all of them =
have
this problem (or it has never been reported anywhere).

For 82XU I found a similar report
(https://bbs.archlinux.org/viewtopic.php?id=3D292867), for 83KT one that mi=
ght be
related but not sure
(https://forum.manjaro.org/t/laptop-will-not-wake-from-suspend/183975)

Then again, delaying suspend for 2.5s is not something that you notice unle=
ss
you know it - I think the power LED even starts blinking before that time is
over.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
