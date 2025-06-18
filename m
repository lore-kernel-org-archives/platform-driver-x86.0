Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D310139D1B
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 17:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750267916; cv=none; b=TiKpGBkmVjuBPUZqIC4UN5rdXZ2pi/b8QOaVvZst8WbhbJu729mXg9mqiemJKMuiuh0x2p2wfOnToGZrM2BtCI38P+2WiDgeFi0iXRtPv+GdnO+uwp06coY5TLWuBdNqCCtrqb6I0TGjmoF+D+5hPQQ+9kaYE/DQJESw7KQUwWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750267916; c=relaxed/simple;
	bh=OMD21k3e6IkEVQR76lO0ncOim2Alecz9ZTQ7wruV4+0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VuVdMeWdTU12sR0pjdPF/KLTS/b6cLSy+MEL9X18hwMFMKFN7EjwRe5Q+LUMFBLdKd79Hp6J2WXUDlJwpgSuzm97ECHX7LS/bICHcLpqcENX1cbAiEEHNUjFZzo/EEU7i1dMaYRyOzTEQ6XEYQcTJSYBRucFgo6PBA6KxlzqTek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/msnrWW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/msnrWW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2CAEC4CEF3
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 17:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750267914;
	bh=OMD21k3e6IkEVQR76lO0ncOim2Alecz9ZTQ7wruV4+0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=n/msnrWWc41x+e1YiMDBc8sR/WnnnJbLSLoQEtfAxC+8Mdw7SM6B+SxYDIQPQcZb7
	 3KNFV8duOJlcwJ/SRRHvgk7GRvbmKkmr/6ZO6oF1jVMHgwYSd8sGjqOuGMv5C3XBA/
	 /GI5JyO1pLZLVs3rt6lqV8B4YFa5jBjK9mceVQDUV+Rv6C4WAzS4Cr3g5nzvD0a1WQ
	 koXx6wJAWAg0LcH9hVzZflWNXDasLDgJc1NWsWa+bQnahhBhWLLTw+e3OSvl0R7V6A
	 PdMG2y31fWgzB9IxR055PJTpQRbZ4ypmUT3Hnx30AoK/GuPiVxaqFqN0Xvs8uKl4Ob
	 fmw9S7VKCMJqg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8F769C3279F; Wed, 18 Jun 2025 17:31:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220246] Dell Latitude 5400: Mic Mute key stopped to work in
 v6.15
Date: Wed, 18 Jun 2025 17:31:54 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220246-215701-VuXSXbPwlc@https.bugzilla.kernel.org/>
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

Kurt Borja (kuurtb@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kuurtb@gmail.com

--- Comment #1 from Kurt Borja (kuurtb@gmail.com) ---
Hi Dmytro,

(In reply to Dmytro Bagrii from comment #0)
> Mic Mute key (Fn+F4) stopped to emit input events.=20
> Before v6.15 pressing Fn+F4 caused `libinput debug-events` to print:
>=20
> -event8   KEYBOARD_KEY                 +21.508s KEY_MICMUTE (248) pressed
>  event8   KEYBOARD_KEY                 +21.508s KEY_MICMUTE (248) released

Can you please check which device owns this input event?

It may change from boot to boot so call debug-events again, press the mic m=
ute
key, check the event number and get it's parent's name with

$ libinput list-devices

Additionally, please attach the output of this command before and after the
regression.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
