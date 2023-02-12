Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B7EC05027
	for <platform-driver-x86@archiver.kernel.org>; Sun, 12 Feb 2023 19:40:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbjBLTkd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 12 Feb 2023 14:40:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjBLTkc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 12 Feb 2023 14:40:32 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A665E3BB
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Feb 2023 11:40:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2A551B80D3B
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Feb 2023 19:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB350C433D2
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Feb 2023 19:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676230828;
        bh=fqkS2tMhALJqF56wzw4dy94Kwqwl8qLVVkGYuycJBLg=;
        h=From:To:Subject:Date:From;
        b=Se55auhkO2aA6WaCQ7b58GStEPH5rBhUN/sKnoAAKFtMgidLXRhlpXtZO5/TWe+Qe
         01irKBTdY2djxkY1JVK9+ibikzca1W4jMxT9irDk7AzO8GTWTR59fhGstZL0n23orn
         glrgF3HVbuNW745eB0PCwjYEUW3k7wZnTs3idEX2iE6STtXqd56OYBNKUXJ/TuPpae
         YHTCmpOKuuDnh3eUMXZiEqFga5g0wPKj8t5ObVpt+7b4Vv1z8JOVbzFli5DEoqCjHH
         8cwyriNWp8vi1ivmb7MEKDEDlHkxBlP5J/aqsN9Z+wCqQHioW2e1AVSm2TmVm17NZy
         ojI5z2FLgouYw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BBF48C43142; Sun, 12 Feb 2023 19:40:28 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217024] New: asus-wmi: charge_control_end_threshold not
 restored after resuming from hibernation
Date:   Sun, 12 Feb 2023 19:40:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: leigh@solinno.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-217024-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217024

            Bug ID: 217024
           Summary: asus-wmi: charge_control_end_threshold not restored
                    after resuming from hibernation
           Product: Drivers
           Version: 2.5
    Kernel Version: v6.1.11
          Hardware: AMD
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: leigh@solinno.co.uk
        Regression: No

Created attachment 303716
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303716&action=3Dedit
Rough and ready patch that seems to fix the issue for me

Hello,

Overview:

I am running self-compiled Linux v6.1.11 on a ASUS Vivobook Pro 14 OLED
(M3401). I have set /sys/class/power_supply/BAT0/charge_control_end_thresho=
ld
to 75. Following resume from hibernation, although the value is still set to
75, the
system starts charging the battery past 75%.

Steps to reproduce (assumes you've set the system up to hibernate):

1. Plug in power supply
2. Set charge_control_end_threshold to desired value (e.g. 75%)
3. Wait for system to stop charging
3. Unplug power
4. Wait for system to hibernate
5. Power system back on to resume from hibernation
6. Plug in power supply

Expected result: system will stop charging again at 75%
Actual Result: system will continue to charge past 75%

Build date: 11-02-2023 08:25:18
Hardware: ASUS Vivobook Pro 14 OLED (M3401)

The attached patch seems to fix the issue, but I know next to nothing about
this driver, so it may not be the correct fix at all (also has no error
checking).

If you need any more information, let me know.

Regards,

Leigh.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
