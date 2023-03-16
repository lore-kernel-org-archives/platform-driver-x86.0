Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03670C6FD1F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Mar 2023 20:13:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbjCPUNX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Mar 2023 16:13:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbjCPUNX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Mar 2023 16:13:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F95719121
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 13:13:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 03F5662120
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 20:13:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69BF5C43335
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 20:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678997600;
        bh=7c9oMQgn5V8jIGZb+/iTC94enALI6aNMpW2PfsP91o8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=SuEMYEe5kVBIUxSKVzvORPamHO5Y3WLBbUWbV8TAoN8Bio1rLzh244kmJcvwh3f8N
         ZdPMI1IPqzW/7hM46ug2ej3sWWE8aqfSx0MRE7mSNAH3FpEV+Rco2YLIZAlHXcqVnO
         3KPVvhuo1OvD6ZW8VokdLF12R3WE4Zu6qjdLKNdvR3QRyoBo+XlFQ4sjXV3eDdIKfA
         0ptIdPaS55XtFtCTWHrqkcj/IXeuVfWNottG7SG4EwTLjZLWlkRlYFt0O4Dr1XQGul
         HydLvW0vHs0q1SEqnvWBag08BJOkqxvL5zhqNqrfISujJPe34HwMHK/MDBTE0c6I1k
         /K06iAgcW8ZVA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5B461C43145; Thu, 16 Mar 2023 20:13:20 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 16 Mar 2023 20:13:18 +0000
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
Message-ID: <bug-204807-215701-jgYgfQYDJ4@https.bugzilla.kernel.org/>
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
 Attachment #303816|0                           |1
        is obsolete|                            |

--- Comment #308 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 303968
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303968&action=3Dedit
Asus WMI for nct6775 v6.2 base (2023.03.16)

Clean up previous patch, add more boards.

(In reply to barfin from comment #305)
>=20
> here's all the outputs, the file that have "_lax" at the end were captured
> when acpi_enforce_resources=3Dlax was used
> https://drive.proton.me/urls/8S727K80A4#MdPfNfkyxSbq

Could you please check messages in dmesg without lax about resource conflic=
ts?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
