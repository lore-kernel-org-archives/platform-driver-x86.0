Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113C120332
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 13:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717334155; cv=none; b=kaNRaeG+YW/VbxMXdTqyAcrb8+71Pk794yDFXeEf01QAtcyFEOeHFK8G9OaJeRy1QV9hiC6zOJbp4ygUyufn2X3gGDbtErJesqcuPlKwocKj+qpYanzLeJIlOFFEm2CPSYcQW/PpWD3+8Vk1J/bG6YuLyZgj1t9S+0h+F+fEoKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717334155; c=relaxed/simple;
	bh=Etk6ZjqklwbpjSjLAb+Q5yZn14Zm57OEREY/BVSVWks=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FQve2zne2hxwtKJ2mOq45wmfhg9Mr6tn7vuurb7PPITf5skZdy5scGJn8Pe2r5QzXKXGqdtDrsSpkFTR/otn/87eIqOxa/u7QhB+DBk6QtO2nREQSE7djIiVl5ag/SOao/4UH7RRGWegADfhMo3AzM5XKdGeYowwosj24sNV+UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NXQ+pCf/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NXQ+pCf/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2408C32781
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 13:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717334154;
	bh=Etk6ZjqklwbpjSjLAb+Q5yZn14Zm57OEREY/BVSVWks=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NXQ+pCf/MFg1WDm1XyiKIW8nuM8Fp7SH7ef6NWrO2grDXNEGIrMNcGlE1476F/HGQ
	 TDkwtZO0er0WMxtWoqIfOJEMGcOPTAz19zbBzB7IkpFTNFvHojAQ8VwPxiAFvdpxD+
	 9Y8N0w7Dl+N2cAft4ulfpKpBGf867BmxTq/UHGPbFNSOU+NQOzeCxF+fNUx8PT4TY8
	 gdpuUeUnf4degcYUFUKtrXaXsWHZfbaPnj/YV6I9SVHOws9TXye+8NuNVk6KKnhJOa
	 YzY89i02YnJGRpGeJ/vB96sIR7bZIJlPuG2nkt/arGpAj/ijDvquZrXyB2zYV8IPar
	 8khwVXyR82e6Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9D7D0C433E5; Sun,  2 Jun 2024 13:15:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sun, 02 Jun 2024 13:15:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: agathe@boutmy.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-sq5PTLv7qx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #11 from Agathe Boutmy (agathe@boutmy.com) ---
(In reply to Armin Wolf from comment #10)
> Can you check that everything works now?

I wasn't able to load the module with insmod, I'm getting an unknown module
error.
dmesg lists the Unknown symbols as=20

```
[ 5954.414920] lg_laptop: Unknown symbol sparse_keymap_entry_from_scancode =
(err
-2)
[ 5954.414956] lg_laptop: Unknown symbol sparse_keymap_report_entry (err -2)
[ 5954.415000] lg_laptop: Unknown symbol sparse_keymap_setup (err -2)
```

I couldn't figure how to fix it so I modprobed it instead:

1. zstd lg-laptop.ko
2. sudo cp -f lg-laptop.ko.zst /usr/lib/modules/$(uname
-r)/kernel/drivers/platform/x86/
3. sudo depmod
4. sudo modprobe lg-laptop

I think it's properly loaded now, however it does not work, I still have the
input output error when trying to read
/sys/class/power_supply/BAT0/charge_control_end_threshold and I don't know
whether that is normal but /sys/devices/platform/lg-laptop/ no longer exist=
s.
I do have /sys/bus/platform/devices/lg-laptop/battery_care_limit however wh=
ich
also returns an Input/Output Error.

On the dmesg side I have now: [   24.393457] lg-laptop lg-laptop: WMAB: call
failed when trying to cat one or the other.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
