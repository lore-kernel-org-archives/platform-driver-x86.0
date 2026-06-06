Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BDA27A462
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jun 2026 18:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780769520; cv=none; b=njIidkNfLI0QgczMUGhdgDo/tyeTPhAz3Hl8q608+OcSvRUF4uFGtrdc0W2+XN+YWCJZRqo4v4FbcjMIIai0ikw1+19CyCLwWQI2bdck8fditzZOJzIKRoz98x7h2bt7ht/hIq2AawNcpd50oZLF/0x0LgpYSbEAiNNSRFOPplU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780769520; c=relaxed/simple;
	bh=UrYJyj5Ds648ghDOYTfy7zzE9CyAmbnZevABZAAt/F0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JjzkvJV7uPMB+TpjL0dh6IiiPBvloOj9Gsg2zxz129We7yJfkeLnDcS2f6cHoLRWME60LlyZFqxVnCcmFcqhkrD8W43e6lMLqFOtc/uEYKQzUsFvpVAHor/KQeQjViILfF2cSm9lv0pevZNS07hWKDcUGLcJylV3WlKN34HqkUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1eQ2js9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1eQ2js9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA0C9C2BCC6
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jun 2026 18:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780769519;
	bh=UrYJyj5Ds648ghDOYTfy7zzE9CyAmbnZevABZAAt/F0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=D1eQ2js9tIMHnzdrPZE3yRqGdGejGGT+dIim6IGz3TXR2s6xwlGTBqU1cswn7J80N
	 DDtaJJKAE88ur1LaS/ebENXDOal1z9JcrQjsmKpt1ewU9LHbV9l272pH+a8ny+7bC7
	 6c+7d+XyW1d4O3U4RvaZGQifp0CwtKhug+zY4aCX9yVfgf08Bnacy5SK/gvgBdRezh
	 JpYpKK6xyBTeTnoI0sw1aIgmoLGsikg3y3oF8JnE2f1xLxjmkiFxw1U1+8CKDIcvLZ
	 ETIejvwOAGbZG9D/8ro0FDbFACus7r0szkkDs8uVRbxM23PY0uptaYl93w+fa6jgW8
	 k9tOzEUtxp1Pg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 97CC0C41614; Sat,  6 Jun 2026 18:11:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Sat, 06 Jun 2026 18:11:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: george.stafilidis@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221583-215701-RFWXS8sqi0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221583-215701@https.bugzilla.kernel.org/>
References: <bug-221583-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221583

--- Comment #31 from George (george.stafilidis@proton.me) ---
Ok so I repeated the KBLO synchronization test.

First test:

Physical keyboard brightness was High.

sudo busybox devmem 0xFE00D42A 8
0x05

sudo busybox devmem 0xFE00D42A 8 0x03
sudo busybox devmem 0xFE00D48A 8 0x54
sudo busybox devmem 0xFE00D48A 8 0x55

Result:
The final command caused the keyboard backlight to turn on at Low brightnes=
s.

Second test:

sudo busybox devmem 0xFE00D42A 8 0x05
sudo busybox devmem 0xFE00D48A 8 0x54
sudo busybox devmem 0xFE00D48A 8 0x55

Result:
The final command again caused the keyboard backlight to turn on at Low
brightness.

So changing 0x2A before toggling 0x8A did not appear to affect the resulting
brightness. In both cases the keyboard came back at Low brightness. I am so
confused at this point I dont know if i am doing stuff the correct way.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
