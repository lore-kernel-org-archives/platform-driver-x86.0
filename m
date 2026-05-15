Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995AE3D3490
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 10:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842416; cv=none; b=A/8MFs13jsTx7nsjcngzpM1NMaEH2yP6tuK4gI0sAxTWiz/d3KCBWXQZpt5z3F2mMFxnGUSJ83X+CPnWmIZjs0FScRv9wns0WoCG5SdNLc2v5ps239i28xgmzE9odhpwiHaUPG9qf8VWFV7OLcqs2LxkX0Bmo6CcfKFFCPdncVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842416; c=relaxed/simple;
	bh=ri7TbDXx6vPSuvgSRmj1OfCihNluSzUipJfm8u2ekKw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HpAQGuOjan9kllKYXpNNJZBWXtpc/3tRfxuBMll17SD4zsiYPb0OjxagLB9CWVvxQuXy8gES8s4tVvSxvrdLShi3vCNlPsrSU7C6LV4WCs3RYpJegdiK2tIWAjH5EnOl91HehcD/z95Fk588CyhavJ9i9IHXRTWV/s9DK2JgBWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TxbyvS0R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TxbyvS0R"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5300FC2BCB0
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 10:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778842416;
	bh=ri7TbDXx6vPSuvgSRmj1OfCihNluSzUipJfm8u2ekKw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TxbyvS0RZvewogj0qDGMGkXnEltvRnXjcoXyVgGm4n8PmpGTRr+wu83qQvDZlQO0A
	 0/7O3jzvfDVp2Mvtej1vo0KIiA25Xt3/NRtrY9dQQVerxnyYybllNhYZU0TxrxvlqY
	 HqJvV7OAU9Pd8Ys6ct1DvNgZYZd5ACAlIFPtdTzWJzaHk7H2gCwe1b+5beTXC03V/d
	 KdR6o/lZFiuvMcVRFGrfu5cgjSjSOLbWYttnud20efINkGKbKBkHVIArLqWt5vGg17
	 BM5NGxa0Qtd6QUznLLQSmyhytHPhR53K0jACSuX0HTJ23QkPGFOm8QrP6/quEsDaIi
	 mHXEvfodDJipg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 47A7BC433E1; Fri, 15 May 2026 10:53:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221523] [BUG] hp-wmi: OMEN 16-ap0xxx (8E35) - fan control not
 available (no PWM)
Date: Fri, 15 May 2026 10:53:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: sivasli-ahmet@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221523-215701-Q3yPcqCxUP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221523-215701@https.bugzilla.kernel.org/>
References: <bug-221523-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221523

--- Comment #1 from Ahmet =C3=96zt (sivasli-ahmet@gmx.de) ---
Created attachment 310127
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310127&action=3Dedit
Omen Gaming hub log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
