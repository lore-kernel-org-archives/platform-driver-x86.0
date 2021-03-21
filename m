Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A4AC433DB
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 18:40:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAF3361947
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 18:40:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbhCUSkJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Mar 2021 14:40:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:47102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230028AbhCUSjz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Mar 2021 14:39:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5134361952
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Mar 2021 18:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616351995;
        bh=Pfx6RqRZQTFWlL9S+RZp9fYCaXwz+SZ2/Y2lERbMD68=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YI8XaMq/sA9u9abuwPG9beOaP8KVI09+kQ9O+4dOvNOlWtcCI8q2RflxXFnlYNA0y
         W0pa8tPk4hDzjRTXhZukHaUCEidWzx+qC/20IfuKxC44tPdtmcP6ovH+F24drZhUfj
         k5ANkY+GYUjCI6nLezcLZpvSj2WPyshuofZ3p6LSKk1veJdKjRnI7ihHHLTDCa3LJZ
         eMrusjI31F4oArGXMvCSRfrtOI/r1SlkEOsQXqea25uDn2nTyzthVDvrM76wXmFID9
         9RNUAxOjxBfue7x+GTIopNcCO87LBngWWn6ZoeG79c3eBIYnwb69XCr/Z+yg+kx4oS
         XLEiDRm9fO5Yg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 21 Mar 2021 18:39:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: rui.zhang@intel.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-6l6DAbUSFE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #46 from Zhang Rui (rui.zhang@intel.com) ---
(In reply to Artem S. Tashkinov from comment #43)
> A small correction of my previous comment:
>=20
> linux/drivers/platform/x86/asus-nb-wmi.c
>=20
> /*
>  * Asus Notebooks WMI hotkey driver
>  *
>  * Copyright(C) 2010 Corentin Chary <corentin.chary@gmail.com>
>  */
>=20
> This is not related to lm-sensors in any shape or form.

asus_nb_wmi_init -> asus_wmi_register_driver -> asus_wmi_probe -> asus_wmi_=
add
-> asus_wmi_hwmon_init

Although the warning messages are printed by ACPI code, but this is a confl=
ict
between the native nct6775 driver and the Asus wmi driver, because Asus wmi
driver accesses the same piece of resources and provide similar
functionalities. And I'm familiar with neither of them.

> I'm really sad how
> this situation is getting handled: the bug has been known for over 1.5
> years, affects literally hundreds of thousands devices and you're saying
> that this kernel option might have unintended consequences yet _everyone_=
 in
> this thread has enabled it with _zero_ side affects and Windows seemingly
> has it enabled by default, as no such messages are getting logged in Wind=
ows
> Event Log either when using HWiNFO64 or vendor specific monitoring softwa=
re.

In Linux, at least for now, I don't see a way to enable native nct6775 driv=
er
by default, and, this is true for all the native drivers that have resource
conflict with the firmware.

IMO, the rootcause is that Linux does not support override driver A (native
driver in this case) when driver B (driver that talks to firmware) is loade=
d,
so we have to disable driver A even if there is only 0.01% possibility that
driver B will be loaded when we know there might be a conflict.

what we can do is to write driver B to make this statement true
"ACPI: If an ACPI driver is available for this device, you should use it
instead of the native driver" and ignore this message.

(In reply to Artem S. Tashkinov from comment #44)
> (In reply to Artem S. Tashkinov from comment #42)
> > "Your motherboard might not be exposing ACPI resources correctly, so you
> > might
> > not get access to your HW sensors. You could add
> > "acpi_enforce_resources=3Dlax" to kernel boot parameters to enable moni=
toring
> > at your own risk. Please refer to
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D204807 for more informati=
on".
>=20
> This message will at least allow various Linux distros to enable the opti=
on
> by default because many are not aware of the bug.

Hmmm, what about following conditions
1. "acpi_enforce_resources=3D" is a global switch, there might be platforms=
 with
more than one conflict, or with another conflict rather than nct6775. we can
not validate all of them.
2. we may have new drivers that talk with firmware later, and we can not use
"acpi_enforce_resources=3Dlax" then.

But thanks for raising this up, I think this also rings a bell that the cur=
rent
message is kind of misleading.
It is true that ACPI covers a series of devices as described in the ACPI sp=
ec.
But at the same time, ACPI is an interface. Many drivers, including vendor
specific drivers, talks with firmware through the ACPI Interface. They depe=
nds
on ACPI, but they're actually not covered by the ACPI specification, nor by
kernel drivers/acpi code.

"ACPI: If an ACPI driver is available for this device, you should use it
instead of the native driver" makes people feel like it is an ACPI problem,=
 but
in many cases, it is not, I can only triage them.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
