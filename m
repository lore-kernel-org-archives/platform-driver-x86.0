Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6815AC77B6E
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Apr 2023 03:43:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbjDNDnZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 13 Apr 2023 23:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjDNDm4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 13 Apr 2023 23:42:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 904DA49C7
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Apr 2023 20:42:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 176B66438E
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Apr 2023 03:42:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F3D1C433D2
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Apr 2023 03:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681443774;
        bh=yt+CzBDxuX53N4ne2+O+aiiHxUm8Qz4s/PtqevJWr60=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=vC5CDwK/NSPMsXaDXLkrRxHPh3DQ932f9bXMR1xVYrUziCeUTSlIMO0CR2K0m4a+W
         laswOo2SNaDb0hmHOj9QPNJFuYXVeuxfLXW4iqqjeAUP+OfRPIArBpkamAapzo5IBr
         WyIZrvAWx92bdx9bziSbq5bdZsRTE3xreykTlfiiV3q8LGmuxuAqRX1xbhxBBHXqHP
         quYBChrKS3AX5uxQLXyEepBL+1EYiC966l5e0uzj3ncS1igoqQE52XSsBxW9Yr6PJF
         0Xttl666s9bhkZCqPti2ktsB5Gnx9yO0E4R2xgszmhYE848ObaQIoyquaPDw2GmuAE
         J9Dcckz3O47FA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 37695C43141; Fri, 14 Apr 2023 03:42:54 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217020] hp-wmi: Unable to change platform profile: Operation
 not supported
Date:   Fri, 14 Apr 2023 03:42:54 +0000
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
Message-ID: <bug-217020-215701-e8GINElcqY@https.bugzilla.kernel.org/>
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

--- Comment #1 from Luis Bocanegra (luisbocanegra17b@gmail.com) ---
So tried to debug this issue the best I could and these are my findings
omen_get_thermal_policy_version() (HPWMI_GET_SYSTEM_DESIGN_DATA) reads as 0=
x03,
same as windows using ec-probe tool

Bypassing the return in omen_get_thermal_policy_version()
seems to allow platform_profile_omen_set() to change the power profile, at
least with=20
cool because I hear the fans spin up and then down when setting balanced, j=
ust
like the gaming hub on windows

But omen_thermal_profile_get() (HP_OMEN_EC_THERMAL_PROFILE_OFFSET) always=20
returns 0 making the sysfs entry always stay on balanced and breaking the
funcionality of power-profiles-daemon

Here the logs of changing to cool then performance profiles

[Thu Apr 13 21:29:40 2023] hp_wmi: omen_thermal_profile_get > data =3D 0x0
[Thu Apr 13 21:29:42 2023] hp_wmi: platform_profile_omen_set > profile =3D =
0x1
[Thu Apr 13 21:29:42 2023] hp_wmi: omen_get_thermal_policy_version > ret =
=3D 0x3
[Thu Apr 13 21:29:42 2023] hp_wmi: omen_get_thermal_policy_version > buffer=
[3]
=3D 0x0 //bypassed
[Thu Apr 13 21:29:42 2023] hp_wmi: omen_thermal_profile_set 2 > ret =3D 0x0
[Thu Apr 13 21:29:43 2023] hp_wmi: omen_thermal_profile_get > data =3D 0x0
[Thu Apr 13 21:29:49 2023] hp_wmi: platform_profile_omen_set > profile =3D =
0x5
[Thu Apr 13 21:29:49 2023] hp_wmi: omen_get_thermal_policy_version > ret =
=3D 0x3
[Thu Apr 13 21:29:49 2023] hp_wmi: omen_get_thermal_policy_version > buffer=
[3]
=3D 0x0
[Thu Apr 13 21:29:49 2023] hp_wmi: omen_thermal_profile_set 1 > ret =3D 0x0
[Thu Apr 13 21:29:52 2023] hp_wmi: omen_thermal_profile_get > data =3D 0x0

Is this a very edge case bug or the controller somehow broken? Happy to pro=
vide
more information/test patches as needed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
