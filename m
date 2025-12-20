Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8FD23E35F
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Dec 2025 12:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766232215; cv=none; b=X//NwA8YHq8jwYS/3FcSPfvKwXFhT6sDcqjhPclFbvcELRiC4TP9w5+gbwgJvToJWTstmOwNwnx44dPgUoeyEU9BoykfxIhjNVX6E4GVpg7f/sIaGuMr5vwz8TnDMK6Cluo6UwkXrop1tZjWGlgtFXaJuAwt9M0HRtzrzvHlsCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766232215; c=relaxed/simple;
	bh=3tS4Qtxu3E81CpvFNUTo4OsZHQ3ZdRgJypAQnbfKVKY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EfuZcYIO7MPM1FHd37iVnhzxp146v5DKEsSgqJQkx20jY+VJRnZtpPDwUmfBr1TNWwbT8PZwCSK71Kx3v3HVSnaKfWDm1MxoVMBpvNgpfSc0XcrK7yK4Cc1z/s1NsbItIpSPWOEsHTM0D6x043w/EJnMoSYP6E53Ja07tGeJlfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LjQSjD5n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LjQSjD5n"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A66DAC116D0
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Dec 2025 12:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766232214;
	bh=3tS4Qtxu3E81CpvFNUTo4OsZHQ3ZdRgJypAQnbfKVKY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LjQSjD5ng8+HIw5ABu2DJJ0EN3zfW/iek8LHn4E878IR4gP+pFtlOW6sHb3+K8GVV
	 sqWMM5Lspn97VhioMHME/bUWca6/AAc/ZfCb5frZtCh22Bx7/TDsGZpv5Ih57iSCbY
	 4tcPvwZG0y5doyQrqLnnRd/IZUkWgz1SVrOJDhmD92MigJz9jIID6vYaE6PVlO/bmx
	 6RZMn4mOCatZPPufahEVNSWMcgY7LwtT29nMjxQILFM6y4CeA1srA9W45o12PHC/Jb
	 fCKapauRKrZzOMrcVLaNepu5ehQpyFJCMB83nRn8yCetHIjW/w9+n+LeoQQnfyocqC
	 AwN+lynUHXAig==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8DBDAC3279F; Sat, 20 Dec 2025 12:03:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220882] mfd_aaeon incorrectly binds on ASUS TUF Gaming A16
 (FA608UM), preventing asus_nb_wmi
Date: Sat, 20 Dec 2025 12:03:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220882-215701-zPJGn2G68i@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220882-215701@https.bugzilla.kernel.org/>
References: <bug-220882-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220882

Armin Wolf (W_Armin@gmx.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |W_Armin@gmx.de

--- Comment #1 from Armin Wolf (W_Armin@gmx.de) ---
AFAIK the mfd_aaeon kernel module is out-of-tree, meaning that you have to =
talk
to your distribution regarding this issue.

Maybe you can also tell them that there exists a upstream driver called
upboard-fpga that should handle the pinctrl and LEDs, and that the other
features should be implemented inside the asus_wmi driver itself.

Thanks,
Armin Wolf

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
