Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE1C22083
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Aug 2024 14:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723300526; cv=none; b=bEeITRH/jW0YXNgNZoygKccL8p/nOnlCSqGc4+ctW56WSnaUfyeZLTRcDh3lB4gz+dZcd8dexucXQSuQa3yymJVL+gWOBi8CDNjULDyUKE2RB+Q/jME/6Kg7vysLX7Gkzt27iEbmDBJR21SzYB/TAYE+ktfFLgdZGSwlAqIrE2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723300526; c=relaxed/simple;
	bh=daQsCBp90NABc1d4NEaOPXhSy/weWIUxQlKnsKwI4TE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cGdrLvezCwDpBtiM1jxkaVvpjDm9gkmHyIp8c4tNwivlyTUFi3QcJn2Xdj1Fo9J+fsqrXDCORfd66IXM9lQAjbs3fYOp4WCc7khBFxhzJkehVibi5K+698ffOIlcmhFwLzitu49lgwfIkQuS5re1WWm2P2oZpdE9J5FCZLkLKC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d4cBsNrk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d4cBsNrk"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94F55C4AF0E
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Aug 2024 14:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723300525;
	bh=daQsCBp90NABc1d4NEaOPXhSy/weWIUxQlKnsKwI4TE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=d4cBsNrkYQFWyKGwuzdnP4EPOcl9EaCa7fkGrjHrjsGIOvLw85sMVcxS1EFCCMuHv
	 X00ruJ++loPHO8mzGOLMrq9cT6aSHnhAINraZaVQ8Xo5TshbHTn4HijuMpCesvxXVq
	 1nsT4e6gIxyYND96mreXHIEtIO9YV+0irN9fg+jkJAD84YNVz2m9w5Mq8CFsdqSdg+
	 mIvUp7Am/8RuvYd0YL5BYu0wKjcNcRioCi6wkCQX8VQDtFDGFCGEFDgL8rThswWKtY
	 s5CshEvvGO2+wj26LDLqt5wW9r3exOcK+/esrlO77L9CSHdKYtOp2KtGxBOyJxX03n
	 dKO1xmiMSehCw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 90269C53B50; Sat, 10 Aug 2024 14:35:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date: Sat, 10 Aug 2024 14:35:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: thomas.langkamp@medicalschool-hamburg.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-5Ltureyb7j@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #337 from Thomas Langkamp (thomas.langkamp@medicalschool-hambur=
g.de) ---
Sehr geehrte Damen und Herren,

ich bin derzeit im Urlaub und ab dem 2.9. wieder erreichbar.

Mit freundlichen Gr=C3=BC=C3=9Fen,
Thomas Langkamp
--
Dozent f=C3=BCr Statistik und Wissenschaftliche Arbeit MSH Medical School H=
ambur

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
