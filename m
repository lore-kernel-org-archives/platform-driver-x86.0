Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2069CC129
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 06:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712729357; cv=none; b=VPtsOj7KQfNL0h/MqZc3HeC5q4SAvoP/PIT7gMtdVcBTJUumjhCfjwMv6u2MH3GML/8k9Iil4bJEhr+ReZgkE3wQx49WvJ2CRNKtZkm9w+xzy9B/HlMD80MAS22IaQRNbe2w5N8zo5als5Cz74wFdYZ5XCvbnha8f1f5zKCmaHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712729357; c=relaxed/simple;
	bh=AZsopy4RdBWTmzTyFGczHda3eECsNH5K2dZpkWt1JYc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lKhDzTJDD+DtXL9RgYnufzBw7/K0RH2AHjAwcWpYhE8BewA4Ucs4jVFgibTfo1Vqkt2l25ON+z1QQptqFru0QkryIBVnblhR6+ge+CTOeHAQ7HtP0uFBpUVMUzGxf5Wu8/iDSJts8ylbNOmxOKk3HDGumh+vXSqUHHDeJSt21bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVCRT9f6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVCRT9f6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9798C433F1
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 06:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712729356;
	bh=AZsopy4RdBWTmzTyFGczHda3eECsNH5K2dZpkWt1JYc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HVCRT9f6sglrgWFEnJuwU05ODaD3w8tmOXSmGy2vKYrkayiTQ3N3mMdWn3IuWHQie
	 R4eb5snRYWLA7pg+G3TiXrnHZFi00+sgxr+WlN18d8SP9SUjZOvTXj+7WZD220wpvo
	 yYbCjs/KFZkupl0bSZrueHPSbUctrFgpKVGE3VgEfrDmXVr50gM4Z15oxMOXbqkj7D
	 YXfYBNC/sr0nUkfOpl6PIM0A8eaO0Xkzu5EJ4V1/w9L+ravbZ8tG+ScIZVuposefO3
	 3uqC+y4+v9/JVcMTNTkTilSGjcVoSBApsDDgyAhV/Kibh4zP/7RDfNc7Y4Lq6e6ujR
	 zkhaGLy0SyqNQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 971B9C4332E; Wed, 10 Apr 2024 06:09:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Wed, 10 Apr 2024 06:09:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: al0uette@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218685-215701-dSxXvXwbsq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218685-215701@https.bugzilla.kernel.org/>
References: <bug-218685-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218685

--- Comment #21 from al0uette@outlook.com ---
(In reply to al0uette from comment #20)
> (with asus-nb-wmi)
>=20
> [quiet](asus-nb-wmi don't have low-power profile)
> spl:35000 fppt:65000 sppt:44000 sppt_apu_only:54000 stt_min:0 stt[APU]:0
> stt[HS2]: 0
> [balanced]
> spl:35000 fppt:65000 sppt:44000 sppt_apu_only:54000 stt_min:0 stt[APU]:0
> stt[HS2]: 0
> [performance]
> spl:35000 fppt:80000 sppt:44000 sppt_apu_only:54000 stt_min:0 stt[APU]:0
> stt[HS2]: 0

The above data is taken when I unplugged power cable, here's the value with
power cable connected:

[quiet]
spl:35000 fppt:65000 sppt:55000 sppt_apu_only:54000 stt_min:0 stt[APU]:0
stt[HS2]: 0
[balanced]
spl:45000 fppt:65000 sppt:65000 sppt_apu_only:54000 stt_min:0 stt[APU]:0
stt[HS2]: 0
[performance]
spl:80000 fppt:80000 sppt:80000 sppt_apu_only:54000 stt_min:0 stt[APU]:0
stt[HS2]: 0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
