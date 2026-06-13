Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B9C40D570
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Jun 2026 07:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781337077; cv=none; b=KC7uWngCBUYmfFDDi1vlHLyFT3VCQbznCD4oIuX3BPQyTM3srYKvVHLWZbWK0Ww2mQw+aY86yxxd0DFtuT03UyO5csqDxYySsh3qgcyFh2EpQuJi6lTGL7l9X/QbCU2t9rCiR0Ys+C92bJ7rhVp2JMMBc2ZGSfxw+9987FgIXU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781337077; c=relaxed/simple;
	bh=Yq/cmdd91gF0QGPpCF/Ph48oMxYqtlCsY4+lHgS9OS0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lYDU2ZQfLX9CdnBfOFAwm7t4+3cSeczS/VxZEL6xErN6lSuWS55NnXzUkyPJ1O+ZIPoh7ifiLAz8SWD9jT3L323EiLc1ZBhBvCAfQbn0vtYa73ZTmz77e/2QoXNuhxOhtqr2ukUwr2J88Ht9ERKgYLcDNhONhCqxf8Vw0D7OXn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jAssr87J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jAssr87J"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9FDCAC2BCB7
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Jun 2026 07:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781337076;
	bh=Yq/cmdd91gF0QGPpCF/Ph48oMxYqtlCsY4+lHgS9OS0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jAssr87Jq6ukA9D2TGQg7bmx5VxvoauQxqqXALy4SbvbGvCzQruIurcP1h+J4hED3
	 0VANxEI65zXU0YIY58oftfRdeCzuVY0YJY6Y+tCB/RSDdZcRDTlFQO38Q3fXtm3ZOX
	 Asd7tzElaDrWyRpFSP0dXKoAn+OUZOP4ogdh6y+cNlKCF+QAO9hgLYEIYsFsjJiFyZ
	 iw2+OUGygAGNw+JNT2arDLiNxg1FGqczlN9OdpB4XM9VervXf4Aw7GoHjJVoGRf82J
	 IR3eLPRKlouTjwx19fKjhqmCJGMDuCNBFEc9fUQqRIk7+44hl7bWbLxq2qZUsaMYNk
	 lb+BCLKsA5w2Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7CE5BC3279F; Sat, 13 Jun 2026 07:51:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sat, 13 Jun 2026 07:51:16 +0000
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
Message-ID: <bug-218901-215701-o4FtGGiCtR@https.bugzilla.kernel.org/>
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

--- Comment #97 from Evgeny Ch (chgenn.x@gmail.com) ---
Kernel:
```
$ uname -a
Linux egramm16 7.0.0-22-generic #22-Ubuntu SMP PREEMPT_DYNAMIC Mon May 25
15:54:34 UTC 2026 x86_64 GNU/Linux
```

Below is unloading existing module and loading newly built kernel module wi=
th
corresponding dmesg lines:

```
$ sudo rmmod lg-laptop
...
[   45.626554] ACPI: battery: hook unregistered: LG Battery Extension
```

```
$ sudo insmod lg-laptop.ko
...
[   49.458182] ACPI Error: No handler for Region [XIN1] (00000000a791ccde)
[UserDefinedRegion] (20251212/evregion-131)
[   49.458190] ACPI Error: Region UserDefinedRegion (ID=3D143) has no handl=
er
(20251212/exfldio-261)

[   49.458194]=20
               Initialized Local Variables for Method [_TMP]:
[   49.458195]   Local0: 00000000181944fd <Obj>           Integer
000000000000002B

[   49.458198] No Arguments are initialized for method [_TMP]

[   49.458200] ACPI Error: Aborting method \_SB.PC00.LPCB.LGEC.SEN2._TMP du=
e to
previous error (AE_NOT_EXIST) (20251212/psparse-529)
[   52.957699] lg_laptop: loading out-of-tree module taints kernel.
[   52.957705] lg_laptop: module verification failed: signature and/or requ=
ired
key missing - tainting kernel
[   52.958770] lg_laptop: product: 16Z90Q-R.APB9U1  year: 2022
[   52.965668] LG Gram Laptop Support LGEX0820:00: LED status: 1408
[   52.965871] input: LG WMI hotkeys as
/devices/platform/LGEX0820:00/input/input19
[   52.966015] ACPI: battery: new hook: LG Battery Extension
```

After module loading I've tried keyboard backlight control via keyboard hot
key. Hot key works correctly the same 3 states way. However, no Gnome UI po=
pup
appears and UI brightness control slider doesn't work. This could be becaus=
e of
unloading old module first, but I'm not sure. dmesg lines below:
```
[  286.267434] LG Gram Laptop Support LGEX0820:00: Received event 130
(268435456)
[  286.272300] LG Gram Laptop Support LGEX0820:00: LED status: 1442
[  287.396406] LG Gram Laptop Support LGEX0820:00: Received event 130
(268435456)
[  287.401024] LG Gram Laptop Support LGEX0820:00: LED status: 1444
[  288.373465] LG Gram Laptop Support LGEX0820:00: Received event 130
(268435456)
[  288.379055] LG Gram Laptop Support LGEX0820:00: LED status: 1408
[  289.612409] LG Gram Laptop Support LGEX0820:00: Received event 130
(268435456)
[  289.617677] LG Gram Laptop Support LGEX0820:00: LED status: 1442
[  290.947406] LG Gram Laptop Support LGEX0820:00: Received event 130
(268435456)
[  290.953464] LG Gram Laptop Support LGEX0820:00: LED status: 1444
[  292.272403] LG Gram Laptop Support LGEX0820:00: Received event 130
(268435456)
[  292.276761] LG Gram Laptop Support LGEX0820:00: LED status: 1408
[  294.229342] LG Gram Laptop Support LGEX0820:00: Received event 130
(268435456)
[  294.234591] LG Gram Laptop Support LGEX0820:00: LED status: 1442
[  296.707288] LG Gram Laptop Support LGEX0820:00: Received event 130
(268435456)
[  296.712731] LG Gram Laptop Support LGEX0820:00: LED status: 1444
[  297.680322] LG Gram Laptop Support LGEX0820:00: Received event 130
(268435456)
[  297.685602] LG Gram Laptop Support LGEX0820:00: LED status: 1408
[  299.880236] LG Gram Laptop Support LGEX0820:00: Received event 130
(268435456)
[  299.885493] LG Gram Laptop Support LGEX0820:00: LED status: 1442
[  301.537256] LG Gram Laptop Support LGEX0820:00: Received event 130
(268435456)
[  301.543016] LG Gram Laptop Support LGEX0820:00: LED status: 1444
[  302.174996] kauditd_printk_skb: 11 callbacks suppressed
[  302.174999] audit: type=3D1400 audit(1781336673.678:385): apparmor=3D"AU=
DIT"
operation=3D"userns_create" class=3D"namespace" info=3D"Userns create - tra=
nsitioning
profile" profile=3D"unconfined" pid=3D9982 comm=3D"(ubuntu-insigh)"
requested=3D"userns_create" target=3D"unprivileged_userns"
execpath=3D"/usr/lib/systemd/systemd-executor"
[  302.175500] audit: type=3D1400 audit(1781336673.678:386): apparmor=3D"DE=
NIED"
operation=3D"capable" class=3D"cap" profile=3D"unprivileged_userns" pid=3D9=
982
comm=3D"(ubuntu-insigh)" capability=3D21  capname=3D"sys_admin"
[  302.208756] audit: type=3D1400 audit(1781336673.712:387): apparmor=3D"DE=
NIED"
operation=3D"getattr" class=3D"file" info=3D"Failed name lookup - disconnec=
ted path"
error=3D-13 profile=3D"unprivileged_userns" name=3D"" pid=3D9989 comm=3D"sy=
stemd-detect-"
requested_mask=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D0
[  302.649150] LG Gram Laptop Support LGEX0820:00: Received event 130
(268435456)
[  302.655875] LG Gram Laptop Support LGEX0820:00: LED status: 1408
[  320.042802] LG Gram Laptop Support LGEX0820:00: Received event 130
(268435456)
[  320.048202] LG Gram Laptop Support LGEX0820:00: LED status: 1442
[  320.837776] LG Gram Laptop Support LGEX0820:00: Received event 130
(268435456)
[  320.842977] LG Gram Laptop Support LGEX0820:00: LED status: 1444
[  322.041760] LG Gram Laptop Support LGEX0820:00: Received event 130
(268435456)
[  322.047132] LG Gram Laptop Support LGEX0820:00: LED status: 1408
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
