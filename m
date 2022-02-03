Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872DCC433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Feb 2022 20:46:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240307AbiBCUqk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 3 Feb 2022 15:46:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355482AbiBCUph (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Feb 2022 15:45:37 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDA92C06173E
        for <platform-driver-x86@vger.kernel.org>; Thu,  3 Feb 2022 12:41:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7C64261584
        for <platform-driver-x86@vger.kernel.org>; Thu,  3 Feb 2022 20:41:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8688C36AEA
        for <platform-driver-x86@vger.kernel.org>; Thu,  3 Feb 2022 20:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643920904;
        bh=HSmbMAQJ+kbuxfaKNQ0ymQA04LvzBooc/FFyf+uoegA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=nBaytEqXhX7iyi9EIi/tP9T0DE6M+fFauTpm2PikJUynO5LV7j8lFlpiCMjqXBIiB
         u1+bbdLqmTpLwh4xRzmHqjYbvUwmnoevCft9l5D3T3rbW+IABaA1PHjJ+RoH51f9so
         d3bWIMK9wgJTbqYiZnC1GTbjuciCM6IueWRDOAN9hk6d243NvtI4tOjHFX8jGMhYGA
         3FJnCfWxvkP3lVlcl+fb41xibQB7lQbJ/3CuLC3d9AG3LJGvrFCxOxCZGGxOp8BFXj
         YUT3tsT05lgu+rzLL0kokBpFpuxpbU+Su0M1x2wtLb0DVG+RW0NIqSnc5c2tGisoF4
         nKzdOB/EJ18JA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D7B4CC05FD1; Thu,  3 Feb 2022 20:41:44 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 03 Feb 2022 20:41:42 +0000
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
Message-ID: <bug-204807-215701-IotfWOwK5m@https.bugzilla.kernel.org/>
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
 Attachment #300351|0                           |1
        is obsolete|                            |

--- Comment #213 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 300389
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300389&action=3Dedit
Asus WMI for nct6775 v5.16 base (2022.02.03)

Added SENSORS_ASUS_EC driver.=20

Same as SENSORS_ASUS_WMI_EC but much faster.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
