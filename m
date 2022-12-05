Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D40C4321E
	for <platform-driver-x86@archiver.kernel.org>; Mon,  5 Dec 2022 09:59:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231573AbiLEJ7e (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 5 Dec 2022 04:59:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231487AbiLEJ73 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 5 Dec 2022 04:59:29 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08F46E024
        for <platform-driver-x86@vger.kernel.org>; Mon,  5 Dec 2022 01:59:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B6158B80DF3
        for <platform-driver-x86@vger.kernel.org>; Mon,  5 Dec 2022 09:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5ABA2C433C1
        for <platform-driver-x86@vger.kernel.org>; Mon,  5 Dec 2022 09:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670234366;
        bh=w13Sd0WC7JSn46PiceGa4fPYPtYtqTAb6bewAsLGPSs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=oEfQduLnz817Lo/ii3DfbLpQo5eBuQstCN02j8NtFX1qPkROeDe+oZ6A/eCAIykAY
         NqtaeBvfqM/cpo9O555pnjxjs/+wXmCJpqwxEGPEd7x0kQaX0TVHB9fytG/O19DhT2
         1sAKDXh24PKzv+KUwenZk1oLmSfK3LwE3+XdaHaXd0F87kjFSVHF1D9wSFbW4sGoRe
         Cv1kSVDLLv188wP/CTb77Wini7p+4Q+Xg7r6sKBmYX2821qyHmxcSZHFQwaBD9IWGi
         PiXMpJlS+xSEWeJjf9fJVsc4HF0N0yo3Y5BM6+7FafAlGPxWUqJHJulBu9UGfSZ3gQ
         sbOH0HY+wGaOA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 40426C433E6; Mon,  5 Dec 2022 09:59:26 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216647] first hibernate to disk fails on HP EliteBook 845 G8
Date:   Mon, 05 Dec 2022 09:59:26 +0000
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
Message-ID: <bug-216647-215701-4ynhlOELsM@https.bugzilla.kernel.org/>
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

--- Comment #7 from kolAflash (kolAflash@kolahilft.de) ---
Created attachment 303358
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303358&action=3Dedit
kernel log for hibernation with platform (Linux 6.0.11)

Hi Mario,

thank you very much for your patience!


(In reply to Mario Limonciello (AMD) from comment #6)
> Can you please better describe the symptoms of the failure you're seeing
> with "platform".  I don't see anything immediately obvious jumping out.

With "platform" the system doesn't really enter hibernation. So the notebook
stays on and doesn't turn off as expected for hibernation. (power led stays=
 on)

The screen just becomes black for a few seconds. But then the system contin=
ues
normally. (not crashed, still usable, but not powered off as expected for
hibernation)


You can see that there are just 10 seconds between
  PM: hibernation: hibernation entry
and
  PM: hibernation: hibernation exit
in the
  hibernate_broken_via_platform_v6.0.9.txt
(see attachment 303251 in comment 5)
In this time the screen was black.



> You can try to take these two commits and see if it helps.
> https://github.com/torvalds/linux/commit/
> 4f2bea62cf3874c5a58e987b0b472f9fb57117a2
> https://patchwork.freedesktop.org/patch/512917/

I've just tested 6.0.11.
Looks like both commits are already included in 6.0.11. So I didn't apply t=
hem.

Problem persists. See attached log.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
