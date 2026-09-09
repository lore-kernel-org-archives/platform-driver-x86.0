Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BEC43E088
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Sep 2026 23:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788995217; cv=none; b=C5fFHFI2B2UzxP5zlwvrD6GhdkB/SwgmGplcDVyxVY6N7Cx3C8rRPplQ+jpb6+4IpbkBDmQRemN5LCwXyWmVOMywIozbLCX7PAxrBqqk1b7lLe+f+nFaMOMfbp6KgQ1V4yVgF00DXYYliur7YGQH+KpUJzfzBfJ+rRTxJVknNpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788995217; c=relaxed/simple;
	bh=79eJRxI5tPmqoEztxr9gplhhMwjPme44MoJqHLTKtIw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bsse4DrKt+IWjUQevfOI69+/+4IimjB01iozZz3LVqhznnztOkveBZpIIi2ZkwJ4UHB2Wjghfh+YhtWL14O5vDRuenJoMM5EsSrUQCxLb2VphS9DJwyeX3EqaAPwQRQcH0t/oD4TXp+Vbj9pi6kkyBmfVO+cl1gOAp/tm1Zd6tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qoBQ0zul; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qoBQ0zul"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE337C2BCF5
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Sep 2026 23:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788995216;
	bh=79eJRxI5tPmqoEztxr9gplhhMwjPme44MoJqHLTKtIw=;
	h=From:To:Subject:Date:From;
	b=qoBQ0zultZmsPEb4TSuUVoaFzZAK0BBEPskt05/sHdRKtJuNRbqLRIJtBXimp03dg
	 0xxEyAHR42cojrtRUDr4CsI82Tu75UZjaXyewxkBgLfqR1iiATpKKEGfYIP5F094hr
	 ZkgULf/+HlhyfrJv5yip071ZYwMtgrW2PdCyJA/SX/B0vXh9fTMs6+YTsOO6XuYKSE
	 Zork5mXqJy80x7te5yvNLjZdNKoMnM0XAV2RWnecHHJBbWa90tGZdMpVQG5T12//aQ
	 Fw1Wdgw3RkpWK1udh8xra2Tb+svsZy55Jhhls7WSs4innynsAzLjHYi8GSQPZhmeaU
	 SfDDqzn1gHaOA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 868A7C3279F; Wed,  9 Sep 2026 23:06:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221993] New: [ideapad-laptop] Missing driver support for
 IDEA2008 / Ambient Light Sensor on Yoga Slim 7 14AKP9
Date: Wed, 09 Sep 2026 23:06:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dadodasyra.pro@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221993-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221993

            Bug ID: 221993
           Summary: [ideapad-laptop] Missing driver support for IDEA2008 /
                    Ambient Light Sensor on Yoga Slim 7 14AKP9
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: dadodasyra.pro@gmail.com
        Regression: No

Created attachment 310826
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310826&action=3Dedit
Decompiled ACPI table

Created attachment: SSDT2.dsl (Decompiled ACPI table)

Hardware: Lenovo Yoga Slim 7 14AKP9 (MT: 83JY)
OS: Fedora (Kernel 7.1.x)

The Ambient Light Sensor (ALS) on this laptop model is currently completely
non-functional on Linux. The sensor is not exposed via standard ACPI (_ALI)
methods, nor is it routed through the AMD Sensor Fusion Hub / amd_pmf. (The
amd-pmf TA session initializes cleanly with the correct firmware, but regis=
ters
no IIO devices).

ACPI dumping reveals the sensor is gated behind proprietary Lenovo ACPI dev=
ices
that currently lack driver bindings in `ideapad-laptop`:

- IDEA2008 (ITSD - Integrated Thermal/Sensor Device): _STA returns 0x0F.
- IDEA2002 (LISD): _STA returns 0x00.

In the attached `SSDT2.dsl`, IDEA2008 defines an interface directly to the
Embedded Controller:

    Device (ITSD)
    {
        Name (_HID, "IDEA2008")=20
        Method (_STA, 0, NotSerialized) { Return (0x0F) }
    }
    // ...
    OperationRegion (ECF2, EmbeddedControl, Zero, 0xFF)
    Field (ECF2, ByteAcc, Lock, Preserve)
    {
        Offset (0x00),=20
        VCMD,   8,=20
        VDAT,   8,=20
        VSTA,   8
    }

Steps to reproduce:
1. Boot Linux on Lenovo Yoga Slim 7 14AKP9.
2. Observe that no ALS appears in /sys/bus/iio/devices/.
3. Check /sys/bus/acpi/devices/IDEA2008:00/status (returns 15).
4. No driver claims the device.

Expected behavior:
`ideapad-laptop` (or a dedicated sensor driver) should bind to IDEA2008,
interface with the EC (VCMD/VDAT), and expose the ambient light readings to=
 the
`iio` subsystem so userspace tools like iio-sensor-proxy can manage automat=
ic
screen brightness.

I don't know much about drivers and new to linux environment on physical
devices. This was mainly AI generated after many back and forth.
I am available to test any patches or probe EC registers if maintainers can
provide instructions.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
