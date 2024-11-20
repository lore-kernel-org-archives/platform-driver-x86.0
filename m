Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318C514831D
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 03:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732072814; cv=none; b=DWeBz5OHugTk3ZkP+gAbqwQ0BvyLUwttkzCg/qug5n8WAAcnKsfr/1w/Rljl1Wms3rmHo/UR9iXl5REE2lsX3Gxe0RHVBdHLYeHa/u0wBYuMhveFzKb5Oc2Hv8hrkg4/PeOGFiNBeS1vEfrtRmUBz9C3HuS73MrCLaYFp0XG1G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732072814; c=relaxed/simple;
	bh=2XOOpPVSIDOXeAQ+qb+NkcI70Sk+2ZYuZ31Pa3iCfaY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rl/wlebhdgIuaqAPUPFYKqTUF4Fn8ut4YmTji/OWiIJ/HDgb7Bj5JbPc0obQRMzYvoP58RH1WMh4656uizAwljyNnIgTTdtfLDioUB0KbfpVfqcSK43FODbqcPZJiEWSJcsvSdn1uoguBSiy7qAvm+nH+o0ZvF3OcbB+9/yI828=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GTNijVJG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GTNijVJG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BCC8BC4CED7
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 03:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732072813;
	bh=2XOOpPVSIDOXeAQ+qb+NkcI70Sk+2ZYuZ31Pa3iCfaY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GTNijVJGOHyiRWqKBaRYTmvoGBDXMjApvfb/sPMxxKZwiu2QFnyZZHG5GAIt1LNnK
	 qnB/FikoKk9JNlONmjcpTOqej1//UvWUdqBPJMoXK/ObvF+qvmeVWxCPzrSly+7QgW
	 fSs7hPIu+zYcsj0mH/pdwZPks2e3BuSItZqPYZTIghA2PBNFV2Z04LWFN2W/Lur/AZ
	 J/PiXND+41bAESEFB0VnZ8UK6cJ8aqGFy92wny5OylRz/xGweHIXnBBcVqhbYVfH54
	 of4VkinaThZDcq7MCcR6DfNmXqH4WQNfIqIHV5/vgu7H2QjJh893rateeO5+GLcXlS
	 tPSElcj4S6TZQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B498FCAB786; Wed, 20 Nov 2024 03:20:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219515] intel_th_pci Driver Probe Failed with Error Code -107
Date: Wed, 20 Nov 2024 03:20:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219515-215701-59TBeczyDm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219515-215701@https.bugzilla.kernel.org/>
References: <bug-219515-215701@https.bugzilla.kernel.org/>
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

--- Comment #5 from andy.liang@hpe.com ---
Created attachment 307253
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307253&action=3Dedit
S15SP7 dmesg

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
