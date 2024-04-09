Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2206B3BBD8
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Apr 2024 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712654083; cv=none; b=ldsTHsbLhhFx/kYBjYHl6FNoXHh/EIo7C19tyfYQvzDAiP8AQr760uSiPbds+D8zKWbtf8ThSoCYijr0MCIVIcPHuQLtMTaXCCP1JuJFQUXx4FPAPYhXp0aBtrYEYzKIy6LeZ9d/9kbkd9FHwf8X04lCnJ+GsXmrg2Ipv9bVmJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712654083; c=relaxed/simple;
	bh=vdmzwq6nn6bI1qDKKlDaodpYI244w25N+Ypva6jJCVA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GhTIeqsefEF60z4EjdpuAGSEtZrxnnUdQhvtT/6HV00+SAJa8XZAl2sM4HtV279gE4qy4Pcx81/2WOj7/pKjOehg2lBpG41ZexELh93aq0sqAEdCaGgOzwDsznAccth9830OQ2fSFWzDEht3MlRKP7KJfICMHrSE70HpBsCb42g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hCuEwqLX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hCuEwqLX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0B62C433C7
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Apr 2024 09:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712654082;
	bh=vdmzwq6nn6bI1qDKKlDaodpYI244w25N+Ypva6jJCVA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hCuEwqLXyUkSxLuHtaxXL6+IT5Kfi044k9oy1Th16j9Sp3Dbu5j+nztsAlYCLE3Z7
	 9I3jz0Awyku1dniyBQTFT9id7V4cHsyAcZhxDXBgbDyYjmqQJVGvaPG4glv81qeBBW
	 RCJge2dEhp14Oqc7yDXJrfKQJ3yVAjhQ6t8/bqWrBqSWn2F69LtX27MeU+0Yv5pzjF
	 Qhc5sSUMRRqe1qySnBeyHmF8X0CKdEScyeVNGo1Z11KW44rG4jQSRydV/CRY04QX1V
	 U3w3sf7+GycE2+WkQjO8g8neZSY0BZx4VlDWPWN/hmUEhrqvPJ1g+/SFQU5/GnG9hc
	 la2kplbcP99aQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 840EBC4332E; Tue,  9 Apr 2024 09:14:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218696] DYTC frequency scaling deterioration and event spam
Date: Tue, 09 Apr 2024 09:14:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218696-215701-eskjqjs3B8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218696-215701@https.bugzilla.kernel.org/>
References: <bug-218696-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218696

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g,
                   |                            |mpearson-lenovo@squebb.ca

--- Comment #1 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Thank you for the bug report. I'm adding Mark Pearson from Lenovo to the Cc.

Mark, can you took a look at this please ?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
