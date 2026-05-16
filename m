Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDBA379991
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 May 2026 17:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778953669; cv=none; b=Pe/W4ZjGnNl49010hMZih4N7RLbfQHJRV2AEaWsDm7Q4PYR88nIMAK+ZscGZ2JR0U7ISBCHEEgqDK5R06KvCZwURabY+YNRotOI3V7rIxam6cbRRtdtvpYg4Xokytfxx7J7QWqoQa+AgcEedC1xc8R3Ig/pFTK8R9Ec9Y3/I4t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778953669; c=relaxed/simple;
	bh=kbafGdp9pZB0XdbBV7QQ4EabefvEwERY0E52o3W+L+A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eVrmAHC6d/gvGSLa3UqP31EzXLD4HLbJUyjdMo1Yy3DpIRPZ46ZW6uPAsJQCznX8l8BGeP8TlNdWzf1CmWoIxUN3XclgpMqK9CMluhACaLnsUS23RJ48pgJ+Lt08A1M0b4ezJ3rkuiuOBZEx0GBKSUS3TizbhLylnrMEeCk8a3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nGsYQH7f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGsYQH7f"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C3C9C2BCFC
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 May 2026 17:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778953669;
	bh=kbafGdp9pZB0XdbBV7QQ4EabefvEwERY0E52o3W+L+A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nGsYQH7fFQ6oLHfceXuzz2OLIvAl/nMwX3TxoGq2vp22PfUwyInemCw5qii4An0qn
	 wRGODzGCcXaKB+OMY90cSVRjIWH9DzCGaNlRasji2e/gYDjatcDjwyiBeIs+E8e9CX
	 IcC5iN+K9JDRkyvuCtpli/IUsVkN7u2pSH9E+hSZWGIgDblQbkp9mZwFodyc/IsSZo
	 QCQkaeqV85v5OcI5LewnnAX9yO/dTgAVUAibg4AHJDEm9iUOlJqnr1d07Zoue1pFqV
	 rOCfDHN/3qyOl434+GGpDU7qL0f1GCvaSA5KrpfQUiUdxl/AdPs/5GDWs/PxrO9bkg
	 0DNe4Nyo4m0zg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 14E70C53BC5; Sat, 16 May 2026 17:47:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Sat, 16 May 2026 17:47:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-9ZuRsWHUUS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #81 from Rong Zhang (i@rong.moe) ---
(In reply to Rong Zhang from comment #80)
> > Let me clarify this - After further testing: the mouse cursor continues=
 to
> > move on screen during a pause event.
>=20
> Thanks a lot for the information. It's very helpful.
>=20
> I suppose it could be a CPU/GPU throttle that delayed some rendering work.
> On modern desktop environments, the cursor is rendered on a different lay=
er
> -- that may be why it continues to move.

Another possible reason for this is that your desktop environment may be
somehow blocked when it reads charge_types synchronously. Normally, it
shouldn't block rendering as it should be done on a different process, but =
I am
not a GUI expert...

Anyway, my suggestions on monitoring and testing should reveal more informa=
tion
on this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
