Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D19C1FB1
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 Oct 2025 22:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760481423; cv=none; b=W3JFRseFxH5TA+tbFQWF0n0dJQhYlsQljTkp8r6d+4BsDI8SWC5AHwAf3P4svVkGC8aEFdKEpzYbcn4IhQdef+77U7y4T/uGw7s8lHcAPYohwN7ya5XhpogxFOeVQGY+S/YYxxTPHwZVpi/9ZFAFg716H8+PD489bd42cwIadmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760481423; c=relaxed/simple;
	bh=Yx0hWpXtK0hJ3KVAx+55KVSc/PXrWb9NJ3nGaK28V1Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qbpS/bBZjlVzvwR2CDQuZtoHzaxXju9/zqDqLQoRjFxOKKr6ANA3d/Hya7QN139c+8zo/JpufF/lo8Y3GOCi52pm0xZwE3ykAHZ+7myMqVj2N2UUS3lEABaaBynYO1XzGEXgnNVIdBKfGp2kMsjxNM9n6KA+8+pjAMiHJPo9t38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FTTm53Aw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FTTm53Aw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E75F6C116C6
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 Oct 2025 22:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760481422;
	bh=Yx0hWpXtK0hJ3KVAx+55KVSc/PXrWb9NJ3nGaK28V1Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FTTm53AwpOx4NRvpiiqu3FIm40SBYmzTRDBRcLNxhDqzNDkhmkQj8Oh+pX+jpk8uW
	 zdmYcORrRCz1K3/IXaw3qzhR4+vIW4ckHMPbnAid4iNrJCDl2TuLbGdVywT9jr7Anl
	 n6D/ETZpF/hDd6y9ExbdKpWC+3pA+/4dAe9w0xZuKj5lLR0QV0po/LJqrysChNBtWx
	 HD1rXOha1pKvSOuwngJSpjEj4hgmvDiH0RpjN8NowAdrC7ERXY5akd9jqro7uNkTx2
	 CW0Diqq7p7GUtqm7fGAGx9pcQ9DRm39ud0n/ZMGFHCizRgjMk6BNoNMGQKpd2cNCQc
	 sRobhKRvxOFKw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DCCE2C53BC5; Tue, 14 Oct 2025 22:37:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220662] hp-wmi: Add fan control support for HP Victus s0022nt
 (DMI: 8BD4)
Date: Tue, 14 Oct 2025 22:37:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: falper2003@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220662-215701-vFpXTqSJbv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220662-215701@https.bugzilla.kernel.org/>
References: <bug-220662-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220662

--- Comment #1 from FatihAlper (falper2003@gmail.com) ---
As I try to find a solution, i found out this
[https://github.com/Vilez0/hp-wmi-fan-and-backlight-control?tab=3Dreadme-ov=
-file]
GitHub repo that can manpulate fan speeds and change keyboard rgb settings.=
 I
dont know much about kernel development but it might be useful.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
