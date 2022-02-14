Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C90E2C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Feb 2022 21:06:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbiBNVHF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Feb 2022 16:07:05 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbiBNVGv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Feb 2022 16:06:51 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 345DB1074CF
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Feb 2022 13:06:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7458AB8164A
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Feb 2022 20:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F70AC340EB
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Feb 2022 20:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644868979;
        bh=lAfhwnZrCbPKuewovRPDPS6F33qACU2kXrifpbEUwAM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=u/tRH1MQNTsHp3FuOWHMnzfGnLIwmlI2mM47lX3UkpD5Mi8bZSc/WB6EvqR+QLZd8
         gKpmZuBc8lTVuv5fKm0z5JsCQ3/kLTaT1G5B+0g0XrdQ3Vq6cj0aWxZraWkwnwN+Xe
         thgf6Up82ckRT3Hlb5AT0PTlYKvqVDc0I92wY2PH02vys2btGLBTJXRB7RDty59u2H
         SN4igxuGWwZBI2tV5EJiiDZPCVgvFzG661a+gGAFtY6AHelsQmjkEZS+EPNE2hL8rc
         gjaBamz/5Cxj2+XRIBgDYlVL+L8mthnVNzMAPMEjrITLVLir0A0d8FmSTsg8yeZv/H
         qWBy/XbqpORkQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 25CEDC05FE2; Mon, 14 Feb 2022 20:02:59 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215531] Lenovo charge limit feature stops 1% short of the
 configured limit and says it's still charging
Date:   Mon, 14 Feb 2022 20:02:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215531-215701-QyvyX20HwF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215531-215701@https.bugzilla.kernel.org/>
References: <bug-215531-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215531

--- Comment #3 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to Nate Graham from comment #2)
> > the capacity in % being more or less equal to the
> > charge_control_end_threshold(1) value
>=20
> Does this mean that expect userspace software to say, "79% is close enough
> to 80%, consider them equal"?

If necessary, yes. It also depends where the 79% is coming from.

On my X1 carbon gen 8, there is both a "capacity" file as well as "energy_n=
ow"
and "energy_full" files under /sys/class/power_supply/BAT0. IIRC upower pre=
fers
the "energy_now" and "energy_full" files and then calculates a % based on t=
hese
itself.

It is possible that when the system stops charging
/sys/class/power_supply/BAT0/capacity actually is 80% where as the calculat=
ion
of the % from:

energy_now * 100 / energy_full

Results in 79% especially if that divide is down without rounding the resul=
t to
the nearest whole percent (by default integer division in C rounds down).

So it might be better if for the "full" because of hitting the charge thres=
hold
case the check uses /sys/class/power_supply/BAT0/capacity rather then
energy_now, this will all need to be tested as this gets implemented and wi=
ll
likely need some more tweaking while the feature has just landed.

Things like the above example can all lead to things looking to be 1% or
sometimes even 2% of, so yes userspace will be expected to fuzz things a bit
here if necessary.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
