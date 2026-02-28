Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE33374173
	for <platform-driver-x86@vger.kernel.org>; Sat, 28 Feb 2026 14:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772288876; cv=none; b=q9BMBhc9CNtHiFf57aRpxpaKwFvZx2zS1eh/AyZMJxWpT8sFmb/zTGIFEHHKCwsBl/s9nJhMinmISeW/EEXyqE6aBeamn4yzboGAMrZodD9hR2+HZFEEQ6NG+RyuU88guIyZeGnXKtylEOO/rFT/LZUahzFeVITO1kFBuxgKDag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772288876; c=relaxed/simple;
	bh=4ajC+XdpGqLTZ4ra9DlmuYlwZIKpumUQ052R4IUeb8c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d3fwpjof73kxOkSuIY1oAc2Gt02+OaghZUWn3INrCjt2+kFF64rb+Aw5sfcbaJ3JZOpIgJF85IvIEAOsI2lxVQfRJNi/4dRF1G9bQRNvu7hLrDqtrThvegMpf6IQaDK2tfU2WPTbApoIeonVeighbaYCDHwPXBYOLuKIypX4AAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XOMLNhjP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XOMLNhjP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D0C3C19421
	for <platform-driver-x86@vger.kernel.org>; Sat, 28 Feb 2026 14:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772288876;
	bh=4ajC+XdpGqLTZ4ra9DlmuYlwZIKpumUQ052R4IUeb8c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XOMLNhjPOnHLX3k0xZmxU5wu+h3oh4eQhZd9ZGXky5/rvCd1YsWT23iaE3I7kT98s
	 Ry+L25AymzR5QOVgGaZTqGSUjp7r6c8rURw9eEgDXQ1JDSlvSWxOJcaPgF59TqF0F0
	 7VCwOgqymrMhAAIT5OrPdRlSsJ4PYfDC9HLa7CMwkr7EvsJFideWF3hHiTKCc2YL6u
	 l2E/xvMXfY3lTV9Olp7dZMQgbvBTv1rwcU/XzXNAfVblrvFdEo1oWWqWbIBGDLCzy7
	 YvJIdW9+kIAnNrXj8XC6IOG1Qpz2qjp4Q+mQw6st702XUml6hUrCM/e6QRGP+Q02Yr
	 kvNjTzjjkKmGA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 08912C4160E; Sat, 28 Feb 2026 14:27:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220646] Regression: kernel 6.16.8 fails to boot on Intel Raptor
 Lake Z790 (ahci/xhci error -12)
Date: Sat, 28 Feb 2026 14:27:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jn@yaloub.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220646-215701-ghOKU0zdZD@https.bugzilla.kernel.org/>
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

--- Comment #3 from Jean-Nicolas (jn@yaloub.com) ---
From what I can tell: AHCI mode.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
