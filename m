Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861ED4776A
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jun 2024 12:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719231775; cv=none; b=haVUp69cq46Vfu3DzY43qjTOivuHJfk41GgdXZOP/lZVQrqkJbL07Fs4fMmAVPnCMUzQZg/aph4aUlH2DNbRfcLDBvAuhAKuTXZrDW5cqxdreu9I6KWakvdbFO9THdTdDTjnrOYLf9cy5egNZrzW+MPElDFk3co8hxHytEYERYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719231775; c=relaxed/simple;
	bh=2CD3+AOTKCj/mePPWlSwA55hwVcNWCnxvd/WMkSpGkg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rk7fS2wQW5ga10hA5UQUPfo7Wa1XL14fCUZgJ3sgQkSvln89BLLUZMd6KVGQ9H/Dgb1/Yt60h4DiaIDUui2VTOgn7oem3XHSBUVMIYNuxZUEY77YH/3jbQOqr6CeFQr+L/rYaaqJ6P6SVRuc0GyGdw1VzCKVZemKXMw6t1QELVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IE7ghvx8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IE7ghvx8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B0CAC32786
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jun 2024 12:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719231775;
	bh=2CD3+AOTKCj/mePPWlSwA55hwVcNWCnxvd/WMkSpGkg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IE7ghvx86UbQ/CCslthP2K8JrOaNOMXchQSbo08i3PEnVtWQEKmt0Kf9nNvIqKDbJ
	 si75nB7q9sau02GRthdWsk0yctRxM/GK9lJkNIKsqo+1Tr2hHUhn6atxXRLpcOyfqL
	 1YqlRcBak5/JZobDEBDAPsc86vwINxVKsGQhUK4I5ugNWINPrG/3MV1mk1kk2McOy8
	 FEMCzC1Lp8Y4BdhEbE8h8ZcYprdfFYRu0RJE83XZQJcisWR8VQhn9svW6ByozI366U
	 ilmF2O6zzcVxpo7HA1OUHjrIKCQPnYR4m84XZTpDJtVrwGIitUUiCAfPOZOY/YkNOr
	 +XB6Br7/I/ctw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E80B6C53B73; Mon, 24 Jun 2024 12:22:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Mon, 24 Jun 2024 12:22:54 +0000
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
Message-ID: <bug-218901-215701-Nio0E70EiH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #48 from Armin Wolf (W_Armin@gmx.de) ---
The necessary patches are now upstreamed an will likely be released with ke=
rnel
6.11.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
