Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C199443
	for <platform-driver-x86@vger.kernel.org>; Sat, 18 Apr 2026 17:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776534714; cv=none; b=hy8ODwx4cKzSIUBKvLXUwA6vfcHT1t0PzVhjsY8JxKtayBANra6f8oUIU6igQdrrCaA6knR8EheEf/2c5IhLXzwmplAC8y3vhM5RmXm7zyy0KXd0NmvLTWMxQCzVmsC07GWckmbuXL4ZIDRFZslU1CMDHLa+pAznrU6Bf1sDjGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776534714; c=relaxed/simple;
	bh=bNza2kz+aJXkh7GAVP1EF+suWVx1ZNeeoWvAqj9qu+I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eISTdHp1qJce6zK3u5rbAmOZyQldVzAnxyoCDwnbBVA0lhQDx1hZ+Aw8fmCrzpDw7+rsKlGbb1bjQFo08eZxZYfRmaz0PX8ZkgryVpBxGxIxyVwWdIUjbpEWkHWR5CtnzGCxQ9IdggSypE1BDlNva9WLi3gqPAyzNwpOPSf/mmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdRLeY/0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdRLeY/0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7B8EC2BCB5
	for <platform-driver-x86@vger.kernel.org>; Sat, 18 Apr 2026 17:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776534713;
	bh=bNza2kz+aJXkh7GAVP1EF+suWVx1ZNeeoWvAqj9qu+I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MdRLeY/0pLi4OY2lut1sKDNO/EO1DySr0z570b2wO7eb2Zs2yX5Lks8CZnq+1yFS/
	 qjDx4gK+Tp8q0sMMcOvFiuzX8pVpdukONZOymnCNFKKOXcUPzKdExrFvZ3/lztphu7
	 9WMR3B3dxLhFQA0PPgoMS3xYM1JqWjPqc0PC2nexowHvWDG8YhfI7w2PobulXnjAJ2
	 y2Dp63BReRZSEI0sqejWm97ZG6YQUd2c6f9rknw0AmIesPZVsyBbVrpqQjGe78zkdE
	 Mf5F35lAYIVyGSbLnnne5dDi6HVPZlt/2mt/fvU7Tw75vjTjf2VW20P5TJ0aYqqmd8
	 OeaaDHYKA90Rg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9695EC433E1; Sat, 18 Apr 2026 17:51:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Sat, 18 Apr 2026 17:51:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221383-215701-lePh9D2jK6@https.bugzilla.kernel.org/>
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

Rong Zhang (i@rong.moe) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |i@rong.moe

--- Comment #5 from Rong Zhang (i@rong.moe) ---
(In reply to sindrehenriksen93 from comment #0)
> Loaded drivers: ideapad_laptop, lenovo_wmi_other, lenovo_wmi_helpers,
>                 lenovo_wmi_capdata01, lenovo_wmi_hotkey_utilities,
>                 sparse_keymap, platform_profile

I assume this is a firmware or EC issue in s0ix, considering that even i804=
2 is
broken.

Hi, could you try to blacklist (see modprobe.d (5)) all these modules and
reproduce the issue? By blacklisting them, you will not be able to use "Ide=
apad
extra buttons," so please just test against "AT Translated Set 2 keyboard".

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
