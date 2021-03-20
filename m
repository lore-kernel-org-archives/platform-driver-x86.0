Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F0BC433C1
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Mar 2021 14:41:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 513FA61967
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Mar 2021 14:41:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbhCTOlE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 20 Mar 2021 10:41:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:54142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229884AbhCTOkh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 20 Mar 2021 10:40:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 009F66196C
        for <platform-driver-x86@vger.kernel.org>; Sat, 20 Mar 2021 14:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616251237;
        bh=OOatZyIWKPAr3p5aqp2ojiJeJvbTqDfYURlfsvHUVRQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=RwAbYLONLwDCFB3C+2/Cua+/WJABiDo/2vgk6fm2uOC98CxONl0BUOraPyTicXOrC
         9s582AzAbSzn8plg/xTMccs6Xv7ts6KAuE4+v3feho2FEnhohgwzs8eYr1V0MfvAG1
         V/h9LoEZBg8ZJr8kbhG+MG+CkX6h8gOSEuMiBXwXwoKO9iRVa7RcwwtG1I4RxQwE+7
         vDNseSVkbmjt4/zx/GevR34d/w/4CNPYCWePLi1bPMD7L6RrYnfQQvbiEbPcFaHSSF
         2WkjMc9dwD1MO39WIiHLSRCFM4JGWaThx8FpkXWlSqRiF1MV8NtomEs+fkxKHrnybH
         YqS+T9uDRyxHg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 211895] dell_wmi_sysman causes unbootable system
Date:   Sat, 20 Mar 2021 14:40:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211895-215701-pI2ACe0LG1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211895-215701@https.bugzilla.kernel.org/>
References: <bug-211895-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211895

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g

--- Comment #7 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
I've prepared and posted a set of patches which deal with various problems =
with
error-exit path cleanups and general robustness of the dell-wmi-sysman driv=
er:

https://lore.kernel.org/platform-driver-x86/20210320143429.76047-1-hdegoede=
@redhat.com/T/#t

Note it is not entirely clear to me what is going on here, so I'm not sure =
if
these patches fix things but hopefully they will help.

What would be helpful, independent of testing the patches, is if someone co=
uld
boot a 5.11 kernel with dell-wmi-sysman blacklisted to avoid the problem.

And then:

1. Switch to a text-console
2. ssh into the machine and run dmesg -w
3. ssh into the machine a second time and run: "sudo modprobe dell_wmi_sysm=
an
dyndbg"

And then collect log info from the "dmesg -w" and in case there are log
messages on the text-console which did not make it into the ssh dmesg -w
output, make a picture of those.

And if you are capable of building your own kernels then testing the patches
would be great too of course (save the emails in "raw" format and then "git=
 am"
them).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
