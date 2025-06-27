Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57459EAD0
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jun 2025 05:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751001063; cv=none; b=dH8IgC82lFe5rNt8sdir0fDrnskrrb1CNmhYqf2AU/A//ObZjPEv6g8ZwhEsyiBpixBZLlv3dMBFpMMMmU1zc32OBnXm4ftrq5J5uW7l9mfVcCHDEJloosLKAfUN+G+zwRUhzFIDVDNr/XFH51pnb1MYvpMh7LrJgwh8/o4lcnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751001063; c=relaxed/simple;
	bh=Fn/ML8rIcjrgZntI8WTdff47Qv2VSSttgr7j9+mv09o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ojx8tclRAoB26EogNZYweO8GOCF5oBFso7qxnx2E/Giim75AU/IVqTsDI+VKa/M6wTmdn6DQ123FNtmf0pHiuHFF5CCEYW6yAfmbSjqCz0tg9FJ334i4889nOBN6lAbsxezr85NlDJA6PdF1PJUOv6OA6ZFVb8WKUJS+lXJ5xkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tUE1ldG5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tUE1ldG5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA557C4AF09
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jun 2025 05:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751001062;
	bh=Fn/ML8rIcjrgZntI8WTdff47Qv2VSSttgr7j9+mv09o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tUE1ldG5WhFTxNCDmOzhV84/9cG6Sc4XTdThX33tC7s81REC57KLqYaGZ8FTbYMDz
	 Sgym16A5n4xC7pNx8+2De1PpE4ouYrNYKFYd6dfUYAAWOP2/s+NdKbsfDOs+mYLOjW
	 qAgz7jVMXimHM6ZYMF7kcXmSJ6V6Ar3KE+U/BOPKU8WE5uT0v7PO7CaR9OUq2bWhUc
	 niWWKya0uQq9b73Z+6ULapmzHOWlMjY9+FKoXjS8SnYZFY8TGPrQhrpXVeka4W7LTl
	 uQRbuhFQMtJMlywJRE9cg/eIAgfvanoUUfvbhJeSWE1hACb9tOOd6ozp0CS7nXiU1O
	 RoCbc0i4H9ICA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D2F06C41612; Fri, 27 Jun 2025 05:11:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date: Fri, 27 Jun 2025 05:10:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: ariel122333444455555666666@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-204807-215701-X5BfZU4njn@https.bugzilla.kernel.org/>
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

Ariel (ariel122333444455555666666@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ariel122333444455555666666@
                   |                            |gmail.com

--- Comment #347 from Ariel (ariel122333444455555666666@gmail.com) ---
Created attachment 308318
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308318&action=3Dedit
acpidump -b -n DSDT for STRIX X99 GAMING motherboard from ASUS

The ASUS ROG STRIX X99 GAMING motherboard has an NCT6791D chip, as shown in
https://rog.asus.com/motherboards/rog-strix/rog-strix-x99-gaming-model/ (see
this photo
https://dlcdnimgs.asus.com/websites/global/products/5QleWlDkArjGYpzg/img/fl=
awless/pic.jpg).
This chip is correctly detected by the nct6775 module, but the motherboard
needs to be added to the module in order for it to work without the
acpi_enforce_resources=3Dlax kernel parameter.

# cat /sys/class/dmi/id/board_name
STRIX X99 GAMING

# dmesg
...
[jue jun 26 21:33:52 2025] nct6775: Found NCT6791D or compatible chip at
0x2e:0x290
[jue jun 26 21:33:52 2025] ACPI Warning: SystemIO range
0x0000000000000295-0x0000000000000296 conflicts with OpRegion
0x0000000000000290-0x0000000000000299 (\_GPE.HWM) (20240322/utaddress-204)
[jue jun 26 21:33:52 2025] ACPI: OSL: Resource conflict; ACPI support missi=
ng
from driver?
[jue jun 26 21:33:52 2025] ACPI: OSL: Resource conflict: System may be unst=
able
or behave erratically



# sensors
nct6791-isa-0290
Adapter: ISA adapter
Vcore:                 888.00 mV (min =3D  +0.00 V, max =3D  +1.74 V)
in1:                     1.01 V  (min =3D  +0.00 V, max =3D  +0.00 V)  ALARM
AVCC:                    3.36 V  (min =3D  +0.00 V, max =3D  +0.00 V)  ALARM
+3.3V:                   3.36 V  (min =3D  +0.00 V, max =3D  +0.00 V)  ALARM
in4:                   1000.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  ALA=
RM
in5:                     2.04 V  (min =3D  +0.00 V, max =3D  +0.00 V)  ALARM
in6:                   376.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  ALARM
3VSB:                    3.42 V  (min =3D  +0.00 V, max =3D  +0.00 V)  ALARM
Vbat:                    3.31 V  (min =3D  +0.00 V, max =3D  +0.00 V)  ALARM
in9:                     1.05 V  (min =3D  +0.00 V, max =3D  +0.00 V)  ALARM
in10:                  624.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  ALARM
in11:                  928.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  ALARM
in12:                  368.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  ALARM
in13:                  368.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  ALARM
in14:                  688.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  ALARM
fan1:                     0 RPM  (min =3D    0 RPM)
fan2:                   479 RPM  (min =3D    0 RPM)
fan3:                     0 RPM  (min =3D    0 RPM)
fan4:                     0 RPM  (min =3D    0 RPM)
fan5:                     0 RPM  (min =3D    0 RPM)
fan6:                  1942 RPM  (min =3D    0 RPM)
SYSTIN:                 +33.0=C2=B0C  (high =3D +77.0=C2=B0C, hyst =3D +74.=
0=C2=B0C)  sensor =3D
thermistor
CPUTIN:                 +43.5=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +75.=
0=C2=B0C)  sensor =3D
thermistor
AUXTIN0:                +73.5=C2=B0C    sensor =3D thermistor
AUXTIN1:                +48.0=C2=B0C    sensor =3D thermistor
AUXTIN2:                +30.0=C2=B0C    sensor =3D thermistor
AUXTIN3:                +43.0=C2=B0C    sensor =3D thermistor
PECI Agent 0:           +39.0=C2=B0C  (high =3D +77.0=C2=B0C, hyst =3D +74.=
0=C2=B0C)
                                 (crit =3D +79.0=C2=B0C)
PCH_CHIP_CPU_MAX_TEMP:   +0.0=C2=B0C=20=20
PCH_CHIP_TEMP:           +0.0=C2=B0C=20=20
PCH_CPU_TEMP:            +0.0=C2=B0C=20=20
PCH_MCH_TEMP:            +0.0=C2=B0C=20=20
PCH_DIM0_TEMP:           +0.0=C2=B0C=20=20
intrusion0:            ALARM
intrusion1:            OK
beep_enable:           disabled

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
