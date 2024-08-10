Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2DA22083
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Aug 2024 20:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723321991; cv=none; b=LHBf2WxtEW9opmVcNhsWJTxcCXCCLG8MtQoaOfwdkgr1gEjTUzikFThepDTeN38O5K8w+YHHynh7j8NNALgK5Jwt48tGyAgtET+9azzBdPYOFQ6uEEm7DpbjX+R0vzEPC5PyxbXxKKdZVTsXR8iCA2naoGxKQpk++eDMxza0DWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723321991; c=relaxed/simple;
	bh=FWW8CpWVuRDAR0VKb9rer+nqcQ0z7CH6PWzB+Akbgwc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lvAwzc3JNSh47TMX/6ll0rFtCWbmX3g51D08iy6/IMRKi9wVisDEPBvq+e4afjnk4qHZC6jEuqQmN2ZdrP+LrrE9Oft9KkM0v2vGcaRqkCJ6BEkVnB04zl8wtFnzeGexP4+L52BJstN2Q3QM8lRGWEZKeMca+ezkYkmr8sV4Mh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4Orv83+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4Orv83+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0439AC32781
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Aug 2024 20:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723321991;
	bh=FWW8CpWVuRDAR0VKb9rer+nqcQ0z7CH6PWzB+Akbgwc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=U4Orv83+8yFAYL2iPvtGlR1xKURELqF0+USHbt2KRca7eb6O7h5SulC5smPiP6Pxy
	 EacXiLiTXtcZYKYqrXymcXOWExEnb/bX8gehgjE9bnI/Cp42gYimcJq8wV9uBhuDm6
	 p3BaQPiBLeCQmfSrnwtPlWMNDFK6TDDluvPdiEkbfJ5kw0kR3sDN2pbY1xDs7E6aHj
	 T02RpqFsTEONGJA3gjg3CjxU1XjQD6wmN9Hkq6CaIG0yYRwNCI7ASBacJI78lnT39e
	 Y1NXb150RPbIIuMmXJv1G9YUZYw8mwW3bFX4Xjrmva/bAKLfOnMiMIFhBjTVa3yEG0
	 Tmpg+r78mzLzg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F2259C53B50; Sat, 10 Aug 2024 20:33:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date: Sat, 10 Aug 2024 20:33:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pauk.denis@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-oKDBtjaWS3@https.bugzilla.kernel.org/>
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

--- Comment #338 from Denis Pauk (pauk.denis@gmail.com) ---
(In reply to Attila from comment #336)
> Hello,
>=20
> I've this board :=20
>=20
> # grep -e ''  -n /sys/class/dmi/id/board_{name,vendor}
> /sys/class/dmi/id/board_name:1:G15CF
> /sys/class/dmi/id/board_vendor:1:ASUSTeK COMPUTER INC.
>=20
> # dmidecode -t baseboard
> Base Board Information
>       Manufacturer: ASUSTeK COMPUTER INC.
>       Product Name: G15CF
>=20
> Can you please add my board to the supported motherboard list?
>=20
> BTW, I added "acpi_enforce_resources=3Dlax" to GRUB_CMDLINE_LINUX and aft=
er
> modprobe nct6775 I can see a new section in the output of sensors command
> with the following details:
> nct6798-isa-0290
> Adapter: ISA adapter
>=20
> output of dmesg:
> [ 3469.171468] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
> [ 3469.171488] ACPI Warning: SystemIO range
> 0x0000000000000295-0x0000000000000296 conflicts with OpRegion
> 0x0000000000000290-0x0000000000000299 (\RMTW.SHWM) (20230628/utaddress-20=
4)
> [ 3469.171504] ACPI Warning: SystemIO range
> 0x0000000000000295-0x0000000000000296 conflicts with OpRegion
> 0x0000000000000290-0x0000000000000299 (\HWM) (20230628/utaddress-204)
> [ 3469.171513] ACPI: OSL: Resource conflict; ACPI support missing from
> driver?
> [ 3469.171515] ACPI: OSL: Resource conflict: System may be unstable or
> behave erratically
>=20
> Thanks!

Could you please attach dump of bios by `acpidump -b -n DSDT`?=20

Or could please also try to build a kernel with add your board to
asus_msi_boards list in
https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/tr=
ee/drivers/hwmon/nct6775-platform.c?h=3Dhwmon-next#n1264
if its possible?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
