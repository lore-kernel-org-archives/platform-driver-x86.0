Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27603CDB465
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Oct 2023 19:38:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233086AbjJSTiR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 19 Oct 2023 15:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbjJSTiR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Oct 2023 15:38:17 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DFBCCA
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Oct 2023 12:38:15 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA785C433C7
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Oct 2023 19:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697744294;
        bh=iiCripmDAmzqUThNt+TY6Obf8yYE5MUODga71CDmg2I=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cbXfd4g0q3zcDlkx3NFm0NwrOX++9kCzs3JdKQxvP3hxss+1MdA6fhan9O6Udilou
         /WH8HCw9vIj80ABN3LSRgo73lFY2OV2VPdG4pp6SAtXxhVUoC1dea+XK7fjz82xsM6
         yxkYU7TB395SVJMdHOlIikVU/zrRy2fH+yvswaBOJuhPDVpr9YKFeCSLYEujqcicNb
         sCIpNocXxVAnOGyJuPSJOzA19GAsNexbpkWKP2CcUq0KTpvE5mS0m/ZsmVXEi9cyCV
         WWy/Ss1FPA62Tyq97r17PPX2uhf1rjvSapwk7Kp5tT+LKjih56yGVq/lB7fY+tW/R7
         tDkpXCI/21DrQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C02AEC4332E; Thu, 19 Oct 2023 19:38:14 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218024] broken suspend to idle on Lenovo V15 G4 AMN (and
 related laptops)
Date:   Thu, 19 Oct 2023 19:38:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component version assigned_to product
Message-ID: <bug-218024-215701-qaJ5t3giih@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218024-215701@https.bugzilla.kernel.org/>
References: <bug-218024-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218024

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Other                       |Platform_x86
            Version|unspecified                 |2.5
           Assignee|efi@kernel-bugs.osdl.org    |drivers_platform_x86@kernel
                   |                            |-bugs.osdl.org
            Product|EFI                         |Drivers

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
