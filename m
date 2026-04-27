Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B82270EC3
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 11:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777290651; cv=none; b=s7lQM/zBfOUFBPcjio2uqGXq7aPekSAeSK+oHVtTojCc75kgNU+e3iCJjGtg6TWF3wU8iPkQPgyOibu/3FI7JCVRcvrGuERyszvE3yYmxss35fJXLsgVGC5BxTChmuP2dt0FuHJrKGoFRi0n6ZqdONkc13U+sR9+5Kqv5mSpsfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777290651; c=relaxed/simple;
	bh=T1Qt5nsfk62HIZhWkXe0/vQOK/gqu46COGN9l2FsWM4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B4HeFuOIFAGLibhgrU4o+qOUEC/rLR9yu94iptKWzd8jFk/brlpgGQ5ubwpIixYRm7uXr/+CqekrrUTC2CPburVSqXJQJuTaoRkZYUGUTv2tVcr2Ws/ZrdTTWG50VZ9ai9txPOEnwgrEgSdJxmZ5+D/MYgIJdFZRMo86FQcqdV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGMf3JN0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGMf3JN0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02296C2BCB6
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 11:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777290651;
	bh=T1Qt5nsfk62HIZhWkXe0/vQOK/gqu46COGN9l2FsWM4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FGMf3JN0hOPg11LNT905V3kc1eQ28elSp8kE+XRUPoFDjkZb0a6TcACBPpTwHULqq
	 E9kQmveDYrJLS0Jml12gh56HHOw69qT4/3KLeRmWBXbN8fRHt17oB6E9aHdBA0+fGk
	 NHDF4UjniC4tcNsqi4OPsXYLODbS+IdGBHLhgeY0pHiHG0h1zn3OH+NpKmUuFZxhYa
	 bxCfCDdHN+cO8pI/h+X2il4eyHLBDskWvMl9vT0qraqUkAdVACenEiuEYAKaPT5x2l
	 T6FzwT0zhR1EJjk/020OSmwjp63DdL2F5BWrdQIr08q9MA7SeKWMB6mF1C3wqYnjqs
	 rSnQlPSdXj6XA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F08DAC41612; Mon, 27 Apr 2026 11:50:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Mon, 27 Apr 2026 11:50:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: hansg@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221065-215701-gwKlWSFyxo@https.bugzilla.kernel.org/>
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

Hans de Goede (hansg@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |hansg@kernel.org

--- Comment #68 from Hans de Goede (hansg@kernel.org) ---
@Rong Zhang wrote: "If you really care about that, you can simply blacklist
usci_acpi as it also returns garbage due to the FW bug".

Would it be an idea to add a DMI id deny quirk-list to usci_acpi for this a=
nd
simply make that driver refuse to load for the known to be broken ideapad
models from this bug ?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
