Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472AF30BBBC
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 19:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776972797; cv=none; b=Y6sQneroxp4VO87NaFERxOAex20xZ5wkFE5iV6GVEFVGHNWbkJol8q4Pn/DYeBcwLTFZe3Vy0it/bNSNkE8hx1M1aJDTtuCWGzbpOW+macscchJQqzbfTyYbrdH9VpanCm22QIve9cuZBcUHf36S3UWccelR7asA6qWUPHjT72s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776972797; c=relaxed/simple;
	bh=+ZfeqvpuYDcOjgfctlNS+PhzqwcHUbBMd4Jd5xkGl0s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JCVmmQt5HX5+FmDNIYT5Fi+VDLO2acA46tM7Ee3nNM5ffS2ViwLRxGoDlh91iG572b6eVWYuxr95h/4qfWt+cMgDfe9wyDIEceEFAVacWHvh84dpH+axfv9VpS+ELVG5R1aVlnXKApBysstCtCV+71N6FDm5pu9oYPHtKpYUMxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CtzGeKGs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CtzGeKGs"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00EA5C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 19:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776972797;
	bh=+ZfeqvpuYDcOjgfctlNS+PhzqwcHUbBMd4Jd5xkGl0s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CtzGeKGsE2upPyDlhQ+FnuT7vwP9g+5T8uJsIlElcw+SFsD2EKXdxELZpUydZrpkh
	 YiinWNQGPFm75a1uui9avfRGgRKGuwY14uCJCdDHC96ixBTs0Lvl+i7mW7OxbCUj6u
	 MODAhfTw2iKMyxjJkBNmIUCg64s2owG/FUlDYW3mXI/vc6xXywh1h5LROBYERbOEzV
	 3L8TqPdn4W3mGp02t15xsIMWiqWiPZet6/iEjFxnGajVFRt+97OddSJqe1AYBduVcX
	 5eEszDCl54AQGShTbeCdolQuuvkkIqcIVDe0q/bl3gcP0mkAai/KAehFV7QyFVtvGH
	 cM2La7aFPEtTQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E29EEC4160E; Thu, 23 Apr 2026 19:33:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Thu, 23 Apr 2026 19:33:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sindrehenriksen93@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221383-215701-eGebZ4Wplj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

--- Comment #24 from sindrehenriksen93@gmail.com ---
I almost forgot =E2=80=94 reading through these comments made me realise I =
also
experience the complete keyboard failure, not just the Fn key issue. After
resume the internal keyboard stops responding entirely. I've been running a
systemd-sleep hook that rescans serio0 on resume to work around it =E2=80=
=94 might be
useful for you, Daniel:

#!/bin/sh
case "$1" in
  post)
    echo -n "rescan" > /sys/devices/platform/i8042/serio0/drvctl 2>/dev/null
    echo -n "1" > /sys/bus/pci/rescan 2>/dev/null
    echo -n "serio0" > /sys/bus/serio/drivers/atkbd/bind 2>/dev/null
    ;;
esac

Install to /usr/lib/systemd/system-sleep/ with chmod +x. Restores basic
keyboard function after resume, but not Fn key translation.

On the amd_pmc angle =E2=80=94 I've seen similar "fixes" floating around, b=
ut they're
not really viable given the battery impact.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
