Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793967713;
	b=XAxL/h+YG0Zc8LCu0QXhsUHOI4P6S66JbBoaNFVQjPwC98djKPSdifOnrVMo3YQluhyB
	 v0e4xO8jeGBVgscgivEgs2YBocQI9eVbudI0nuiGRO3dgoBy5qnR/YJhVRKyVS/fTVYs8
	 wcxehvwLgO8PnOqeB4ZakA0DKYfw1FWgyTzeqsEj45nxrGue1179AsLpgywttPTrh8uFF
	 BtAf3eF6vPb7a/nws+oKobU9k8stMlADRZUdF9O3fSNtqgvdTvNerQ0Mx6oelSggQUmXL
	 KXysdBRA/ukkP4x8fv9NT9oTewk66ydM3ftGA5h3zAt0AV3Ls9+n5CZzdM5vm8ipHNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793967713;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=yEaZRg5Of0LOYoXjNBnes7giITfqU+0Gn83Hx87w8fY=;
	b=PFaf/4t8DQdDihYtOubmaSIjjX+zZphYycGk8dir/3NMjKj1CQy0cbX2M/WuLFUofHKY
	 6YpsYHgm3s8Ie2pa3SQXIdkGIHd8VuM5vH/deT8FqQhzboJEFK6nuMq7Afk/wJKPAedef
	 Zrae+iYk2MbZUeFqzJ7S9QoK38vqU2QzoCEFOlObPLaVZHPcz87eid4nXYbKESI686lEc
	 xFfJHOY/8d3nwVdM6gudaQHKAudewqdc2fRKFjAvG8FAmVoy74FfRaTAvI2UvqNbHhtl5
	 B4OVS/eVPPqBmD2kDVLi0JRzIQPB8DtUc7e52uEdFKB99lKfG8EFaWcn6Wyyq0ZLQwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=brjIi22f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DE3606A32F
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 12:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=brjIi22f
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5B0B1F008A6
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 12:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793967712;
	bh=yEaZRg5Of0LOYoXjNBnes7giITfqU+0Gn83Hx87w8fY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=brjIi22fJOLjKZ52VmaWHoL3LCkosWbl8PTFNchmZsPe19Jqs99juhGREAz7pBjwN
	 sp2qfdOerqxAUtG9S1+Hlx6Evzgi1FxwOn90ugN9bnQ0CNtcAawFkvVpPV+cdZ1zFF
	 XfPHeQWh/Qet5S8aLocscAhmMJkZC1pi9mZm1mcEB6nH2TJTCy6NgmTy1nRYJF4cAi
	 mpApgVYDL/a+TTwDMPms8XEfUpsWt8mfUpmtmB5G4fYvrvRr4cYy9ijyhZggUk5Q0k
	 eUfY8/3elrpHzX/TKDuP6ZiU+LxMiFlPvW8Wi3c69FKU0vPVH+MdjbMCTzxgEK4glT
	 VXlxk2mfaJ24A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AFFBEC4160E; Fri,  6 Nov 2026 12:21:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date: Fri, 06 Nov 2026 12:21:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: z00nx0@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-204807-215701-AMC4W8JbaI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #358 from z00nx0@gmail.com ---
Created attachment 311390
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311390&action=3Dedit
dmesg for ROG STRIX Z370-E GAMING

dmesg for ROG STRIX Z370-E GAMING

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
