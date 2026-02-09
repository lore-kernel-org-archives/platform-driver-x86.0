Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1414B372B54
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 12:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770639102; cv=none; b=PuZFSE9CepfCwd9mqa/ibl3xTt0ayvDp/WpmlpQRuV7aSEc9qeXMqcWPNsVJL3A0Lr09n5Ox7bJTaW4pWGE6uXo7rA+FrPvyP632nt/jLdD2bdQSZ+KDLOSAUPK4PdLVPuix2aTrKsDqGmlzCMlzCWV4qvGJ0Z5vdYXrgF5swD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770639102; c=relaxed/simple;
	bh=mOTAlnY51xH24u/FmduhnsWOW8C5vtePCFptrCtNQp0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OnFD95dGLqOPYXEAvW6caevbP1boF/7/f/a9WrJ9Lj4Au3Q5ePslznXNx5lbhZtI1DNkFYJtNR43BwytRt+hGSrR4Kc33cvg+dD/L1heT/SoRjwz8wpSJH1RHDVnzyLLc/MSJgumoPQaDROxNKBOcuqpkNbLy4y82dPis9GGo8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IY2oAO8e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IY2oAO8e"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC0B9C16AAE
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 12:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770639101;
	bh=mOTAlnY51xH24u/FmduhnsWOW8C5vtePCFptrCtNQp0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IY2oAO8ebRJ8jrm95U7SgIA/M/gWWFp7uo8q6s7cUUeS5JSiNWdMrQyMISX3YMWS2
	 olbXlxuqdItgLUQvJsCje6thOSGEKRL+QeBFQwm9nqU2ddNSV2pjmJnuARmqfCGKBW
	 hBOFO8JVQ+wpLMoM1+v+KDBkyyeaBNi3Szr7rj7Ri9U8zClOUuMI0aFzoC0tqpfX1/
	 oLJyn4IE18LJizVEaQAb7ibMLUjf4UMhTUb9W+Rit8tTdmLNFv6tdgv/Sg+ohMtOQX
	 32xgY7gXgrxiWKOPEikG/XUh2CV7Ux1og80QlmO8Uj48/+RJ6xYVaCudHVeQ7eAGbX
	 PKNismnA44F8A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9FF6DC433E1; Mon,  9 Feb 2026 12:11:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Mon, 09 Feb 2026 12:11:41 +0000
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
Message-ID: <bug-221065-215701-IZAIDk7UQn@https.bugzilla.kernel.org/>
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

--- Comment #2 from Rong Zhang (i@rong.moe) ---
Hi Raphael,

On Mon, 2026-02-09 at 07:50 +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221065
>=20
>             Bug ID: 221065
>            Summary: ideapad_acpi: unexpected charge_types spam on Yoga Pro
>                     7 14ASP9
>            Product: Drivers
>            Version: 2.5
>           Hardware: AMD
>                 OS: Linux
>             Status: NEW
>           Severity: low
>           Priority: P3
>          Component: Platform_x86
>           Assignee: drivers_platform_x86@kernel-bugs.osdl.org
>           Reporter: rbitton@linux.com
>         Regression: No
>=20
> Hi,
>=20
> I'm experiencing constant dmesg spam from ideapad_acpi on my Lenovo Yoga =
Pro
> 7
> 14ASP9:
>=20
> [  733.997072] ideapad_acpi VPC2004:00: unexpected charge_types: both [Fa=
st]
> and [Long_Life] are enabled

Please attach the full dmesg log along with the acpidump of your
device.

This error log is intended to remind users to write either Fast or
Long_Life to charge_types to break the dilemma. Could you check
/sys/kernel/debug/ideapad/status before and after writing into
charge_types?

> This started on 6.19.0 on both my distro's mainline kernel and the vanilla
> mainline kernel I compiled. The issue is not present in 6.18. It happens
> about
> every minute starting about a minute after boot regardless of if I'm char=
ging
> or not.

In your case there was a userspace process reading charge_types every
minute and triggering the error log.

What process was it? Could you check with

   sudo perf --no-pager ftrace -T ideapad_psy_ext_get_prop

to see its pid and find out what it is?

> Model: Lenovo Yoga Pro 7 14ASP9 (83HN)
> CPU: AMD Ryzen AI 9 365
> BIOS: PSCN17WW (up to date)
>=20
> The laptop appears to be reporting both Fast and Long_Life charge modes
> simultaneously, which the driver considers unexpected. Functionally
> everything
> works fine, including fast charging, but the log spam is excessive.

Did it stop charging at 60%/80%? That's what I got (i.e., both fast
charging and charge threshold) when I manually put my device into such
a state.

> Of note:
> zsh rbitton@rbitton-linux3 01:46 /sys/class/power_supply/BAT0 > cat
> /sys/class/power_supply/BAT*/charge_types=20=20=20=20
> [Fast] Standard Long_Life

Wait, I don't understand how this could happen. Reading charge_types
should have failed with -EINVAL when it ran into the error path. In
other words, you have already got out of the dilemma when reading
charge_types returns successfully. So at least it temporarily recovered
to an expected state when you read charge_types, but was somehow broken
by other things afterward...

Could you check `sudo lsmod | grep acpi_call'? Did you ever set up
anything abusing acpi_call?

> All attempts to fix it on my end have failed.Let me know if you need any
> additional information; I would be more than willing to test any fixes.

Could you try booting into a livecd (or a fresh installation) of your
distro with 6.19 kernel and monitoring any upcoming kmsg with `sudo
dmesg -w', then:

1. read charge_types
2. write Fast into charge_types
   a. read charge_types
   b. unplug and replug AC power
   c. read charge_types
   d. wait several minutes
   e. read charge_types
3. write Standard into charge_types
   repeat a-e
4. write Long_Life into charge_types
   repeat a-e

And attach your observation in reply.

If the issue persist in fresh installation/livecd, the firmware on your
device may have its own thoughts (?!) and messes up charge modes on its
own.

Thanks,
Rong

> Thanks,
> Raphael Bitton

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
