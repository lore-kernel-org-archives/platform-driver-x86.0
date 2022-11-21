Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3138DC433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Nov 2022 15:52:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbiKUPwQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Nov 2022 10:52:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbiKUPwP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Nov 2022 10:52:15 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACFDCE0B7
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Nov 2022 07:52:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5BB4FB810E5
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Nov 2022 15:52:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B310C433D6
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Nov 2022 15:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669045932;
        bh=FEDVmscxErM/uzwMtdXilewR0OVJKfXlEsDhksEFeNo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=hXpJU299zRaCmXT8XQ1VhdXedGtR1YxHCll++K/4mCk2dQgJK+ExUb47d9DHDuuK/
         sk3SnNCTfVwv+Xvq0MBMFxcMsa91Pzn01RIyGWSpnyZnV/1HQqxr3rbKpEHzQRLxLC
         hmxVGWbkjDvhmnhhoWlEKIsbhT8tBcHgShtPCQ/2oC5qDRIayLwP0H4WiNYQ+VKa4Y
         BAJa5xQPdoMI1rL2BfBaWKYz2MRU2R5erhexsZE1gB/yyYTG4IqSao6am8k/LQCZPr
         4XGZa/LseDo5EfZoGFGJ04Q3QKc9tjiQ97kY2M8/s6c41Ijjdn41HWNWSE8P2JCnsm
         Hc/xarFXXR5eA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id EB2A3C433E6; Mon, 21 Nov 2022 15:52:11 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216647] first hibernate to disk fails on HP EliteBook 845 G8
Date:   Mon, 21 Nov 2022 15:52:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216647-215701-uYQBJdKGxg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216647-215701@https.bugzilla.kernel.org/>
References: <bug-216647-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216647

--- Comment #5 from kolAflash (kolAflash@kolahilft.de) ---
Created attachment 303251
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303251&action=3Dedit
kernel logs for hibernation with platform and with shutdown (Linux 6.0.9)

@Mario

(In reply to Mario Limonciello (AMD) from comment #4)
> OK 6.0.7 +
> https://cgit.freedesktop.org/drm/drm-misc/commit/?h=3Ddrm-misc-
> fixes&id=3De0b26b9482461e9528552f54fa662c2269f75b3f please.

I've just tested 6.0.9.
Looks like that commit is already included in 6.0.9. So I didn't apply it.

In the meantime I figured out, that
  /sys/power/disk =3D shutdown
seems to work better than the default
  /sys/power/disk =3D platform

So I did a test with "shutdown" and one with "platform".
Result:
"shutdown" worked fine!
With "platform" the first hibernation still fails.
I've attached logs with the test results.

Before I used 6.0.8 which also had good results with "shutdown", but bad
behavior with "platform".
Note:
For everyday use I changed /etc/systemd/sleep.conf -> HibernateMode=3Dshutd=
own

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
