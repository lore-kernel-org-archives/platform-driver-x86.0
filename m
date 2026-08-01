Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37D835957
	for <platform-driver-x86@vger.kernel.org>; Sat,  1 Aug 2026 04:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785557160; cv=none; b=MpxHGN6SWgFYHEHhA/FtPL4MceH0Au0rvDqbj3HV8lz2Fazqpq+uLGwL0n8tssspBWUvZGKR0tHoNTW3p82rsPNllx2Wu1xMNQg4bZWxh7BEaf+IG1ufzbBy6ifnEH1P7MEaE0aZV+qVhdptsDSEkiBB8MXuPuKEJNpCbyZBMS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785557160; c=relaxed/simple;
	bh=bo5GxqG2GmxLlb8qPYpkl1OXHJ+w7RPZKxQKT8FOF+E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n4X6L1IZ116EeAEJ/gIONVswMaeMoudiuzt4tZZ6pKfsUUL4TkL8xjA4nZaznJ/uElv8YbCRBSGj9d1Pf1jeeKKylb3ktg71WN0UkWt4qN50eBRZy26FVGfygJHVGx0Cl0OK6QC2lv4qeHPxX1w4U/fc1cbk5CK7dl1dFrkR2XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+yXB9YY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+yXB9YY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B378C2BCF6
	for <platform-driver-x86@vger.kernel.org>; Sat,  1 Aug 2026 04:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785557160;
	bh=bo5GxqG2GmxLlb8qPYpkl1OXHJ+w7RPZKxQKT8FOF+E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=l+yXB9YY/2Tq0pRHglvTsYLhD8PSz86POAEYYGsWwbfezNQGl/AfbUrmh22ZZWF0n
	 cJmLFX6h8KCqc4uk0O3eyuNJUFxsGep1KJldMni1d53A6SrS0HAd+DTbA9WJaPfHU0
	 xSGqQdrCZSo7MYSWUchtn5DhyvdCWwoEwB3h0TTvm/mjLI3nlEJmVojJquTYus5jB0
	 ZOMe+EeqnstS4CZv78k2eCA8C3/Wo4smfvUWTpkDTHvLLDfe80xEGzljvhhYvFiG42
	 e+vHDDd7HiIQznSf89vmvDqu/KlEb8EEbgo3L5APkR5SD60MxZxtL3dLDq0UL6WI9l
	 /frdx+lmfhTBQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 43C2BC433E1; Sat,  1 Aug 2026 04:06:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221789] [BUG] Prestige 16 Flip AI+ C3MTG Panther Lake - Tablet
 Mode Switch SW_TABLET_MODE) Not Detected
Date: Sat, 01 Aug 2026 04:06:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: workspace0001@outlook.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: TAINTED_KERNEL
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-221789-215701-QTI0wpuujY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221789-215701@https.bugzilla.kernel.org/>
References: <bug-221789-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221789

work (workspace0001@outlook.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |TAINTED_KERNEL

--- Comment #1 from work (workspace0001@outlook.com) ---
the issue is resolved it was the ISH server bundled with fedora that had is=
sues
so I downloaded and replaced it. Bellow are the steps i used to resolve the
issue



# 1. Navigate to the 2622 firmware directory
cd
ISH/ISH_Kit_5.8.1.7779v2_14T2_2622/Drivers/Win10/IshHeci/2622/x64/FWImage/0=
004/

# 2. Compress the file into the XZ format required by Fedora
xz --check=3Dcrc32 -c ishS_SI_5.8.1.7779.bin > ish_ptl.bin.xz  #must use th=
is
flag for kernel to recognise

# 3. Back up the default, non-working stock file
sudo mv /usr/lib/firmware/intel/ish/ish_ptl.bin.xz
/usr/lib/firmware/intel/ish/ish_ptl.bin.xz.bak

# 4. Copy the new firmware to the system directory and fix permissions
sudo cp ish_ptl.bin.xz /usr/lib/firmware/intel/ish/
sudo chmod 644 /usr/lib/firmware/intel/ish/ish_ptl.bin.xz

# 5. Tell the Intel HID driver to listen to the 360-degree folding state
echo "options intel_hid enable_sw_tablet_mode=3D1" | sudo tee
/etc/modprobe.d/intel-hid-tablet.conf

# 6. Rebuild the system's boot image cache and restart
sudo dracut --force
sudo reboot

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
