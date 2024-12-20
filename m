Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863ED22655E
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 20:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734725783; cv=none; b=mmkHwsboHYDGzDXpVLjaj+YqdMaXdSORBRMjQxAxhhlmA2S1JxyXmEzBYtV4G9U4c9RwiRAe5T7sO34s4pjI34QjMJGkq6oMI76tCVZFRuCB/LdSNe/Gk79q2GPLtA65k2cJ/V1oV0UwXXxDlmlGynW6Bbg3WlstZsd4q7NjoJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734725783; c=relaxed/simple;
	bh=Nw+yKswsltG2sr0y0PU+y4A+Cbsod/JYe1zBrRqiTwo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lWizawtnUOnm5Ff9aOIzYyX9vZTddzo3E2AYjoNx41LIDdxgM3QQVRAKF5/cobRJcwK7BQ9RFbqmYPtR+g9GnOJ4P+DIQ8fblNCjxy/lHeA863fxFCb/AhmVsd0OPQrIfOV/F5frtmHYCVespLr+wYeSZ01odHRaQdm12D8jBM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NT0LvlaZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NT0LvlaZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10F0BC4CED4
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 20:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734725783;
	bh=Nw+yKswsltG2sr0y0PU+y4A+Cbsod/JYe1zBrRqiTwo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NT0LvlaZOLPEgdoRMmI+tm+wUREqcUvPAKT7j6Tu8+w2QJsosHayHumOWRah5box6
	 MO0z1zV4BAcMzH9UnhbiQ/JDsWs+YfnZHuCba+NlRiDuPWaxrLIWgqECDRzLfwID2C
	 WV7Dlo981nIXEvRaP5fTK9dhmvWv3aFB0g917U1/oXtOT6qbWj5Ao9mqHNjpD36yNl
	 zSu7B2Wpfja3fuLO4nMYT6BLKOxBdJUxWPSgWcoYe8iA0X4Nit4WuBGmIPMZbfxDG2
	 GYzT+fAzIiZ+Ier1IF5jVAISKtsnIeH0TOt0Jk5CZ8b7V32v+gSe01S1+OYihiGaeq
	 M97lCUfvHdgUA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 08469C41613; Fri, 20 Dec 2024 20:16:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Fri, 20 Dec 2024 20:16:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarkko@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-5qvanpoUG3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

--- Comment #39 from jarkko@kernel.org ---
Since ACPI's own code uses normal memory accesses to the memory mapped by
acpi_os_map_io_mem(), we can too:

https://elixir.bootlin.com/linux/v6.11.5/source/drivers/acpi/apei/einj-core=
.c#L222

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
