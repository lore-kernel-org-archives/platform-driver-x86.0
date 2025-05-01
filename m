Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5416A20E026
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 May 2025 12:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746102959; cv=none; b=Y9MwY+LdEe++D/RH9sbFeDrAwkoU6EL1jx9F5kSfBVmG70QPuQlfA0wX0pgI74uORvnIh66qlwW6bYLp09uWpzg4y27VLD4qHAIP/zEld5W7dvIvC/+XmIkp+vbFaPqtVPaCAyRl67xEug/xxok2zydzNtzbAvdqYaqo6OPFHPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746102959; c=relaxed/simple;
	bh=RMvXZvucJTivs2HWkEnw6if24sOtpc/zN2zSZArwmJk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UP5qvrFYMsUjeAsUVfc9u8VR0UWY/6AsFJns6ltVhzSZ68q7rcuPFWSWcJGrmZ5q262BQkelOQ5bewZYveanxpl9cwNMpT86qDxokJZYTU3LHGGCLI+QN/iVG1pf32lowL3GWCSdaQWDXVOm3ebCsg3M9Zk1KDFtYzvBElp6N68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QgSk99mP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QgSk99mP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8257C4CEE4
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 May 2025 12:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746102958;
	bh=RMvXZvucJTivs2HWkEnw6if24sOtpc/zN2zSZArwmJk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QgSk99mPHDX9QVIKfLKGHlyaVUc9+mSELgFhW5BZR8Gxul5oVYBxXhw3v/PGMacJ0
	 QicK/pZcSQ3+I0odgl5881XutNpH7VqFwjgy56UmX3jt1U6Bxl91GcQGlp8Bx+l/5U
	 9qPfZ160W28O6kMQWQiYsZKuHbJSn2ELsX7Br++Iwvv5aKdmJog5ujxIOPeo0emy/N
	 GaipxTIpAt4DlCSTCE1QQPUy7fB+GVlzuMFsTe0a58sIXMXbNYwatgXTkgVfR6Eeb2
	 pFuSJlbvcG4eO0AKFypJFWb1dtXEEKEJBGfC4G1je7+nv9Gy42MwMIm115ZzYcCipo
	 xBVcIEgmi1XWg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B99ACC41612; Thu,  1 May 2025 12:35:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219786] asus-wmi: WLAN is permanently soft-blocked on S5406SA,
 but can still connect to networks
Date: Thu, 01 May 2025 12:35:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219786-215701-PcPLHJ4x00@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219786-215701@https.bugzilla.kernel.org/>
References: <bug-219786-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219786

--- Comment #11 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
bugreporter23 in case your wondering, this part of your logs:

[32267.286227] asus_wmi: asus_wmi_evaluate_method3 called (0x53545344) with
args: 0x00010011, 0x00000000, 0x00000000
[32267.286245] asus_wmi: Result: 0x00050000

Shows that a get status (0x53545344) on the wlan-devid (0x00010011) returns
0x00050000 since 0x00050000 has ASUS_WMI_DSTS_BIOS_BIT (0x00040000) set and
more importantly, does not have ASUS_WMI_DSTS_USER_BIT (0x00020000) set, the
device-set (0x53564544) call should also be done on the wlan-devid
(0x00010011).

But the logs show that instead this is being done on the wlan-led-devid
(0x00010012):

[32267.287502] asus_wmi: asus_wmi_evaluate_method3 called (0x53564544) with
args: 0x00010012, 0x00000001, 0x00000000
[32267.287508] asus_wmi: Result: 0xfffffffe
[32267.287511] asus_wmi: asus_wmi_evaluate_method3, (0x53564544), arg
0x00010012 failed: -19

The use of the wlan-led-devid instead of the wlan-devid is caused by
wlan_ctrl_by_user wrongly getting set when the get status call returns
0x00050000 and that is what my patch fixes.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
