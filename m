Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC78B3CFF72
	for <platform-driver-x86@vger.kernel.org>; Sun,  3 May 2026 18:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777832394; cv=none; b=fa/wNToSyFRQrVMc3ob12PFoa5EXzD0Z9GTVh6sbRsEfM5pNcMsCLmPF3yMGpQxvAAN3FZeXA6sLNmT9ScdQOw7C865lfhzyztxNXsEjnFHUXMJ/x7qKikqdnaop2dHU6z1gMlMU/OVAhhk3FBymrRUI4vIDXI++KPcXkYmjbuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777832394; c=relaxed/simple;
	bh=AobalHEtj/MC/K66ms5DMX3+kd4ciiSucmWLljm+Jbo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vC1aSvYUU5QG+3Wn/XoX5m0yR4bp7klnoXXow5xHjcArrfJR/MeiBw5wakJs6Gab6x6k9e9HiPQbKolqt46u7sPVjVahLuuVSIgdjJiTzuJeVRmsByeEEA19tmLG19KzcYy+s5CNfLE6J3vOSX0W7C/vZFonVf0GGZGs6IiYjr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F2IrC0Pp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2IrC0Pp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72E5AC2BCB4
	for <platform-driver-x86@vger.kernel.org>; Sun,  3 May 2026 18:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777832394;
	bh=AobalHEtj/MC/K66ms5DMX3+kd4ciiSucmWLljm+Jbo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=F2IrC0Pp4MVk2XsDreKX4kdMz3cj43h5G265LuV0pxHdEcjH6QycgK/AQDK5fyyTl
	 OexjIUrgulTr8LJdFPR3glPeDCWyJPVZIuoFTToGd+WsIDmwkwoNNvk5QC/RE/DlbX
	 UQTcay0duAs+KEpwK8Y/m1uEW1YwVBsUWfyZI5b0uhjzlk4pgBHMjFBwxBcUsiQrhj
	 UjH5ZHwPSrAsDamI/Nu3a9QLvkpdRcX668qJW7vzrxbi7VNKitzB2J7vGtYoK7BRBX
	 LxZnFa+n7E4v4lGfEmU5noHHydd2Z9O5gK6Gxn/PYF9IYzsMf4c4sesTT4Y5WV8qTK
	 Z8RQT8DhAjG/A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 638EBC433E1; Sun,  3 May 2026 18:19:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221419] ideapad-laptop: brightness keys require continuous VPC
 polling to function on IdeaPad 3 15IIL05 (BIOS EMCN60WW)
Date: Sun, 03 May 2026 18:19:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ladha979@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221419-215701-EKzkeWH1Sh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221419-215701@https.bugzilla.kernel.org/>
References: <bug-221419-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221419

--- Comment #1 from ladha979@gmail.com ---
It's suddenly working now, but this has happened previously for me on Linux
Mint as well where it abruptly started working, and possibly just broke aga=
in
no warning.

So i don't know what was causing the bug or what fixed it, but currently the
key presses are registered on evtest, and hopefully it stays that way.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
