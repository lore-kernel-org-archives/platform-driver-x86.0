Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0821FC43334
	for <platform-driver-x86@archiver.kernel.org>; Thu, 14 Jul 2022 13:48:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232131AbiGNNsX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 14 Jul 2022 09:48:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233306AbiGNNsW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Jul 2022 09:48:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CAA052FD4
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Jul 2022 06:48:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 36CDB620A7
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Jul 2022 13:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9515CC3411C
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Jul 2022 13:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657806500;
        bh=5Qc0spr+Lb33EKoLIky8BM7eEVUhLIi1R68V7Ps1J+s=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mRQe1aogJS6684Xd6ZCCcpwjKgq1PJe55tNMJjf93QI/xpu6eeoKVLOu3WLb305vS
         YV6RAF8AMBv7K+Vez2V2NevioBcyIH62pcT4kZq1o+wp83dZlFuQ5lJmlamyPxk0OI
         76XDQMzN+oQA+5vhAUCkw7uPBZ4B7zo80bdVNQcUx5z6VPC4ebNAhImg0HDeeR+nxA
         MKKW4d4cMYmACV2L4o6gRiWELUehifADwAK2ZTiL5/FQHvcMMA7Lkd5W4JM8HIZjtd
         /pkiAxhvRGWomj92QgOGlplYe19qClDKPThHg3FDk8wIfZvqr9YzARQbRIPyyT/5mA
         IzGgFnR9rqZkQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7CCC4CC13B5; Thu, 14 Jul 2022 13:48:20 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216230] "irq9: nobody cared" on Thinkpad T14 Gen1 (AMD) when
 s2idle is enabled
Date:   Thu, 14 Jul 2022 13:48:20 +0000
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
X-Bugzilla-Resolution: DOCUMENTED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216230-215701-7OF1WpTnsr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216230-215701@https.bugzilla.kernel.org/>
References: <bug-216230-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216230

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |DOCUMENTED

--- Comment #24 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
OK thanks.  I'll close it, and we'll work on getting that patch landed to
prevent users from compiling as a module.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
