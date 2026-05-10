Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA70F32BF41
	for <platform-driver-x86@vger.kernel.org>; Sun, 10 May 2026 15:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778426438; cv=none; b=o8kwvzcJ07ao2IOtTr/kqowchh8S7CBSupQ22hcXXdk2jQ4znTSwX/QhuINZwJOdlJpTc66aLBP/JzZ21jV27eY+5Lf+hVgP+zJFr8Z154oVot5XwAoL8qUCdVPYjCnXHSFN43CA4mD/wkY0wqVTtd+mONyQCH6gg9cayNaNt4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778426438; c=relaxed/simple;
	bh=1JMlRIpwMigqeokq8q51Auq6bWy6gqxv92d5cHLartk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I37EM5N3wF66PnMsk73Z8SQU08Lr0iKKa9grBI7JNRwNyelPt0JJWBTTPSuIdT+qgjblSplwuQMEP/ZL14roWbgr8NJd1yk88s55u1Lf8WbRZFX1zftTRX8ODw6wm5EaSml0oteh0iX9/HMkgeVoK888nQZ8dIaL+UkRB/KT0S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iv2/HNN1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iv2/HNN1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B070C2BCB8
	for <platform-driver-x86@vger.kernel.org>; Sun, 10 May 2026 15:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778426438;
	bh=1JMlRIpwMigqeokq8q51Auq6bWy6gqxv92d5cHLartk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iv2/HNN1T6rNWLrXH1qH6ypmMKsDwYEXi7Ommopa7Ti0/iN62fIQroKwfYb21cIJj
	 lTaJummgDQElDifGkwz5iha9BFjrC6mYIu9pFmIVCh4nx4/dyyjbHc0tG7zDR4yYoE
	 Kz1lxgXIv7C8TP/LCFinQU0XTWb+5ln3bfPrxE4EWo7bb54ajxPqB4Kiw5FG0BQzEv
	 NrGpBi7HGBF7MUR4nR12fi6NL0OY1nJ6bw7vwrSxEy/UzFB3ui6SyIfbT0LNV5myQ6
	 RBcsVnjNZc+K5PckF1HYLwN2PAPJs8eH77bMLbgxUCJFTkoBCfeKIjP5xtoJ732RgB
	 6TLVspxDNt2+g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 386B5C433E1; Sun, 10 May 2026 15:20:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221430] nvidia_wmi_ec_backlight: brightness writes silently
 dropped on HP OMEN 16 (2025)
Date: Sun, 10 May 2026 15:20:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hansg@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221430-215701-goeFzDibP9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221430-215701@https.bugzilla.kernel.org/>
References: <bug-221430-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221430

--- Comment #6 from Hans de Goede (hansg@kernel.org) ---
Hmm, can you try adding the following to your kernel commandline:

acpi_backlight=3Dnative nvidia_wmi_ec_backlight.force=3D1

That should give you both nvidia_wmi_ec and native (possibly multiple nativ=
e)
entries under /sys/class/backlight

and then try echoing values in the 0 - max_brightness range to all the
/sys/class/backlight/*/brightness

attributes and see if that does something? Note the max_brightness variable=
 can
differ quite a bit between different backlight interfaces and can be found =
by
doing:

cat /sys/class/backlight/<foo>/max_brightness

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
