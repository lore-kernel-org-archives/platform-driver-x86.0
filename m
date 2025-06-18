Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422D527726
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 21:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750283001; cv=none; b=vBLwXImbVGzlFbRG690bZcbtqX4C9P4IW7FyjzvWL7yc5BElZ88M3O6xhV/NNpNRfK+AcDKxFNeKQpaODcG894rPXGTaht5kurhfS2xs48lHdBauumP0KRyCsL9IfUx72B8Q1t47oF/keXkdQ4gSs6UGM3XPj1vYpHtR6fYH94Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750283001; c=relaxed/simple;
	bh=T9gM//UP13oM9DTQg88j0nlDgdvyIValZxErwDGf6eM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FY2vhpgIyTXNcKF0t0BmWPOJu1htQdvcCiPXP/C7W7LbAOrO6fsL26OBhB5NVDmHdhEsCD/idcW7lnVrOwep+I7APLPq2KVj9ns20y2UY8wNj5ukLggkALq6840yl5m7CRwhGp/tGrP1zw5Z0ItYIN4VBoVpv1D6RGcVbIL8Hvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HhO+9Oqm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HhO+9Oqm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFFE0C4CEED
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 21:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750283000;
	bh=T9gM//UP13oM9DTQg88j0nlDgdvyIValZxErwDGf6eM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HhO+9OqmcBc47IitxiDg9o/UBGDlWoMyumb8aKfoj/jI2PA+iBFE+9xEBzW5zzAju
	 SS10h96ABPBmZ984bcjgkC/NQMty44u9ILiBP9+HAY9VkEIyNkgXb8itl24bnopUJl
	 iuKbgmuwIeioCXqbf+Y8cV496X5y9Ktcb7XX6dtzMzaxKXrQF4o3OeDDtKxEHjAJxi
	 Fs6zh8A1r+zin3zNKqdq1d02PNbtoz8hPp8hTGP0L12DKuE3GmDZSPO8211r+lCTpK
	 CuyNVL7Vmt131eUlULESCwhVnke4ERWQxWtwwxGp8L3gDd/v4wEKBoenC2Cp5AFJI9
	 J3dawIg7+65tw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AA874C3279F; Wed, 18 Jun 2025 21:43:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220246] Dell Latitude 5400: Mic Mute key stopped to work in
 v6.15
Date: Wed, 18 Jun 2025 21:43:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220246-215701-QKEyKyRl50@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220246-215701@https.bugzilla.kernel.org/>
References: <bug-220246-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220246

--- Comment #13 from Armin Wolf (W_Armin@gmx.de) ---
I think i found the bug myself: it seems that commit 656f0961d126
("platform/x86: wmi: Rework WCxx/WExx ACPI method handling") breaks the WMI
event delivery on your device.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
