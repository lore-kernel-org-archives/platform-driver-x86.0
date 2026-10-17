Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9E847ECED
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Oct 2026 10:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792232208; cv=none; b=ldVXXcgvKAl4nVjCXr2aORCyepJ8N+oFyUBNJLky6y29cACrzk3JqzVJvJTSCrJPhX8UU6AuepnL6D3+4PUDbYjPdQiJS0Y8dRGr+pe92xT3XDbrnJPCg0jZ8Hd+sarOjwJ5/n8c7zXubbf2embkASxxsJMd8e1dCdI57J+lgP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792232208; c=relaxed/simple;
	bh=HIvpkoGMvTLsCfbV3MsVOnAcnj8fS5u5jJvUxVNriOM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jfV67y+Y6WIuPXhoXQkfzZtQTDu8a7qDJiS4nCBihgpk26mBHwKNm/IW6hxUE928vqiuossoLCenAyarZV8qVbicHhUCXeWNGbBTDsadrskMLe8Q/srGlJ8oYn0l0GATQfEV5hr5SKTjAZbMortrErIBRMouwX1Fs41cSZUPdOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lxfkEpf0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lxfkEpf0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3243C2BCFA
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Oct 2026 10:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792232207;
	bh=HIvpkoGMvTLsCfbV3MsVOnAcnj8fS5u5jJvUxVNriOM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lxfkEpf0VUVonR9vRoOxugEWSl/mnf3c243d4BSVGAvSIr1HHmzgMAWIE3wXgVf1s
	 o47H9LEJcS8UUkLobtdn6lEW7wfKa2IeG3y7Trbg37s7ChdqcSH3Gt27NmM4WBxXou
	 v6itRDvg6HkVP8LPhn+IL1toAVP/RcHeBnGWu9RHOZeIFVtoJpVPJjdrDEGc8HIujZ
	 mj+jwrURiFpOH8TKGIZU0ydDTGy2ZDX5HVUID9y16A/1kZUg9+3P/okl4SoqKuUCt8
	 eO0NwfcqYWPaBnMSpSoA9eA1pGjckCOA5RXRm2Uf9ekZ/UJ+hl8CllzGeK8AePr+bL
	 uPazjfGahUxVA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9B33CC4160E; Sat, 17 Oct 2026 10:16:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222138] hp-wmi: HPWMI_GM queries fail with AE_AML_OPERAND_TYPE
 on OmniBook 5 16-ag1xxx (8DF4); firmware WHCM never calls GMCF
Date: Sat, 17 Oct 2026 10:16:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: krishna.chomal108@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222138-215701-NM21PcwFem@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222138-215701@https.bugzilla.kernel.org/>
References: <bug-222138-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222138

--- Comment #5 from Krishna Chomal (krishna.chomal108@gmail.com) ---
Hi Lorenzo,

As said, the patch was based on pdx86 tree, not stable branch. But looks li=
ke
you applied the relevant changes correctly and it seems to fix the issue. Do
you want to do more testing or should I proceed to send this patch to the
mailing list?

Thanks,
Krishna

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
