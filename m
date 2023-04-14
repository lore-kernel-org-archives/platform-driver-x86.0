Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE04BC77B6F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Apr 2023 10:09:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjDNKJX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Apr 2023 06:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjDNKJW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Apr 2023 06:09:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F21D198D
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Apr 2023 03:09:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 16AB364621
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Apr 2023 10:09:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4FAE3C4339E
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Apr 2023 10:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681466960;
        bh=2UI/AEw9oDcz0DhEb4WhqJCcz95BF5E9HDquql2+y+I=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fGLB4lRuMd/PMJK5fUU+uDxUJysUbE3z2P+cehsnRk66Cds153cLqNaa5O+OOadv8
         pe2CeXZkaxxrP89hv2jIJ3TpA+o+PMvJFbGNG2Z4XxG4yRj1w1EoqsTinF9LyJCxnQ
         SQv1pzKli+FPKtdp6CqPT49u+kvB/PzlrTSz2IWEc28/ARToLUKKG+Vs5kmvVPNNee
         T0zossyu+zIr1R9I/9xhcYbClPeJLBHesTC5T71ifoJPRBFE7iXYFZ2DMuYwJgN+XO
         f6FM7HFRdhKJeTpwisJjiozGDjISIoew2jFV30eyapqh+UMBtrwVaLVIJIkcv+AIRf
         TLGguEUr5F/tA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1CDA3C43142; Fri, 14 Apr 2023 10:09:20 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217020] hp-wmi: Unable to change platform profile: Operation
 not supported
Date:   Fri, 14 Apr 2023 10:09:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: luisbocanegra17b@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217020-215701-5rhDeH6iOi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217020-215701@https.bugzilla.kernel.org/>
References: <bug-217020-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217020

--- Comment #2 from Luis Bocanegra (luisbocanegra17b@gmail.com) ---
Looking at the registers on windows the HP_OMEN_EC_THERMAL_PROFILE_OFFSET
(0x95) doesn't change on windows when switching modes either, could it be t=
hat
the gaming hub is doing something different or straight up ignoring the
readings due to a bug in firmware?

Here is an updated log with more debug prints:

[Fri Apr 14 02:47:32 2023] hp_wmi: omen_thermal_profile_get > data =3D 0x0=
=20=20=20=20=20=20=20=20

[Fri Apr 14 02:48:24 2023] hp_wmi: platform_profile_omen_set > profile =3D =
0x5=20=20=20
                    ## write performance
[Fri Apr 14 02:48:24 2023] hp_wmi: hp_wmi_perform_query commandtype=3D0x28
command=3D0x20008 size=3D0x8
[Fri Apr 14 02:48:24 2023] hp_wmi: hp_wmi_perform_query actual_insize=3D0x80
[Fri Apr 14 02:48:24 2023] hp_wmi: hp_wmi_perform_query > wmi_evaluate_meth=
od
ret=3D0x0
[Fri Apr 14 02:48:24 2023] hp_wmi: hp_wmi_perform_query > bios_return_code=
=3D0x3
[Fri Apr 14 02:48:24 2023] hp_wmi: omen_get_thermal_policy_version > ret =
=3D 0x3
[Fri Apr 14 02:48:24 2023] hp_wmi: omen_get_thermal_policy_version > buffer=
[3]
=3D 0x0
[Fri Apr 14 02:48:24 2023] hp_wmi: hp_wmi_perform_query commandtype=3D0x1a
command=3D0x20008 size=3D0x2
[Fri Apr 14 02:48:24 2023] hp_wmi: hp_wmi_perform_query actual_insize=3D0x80
[Fri Apr 14 02:48:24 2023] hp_wmi: hp_wmi_perform_query > wmi_evaluate_meth=
od
ret=3D0x0
[Fri Apr 14 02:48:24 2023] hp_wmi: hp_wmi_perform_query > bios_return_code=
=3D0x0
[Fri Apr 14 02:48:24 2023] hp_wmi: Ignore output data of zero size outsize=
=3D0x0
[Fri Apr 14 02:48:24 2023] hp_wmi: omen_thermal_profile_set 1 > ret =3D 0x0

[Fri Apr 14 02:48:50 2023] hp_wmi: omen_thermal_profile_get > data =3D 0x0=
=20=20=20=20=20=20=20=20

[Fri Apr 14 02:49:02 2023] hp_wmi: omen_thermal_profile_get > data =3D 0x0=
=20=20=20=20=20=20=20
                    ## write cool
[Fri Apr 14 02:49:49 2023] hp_wmi: platform_profile_omen_set > profile =3D =
0x1
[Fri Apr 14 02:49:49 2023] hp_wmi: hp_wmi_perform_query commandtype=3D0x28
command=3D0x20008 size=3D0x8
[Fri Apr 14 02:49:49 2023] hp_wmi: hp_wmi_perform_query actual_insize=3D0x80
[Fri Apr 14 02:49:49 2023] hp_wmi: hp_wmi_perform_query > wmi_evaluate_meth=
od
ret=3D0x0
[Fri Apr 14 02:49:49 2023] hp_wmi: hp_wmi_perform_query > bios_return_code=
=3D0x3
[Fri Apr 14 02:49:49 2023] hp_wmi: omen_get_thermal_policy_version > ret =
=3D 0x3
[Fri Apr 14 02:49:49 2023] hp_wmi: omen_get_thermal_policy_version > buffer=
[3]
=3D 0x0
[Fri Apr 14 02:49:49 2023] hp_wmi: hp_wmi_perform_query commandtype=3D0x1a
command=3D0x20008 size=3D0x2
[Fri Apr 14 02:49:49 2023] hp_wmi: hp_wmi_perform_query actual_insize=3D0x80
[Fri Apr 14 02:49:49 2023] hp_wmi: hp_wmi_perform_query > wmi_evaluate_meth=
od
ret=3D0x0
[Fri Apr 14 02:49:49 2023] hp_wmi: hp_wmi_perform_query > bios_return_code=
=3D0x0
[Fri Apr 14 02:49:49 2023] hp_wmi: Ignore output data of zero size outsize=
=3D0x0
[Fri Apr 14 02:49:49 2023] hp_wmi: omen_thermal_profile_set 2 > ret =3D 0x0

[Fri Apr 14 02:50:00 2023] hp_wmi: omen_thermal_profile_get > data =3D 0x0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
