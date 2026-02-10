Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F022638B2
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 19:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770751078; cv=none; b=pFNrf+fJXMBwKmwV8vRq+NVlb877yfn+yMS5wEAZ7p03WeJWT7tCsw/+s1CqDcOyPx/DjgU9nUwgj1RCYj4DQwMxvNYgfhu6xFega2VP9jN63Fkl8ka/3Asgvw35rn6p1CNtzBmT8weHiS/jetC86S84B2Y5E4e8uzicDV2RWoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770751078; c=relaxed/simple;
	bh=HIWumzVxhkVCwdWW12HsRW8a84DVS0sH4w1LCNidslw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FzlEAgFWkfXP5IzL/JXkC+BfxQt0ZoATULo9wkiREc8blCUH8L8LhlQ6ICoYl2yF9tECGd+Lmyf8Oa+8Iw6MuFyJMOD3O7xKmbzKD3X4SF2K7Xxd3/dOcUrvzo+OQkwdFGA7USZr9ooPrLm037MdjNy6AMAXX6UbcOBj3Gkq4BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bi0cKW6H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bi0cKW6H"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFD36C116C6
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 19:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770751077;
	bh=HIWumzVxhkVCwdWW12HsRW8a84DVS0sH4w1LCNidslw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Bi0cKW6HnFoMx9kfU01KFMmNSDcybcYrPIUXVNK64VLdZUvmYGzdqRFVbaDn/fPwT
	 C0QnHsTPleiU2Ev1903ICA35Y8fvbnWCCARmsZhFCO/xjl+TIf91k4wgrFMfssf+5n
	 dKGZPM/0eAhg2r+GBt2dxDssBwaohVOVbwI1Chjq07PrEm+iRKIRNBKbalETqEgMwi
	 K7b29PUf1XQgsiNbsnBMTNoKpyd/5ifEg2iEphnjlao5gtFDHBhWkmYH+XSfR4FHun
	 gzh4mnbVi91hShjFNozzDDIYJFuire26IlPnK0g7sydc0PNcd5HnoBUDHX9DGtWV6G
	 SWAxqaiEVKXPg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A5B74C433E1; Tue, 10 Feb 2026 19:17:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 10 Feb 2026 19:17:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: anhollander516@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-uquMBhNkeQ@https.bugzilla.kernel.org/>
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

--- Comment #10 from Avraham Hollander (anhollander516@gmail.com) ---
Ok compiling a vanilla kernel with debugfs only took a couple minutes.

/sys/kernel/debug/ideapad/status before changing the setting:
Backlight max:  16
Backlight now:  0
BL power value: off (0)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Radio status: off (0)
Wifi status:  off (0)
BT status:    off (0)
3G status:    off (0)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Touchpad status: on (1)
Camera status:   on (1)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
GBMD: 0x00860004
HALS: 0x0000ca40

After writing "Fast" it took a few seconds to output the same:
Backlight max:  16
Backlight now:  0
BL power value: off (0)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Radio status: off (0)
Wifi status:  off (0)
BT status:    off (0)
3G status:    off (0)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Touchpad status: on (1)
Camera status:   on (1)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
GBMD: 0x00860004
HALS: 0x0000ca40

After writing "Standard" it took a few seconds to output the same:
Backlight max:  16
Backlight now:  0
BL power value: off (0)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Radio status: off (0)
Wifi status:  off (0)
BT status:    off (0)
3G status:    off (0)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Touchpad status: on (1)
Camera status:   on (1)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
GBMD: 0x00860000
HALS: 0x0000ca40

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
