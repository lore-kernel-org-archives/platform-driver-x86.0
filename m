Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0296C404BEB
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jun 2026 15:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781537875; cv=none; b=iKU0eyVBhO7Tq68EqarKEOvxgYJmbwBYfUU5stDiCyyfcJu7JDNpDnfuNgVSw5VgdorsDkuLap/itInpFLMz/ZRvTzsaCm0hwd4/jeBlBxhzAgVl2xCwC7uBAYzi39P+acugAXlCnLB0vR4DeE9kmYmKXwxxOxZ5Mx2QegI+8Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781537875; c=relaxed/simple;
	bh=Wa6xlxkl4JJ09AklQhD4tMfDw1OwppgkXjvn5A4AoQI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nx454HKCJNu74CTHP3mriTqgbOHfLVLSFr9pzwC5YlrIyBXmSJsUsq7utgheVGl/OaV3ExCVErGihT1bgbaRf73PS/D6gaJELlO/SQls9kRLKIuMNRhwzJTT2bTRqLOTmMlSC4gMGqWqQsaelUh8jddwTNidJjU+x2JPbh75Xjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m8Y/pfeC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m8Y/pfeC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4320C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jun 2026 15:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781537874;
	bh=Wa6xlxkl4JJ09AklQhD4tMfDw1OwppgkXjvn5A4AoQI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=m8Y/pfeC1+OMOfEOuPd6ghWlGaU3/BJna1seVYQn0Wl+ZplYK/v7wkeRFjhuFJBd2
	 roUEqNnKx1JUNr9mNnsGb1i34pGaZIkmesA64UotvJPWD94yQ7uYVOFzdxwNfdnQzD
	 EuNODAYB+/hdp6pTLjF1o2w0LfmQmA13Q0KH8+8CiVfWr0qghC3dTx8BsisNhbAZW+
	 BFYxMvH/BZpKWFqtmjiKCOkhUHa0Xw4ffdxAZBTHkc2xJmJ/KH30/qU9+tEM4Ws/uh
	 kCwuHEHvd9YGC11I1al40reoAeh0/Hvt9u4/6IbLCCyQvOHj25KmauTdY8srE39wxV
	 j6CvNfjpQEyVw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B4BE0C3279F; Mon, 15 Jun 2026 15:37:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Mon, 15 Jun 2026 15:37:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chgenn.x@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-MpfEYI9DMi@https.bugzilla.kernel.org/>
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

--- Comment #104 from Evgeny Ch (chgenn.x@gmail.com) ---
I've checked new driver version on LG gram 16 2022. I've tried all Fn+F
combinations. They mostly work. "Reader mode" combo Fn+F9 doesn't have any
effect for me, Ubuntu 26.04 Gnome shell. "Fn+F7" External display toggle
doesn't make any difference to me too.
Also, I've checked `fan_mode` default value & changing it:
$ sudo cat /sys/devices/platform/lg-laptop/fan_mode
0
$ echo 1 | sudo tee /sys/devices/platform/lg-laptop/fan_mode # should disab=
le
LG fan silent mode? Is it correct, by the way?
1
$ sudo cat /sys/devices/platform/lg-laptop/fan_mode
1


Loading driver + keys testing dmesg logs:
```
[ 7437.824922] ACPI Error: No handler for Region [XIN1] (000000006c907335)
[UserDefinedRegion] (20251212/evregion-131)
[ 7437.824931] ACPI Error: Region UserDefinedRegion (ID=3D143) has no handl=
er
(20251212/exfldio-261)

[ 7437.824935]=20
               Initialized Local Variables for Method [_TMP]:
[ 7437.824936]   Local0: 0000000056306aad <Obj>           Integer
0000000000000024

[ 7437.824940] No Arguments are initialized for method [_TMP]

[ 7437.824942] ACPI Error: Aborting method \_SB.PC00.LPCB.LGEC.SEN2._TMP du=
e to
previous error (AE_NOT_EXIST) (20251212/psparse-529)
[ 7441.231104] lg_laptop: loading out-of-tree module taints kernel.
[ 7441.231110] lg_laptop: module verification failed: signature and/or requ=
ired
key missing - tainting kernel
[ 7441.232304] lg_laptop: product: 16Z90Q-R.APB9U1  year: 2022
[ 7441.247021] input: LG WMI hotkeys as
/devices/platform/LGEX0820:00/input/input19
[ 7441.247202] ACPI: battery: new hook: LG Battery Extension
[ 7552.050047] audit: type=3D1400 audit(1781536857.026:390): apparmor=3D"AU=
DIT"
operation=3D"userns_create" class=3D"namespace" info=3D"Userns create - tra=
nsitioning
profile" profile=3D"unconfined" pid=3D11371 comm=3D"(ubuntu-insigh)"
requested=3D"userns_create" target=3D"unprivileged_userns"
execpath=3D"/usr/lib/systemd/systemd-executor"
[ 7552.050484] audit: type=3D1400 audit(1781536857.026:391): apparmor=3D"DE=
NIED"
operation=3D"capable" class=3D"cap" profile=3D"unprivileged_userns" pid=3D1=
1371
comm=3D"(ubuntu-insigh)" capability=3D21  capname=3D"sys_admin"
[ 7552.077511] audit: type=3D1400 audit(1781536857.053:392): apparmor=3D"DE=
NIED"
operation=3D"getattr" class=3D"file" info=3D"Failed name lookup - disconnec=
ted path"
error=3D-13 profile=3D"unprivileged_userns" name=3D"" pid=3D11379
comm=3D"systemd-detect-" requested_mask=3D"r" denied_mask=3D"r" fsuid=3D100=
0 ouid=3D0
[ 7615.499008] LG Gram Laptop Support LGEX0820:00: Received event 130
(252116994)
[ 7625.038464] LG Gram Laptop Support LGEX0820:00: Received event 130
(271581201)
[ 7625.160481] usb 3-2: USB disconnect, device number 2
[ 7625.996620] LG Gram Laptop Support LGEX0820:00: Received event 130
(271581218)
[ 7626.256223] usb 3-2: new high-speed USB device number 4 using xhci_hcd
[ 7626.410086] usb 3-2: New USB device found, idVendor=3D04f2, idProduct=3D=
b772,
bcdDevice=3D52.02
[ 7626.410115] usb 3-2: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[ 7626.410116] usb 3-2: Product: LGE FHD Camera
[ 7626.410117] usb 3-2: Manufacturer: SunplusIT Inc
[ 7626.410119] usb 3-2: SerialNumber: 01.00.00
[ 7626.422862] uvcvideo 3-2:1.0: Found UVC 1.50 device LGE FHD Camera
(04f2:b772)
[ 7626.469259] uvcvideo 3-2:1.2: Found UVC 1.50 device LGE FHD Camera
(04f2:b772)
[ 7628.254894] LG Gram Laptop Support LGEX0820:00: Received event 128 (116)
[ 7629.540205] LG Gram Laptop Support LGEX0820:00: Received event 128 (116)
[ 7634.692770] wlp0s20f3: deauthenticating from 9c:56:36:1b:71:08 by local
choice (Reason: 3=3DDEAUTH_LEAVING)
[ 7639.416293] iwlwifi 0000:00:14.3: WFPM_UMAC_PD_NOTIFICATION: 0x20
[ 7639.416354] iwlwifi 0000:00:14.3: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[ 7639.416362] iwlwifi 0000:00:14.3: WFPM_AUTH_KEY_0: 0x90
[ 7639.416371] iwlwifi 0000:00:14.3: CNVI_SCU_SEQ_DATA_DW9: 0x0
[ 7639.417925] iwlwifi 0000:00:14.3: RFIm is deactivated, reason =3D 5
[ 7642.781646] wlp0s20f3: authenticate with 9c:56:36:1b:71:08 (local
address=3D7c:b5:66:d8:c2:af)
[ 7642.782479] wlp0s20f3: send auth to 9c:56:36:1b:71:08 (try 1/3)
[ 7642.827880] wlp0s20f3: authenticated
[ 7642.829123] wlp0s20f3: associate with 9c:56:36:1b:71:08 (try 1/3)
[ 7642.832173] wlp0s20f3: RX AssocResp from 9c:56:36:1b:71:08 (capab=3D0x15=
31
status=3D0 aid=3D7)
[ 7642.843398] wlp0s20f3: associated
[ 7650.896203] LG Gram Laptop Support LGEX0820:00: Received event 130
(268435456)
[ 7651.875882] LG Gram Laptop Support LGEX0820:00: Received event 130
(268435456)
[ 7652.724018] LG Gram Laptop Support LGEX0820:00: Received event 130
(268435456)
[ 7655.360898] LG Gram Laptop Support LGEX0820:00: Received event 130
(251789312)
[ 7658.047661] LG Gram Laptop Support LGEX0820:00: Received event 130
(251789312)
[ 7660.768967] LG Gram Laptop Support LGEX0820:00: Received event 130
(251789312)
[ 7663.182967] LG Gram Laptop Support LGEX0820:00: Received event 130
(251789312)
[ 7696.705618] audit: type=3D1400 audit(1781537001.681:393): apparmor=3D"AU=
DIT"
operation=3D"userns_create" class=3D"namespace" info=3D"Userns create - tra=
nsitioning
profile" profile=3D"unconfined" pid=3D12474 comm=3D"(ubuntu-insigh)"
requested=3D"userns_create" target=3D"unprivileged_userns"
execpath=3D"/usr/lib/systemd/systemd-executor"
[ 7696.706172] audit: type=3D1400 audit(1781537001.682:394): apparmor=3D"DE=
NIED"
operation=3D"capable" class=3D"cap" profile=3D"unprivileged_userns" pid=3D1=
2474
comm=3D"(ubuntu-insigh)" capability=3D21  capname=3D"sys_admin"
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
