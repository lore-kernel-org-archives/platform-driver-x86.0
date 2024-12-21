Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ED51F2369
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Dec 2024 12:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734785182; cv=none; b=C4a1MOxdmwStZUuLF+6aYkQ15PWM1SbypMJgqnChtg+JuVwoh7rBqSjBZrvNe4G26Ed940InXdS6GeSCNNtDovkq6z4TOCSWHPN3S12q3t7fP3iptz0ueeTFxYxlLT6LtMci9HAN7h/7tdQVJaKoXg7BGFg9znLsflAIhZvn/XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734785182; c=relaxed/simple;
	bh=fYi8rHa9Len9kjX/MB/aE7mV2AMNN4E7R54D4yVHm1w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qL3REUuj56fDtRZ6aV3J0DdY2Ruo4tnTcGtWPhajV4e7vNlYGVaFiM6V3kZRxBQcYuOv2Yj8UbxtfsVJImguGDacl1I4kFkBT9E+u5LWuzqBjYPs9ODz1ITmC2NlCesSaUZDugMf555BeCR7hGEl5XGWVPynl6L0y59rm9KHFuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k16TDK4w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k16TDK4w"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AEAB1C4CED4
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Dec 2024 12:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734785181;
	bh=fYi8rHa9Len9kjX/MB/aE7mV2AMNN4E7R54D4yVHm1w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=k16TDK4wUfbEoa3nqoJwoWRWhy2sUcIIBwFnRBu41PywyX21sJO6k9hPo1FkeGaZ+
	 40lTo6zjYp298WhAeUG+u+Mf89/tfVTkLmrHgj2OpjdhgHkNmNRqzkMLDc6EG7bG3o
	 WKLfjxxP0LJkhi9+f4w2m8XOihUEiDhpTgI92pEBdRmFTb0gAW5mP9WXcnuLrPoQrD
	 zj8mQg7q5zaL7laEue7PokyLdICWAu5fpCwCgssl46vMlRLRITIETpXeO22vA6CHoK
	 OeCGI17nebY/9JH/5rV2i/+VDAzztOCMCpqLtGGXjh5joNxEjKgHZ9RIHmUvV8/zRR
	 2qeXDfaXU2pUA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A2957C4160E; Sat, 21 Dec 2024 12:46:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Sat, 21 Dec 2024 12:46:21 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-219495-215701-DIOdAZh6dO@https.bugzilla.kernel.org/>
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

jarkko@kernel.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #307383|0                           |1
        is obsolete|                            |

--- Comment #45 from jarkko@kernel.org ---
Created attachment 307384
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307384&action=3Dedit
[PATCH v2] tpm: Map the ACPI provided event log

https://lore.kernel.org/linux-integrity/20241221124447.774553-1-jarkko@kern=
el.org/T/#u

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
