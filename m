Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432CA33D6D5
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jun 2026 20:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780432770; cv=none; b=Zc92rNcdBuLZ/NJfYUPKi3+bOTZ9xswbAOp58ET3SaZSimkSDXhks02BRS3USQJ1AEPvweKu9bqHp+0pXLpoj8ju4ZS5YwP9yoIE/yIQWzUDmpfSOQYgHZxUXJ6/It1/biOi13tAo6uBG0dDpsgYtHuLi/oLpZSzwjV/V9dZaYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780432770; c=relaxed/simple;
	bh=107OotYueZVYoNNX48/b2QcIt1fJX/9PJyz/pkZBIjE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DsJOmBtpi5+I0Kb+vh1Y4+6AsRKsMItb0yUbjHu05pA5ZtMsk8ohoT9Cy+wTpkW401+WwTKCSAGoaVlwGTgNb00gRdrVxHq+JsHQwa0JPfloaTzNpDV+cOdOXdhfw3DAMDH4rXPlZq9AbA/C84L+4DqelQCb7WQg7yV/eRkXU4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VOxv+Wxh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VOxv+Wxh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C816FC2BCF4
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jun 2026 20:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780432769;
	bh=107OotYueZVYoNNX48/b2QcIt1fJX/9PJyz/pkZBIjE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VOxv+WxhockSZ8dC4GyxXx02ESeOwSTdRtLjKj0D3FaOhE68ldoP/REHI1DLNqqZ1
	 Yaa/OKbXT66nAooBnQ6m/lTnLLFG7Wv9boxEYgyMwQ6IfKnEuATcd8iS4Y4e9czp1G
	 MKdqKx5elsc528f17Wc47pVSOrGWJh20jOhwsULpyO6Op0HSuSTuiXa9p8meAos6JQ
	 cAYdrWnnG5q7IS/MVerQbJzZJxRCGsjfxqrxERIDjh+/U0tbSMrUDalBw3o8y5OnBH
	 U7ArDuuL1sjcfZ52t1ofap4go1ViNQYfGZmsXNs7AyLl3f6K0bCnx9JQz/JnVD70uq
	 SeEVUCXjA6SRw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A2D68C41613; Tue,  2 Jun 2026 20:39:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Tue, 02 Jun 2026 20:39:29 +0000
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
Message-ID: <bug-221583-215701-6EomSpTN0h@https.bugzilla.kernel.org/>
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

--- Comment #4 from George (george.stafilidis@proton.me) ---
Hi Rong,

I repeated the test while checking the debug files after each keyboard
backlight state transition:

* Off
* Low
* High

The contents of both `/sys/kernel/debug/ideapad/status` and
`/sys/kernel/debug/ideapad/cfg` remained identical in all three states.

Relevant values remained unchanged:

```text
HALS: 0x0000ca40
_CFG: 0xfe0d0018
```

No differences were observed when cycling the keyboard backlight with Fn+Sp=
ace.

Please let me know if there are additional ACPI methods, traces, or debug
options that would be useful to collect.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
