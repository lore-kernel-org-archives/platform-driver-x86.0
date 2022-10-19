Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55E8C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 Oct 2022 21:28:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbiJSV2n (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 Oct 2022 17:28:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbiJSV2m (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Oct 2022 17:28:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8079B192B8D
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Oct 2022 14:28:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2357B61A0D
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Oct 2022 21:28:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F689C4314C
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Oct 2022 21:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666214920;
        bh=I4azNbvV+BMHjCfFQxhGFNC2+0mAs7WeArNCfjcCCgA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=aDwbhhMwfuBIN6WIstbD7Adb0j+qWDVF3SuXb9TwEvr9FXBmQIljxbORnNjaD17DK
         p64WrMGowqgJx6lBjVYU+ODysvgQBp5gwKoiT7L7FdQk5KOuTGyQXva2Hk9g5pqFhP
         nxItRzLCl2LZ6u7nfWLHobxObcNY/4xqcPXViOyu4HnVWw6NMWwD/8ls+cDOKdeJck
         8asNs8Sbiucu9Q9Zp/CjQ+MvamY4YL1WLLTj7ecrnfNzZVHYehMOnV9GTDzhRZKnJO
         7m0MMDnRKVrP+Yjts4qcrcWhsK0TTI+OtX4o0aXG7q3psCl44Ji7BzkplzwJwBlQG2
         f58Q80yBHNSyg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6F71DC433E7; Wed, 19 Oct 2022 21:28:40 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 19 Oct 2022 21:28:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pauk.denis@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-204807-215701-jm1mnvN6Ns@https.bugzilla.kernel.org/>
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

Denis Pauk (pauk.denis@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #303031|0                           |1
        is obsolete|                            |

--- Comment #263 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 303045
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303045&action=3Dedit
Asus WMI for nct6775 v5.20 base (2022.10.20)

Updated patch with X670 board support, based on patch from Ahmad Khalifa,

https://patchwork.kernel.org/project/linux-hwmon/patch/20221018173428.71080=
-1-ahmad@khalifa.ws/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
