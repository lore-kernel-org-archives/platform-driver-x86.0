Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A18614A624
	for <platform-driver-x86@vger.kernel.org>; Sun, 11 Aug 2024 16:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723392633; cv=none; b=cvBDJ3Apd3i7uMHyCJmSAPlTnMLSqCcN5+i0NRTVRhtwolwhEoYo9BVwa1WzWhiMoY83wupu9iRAJNWL1oZeI4+ZmBIyEhdmqkTjgbhPblDnk5VZ8RXXlU8d76G+0VHizFA/DwHH74AWxPkM0rTCbO+0crJw2RotS9JVcs1BJL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723392633; c=relaxed/simple;
	bh=UIO5zqMsuGLqoxc0ygLrubdmUc+qhhzM5tt12+ZyRoA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gB6KQVp0hGSUUHmSlxEWsDwqymVKzcmLJRwzed1whmlsGtvgOoditcQhfztma86jaPKPyRdBLzQxFzKFsIIEp8tkpPGVhVqly3kDOUM6yaPs2StscBAqeigODI/rXmrORx26RpJQATRpXyVLzSA8ZZHb/JVYj4AyvEs36XE/Cbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W0fYu5di; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W0fYu5di"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23D68C4AF0E
	for <platform-driver-x86@vger.kernel.org>; Sun, 11 Aug 2024 16:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723392633;
	bh=UIO5zqMsuGLqoxc0ygLrubdmUc+qhhzM5tt12+ZyRoA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=W0fYu5diAhcsw03VSQFAQ4ebmi2TQMJ7SY9NDB83f7bDXicp7o+tI36B7RTw2XtFN
	 HZcucd9U3bNpC9PNLvrV3Oq7jGw6oZoMDABmmQIYlu5l+hX96wlyR9/dqsEe6xdXSq
	 S+m6WdAjhK2IXMUvc7GTSEsW+HtfXRxWA+b36cSaF1/tPLT5/UqP/evgb66XeJSHEj
	 3wuO6o4HdSN39//aWA9/lFjNoydRlA5tR8tT6X6u2ZxD2mGXdFROQ7q2P4vw3FzeBe
	 zen9vlA/MWBTQFSETESGtFvslXuFbkIf3Q+2a+fQgbF3GDdrzmT+aoo67Pjz3OwJv9
	 oyOE0Xgg9BJUQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1E0A0C53BA7; Sun, 11 Aug 2024 16:10:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date: Sun, 11 Aug 2024 16:10:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: attila@fulop.one
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-7k66obhUl3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #340 from Attila (attila@fulop.one) ---
(In reply to Denis Pauk from comment #338)
> (In reply to Attila from comment #336)
> > Hello,
> >=20
> > I've this board :=20
> >=20
> > # grep -e ''  -n /sys/class/dmi/id/board_{name,vendor}
> > /sys/class/dmi/id/board_name:1:G15CF
> > /sys/class/dmi/id/board_vendor:1:ASUSTeK COMPUTER INC.
> >=20
> > # dmidecode -t baseboard
> > Base Board Information
> >       Manufacturer: ASUSTeK COMPUTER INC.
> >       Product Name: G15CF
> >=20
> > Can you please add my board to the supported motherboard list?
> >=20
> > BTW, I added "acpi_enforce_resources=3Dlax" to GRUB_CMDLINE_LINUX and a=
fter
> > modprobe nct6775 I can see a new section in the output of sensors comma=
nd
> > with the following details:
> > nct6798-isa-0290
> > Adapter: ISA adapter
> >=20
> > output of dmesg:
> > [ 3469.171468] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
> > [ 3469.171488] ACPI Warning: SystemIO range
> > 0x0000000000000295-0x0000000000000296 conflicts with OpRegion
> > 0x0000000000000290-0x0000000000000299 (\RMTW.SHWM) (20230628/utaddress-=
204)
> > [ 3469.171504] ACPI Warning: SystemIO range
> > 0x0000000000000295-0x0000000000000296 conflicts with OpRegion
> > 0x0000000000000290-0x0000000000000299 (\HWM) (20230628/utaddress-204)
> > [ 3469.171513] ACPI: OSL: Resource conflict; ACPI support missing from
> > driver?
> > [ 3469.171515] ACPI: OSL: Resource conflict: System may be unstable or
> > behave erratically
> >=20
> > Thanks!
>=20
> Could you please attach dump of bios by `acpidump -b -n DSDT`?=20
>=20
> Or could please also try to build a kernel with add your board to
> asus_msi_boards list in
> https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/
> tree/drivers/hwmon/nct6775-platform.c?h=3Dhwmon-next#n1264 if its possibl=
e?

Hello,

I've attached the dump file.

- I've also managed to build and install the kernel with the suggested chan=
ge.=20
- So, I added     "G15CF",      to line number 1272 and built the kernel.=20
- After installation of packages, I removed the "acpi_enforce_resources=3Dl=
ax"
from GRUB_CMDLINE_LINUX (in /etc/default/grub), ran "update-grub" command a=
nd
rebooted without secure boot.
- The module was not loaded automatically, but I could load it with modprob=
e.
- The output of dmesg is: "[   37.371639] nct6775: Found NCT6798D or compat=
ible
chip at 0x2e:0x290", there is no any warning.
- The output of sensor command contains the "nct6798-isa-0290" section.

Should I do any other test or is it fine?

Thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
