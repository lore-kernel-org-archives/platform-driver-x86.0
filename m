Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D29B2B9B7
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 May 2026 00:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778892546; cv=none; b=T4xUZ9EuhoD1IY8nEcCuhs+p2q9ZL8U9n4H6XKg8gcqNM5t47Pxo1bIZpQH3+xiyUyZVw1hFppZJaaaH9MpbCJP6a1QoZ2dY+FL7RTJUC2p2uZg9I+cmpjBVed227q2wBeUurpdqiytAviuMKgS6pMcWcv4ULuSQtu9V2D5fiLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778892546; c=relaxed/simple;
	bh=O2+SH7RnieWOl6wOKwquYClu3z1DJIvH96sGrsj8n2s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hfsmoBnUAfKlN1qQ3Zq6kyfAs+IXU24IbTG4mMN56KHtrwHlXAnJTuD1TVzrm9RUGK36BpPmpEU2cV9AVqmryiBmRho4NzfleLg7ZUC5i88ThP3CSvSf+WdyYWfNKBEg2PdtgYZis1588u8bqPoGOn24cMcnTjV24dqNJuIc7Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CnL0JMaE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CnL0JMaE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92D42C2BCB7
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 May 2026 00:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778892545;
	bh=O2+SH7RnieWOl6wOKwquYClu3z1DJIvH96sGrsj8n2s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CnL0JMaEAfmbzBbzpnkXMMyNgDKFyuDFMQQfSr1rq1/8BuBnxMPnS8495YMQ7Em4x
	 Bh1nnsn9MH6dMc/upEiSKcgiaXoGs2A2eVWnyz7d53yxBOM//zh0WXz60VpHgtMOiS
	 PuOLzvAvzTb2IaVPftNd+DauBR1gFzGpyxmz7KIgUlX5oaBFF2DWNLNrrtD7qzmLa6
	 zEW+GwqJ9GCR5JIP44qc2WnIFGY1c3xnURMrJV2d1h31bw1rf/NA/JyABCKFYRU3Pd
	 c4iKV0J7UZ22+ShkwgsAAWdb2h1gVraFDvuKrCRWjQkeklOcWIz9xR3lcVmGg+/WGI
	 EjNzGJroxTGHQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7A80AC433E1; Sat, 16 May 2026 00:49:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221523] [BUG] hp-wmi: OMEN 16-ap0xxx (8E35) - fan control not
 available (no PWM)
Date: Sat, 16 May 2026 00:49:05 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221523-215701-oGeLuvKbh8@https.bugzilla.kernel.org/>
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

--- Comment #6 from Ahmet =C3=96zt (sivasli-ahmet@gmx.de) ---
BTW, the fanX_max values are 0.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
