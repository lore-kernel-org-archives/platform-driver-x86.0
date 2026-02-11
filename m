Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791102951B3
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 15:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770823042; cv=none; b=n/7nf5xyEqgaQzEpMiyFOV+Pm8lV6TX8dIrOBS4zuLtgIP1Vd4CZ/S9aGl6/RA4T/c3z/f9pPZ71nhx9uBDMFpAlSev54lNIINDr55/fRYyKf0R2+8IEAoBJLR0qrEmYqbH+9EeeWmpVKjeEvQQd3YF26rHJLrGFetjrBjMg7JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770823042; c=relaxed/simple;
	bh=M2iwxQtpmvCpfoEEmpxdX+7fpLr7R2hhuNztV9NeJpQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WU/Damk/Ubu7+X9DpgC7OV35y2x56htMxGOxraRqKPRu+5ClJ2Q//BVWHAZLc6Q9koCzbkESy54WPs0zfGHUWG15yPrNU5oDql9PlRPwxbkzAH+1MOzyz0vGup5FCVIeyKUlXZZ30wZefOsRvJFUFdjsSE3Q+3ssTxLYb6+XiO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zkf9UN1q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zkf9UN1q"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DAC15C4CEF7
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 15:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770823041;
	bh=M2iwxQtpmvCpfoEEmpxdX+7fpLr7R2hhuNztV9NeJpQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Zkf9UN1qtmnRr7okzvRumGMlWDqecOYNW1yeyahJjYy/tZ4o/8qLWk62A+iS4ivtJ
	 ivIlgk+HKsvSknsAdPK7SZVkjR7c6xOsianO43he8SewSZQU2HD62lGj1NT36VFBNH
	 ZyMIuZ+pyFUVC6h4R6fpqy93yrNOVfDUG8rJ2TdDt5mMykCSJEyUPqHXxK77vxi90a
	 GF6wdQGs/+LqPdU1VNMauFgTFvi4tOpr5UcyJGBJL87EVwWSlPlED8LDsiRv8r2606
	 7bGylZKPfemFvHqQvNPm0G7UAgQ0ZbrhK0YsGQLIgMdv50vsSnRyIutW2tlS07gTF0
	 LRyIRAq4b5b/w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D422DC4160E; Wed, 11 Feb 2026 15:17:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Wed, 11 Feb 2026 15:17:21 +0000
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
Message-ID: <bug-221065-215701-YWtp9Cct2L@https.bugzilla.kernel.org/>
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

--- Comment #26 from Rong Zhang (i@rong.moe) ---
Avraham, could you test if the patch fixes the issue?

It's just a PoC as I haven't seen Raphael's acpidump so IDK if it works on
their device.

Mark, could you check the documentation of the GBMD interface? Will its ret=
urn
value have any byte being 0xFF under normal circumstances? If not, I think =
the
workaround can be applied unconditionally without a DMI quirk. Also the iss=
ue
should really be fixed from the FW side. Could you coordinate with the FW t=
eam
about this?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
