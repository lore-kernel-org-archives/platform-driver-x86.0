Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DC318660C
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 05:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732168607; cv=none; b=hzEqcEUc7QFSdQ5oh20cguL1nRyy06eg6oyVi7Kyk3gDrOl/2diFRAzozTv4ygb96sJwlKOuQCtjzy5whzQDb9VQ9Zql5y+f9Rn5cg1YH2fbTmwCwkGtyvsBoXig5Vz+34Wy/5Cbbi8ks5jLUEmGHIOOTJ3NaWUx4Pu1ypTg7WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732168607; c=relaxed/simple;
	bh=P6fN2ZcAZ5Cp/rN2+ZUVjwmn6JxcfEIaJErkCW7UeiY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ky1d/jMOwyogAlrB1crgZVAdbkpmPGhluebg4xHuWPFRi6HJ1AvX78f8KfY65babHoaVfyA1t56mX0J4P8fnDaINVq6xxSyMVkGi/+Z66Ss7SSagyHXcRgS7TJ7kmPUzw/Zj50cgyNNr/U6MFHcve1VFEvVHvgkDhCPTuwhV9nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pQsUrCcl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pQsUrCcl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40D61C4CECC
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 05:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732168607;
	bh=P6fN2ZcAZ5Cp/rN2+ZUVjwmn6JxcfEIaJErkCW7UeiY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pQsUrCclEpg/2NK7p03UvDN78oOVYKSFmkf5wnfzXJQ8+dXhJPOS6QJ6Espli8eqE
	 yuVrszjmW8ED27cMz3uq1A3Qf51CRwsjJUnL10W/sYiqvettwryblhlgqeKC2bp5CZ
	 li96yIbt+RmM5JeejRt5fiEM0RvBPJghiXzAlvCk2GBzTTtDo51MdnYl8kaF3Lo7CB
	 J21BEoo6W4dEA2w0Z5P4m7A84J9WLzQ6SVUIePKE8f81uM6FhE9FlQkKUJt/R86LNe
	 Vdj4OEJnY0Rwah/xF8uJjgvBv5LgnrcNxbqsEILgv3u420lT5XMfWK1R2AFNXaAxlL
	 bte7A5x3ALCvA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 33F3DC53BBF; Thu, 21 Nov 2024 05:56:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219517] REGRESSION: charge_control missing in 6.12
Date: Thu, 21 Nov 2024 05:56:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: auslands-kv@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219517-215701-9uY2M37C11@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219517-215701@https.bugzilla.kernel.org/>
References: <bug-219517-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219517

--- Comment #3 from Michael (auslands-kv@gmx.de) ---
As a comparison, here's the dmesg from an earlier kernel with working
asus-nb-wmi:

=E2=9D=AF dmesg|grep asus
[   14.268902] asus_wmi: ASUS WMI generic driver loaded
[   14.283569] asus_wmi: Initialization: 0x1
[   14.284980] asus_wmi: SFUN value: 0x21
[   14.284993] asus-nb-wmi asus-nb-wmi: Detected ATK, not ASUSWMI, use DSTS
[   14.329923] input: Asus WMI hotkeys as
/devices/platform/asus-nb-wmi/input/input11

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
