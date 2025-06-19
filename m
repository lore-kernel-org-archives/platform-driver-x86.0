Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90900DF42
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jun 2025 22:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750371022; cv=none; b=HDAyqFljvew55qN9r0k9eYGJ4/TVNANBeX7oxsahtdor4bUS3Lz+2W37Pn+SklSS+jQb7j6JD6U2omwJLOKXJ1Vvaf7nNlBg43B4Q4ih8A3FIB3Q6x1QmrsbaTJaRX2StpBswXC2aELP9ZsZziBT4aVSrCQRSWGstgqdilKGFjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750371022; c=relaxed/simple;
	bh=f8/NrsQiSvPqlY4bkyLIIqKcd8xdemyNci12x3mqZI4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AqcTwkS2R09hAaftow6GpVDCDWajBrxVBcFGOIFuJHjzkD3WEM2+QGBnuYG3Tcfjho2WKaVW+3A85WvYBGjFMgt+2AOQYg/xI9L2jyNqhqxLKJY+5zxVssQ4KNxsxlKlDXu9gPyr95s6DopDEb7O2FuKIyYfcKNny7fuk80OyjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pvt5u2W1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pvt5u2W1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27CF8C4CEEE
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jun 2025 22:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750371022;
	bh=f8/NrsQiSvPqlY4bkyLIIqKcd8xdemyNci12x3mqZI4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Pvt5u2W1XD4aDVFBbgMAOShGn7Uo4pQyHBjzF/JojEsyefrsIpZPU1+Q3Yx4SxwAe
	 ea3Z3O0MptBoP/SsaSCm/TTaDxus0+OYzBq2yNL/9p6qdLAjMvrsueXGdyaT0fjuRO
	 pQd2f1LGu57PDIyVs2o2j2bOQJlVnwVAGF6NKUoIeamtelP/I3SbQN0AIUiGBDwP51
	 h+dOqc2dOkpKgq8lpsymuSJs3tNYdDk9WLFlmryoDV/8i5JJJbG8H/AgYCOK/Y0V3i
	 9faMlsJGqNAnCc3yFtniDdDSYzZNVRxnT4I85eH6VnzmMcL0ydHkuQo/ZHHTt4bIyf
	 87Cwbg69mrHcw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 15864C4160E; Thu, 19 Jun 2025 22:10:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220246] Dell Latitude 5400: Mic Mute key stopped to work in
 v6.15
Date: Thu, 19 Jun 2025 22:10:21 +0000
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
Message-ID: <bug-220246-215701-L9SCq3LMlh@https.bugzilla.kernel.org/>
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

--- Comment #20 from Armin Wolf (W_Armin@gmx.de) ---
Nice, i will send the patch upstream then. With a bit of luck it will soon =
be
picked up by the stable kernels.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
