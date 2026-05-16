Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9230171AF
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 May 2026 08:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778918727; cv=none; b=sZef5zFAo+yljZbeV+s6x0LEjCtLCZw4tOT33QBr8hOHLDO1m0IvoDoVCoj5iGBCxlZcQC5lurhjIcB75cpV0pF7n6JAVldulmaaje/s0bTkMM3KiJpBkf0QKf9rNRTxTrVGh8nkoxj7JGIX9s1Yz7ll8WS+DNG0s5U7LOzXEE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778918727; c=relaxed/simple;
	bh=tyccAJh654Z2/xVZ4lM0jyUkuKbcOq3aIOW0U9zYJww=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QW71AkHSi8d2S6VIX3ltE09AkXaM2Z9iwDLkOHeuIB/ntankBoSyXgsHide2jPSEIQG+csNFC4JQ7+ST21oh5GQ78B7uaz74jcFoBmyOaGb6t0Abqb6cWiqMFz8YDFa8oSdtYjKRWQh88spjYxopxK3CiOsVaVbpX1NTJBvWEmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q23wfRk0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q23wfRk0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89407C19425
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 May 2026 08:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778918727;
	bh=tyccAJh654Z2/xVZ4lM0jyUkuKbcOq3aIOW0U9zYJww=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=q23wfRk0jBliKAK6PF1h+KPjuVmRARXmtx+ITntoELs6f413HAfS2wvAv7MlvjMoO
	 rqDmeOKKkud0rOHo9ArwSfEs524rUbAnJlqPqda00k4Hl3LbOJeJl8JMHbS8KBcsUY
	 u22uOVOIoimbGnQYM+Ryp5wN3Xmz3roCbReS7YUfBLm4WxPkVohxokXC9rG0YaJE77
	 tPOg6XEBL6ilHzMF6dBQzvmeitFIqvn5Za5fhop8WsZuCyi5PQCEM7QAheFM+qamRk
	 Gidnp7O1BhVFyqgGXiqsWASiP7gCZq9njpN3IRKcWUa1iIBL9G0k2g66U1NNWu4gXY
	 RddJfJ+j40Fyg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 78B8CC3279F; Sat, 16 May 2026 08:05:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221523] [BUG] hp-wmi: OMEN 16-ap0xxx (8E35) - fan control not
 available (no PWM)
Date: Sat, 16 May 2026 08:05:27 +0000
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
Message-ID: <bug-221523-215701-RDomFjWSPf@https.bugzilla.kernel.org/>
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

--- Comment #7 from Ahmet =C3=96zt (sivasli-ahmet@gmx.de) ---
Hi Krishna,

I realized, that my hp_wmi.c was a modified version. I updated the file to =
the
newest revision from the linux repo and added your modifications. hp_wmi is
recognized and the fancontrol is working. I will test the platform profile
today.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
