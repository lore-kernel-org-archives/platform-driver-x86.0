Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408A9C433B4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 May 2021 13:08:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A47CA613CA
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 May 2021 13:08:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhEKNJ3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 May 2021 09:09:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:46536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230483AbhEKNJ3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 May 2021 09:09:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8AC38613CA
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 May 2021 13:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620738502;
        bh=fWlVLt3sdY4k3EqZs6AzQHj823W/pV1Zov1crPvojgM=;
        h=From:To:Subject:Date:From;
        b=YL7C4mL8NVvehmogIVBDvBBsc0Y46TNux6gN89eRQfz6iUE7m8vrWx+U+Tzmk2Ica
         X/35GgwpF0JXvRcYbWy5Z45sJEhIFB0avIHj4qlZ75AbBF1TbBGUJIYm5a04eJPo2x
         utkFZnWZjAVPHbLoS5lI9kVeH8cTGoP85jy7CBY9gAD/wtsycYJ4IVLiD+BxaNq9dn
         QvPE4aTmSgAaDlpjdJ7vpcGsPltPlC3c9OemtIA+2x2jCF42G0xAGCYq/jMrcUyTxB
         BrCDqKeVO+8zcrOEjDcNlfPhrx+515Nok3JrGJ6V2i4wOZtUBRFO7N26G3wGxoBaVx
         eq/5pxkpWBhTg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213029] New: [5.12 Regression] clock_gettime() a lot slower
 with Hyper-V clocksource driver
Date:   Tue, 11 May 2021 13:08:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mgamal@redhat.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-213029-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213029

            Bug ID: 213029
           Summary: [5.12 Regression] clock_gettime() a lot slower with
                    Hyper-V clocksource driver
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.12
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: mgamal@redhat.com
        Regression: No

Since kernel 5.12 the performance of clock_gettime() is a lot slower. There
seems to be a regression concerning VDSO in the Hyper-V clocksource driver.

The following code snippet runs a lot slower:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
# gcc gettime.c -o gettime
# cat gettime.c=20

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char *argv[]) {
    struct timespec start;
    unsigned long i;

    for (i=3D0; i<100000000UL; i++) {
        if( clock_gettime(CLOCK_REALTIME, &start) =3D=3D -1 ) {
            perror( "clock gettime" );
            exit( EXIT_FAILURE );
        }
    }

    return 0;
}
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D

# cat /sys/devices/system/clocksource/clocksource0/current_clocksource
hyperv_clocksource_tsc_page

1) With kernel >=3D 5.12
# time ./gettime=20
real    0m48.201s
user    0m14.788s
sys     0m31.531s


2) With kernel < 5.12
# time ./gettime
real    0m3.308s
user    0m3.214s
sys     0m0.003s


I bisected the kernel and the commit that introduces the regression seems t=
o be
this:

commit e4ab4658f1cff14c82202132f7af2cb5c2741469
Author: Michael Kelley <mikelley@microsoft.com>
Date:   Tue Mar 2 13:38:19 2021 -0800

    clocksource/drivers/hyper-v: Handle vDSO differences inline

    While the driver for the Hyper-V Reference TSC and STIMERs is architect=
ure
    neutral, vDSO is implemented for x86/x64, but not for ARM64.  Current c=
ode
    calls into utility functions under arch/x86 (and coming, under arch/arm=
64)
    to handle the difference.

    Change this approach to handle the difference inline based on whether
    VDSO_CLOCK_MODE_HVCLOCK is present.  The new approach removes code under
    arch/* since the difference is tied more to the specifics of the Linux
    implementation than to the architecture.

    No functional change.

    Signed-off-by: Michael Kelley <mikelley@microsoft.com>
    Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
    Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
    Link:
https://lore.kernel.org/r/1614721102-2241-8-git-send-email-mikelley@microso=
ft.com
    Signed-off-by: Wei Liu <wei.liu@kernel.org>

It does indeed not introduce any functional changes, but degradation in
performance is quite noticeable.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
