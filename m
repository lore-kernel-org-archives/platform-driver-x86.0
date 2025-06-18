Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD122EA738
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 17:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750266474; cv=none; b=NwA8rhCV38g/xHZlcFpUcwbDVyQ+/7i0t85FXzmlKTZoOl8CuppOr6S8kGMA9p0eobof/k6XcmMKLcydK4L1CRB0ERg1pY14NzR/6NGn9sXLznFDzQAmK6L2acHvXU9Q3eufcS6CgRooiqfrQOehjIkzIw2tf9YBOubgxSMMF9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750266474; c=relaxed/simple;
	bh=1hLn7rbskSl02gK8a1egWslfudVNAtJSw7O9aw3tSe4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fb2BaHyQZr7EU7PE9kict3uX2UiRk9Ky/v8JUPJ2w5NTwwJeqnl4fCI+SVL26iWJAL7SoXeu+RZOYzgyOJ/QMemEVLhi7QKC+OgDXf9xt31XwcREmL92/OW3aMyw+ocu18FpjOS59Xk5wumq6XsENjWBOo9lhAHcMxtm7I2Vx8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vgt7c5CA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vgt7c5CA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6AD9C4CEF1
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 17:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750266472;
	bh=1hLn7rbskSl02gK8a1egWslfudVNAtJSw7O9aw3tSe4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Vgt7c5CA/Pq+oWWX30e10Mt8Y4TaJEzicQReTQ9xLZLDck/nY2OtpzIrq5x0PENfa
	 my4OV+Ck7URQu8GHOigP/4yNbzwyeeB+6sfNkTy5yNit2/VJ7rLnc2iayxubLPhdJB
	 vpTFddiD59eWhUU0+Zdbj7y9QHiEJMEYP8ZetEcKGVQTl1LmUDlwhghOLh2pIYKvtr
	 UFpCpBXaUc6Lfif9Vs8Fe8qcv4M7TRJ5aHWI6oIfttgR5dDryWqYSyhCB+JrfG+sfj
	 dWenLpfsnmJ04xKXd+VqH66ezKNUWez+Fu/kSWepQqHAoR0mhn++dneNi16iGnoTRA
	 mJb2D292FMWSw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id ABCD0C41613; Wed, 18 Jun 2025 17:07:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220246] Dell Latitude 5400: Mic Mute key stopped to work in
 v6.15
Date: Wed, 18 Jun 2025 17:07:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dimich.dmb@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_regression
Message-ID: <bug-220246-215701-icOdy2tYCG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220246-215701@https.bugzilla.kernel.org/>
References: <bug-220246-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220246

Dmytro Bagrii (dimich.dmb@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Regression|No                          |Yes

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
