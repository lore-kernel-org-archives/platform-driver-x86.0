Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3EC7C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Feb 2022 07:59:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234943AbiBIH64 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Feb 2022 02:58:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbiBIH6z (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Feb 2022 02:58:55 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A164AC0613CA
        for <platform-driver-x86@vger.kernel.org>; Tue,  8 Feb 2022 23:58:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 385C1618B0
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Feb 2022 07:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9228EC340EE
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Feb 2022 07:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644393538;
        bh=mjo7Kt0YXRGbabwbYxAlBiq2TnB7jcBehcBgJkS+yiE=;
        h=From:To:Subject:Date:From;
        b=Juq84T8+FFoXhYMyFKO70H6fFAOgl/2pl0v8MIz5odHmgyp4S32U3VPAphw261WL8
         UXQ2u1TkdHm3mRXg5Af9aMTC4i5h7frenglYcxvtLhVG16JOmsAuciXqRU/lnhEh9z
         0sLHq6K6YBezNbvwJ7wQ4Qb5Axm1U4oZ4NdwLBBTZrh1s5PMROaFOWA52NdfTYOR+q
         f3afeG6J/SVjnMBXILn3Kop55QucctAa4OTCkAlXyJSH4WsatMm+NDszo78lTXwJDh
         Juji58FnhijVc3JLwOr79OAcIokDt0t3d+FZ1Yd5eCY78SA+xbQHfg3KIWlSOtTgWs
         06ggJEmLgqeIw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 671B0C05FD4; Wed,  9 Feb 2022 07:58:58 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215584] New: ASUS laptop cannot suspend with external USB-C
 monitor
Date:   Wed, 09 Feb 2022 07:58:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: william.a.wall.4@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215584-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215584

            Bug ID: 215584
           Summary: ASUS laptop cannot suspend with external USB-C monitor
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.15.21
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: william.a.wall.4@gmail.com
        Regression: No

Created attachment 300421
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300421&action=3Dedit
journalctl -b -k

I have an ASUS TUF Gaming A15 FA506QE_TUF506QE/FA506QE laptop. On kernel
5.15.21, it suspends just fine when using only the laptop. However, when
connected to an LG 43UD79-B monitor via USB-C (monitor supports DisplayPort
1.2), it wakes up almost immediately after suspend.

fwts s3 claims that this is due to:

kernel: asus_wmi: Unknown key c0 pressed

(and that log does not occur when suspending without the external monitor).

I also attempted this on a 5.16 kernel, but I was unable to get the nvidia
drivers compiled via DKMS and therefore it was not a similar test, as I am
fairly sure that the integrated graphics are not capable of driving the
external monitor.

Is there a way to configure the system to ignore that keypress? I was unabl=
e to
recreate it by mashing every possible combination of function keys I could
think of while running showkey.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
