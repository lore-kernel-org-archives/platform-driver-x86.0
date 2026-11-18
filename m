Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990520;
	b=Ma4YD69kW2oBReTaXr+4sR816Yn1ZNn7bLvIJq0HM0aACkls7V3bATdqRlgNPBRQCsul
	 /kD/8W3GF+5NF1IGkG/VRVHg4iIkBLuSvtkDvQOphJz7zKbAvNzvmtj2LtvhOItf7HyZ4
	 oIlHdzW190suIaYmd/in1CcuSdI4aYgFUvzQK0if3P+CMGJWQdjTk0I4hlVgex7PUKfEE
	 ob69Qed8sBw4fl85VOo7UKWdWqz5T1dIveOOLa1Zh1BNyzRmsY1GFYorfZl98PbChuNDA
	 pp6nj5lN7VDa91kMqRK5I0SQOxrGyySqdjnBgb9fsB7YOwBGG79KYPMhiH2lPg9lj1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990520;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=sphmAIkLstGc1rL86hhB0HckfA92D1hGumXvMPIzLiA=;
	b=iCCUsE/x8CRQ7tdPcYq/sh7jb4secB8g+Yz2A8j76M7atUJUAvgL1jwEXmWSZbD68nAj
	 Bnlw/DGBRiKuHRUcRwXJZ+4UDJOUogo7wB8FUkFQX/cwcYHDFbzwwwMG6s+gkKRquicgC
	 NMmPEluLWG+q16VWVL61HPyfQf22YyQQ7buAOSTPPM2KFU8n1zBF81h9uiQbPsgCdx46/
	 xAFm53TbFYTisiLqYvlXmKVRBCyYo/9N9vzMJLg3P4JifV+VviAl23K35FDUN/7nDw50X
	 sykTUo4O+yNf99WNM3tlBWmSuWdCxcrt3qDuyOn4UAJJqOSUAAGLKxuCw2tNMxckeyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BEJS2Ffv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561EE606A32A
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 08:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BEJS2Ffv
Received: by smtp.kernel.org (Postfix) with ESMTPS id EAF1B1F000C8
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 08:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794990520;
	bh=sphmAIkLstGc1rL86hhB0HckfA92D1hGumXvMPIzLiA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=BEJS2FfvOFrkYTJ2gVPgHzrXVS31/bEIndObBI+J6f2k/E/4oASdjJvXS7rWxZkvJ
	 t2aqmWLDcj11ZADhX84ixqj7omk1i4aaMc3tmfl2x+MzmVh1UGgu0/ERiyJShsb4GS
	 uK7oA3Uvhj0O/xxNx+xPX6xknhVgc76Esz29i9nZub0QDuyFQwdNGFjHBHVu/SKUKN
	 XkDNCglX4S8efovkpMsZBvYJqQx+shprThkh+HYhD8rnkKT4Q/99miParfSGL7InX1
	 WcRJfYV83IEJ4S7foXBBnj+qANOeH3WnvscYXCZgCGUGjSJfeTPyLj7GexJUTB0Dcg
	 DVQKrHYtbnHyw==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id DAD91240040E; Wed, 18 Nov 2026 08:28:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222275] lg_laptop: LG gram 16UD55U - kbd_backlight has no
 effect, unknown WMI scancodes on Super key
Date: Wed, 18 Nov 2026 08:28:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: daxter1992@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222275-215701-z96gMAVBul@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222275-215701@https.bugzilla.kernel.org/>
References: <bug-222275-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222275

--- Comment #5 from daxter1992@gmail.com ---
I checked LG's official spec page for this exact model
(https://www.lg.com/es/portatiles/gram/16ud55u-g-ax85bn/) and there is no
mention of a backlit keyboard, and the keyboard has no backlight hotkey.
So this model (LG gram Book line) simply doesn't have keyboard backlight.
Sorry for the noise, that part of the report can be ignored.

The Super key issue is fixed by the lg-laptop patch, which I tested
successfully. Thanks for your help!

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
