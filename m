Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72975C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 30 Sep 2022 15:50:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbiI3PuL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 30 Sep 2022 11:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbiI3PuK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 30 Sep 2022 11:50:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 107AB5F7C1
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Sep 2022 08:50:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A1441622A9
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Sep 2022 15:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1254EC433C1
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Sep 2022 15:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664553007;
        bh=KuL3B7fTAWICQ+3Po2ti5dIhNc5VkFFJ8aC+5mJK6b4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=utnm+RRfMXYpvg19X19daAOukRKO4+ohWDoqteU9VeXzeS2PJvmYrcC1iGd0P9Y4A
         x8iTZzIRdrdqXZlH+LroRXZS3ZwTBR9DvitKqu8rbBtaY0lvUWpOrNH5XOf738FXV2
         uh6+itfxoKWFJtsZqPkl0wxCoJiBYSB0W5Uzeee+QTZbw0aF1aKM+LbjUMhb9okwBc
         CBkaL7ifYAJYP9olEnvn0JZM3UdlOU9jJ6demCIvwp3PPPY007c/fesaIqR4sCcH2O
         JFAKncr9yZ96egHD6LZuIIBYCgmwIHb6HJ4H1oLtf6V0P4EHumgo4Ovz8hgeP6NmVv
         9Ifx+lR2tRfFQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E68C4C433E4; Fri, 30 Sep 2022 15:50:06 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date:   Fri, 30 Sep 2022 15:50:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DOCUMENTED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216516-215701-y5NoK7P41v@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216516-215701@https.bugzilla.kernel.org/>
References: <bug-216516-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216516

--- Comment #32 from kolAflash (kolAflash@kolahilft.de) ---
Created attachment 301909
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301909&action=3Dedit
HP EliteBook 845 G8: dmidecode and lshw

(In reply to Mario Limonciello (AMD) from comment #31)
> > Can the power consumption in s2idle be lowered further?
>=20
> Once the amd-pmc driver is reporting nearly the whole sleep in the deepest
> state, I don't know anything else that can be done from the Linux side.
>=20
> External things to Linux that come to mind:
> - Anything USB plugged in over the sleep can stay powered and sip some
> battery.  Unplug these.  A good example here is a wireless USB dongle for=
 a
> mouse or keyboard.
> - Do you use any manageability features like AIM-T?  These can keep some
> parts of the SOC doing things.  If so; you can try to disable those.

No external devices connected.


I'm currently *experimenting* with additional stuff.

This kernel command line options: pcie_aspm=3Dforce iommu=3Dpt
(looks like iommu=3Dpt may already be the default, but I guess adding it sh=
ould
have no disadvantage)

And also setting sysfs options before entering s2idle.
  powersupersave > /sys/module/pcie_aspm/parameters/policy
  find /sys/devices/ -type f -name wakeup -exec bash -c 'echo disabled > "{=
}"'
\;




> > Is ec_no_wakeup=3DY the best solution? If yes, maybe add a quirk to the
> kernel.
>=20
> If this is to be quirked by the kernel by default then it needs to be tied
> to this BIOS version, as hopefully this will be fixed in a future HP BIOS.

I guess you'll need dmidecode or lshw for that. So I attached it.


Here you can see which BIOS versions contain which AMD SMU Firmware version.
https://support.hp.com/us-en/drivers/selfservice/swdetails/hp-elitebook-845=
-g8-notebook-pc/38492638/model/2100000127/swItemId/ob-294554-1?sku=3D5Z621EA
BIOS:
  01.10.00 Rev.A
  01.09.10 Rev.A
  01.09.00 Rev.A
SMU Firmware: 64.61.0

BIOS:
  01.08.20 Rev.A
  01.08.03 Rev.A
SMU Firmware: 64.60.0

BIOS:
  01.07.01 Rev.A
SMU Firmware: 64.48.0

Do you have internal information if all these SMU Firmware versions are
affected by the bug? If yes, I'd say the quirk can be enabled for all of th=
em.=20


I'm wondering if there could be a way to dynamically detect broken EC GPE's.
And such an GPE apears, automatically set
  /sys/module/acpi/parameters/ec_no_wakeup =3D Y
Not for myself, but for other users affected by this bug.

Because it seems that not just the EliteBook 845 G8 is affected by this. (s=
ee
above for the ThinkPad Carbon X1 6th)
So an automatic detection may spare a lot of future work.


I already thought about doing this in userspace.
Systemd service:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[Unit]
After=3Dsuspend.target hybrid-sleep.target suspend-then-hibernate.target
[Install]
WantedBy=3Dsuspend.target hybrid-sleep.target suspend-then-hibernate.target
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
And the service could call a script, which checks if there are two IRQs in =
the
dmesg like this:
  [   90.048438] PM: Triggering wakeup from IRQ 9
  [   90.048801] PM: Triggering wakeup from IRQ 1
And if yes, ec_no_wakeup=3DY is being set. Or at least there's a message te=
lling
the user to enable ec_no_wakeup=3DY.
If this would be in the kernel, that message could appear in dmesg.

But I'd guess a general detection wouldn't be that simple!?...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
