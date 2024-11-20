Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE9128691
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 03:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732072595; cv=none; b=VoEUV3ocBH7eO/vIkGCg4uYU6pVIegmHY3sD2Nr1ba+87TEWgcfu1tlHb1A7zGZtRJ4B/sJ/53EU+zpJSvK9DvCtzR8T5nOMDzPlTUldOaQUl10ImodmEhfRscgnT92ovW7hvFr59w+lEMddj891wY0MGDuPGzTyy+k0mxH5wZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732072595; c=relaxed/simple;
	bh=i+sMY3ipP/nO1Dlvy1sYAi172/UdT2X2DnRGRRNY17g=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jI9FF1+jnLnQFBzMt5HQ2bxRFta3JCNQeGv10Vr587eEJZ0LLkJbaC8c3HkYF5WinqBB6yIn+ysxawyJcdClarFRkjUrayY5UlSvL/P2P9VygZHIT9aIwcVIjg73b5qSzaUv/h78tOUs5qiYYHrMAkFl045LE0xmq204fHJq0tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qLnfkILp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qLnfkILp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0A4CC4CECF
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 03:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732072594;
	bh=i+sMY3ipP/nO1Dlvy1sYAi172/UdT2X2DnRGRRNY17g=;
	h=From:To:Subject:Date:From;
	b=qLnfkILpPmk+7z8PXa70/A1fB9A3LDRuz+LsVBI9j9e3HiT1F4r4izISStwjDeXmw
	 yYG24OI94M2I1vNYWANteA0qfm9lGk+Lj2bSE6KD67noPDLqlcBQCWNM8j3yPxwX3u
	 2GCMxf593p3JtpekJKHaIA/Vd9iiNU9x4rbyAIIYh8zt51+w9fvEfCpCs/VhG32AH9
	 Zd5vBnA2n1dxuYKV0grrufgcu/zs4SGDfrYeSMHIyfaLp3AXi9e4psKegph6wFTvPc
	 +f5TCEk7AOopyneCu4ULQWX39JTQiPfawOXb6gqMkGNxPxzjVqQIoTrNhsr3CprYnY
	 wjQ+31/HDqcQQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BC92FC53BC5; Wed, 20 Nov 2024 03:16:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219515] New: intel_th_pci Driver Probe Failed with Error Code
 -107
Date: Wed, 20 Nov 2024 03:16:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.liang@hpe.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-219515-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219515

            Bug ID: 219515
           Summary: intel_th_pci Driver Probe Failed with Error Code -107
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: andy.liang@hpe.com
        Regression: No

Created attachment 307248
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307248&action=3Dedit
v6.12.rc7

Processor : Intel(R) Xeon(R) Silver 4314 CPU @ 2.40GHz
OS : SLE-15-SP7-Full-x86_64-Beta1-202410-Media1 /
RHEL-10.0-20241104.0-x86_64-dvd1 / latest upstream kernel (6.11.x and 6.12-=
rc)

The intel_th_pci driver hooks with the Intel Corporation Ice Lake NorthPeak
device and causes the problems. The older version kernel doesn't hooked with
the Intel_th_pci driver.

[   24.202199] intel_th_pci 0000:00:02.4: enabling device (0140 -> 0142)
[   24.202369] intel_th_pci 0000:00:02.4: can't derive routing for PCI INT A
[   24.202371] intel_th_pci 0000:00:02.4: PCI INT A: not connected
[   24.202441] intel_th_pci: probe of 0000:00:02.4 failed with error -107
[   24.203214] intel_th_pci 0000:80:02.4: enabling device (0140 -> 0142)
[   24.203315] intel_th_pci 0000:80:02.4: can't derive routing for PCI INT A
[   24.203317] intel_th_pci 0000:80:02.4: PCI INT A: not connected
[   24.203371] intel_th_pci: probe of 0000:80:02.4 failed with error -107

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
