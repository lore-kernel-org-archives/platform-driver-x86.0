Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72197C636CC
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Feb 2023 11:05:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbjBPLFf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Feb 2023 06:05:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbjBPLFe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Feb 2023 06:05:34 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 076F7BA
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Feb 2023 03:05:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 915E161F92
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Feb 2023 11:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0335AC433AE
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Feb 2023 11:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676545532;
        bh=g37MMbsGG77w7M9dNxQOgBvteLPArRlV4CnVTCkNyAM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fcndf8irYWJfrzYuzslij34a4CwcVWXF53EWgfJlrZhvoSECbzyGe99mFL8GF1Y9T
         O7e/GPJywByO5jUbQKNmT3IwYjhh5WCegpWfzO82jwVwFC43ATr/3ualdNPCzOxVEZ
         AjmKSxpuIt5kvizQCvSl4o54GXEBDV2Q/BUWlDPdVEA5eiGe6ho8GJ+ubu/s8L+5XY
         S+KHeez7Luz8/8BA+HQ1WTRwro8NBiSfqQf4dtrRyaRLEiCYzrenRtZPoqR9m7E+/T
         TsHSRX6UgSgen/EVML5RM5ZsZ6UxARFUb20wJWFb/WMSVyTBw9Joyoh/yfoc4CjSMB
         n1YkEo5U66ptg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E77D7C43143; Thu, 16 Feb 2023 11:05:31 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 16 Feb 2023 11:05:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jeroen@beerstra.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-bIvcSigiA2@https.bugzilla.kernel.org/>
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

--- Comment #297 from Jeroen Beerstra (jeroen@beerstra.org) ---
ON 6.1.12 I still needed to apply it. Guess it=E2=80=99s included in 6.2 (R=
C atm)? But
I would love to stand corrected, compiling kernels goes like a tornado on a
highend Ryzen but still is a task I would like to skip nowadays...

> Op 16 feb. 2023, om 12:01 heeft bugzilla-daemon@kernel.org het volgende
> geschreven:
>=20
> https://bugzilla.kernel.org/show_bug.cgi?id=3D204807
>=20
> --- Comment #295 from P=C3=A4r Ekholm (forum1@m.pekholm.org) ---
> (In reply to Jeroen Beerstra from comment #294)
>> For me, on 6.1 ML via elrepo. I needed to apply patch and modprobe nct67=
75.
>> Lmsensors did not detect my sensors. Other than that it just works :)
>=20
> Isn't this patch included in kernels after 5.17?
>=20
> --=20
> You may reply to this email to add a comment.
>=20
> You are receiving this mail because:
> You are on the CC list for the bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
