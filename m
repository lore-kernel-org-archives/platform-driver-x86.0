Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1961740B103
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 07:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791357124; cv=none; b=boOClbeqpdlMrusAtPJSTMnyeBMsTJRBhhr6Zom5wE4IA7PBnlFOcwtS5zXWZBjCxrpHrfVcUDp2jBwWMQygWTeHqFu61xtXsVQ8UFoI7F6AK6QRdcfszp4kPsKADCaNxoSXdVu3ofz5IY+vFVOyqs0T7nKUrF8nrCF6qGEVrK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791357124; c=relaxed/simple;
	bh=X45cr7hjn9CAzfiLpnLiAamOmRNoKdmqNn9V6Wflmfk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AUj4tqFPbIG6CGqxCkNOPU5G70jz/zAC3hEwe8nJqMszCGS3J/XlMyL8lJC0R1jCnKCIgF5nS9x2aNVT0XVZSm3rXjVeV6aVVyznl6HpBT/bauwKJEIKAPaca+60W2Eoo4NmIi9JJyB+x1s1U9NmsgRaYJTx8fGmDd1xM/ubwpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n9D4j02O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n9D4j02O"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 950AAC2BCB9
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 07:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791357123;
	bh=X45cr7hjn9CAzfiLpnLiAamOmRNoKdmqNn9V6Wflmfk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=n9D4j02Oc4ZCykOO0slb/V6Ts1WIufIfdKkNr8jO4v5M8wioYCQ7FixIStdHBtg+8
	 mqbGUY4daZCLB3nvmzckatej+MZydjN4PlMNW8zmRJp/9Tlj7idTH9yhz/9c4uKfpz
	 rVb5N6ecMtffKfBq3enDAHtKOFn/W0fy0aV8Nk89QYCuWF5+6ikbeP3RVUyPOQ7rd2
	 vt7Pkt85al5rqtvBGq+2UIgQdLXzasA1Hy1AohsaWI2xN2DTHkJrEM3Tm+a0qHAH8i
	 cumZzKOAH0UYO+PjVwA0mO0gnNvXcHwiuv6xjj+gHhzI1A9PW1/qBcATqP4rweyRh7
	 HIMODLMzMYNGA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 735CAC433E1; Wed,  7 Oct 2026 07:12:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222044] hp-wmi: Mute and mic-mute LEDs not supported on HP
 Laptop 15-fc0xxx (board 8DC9)
Date: Wed, 07 Oct 2026 07:12:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: neonblade018@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222044-215701-DGPg47pgD6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222044-215701@https.bugzilla.kernel.org/>
References: <bug-222044-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222044

--- Comment #6 from Piyush (neonblade018@proton.me) ---
Hi Zhang Heng,

Just confirming that Comment #3 #4 and #5 above was posted by me from my
alternate account while I was temporarily locked out of this one.=20

Those are my test results and findings for the fixup and the DMIC/LED behav=
ior
we discussed. Ready for the next steps whenever you have a chance to look it
over!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
