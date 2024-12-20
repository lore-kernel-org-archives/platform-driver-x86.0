Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EEB1A0B0E
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 20:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734726830; cv=none; b=T/VZUsPmrR0Y1mVXl3fYlA7Ibe4xoDRvSAi2V5GO6mw25q4FWmv6CW2TDVVHWvDvr5K0pj2tEHpNTizOu2EiNdUkLUXDOV/EyP2mIHn6+9tLvI+WDFML2vjuzm68X4NcPvA/n+InTqetjBXhLIGyplKk6A/yVBoP0XZrehKbFWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734726830; c=relaxed/simple;
	bh=h/2K8ptKanZZm/5cIcVMT45Vu/PHpsMNJjCg+V+Z+1E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mZD5AgCFxAdMSVg25VhBSB8qP3+K6ScBmig1fgyrhgWQ5sTd/PnTFtQ5hcYQR4aMuNSyLUXqF+iSc1A1PsBGpWhOFDmv8NWE7ho9KbIVYaRu5qrHyFQMCjF/DK95N2UU/NYKTr9/Ok/byHFkTltGJ6E8r0duFYOHbtnmCoAnD6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VoZn3H1p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VoZn3H1p"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F13DC4CED6
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 20:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734726829;
	bh=h/2K8ptKanZZm/5cIcVMT45Vu/PHpsMNJjCg+V+Z+1E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VoZn3H1pVZwsZoN1vKvpqKbzdWtDQrqJXhLr6qEgXSpvJVrzUlmGFBxO6oPjgeW/8
	 VV0vr7hUG3fEOIlw3yu+pGG74b0I9Xm3t3+4HKIYQy36ucS5rUPoxaWx+YUWFqApjX
	 jG5sOcNv+QmWTJKXOmHAVm9sfAIwwev2HeuGIPWPGwzWNkRtVRm+MDIXUeA6ycH0Ye
	 E1A/GQYTHl/sj03UfLlRzAB17oz2RoL5FPJhx5K3o3hz8eXAZXLsGU4wo7d8x75wZi
	 wK2RCG8lLVYMQfoifwQZNMNUoOwVd0xJ1SUZrP4AytEwCtc2UEb4sSMb/8092256Kc
	 XQllRySp02J3Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6290BC4160E; Fri, 20 Dec 2024 20:33:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Fri, 20 Dec 2024 20:33:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarkko@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-HC4j1OfhGn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

--- Comment #40 from jarkko@kernel.org ---
Errata 3: Better to keep semantics of TPM 1 path for ACPI as it were as we
don't want to mod tpm1.c.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
