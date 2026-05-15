Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7959A372B3C
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 19:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778875122; cv=none; b=XHMihFnMxwU3rsY0LZFqG2GVakJ2Uz/w3d8DYySt3Q76l+gWOTitdvjVjWBzPHGhbao7mMivHb60p05l4famhWEzde0B0pMbr8VARmAfhqyFUTPjQZNbutdsuGOhtqRXHxROUVwqng5KmsF1a2/Whf+tFpIS+bm0AytDHnyb5Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778875122; c=relaxed/simple;
	bh=apAe6iG5Hq/+RhhgaCx3tysh1f60SBdFXTgLkWtdDGE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dLq5IKedjj6BvawWKN4MEAVVkHvhJxrvVJl2dBsX8t9CQ2ZQkTML7sua79K3Naszr4jyen3M9OM0IyyLN+4OSOq0SwQI215PPvCUiWddP39nfrmHNB4seqV5d45xPUbTygGrPwP7mcjhEshxYRyP5X7XHo3fchlWZaWROjOTeV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i7kRyRwT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i7kRyRwT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BCCDC2BCF5
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 19:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778875122;
	bh=apAe6iG5Hq/+RhhgaCx3tysh1f60SBdFXTgLkWtdDGE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=i7kRyRwTEjtjZw/thVOM+oYArJDHNQRTEUj3DXB99zImI4gAcO0CO6+Q8pWDpgRdR
	 MDUgicDN8whBbMJhwL8Z3g0iDrgW5mSIq+rWyZXhVc/K2FP5rP2iFhhtn0QrZP6qm+
	 KFdt7O7rnjdmppA8l9LzUVvvrIy1BgU53LokLkPPggx8urxkopaxJLRrRedFtJGuQY
	 EQ+fWjhBas8L4Lc5FTx3diPw1NXlxD/iZpBYUpYr+pob0+Z9SaSGnVuIMlvad5VW5P
	 VxU4f8/H+VPh6/UcxvV753fjnxpuKleaRI/h2j9/pkJKyRFdQU86eQp4JQKkqxKfde
	 IkeU9/CFrqrqA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 02A0BC41612; Fri, 15 May 2026 19:58:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Fri, 15 May 2026 19:58:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-h6nJMI5qIA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #77 from Rong Zhang (i@rong.moe) ---
(In reply to Rick from comment #76)
> (In reply to jeffrey from comment #74)
>=20
> I completely blacklisted Ideapad_laptop on my system (using Mint Kernel
> 6.17.0-23-generic) and this seems to have completely solved the 1 second
> pauses every 7 minutes for me.

Hmm, interesting. I assume the pauses had existed before I introduced the
warning message (unexpected charge_types...), right?

This sounds like a slow SMI handling due to the broken firmware.

Could you kindly provide more detailed information about the pause? When it
happened, did you notice a spike in CPU usage? Did you see any dmesg messag=
e at
that time? Did it freeze your system completely or just make things laggy?

Could you also monitor the SMI count, i.e.,

  sudo perf stat -e ls_smi_rx -I 1000

..., wait for the pause to occur, and check how many SMIs have occurred dur=
ing
the pause?

You can also mess around with sysfs attributes of ideapad-laptop, power_sup=
ply,
and firmware-attributes to see if reading them causes SMIs:

  sudo tail /sys/bus/acpi/devices/VPC2004\:00/physical_node/*
  sudo tail /sys/class/power_supply/*/*
  sudo tail /sys/class/firmware-attributes/*/attributes/*/*

On my device, reading /sys/class/firmware-attributes/thinklmi/attributes/*/*
always causes 580 SMIs, and other attributes do not cause any SMI.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
