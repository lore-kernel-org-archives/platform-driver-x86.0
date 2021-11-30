Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14C4C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 30 Nov 2021 22:25:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235910AbhK3W2x (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 30 Nov 2021 17:28:53 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:42568 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235555AbhK3W2p (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 30 Nov 2021 17:28:45 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id E8D96CE1D00
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Nov 2021 22:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1ECD6C53FCC
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Nov 2021 22:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638311123;
        bh=962tL/eSJ0vSpuP6u21QzN/Oq+vBNHwoPnZTm2ri1g4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=OTpQQ116nJC5w+7o9F9Hk0Yqp8Z63CvveY2/BFVPtIrYCBMNJadUCiCYmJe+6Ue2Q
         YVzDkTnOtyezZ5NxUXDdfHXWz1NSdBQsl8Qt6ox1M+DfQ2ImTuuiI1tj6IOB6137a2
         n3DiC8B1Coj6wruM4itbVtjwnhJkKtTnngMo09pNPYoq4x/5iNe8ewU6t3rlczWH2p
         RcG3HCLvEeyPciseKJjd0nrtPJ9rhqrdo2Dw0eUvvchsMRs+QoNOl4bY1m3K6GSiAg
         NifQc5A/M8vqG9Kv4/SVrdwJSbgGTAT7wo09qGWSCN2Mb6NrH9JO2egDabZLG1N/+5
         iDuuQQ+uo7CUQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id F129B60F47; Tue, 30 Nov 2021 22:25:22 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215177] Stop exporting platform_profile interface for Lenovo
 T14/P14s Gen2 AMD
Date:   Tue, 30 Nov 2021 22:25:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bjoern.daase@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215177-215701-eUQz67ZoZs@https.bugzilla.kernel.org/>
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

--- Comment #2 from bjoern.daase@gmail.com ---
That's indeed the better option.=20
I just wasn't sure there is anyone who has the knowledge to fix this who al=
so
wants to fix this, as this definitely sounds more complex than simply disab=
ling
them.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
