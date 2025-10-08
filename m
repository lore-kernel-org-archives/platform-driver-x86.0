Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F17C1F8723
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 Oct 2025 15:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759938399; cv=none; b=hszgyxXcW3xMifDOSIDCnvXxBEEVpqbpmpJEWORS5GGxsCNW5StcVIGvTMLZ3LDon6WwIAGyCN8TqOMceVRPUreEBDEhS6FJf35DrsDi8HDBOQIkJwOp4QIpUB2n0mPCx8vc/id40HQsH/vbgtjAvqJQWO5wB7zpD77BbFoYOqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759938399; c=relaxed/simple;
	bh=XYgPGM87sEWuDvZ7GGwXDBRuovZM48QFmN2oVXeXI9c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CQg4VTrEoNm8zdVmxoxHJFYFFHirhy6vxhBGMvSzq3VQ3W3G7eYaIxGaH9vgFaLmdWeeHJOfq6KFpjfenDcfRgSx7MvWn0xoGFK09DTOsC4m4p5jMUv9xoEUVE7Gp+VFXVR5HbpDc7srRL2SCR3C3ofln1cd9hqIPuEpH51Dmn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ax7GuhsE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ax7GuhsE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B22F2C4CEFF
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 Oct 2025 15:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759938398;
	bh=XYgPGM87sEWuDvZ7GGwXDBRuovZM48QFmN2oVXeXI9c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ax7GuhsEwexGAvr4piaWgXfTwKbxS7zEgf5JG/o2OL8o1Mh846sCO2pIOdpotln/n
	 8BBxxXz4d0nUAaWTHjki+SLu/aiZbHBeGILzUUarGm7YfHoqRV3VM8nLUnHD4mehk7
	 njuU6HM8kT0nKhUo5ZHpZ6M9xyvjYeM3RDis5evCYx0Kdk+QprjuDBALh15gDZY2FB
	 uRCmlL5QM3e3uygzE79ZWsd4iBGJuklbpUJBON0XQo87vGa+VDjVi77ZEk3WPL5oz5
	 Llq7/uJYNCmJzX3FrgwKdH/y5Yi9KqTSpTmZKwmSTd5iWc/uWM/+eQAwRwsC70ZE/Q
	 p0fzp/No5WWmQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A641AC53BBF; Wed,  8 Oct 2025 15:46:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220646] Regression: kernel 6.16.8 fails to boot on Intel Raptor
 Lake Z790 (ahci/xhci error -12)
Date: Wed, 08 Oct 2025 15:46:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220646-215701-MBWHICayOn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220646-215701@https.bugzilla.kernel.org/>
References: <bug-220646-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220646

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please bisect

https://docs.kernel.org/admin-guide/bug-bisect.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
