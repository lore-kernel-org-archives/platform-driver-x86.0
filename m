Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB3BC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu,  7 Jul 2022 19:45:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235918AbiGGTpU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 7 Jul 2022 15:45:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232284AbiGGTpT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 Jul 2022 15:45:19 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CA212BB18
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 Jul 2022 12:45:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F1F70B8229A
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 Jul 2022 19:45:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B87EAC341C6
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 Jul 2022 19:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657223116;
        bh=srKGQI1KLnDdXsWtTeXpMxSZsVHHDDtthHHnNm2RWF4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=BBBUxuzzcjqLDnMdqv65tk0bzXzx7lBsV9RJHNio7mp9UVGvyd70cfH5CCPohTT/K
         t0LsCow3gJCZDAvkxOklDQ+02A5v7TVOzKhkxVBXH2b/BQr527yDfUsiEhW3a3QBnT
         bFr00cGM7DnaxnR5AwsJ6HEeGGsupN6iOI+d85yMAxhRGrUrIsn6aU7f6Vst/br82m
         IULGz/bstwczyNrIIESmCfrDFEVRuuJFxSNpqIqKpau3Beytj7mkcuFLxzVWuCSYcr
         8h8J4TgGtd+BfNXBb9X02D+i0+RlBHKqdmlC9MbtE8gHkq9TPT8//bBg2hovZDqC/0
         zOwlH7/2r7oOw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A3971CC13B1; Thu,  7 Jul 2022 19:45:16 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215177] Stop exporting platform_profile interface for Lenovo
 T14/P14s Gen2 AMD
Date:   Thu, 07 Jul 2022 19:45:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: markpearson@lenovo.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: rep_platform assigned_to
Message-ID: <bug-215177-215701-yFUzwzZVor@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215177-215701@https.bugzilla.kernel.org/>
References: <bug-215177-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215177

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Hardware|All                         |AMD
           Assignee|drivers_platform_x86@kernel |markpearson@lenovo.com
                   |-bugs.osdl.org              |

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
