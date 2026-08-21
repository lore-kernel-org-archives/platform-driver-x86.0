Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23657376A0C
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 10:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787309526; cv=none; b=j068dPDy2tqlsnbw2Gz6KWrB4VaI5b9MJuIfZkWkjHHtUDmIRzp/zJduwoGc0IoN8PTGSC2ml7cswcPQ0mEPIux1+xMk5I08CfmyqUdvdfPsJidfEn/TrEakLy2SxekBZ8ZC1ui3xxPBJiuYKOkr84+0UFjb93AW+CW51Ij7BeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787309526; c=relaxed/simple;
	bh=0IcV36Gd7dqCmonBcIRm44K+OUQ99Vazalz6GRIIfTM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IOkgbA4g2Ladr7aRu2zmLXOmPrJBNleRIoLWNk0VRXqI6R4H+W4RNZOL8QVYsbEMUYZ9NRCQqYUXJXHVz4diDkfmkG10kf258T2R8y9ZcXYEAd1Y0R5JZlAA8iLbP9aduBy4S7cOj9qJKOA2Rm3xlx7OXGuM7gnw6vgiHjGSQGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lx4uX87e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lx4uX87e"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76C16C19425
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 10:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787309525;
	bh=0IcV36Gd7dqCmonBcIRm44K+OUQ99Vazalz6GRIIfTM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lx4uX87eV8O0DrtKTKdM9L81IZOC7E6fbAkwcMcy5/lAsC5/zgG6NsFlPf8N4Lzmb
	 O25wNKZ5PvbM3JyOWxrKFDJa/VG3GHrUue3Ag55pgJ/HZ6LstNo/MiTkduagKSrOPp
	 bgeYiABM/tjjjcjfuDrQdILb5SGCmBxdsqcS/rLSXN+Pua+pOsUk5rZZCmDy7HqB4G
	 /ZCWc31UVbUwNYyFdeVyHognnrft7W4hzweuZZH7VjnLxT9/KWHEFahaiLoQeoHMXD
	 KHKCx2CgmwNE4K4ssAOuFgVsZqqTRTnzVjzV2o+6UkHXCb2kNYjnMudkLaoSIsQ32B
	 HBfu8dhp3YQNg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6877BC41614; Fri, 21 Aug 2026 10:52:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220926] HP ENVY 16-h1xxx (Hayden): hp_wmi platform_profile
 fails to read/write
Date: Fri, 21 Aug 2026 10:52:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gibs23@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220926-215701-NtOZAFeGTD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220926-215701@https.bugzilla.kernel.org/>
References: <bug-220926-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220926

--- Comment #14 from Gibs (gibs23@proton.me) ---
Created attachment 310705
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310705&action=3Dedit
ec dump while fans ramping down from higher speed to lower speed

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
