Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E641D89E5
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Oct 2024 09:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729849422; cv=none; b=PS2TTzGJCqp5VmH1kTnNNtBtmOA6B3n4y0ZBjHqJkI32q1DpxD3ydYvmgVGYwjdwnnVaQ51TAxUg2aNJjsqh54yiDDwGimN1TinUFDq+NXiP+ugKbiBWZsB6o6T3Sn8mjaX1GSfAHd6oj0r+gteJvEen0vVc8IlI4epmDwlefJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729849422; c=relaxed/simple;
	bh=nagfTAJuB5FFBRM1pUr2qBoOY9wBbsEoUvYUa0iMTN8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O8tnggvaw+oRafQgjJDV5ebMTMEQ7vj1km0sKSCgI74fK7lkHpCt9p+HQZ8vxELUgWuFh205B5qp31axhQrYFoYOXeFmG67Q5ysoHmNEi6CIotF6f0lRlfLsaKDTLqUUBjabjglZgpQrO2t+SgjDyT2Yw9wGbZUoObGpLLPk70M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=flh05RwY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="flh05RwY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21117C4CECC
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Oct 2024 09:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729849422;
	bh=nagfTAJuB5FFBRM1pUr2qBoOY9wBbsEoUvYUa0iMTN8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=flh05RwYhvsH6Zkz0359eoe97sBRxQVcAlXTbwpkVKfQeBn3Vv59vWgAKafctYD2e
	 Sf0jRMAjcehIxn2HHC8NUMiTHhavISDXk3soDzrLz4+eOcx7KilsGseptJn8P61eV2
	 zsNzhvoB9I6U4Actef2I2/m17ESqeDefR38xXe/lz5bNG7b/ayj0U/Thx1QbcGBI9I
	 R/ebTEnQnRvHd30wMgMFf5j9x/grRyfvZqkNEYaJ4ufA9JXaxkU9Yb4pvWaGeyPNlx
	 tqNmAvY/gnuxSSVAVR5w+couTkmRwSVEtAkN7mVJO4781HCWTEStUzCp9aaVNQ85KC
	 s0MiVBRJgAKuA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 18A34C53BC4; Fri, 25 Oct 2024 09:43:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date: Fri, 25 Oct 2024 09:43:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aaron@planetab.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-204807-215701-Fow5XAqe3A@https.bugzilla.kernel.org/>
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

Aaron (aaron@planetab.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |aaron@planetab.com

--- Comment #341 from Aaron (aaron@planetab.com) ---
Created attachment 307070
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307070&action=3Dedit
ASUS Maximus VIII GENE DSDT.DAT

Hi,

Please add. My board is:

# grep -e ''  -n /sys/class/dmi/id/board_{name,vendor}
/sys/class/dmi/id/board_name:1:MAXIMUS VIII GENE
/sys/class/dmi/id/board_vendor:1:ASUSTeK COMPUTER INC.

# dmidecode -t baseboard
# dmidecode 3.3
Getting SMBIOS data from sysfs.
SMBIOS 3.0.0 present.

Handle 0x0002, DMI type 2, 15 bytes
Base Board Information
        Manufacturer: ASUSTeK COMPUTER INC.
        Product Name: MAXIMUS VIII GENE
        Version: Rev 1.xx

# dmesg | grep nct6775
[    5.001289] nct6775: Found NCT6793D or compatible chip at 0x2e:0x290



Thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
