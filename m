Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C81F944F
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Jan 2024 07:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705649474; cv=none; b=dUAFelY4SNSpTQwQ6bJ/LDcF7ggALbpmAraGE/Sg4f8WNh6cu84avjdBkbx+yAFQPdt/Vy16HZvOO/E10Wm1xq/BdEOXYFFLbImt2dzPXyarqxromdcnRY7ewON2yfnUtYM4fqohxc685kagcPYNJDF2GK26xIN+3fW87uomIwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705649474; c=relaxed/simple;
	bh=0jQ+SFSR1YokYVbDyQ7qBlAWatd1fVOp41iwMAzfCak=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HVWfSJvN7dXtflIi2sHNxyNy163RK3vIKrdYEJUo3RZZhhu3d2k4Az1Z8p/E55loQYl3vfFbHM6QcKinoQAWjpDUmS0sOAAMbFx3Y+THdArAxpaf4cevva4zz/7EnrDWXxTKAEj9huXVkNFzt5TsQOJkgBnrcrUV3K+DlvMFv6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mkAwb1Xz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mkAwb1Xz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97587C433C7
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Jan 2024 07:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705649473;
	bh=0jQ+SFSR1YokYVbDyQ7qBlAWatd1fVOp41iwMAzfCak=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mkAwb1XzzDG2eO569yjNSVybnR0gvpVoZypad09fwSdja8nDu1GFmHSShYCsmpcbT
	 ZISZgrOO7tSc6RdhFVNSmI7g+DJBw6pqJkDMqjiNbPO7UPsjf+FMaVM0xfhimDn78u
	 vn94lZCId7qB/neQMjPptQ/Aj10GzwS4XIxcnHI6r3U3Gx6U8wIL8oUTYmHn5rEAa7
	 n1gCruKY4xgnICVkMaHvFiVI6QaKGGKy3GNJuzc3XkkN6Niuy9zflLCC1PfIngj18Z
	 48UQwJx7MD3zF8GDYJPmioZIfF5K6eVZRajzr1ppe0FDhwbSxzhyr7KM1mHSM+gPah
	 Fuir4USk4o2qQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6C7FBC4332E; Fri, 19 Jan 2024 07:31:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Fri, 19 Jan 2024 07:31:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: muzhi.yu1@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218305-215701-Hbwz12fTWJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

muzhi.yu1@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |muzhi.yu1@gmail.com

--- Comment #16 from muzhi.yu1@gmail.com ---
I can reproduce Artem's issue on EliteBook 845 G10 (kernel 6.7.0 on NixOS).
Also Dan's workaround works for me 80% of the time, with only a few times w=
hen
I had to reboot to lift the cpufreq lock.

My max_freqs are also strange, regardless of whether cpufreq is capped to
544MHz or not.

```
=E2=9D=AF cat /sys/devices/system/cpu/cpufreq/policy*/scaling_max_freq
5137000
5137000
6080000
6080000
5449000
5449000
5293000
5293000
5924000
5924000
6080000
6080000
5764000
5764000
5608000
5608000
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
