Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EA6548EE
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 May 2026 21:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779054525; cv=none; b=BAE5lubxialiFeOv/LtVMe6LR8P/J4VIEkBpzELsXbqogRfYm5pBwNEzoVXEfWNsLRHQ2CxId5sWqi1eZHCDLp7dLaEQ6wB79SL9TxgnEG4FvEAD/FFM7HDfuVON+JOa9jlqTYqPvDrH6QSd7xvy4MuTF1d9NvdT9jwIB1ZHPMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779054525; c=relaxed/simple;
	bh=QhlJkwyl+mAeT4kSifc5b2CzYpCz6JcoDiQS8enuKhc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=piCHp6S82u6stmccQhB43yTYSwreS9F5QzMQQnO1cb9CDyqNp/Q8loG4FrDy3PCD/10j7M32xGmgDdx+mg71rpr6t6XsQNT0tiTL+fwrvJkuz9YHDpH6cYedncanU+rgppc3t7aGfAjYkrSB+7nYElFDx3nuhdO51kNhOE6bicQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gzh8Kfgv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gzh8Kfgv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08357C2BCF6
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 May 2026 21:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779054525;
	bh=QhlJkwyl+mAeT4kSifc5b2CzYpCz6JcoDiQS8enuKhc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gzh8KfgvDnBRdOw0Pjce0cdvf5wce+GOSfJqyR6IhOoW5/57X0YHXLBhFL6l6Xsnf
	 cMzGFenWOxyXLUj5ao3d74xa6vA86vOfgG+kVyTVv3gIUXTwOLI4fPToOVv5IYIO3T
	 zKDuj079i9Yb4RimrFYv+yKkjsZhz1+LnlcKYRa9WNNbKWVJH3OO2z6RqMqnw26jvF
	 pyzYbuF8litvyCLs+SNpyXbE/1VVfEbIX9qStqJnqLQ+/SBhqfFd/w/4I7fUbasxbE
	 BLIG1R7Z6tKHzu37bZkRT5jYMJdV9+2yj1kWsnn2VWa8UU6Zy5yeQMC4edKfC/478x
	 P8kn1MbZVr0Bg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 00853C4160E; Sun, 17 May 2026 21:48:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Sun, 17 May 2026 21:48:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: rickk1166@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-q6hVECEFYg@https.bugzilla.kernel.org/>
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

--- Comment #89 from Rick (rickk1166@gmail.com) ---
(In reply to Rong Zhang from comment #85)

> Please execute
>=20
>   echo 'file drivers/acpi/ec.c +p' | sudo tee /proc/dynamic_debug/control
>=20
> beforehand, so that I can see which EC queries arrive before the pause ev=
ent.
>=20
> Please also spam magic sysrq until the pause finishes, so that I can see
> more samples during the pause. In detail, you can press Alt (keep it
> pressed), press Fn+S once (no need to keep them pressed), and quickly spa=
m l
> and w alternately. You can do some practice beforehand.
>=20
> With these changes, your dmesg dump will be extremely long, so please upl=
oad
> it as an attachment.
>=20
> Thanks for being willing to investigate the issue together!

I appreciate that you have been keeping things relatively simple and breaki=
ng
the information gathering into reasonable chunks.

It took me embarrassingly long to figure out how to attach the files - but =
at
least they appear to be there now!

Before starting I opened one terminal with
   dmesg -w
And in another terminal I did=20
   sudo sysctl kernel.sysrq=3D1
   echo 'file drivers/acpi/ec.c +p' | sudo tee /proc/dynamic_debug/control

As there is now more output into the dmesg window I decided to capture just=
 the
system sitting alone through two pause events and captured that in my first
upload #310145

Next I did the spamming requested (both l and w alternating until the pause
ended)
This is contained in attachment #310146

I noticed with the first spamming attempt that the new output ACPI messages
happen in the dmesg window before the system actually pauses.  So I did ano=
ther
spamming attempt but this time I tried to start spamming as soon as I saw t=
he
dmesg window start displaying the new ACPI messages.  It is likely this file
has data that starts earlier and personally I would start looking at this o=
ne
first.
This is contained in attachment #310147

As always - let me know if you want more.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
