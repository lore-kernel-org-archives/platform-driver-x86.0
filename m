Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B46DFC00140
	for <platform-driver-x86@archiver.kernel.org>; Sat, 13 Aug 2022 03:10:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234567AbiHMDKK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 12 Aug 2022 23:10:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232374AbiHMDKJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 12 Aug 2022 23:10:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31977F1E
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Aug 2022 20:10:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DF36AB8254B
        for <platform-driver-x86@vger.kernel.org>; Sat, 13 Aug 2022 03:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 648FCC43148
        for <platform-driver-x86@vger.kernel.org>; Sat, 13 Aug 2022 03:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660360205;
        bh=LMIW7GepFYR8wJ3A/B22nT1trf+EPtYh+W1PGnpO2AI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=D7UdnOY3pqbOkYnEis6H8C2l6L9+Mz9GDhmhqtL7eurKh7UwzL8wx88ZDIHVlk4Zf
         sHEJHjMRwqhXx/weqtk27OoQsti4qO+WGrKV62di3JmZM+9T1H23alcqvlHuySoBWC
         a5+Qz/3pXylZZe+AyzEvWsW+Ykpoz1va0bc2y646C+kh88WF+V8GZ19K+V2ox8B0Uv
         MVJ/nWrXg9F5VKV/PVY9tOCnPFLLhIbpayK2vo5WzMTZJjZGewznftx5Tz4uvM9AxH
         To8Bw4lWe7udziMNDh35AVG+5jB4SoWLn+RE6vaoNaOWC5X3OtUjFyXMlcMmiUI+Bh
         opHhw5PojvbSw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 54C43C433E4; Sat, 13 Aug 2022 03:10:05 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 32742] Keyboard backlight does not work on Toshiba Satellite M
 series laptops
Date:   Sat, 13 Aug 2022 03:10:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: cado007@gmail.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-32742-215701-Ed2hZQjZfo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-32742-215701@https.bugzilla.kernel.org/>
References: <bug-32742-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D32742

cado007@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |cado007@gmail.com

--- Comment #116 from cado007@gmail.com ---
I have the same issue with a Satellite M645 and the trick from:
https://bugzilla.kernel.org/show_bug.cgi?id=3D32742#c108 worked.

Since I'm in dual boot with Windows 10 to activate the keyboard with the tr=
ick
instead of booting with a Win CD I just begin to boot in Windows and shutdo=
wn
the computer by holding the power button as soon the boot begin and right a=
fter
I boot in Linux and it work.

It's not really elegant but it work.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
