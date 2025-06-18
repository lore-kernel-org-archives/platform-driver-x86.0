Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019553085B3
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 18:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750272175; cv=none; b=BKlGEYfoQjlDC9y2Qtqx5R1ALZvp6euH3U6oOrStPbq1nJ0R/MRkCXuVYYtQRpBdoYZtkHqYfe5ljO3WvNzt/4nk2PfVJHhMkwRz3DIShmPzm4sl2Hu+1VSUE0iBRwZjFT1WYErh1NyTPTSJ6bS53MevXq6i0s1pY+LjHoo/WHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750272175; c=relaxed/simple;
	bh=QM8sz5b2JVW0U67nlmiL1Wta0+dbku175nX4GzSJliA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uVkM0PEGO13T+ssFju1o3iN+w2ufDZQ9F/2nXWKPpKdxgQj4bYzX6Co5v4SS1w7BVC+KEbyYNYneGdZwRFldH/zBvblb1Hndlh4sWuPmuvQLll4jYdVV41ftRTxZcgrZd3ys5h5qvCAmh7TVR9L7Le5LrWjHAWYyg3HK4Y32RqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=egbzj2dH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="egbzj2dH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B676C4CEE7
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 18:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750272174;
	bh=QM8sz5b2JVW0U67nlmiL1Wta0+dbku175nX4GzSJliA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=egbzj2dH6BhjPEalg4xn9sKeCS8L1g5uRjO9pgBYu7wQU3kjWL/ADYOkBE4LMCUX1
	 MpsAMIWXkdaRFJgd32itfu2ikrPRBAfU+5UR5dGBLUfG0jNRslX1HIRB+95oIY+9np
	 CO5nZA+NMRypTmh7UOCe8Y22aDW0LicnNw/HIb0a6q7LIpYZFu7dyEx5mPYqUqIOX4
	 aPCQYHXBihuG8jGrxQtx2C0jUoCWunmylzw2yMAqHKvbZ/ujJGRb4uGZV63q/4r8M6
	 nogPuum1OtTu01h1S0Dxy/5YNjDvHFNvzwpa9Pk/2iMLbszVmmV2vtbDfw1souSdW/
	 7O1Tk07I2PJkg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6C862C3279F; Wed, 18 Jun 2025 18:42:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220246] Dell Latitude 5400: Mic Mute key stopped to work in
 v6.15
Date: Wed, 18 Jun 2025 18:42:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kuurtb@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220246-215701-h8Zke9RFGD@https.bugzilla.kernel.org/>
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

--- Comment #4 from Kurt Borja (kuurtb@gmail.com) ---
Please, boot into Linux v6.15 and enable dynamic debug for the dell_wmi mod=
ule:

$ echo 'module dell_wmi +p' | sudo tee /proc/dynamic_debug/control

Follow kernel logs with:

$ dmesg --follow

and then press your mic mute key. After that attach those logs here.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
