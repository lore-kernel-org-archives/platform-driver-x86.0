Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBCC32142D
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Oct 2025 15:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761839939; cv=none; b=c4JeeoTKjxBS0XcCuAxWzTSlCjNaTh/hudJD3Kmo8+0N76anvyD372u8hEZ2+VOIJetAGV2Ai1yidlPAGH+Rs69wPKjl+xxUuFn9c8MnMXm97tzn/pyLmwh72iTB7ETDw+zg1mkw8CPglaLfkvFyZuJWYUj6kmzcaIcOlHpLtv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761839939; c=relaxed/simple;
	bh=RZrhVgQ/OOnfjQubz43Y4lWU987RrzEgEtEOcO8TsSE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=agS0mIrDXQPDw6xLXWerEXdmncMaC7eOU2PAbiAJQj9HEgdL0JD1GsIYszvPIKM0lNiY73eOAbUBldUbJrmkqsf2N5EVwzjoqxfYRrM6SJJT0LQM/wwxmPMort5qxxumGS9CV5JmBBOmoGYjDEfab7C5HGfrbenOZ8w1So0k8+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WuZlf/KZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WuZlf/KZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66364C4CEFB
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Oct 2025 15:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761839939;
	bh=RZrhVgQ/OOnfjQubz43Y4lWU987RrzEgEtEOcO8TsSE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WuZlf/KZc3uk3jD3gJPUYHuaMN5kjdL/9yr3zIUtq6F1I/v4/BZ0hxA8GMkqZjVlH
	 /CkQStsOV36/r/tbc2MlMXw8L1C7/YGtSh+ICJGK3tYhZeCS5OLCa7cOXMWk2vmtwJ
	 QduI21OVeWoZ5mRpM+B/UcwjYKsHnmNiwHlGYD7G5cLwZ/VUUjFsMV9zkLXREuljAs
	 /hwvrjLTGDlIlfcDx/bnbENmoQVZlfw5sUS5Kf3F7a948lPWpOvolVbC+ZioSYrILq
	 dMw/kJDP66nPUCIGYuxA3ykAm4Utd3af0D3fVyn1PH1k2TpDK5F15Y/bxMvDP7Qc86
	 t1hFy/svi4kYA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5EC84C41612; Thu, 30 Oct 2025 15:58:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220722] Non existent battery reporting for a laptop with
 touchscreen MSI
Date: Thu, 30 Oct 2025 15:58:59 +0000
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
Message-ID: <bug-220722-215701-NYSXD71jrI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220722-215701@https.bugzilla.kernel.org/>
References: <bug-220722-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220722

--- Comment #8 from Hans de Goede (hansg@kernel.org) ---
Mario, good catch on the existing quirk only being for I2C devices, the
proposed patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
