Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B85C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Jun 2022 00:32:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbiFDAc5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 3 Jun 2022 20:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231737AbiFDAc4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Jun 2022 20:32:56 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5049193E8
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Jun 2022 17:32:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 655C6B8252B
        for <platform-driver-x86@vger.kernel.org>; Sat,  4 Jun 2022 00:32:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F560C341E2
        for <platform-driver-x86@vger.kernel.org>; Sat,  4 Jun 2022 00:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654302772;
        bh=NSnOkJWM4xxRT57e3++kpyw+bcxfLWo9S+LcpPJ0IT4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LhXvigt+z9K3wNjLEboE3TLrVxwqNJn/GXRduyuko1Hw8zm33x6PWN0bsBZZ0oj8V
         7FNq1tbB25Vgv4ReeaUidFVInHRHjJWMuQd/q7n6g5TEeXZmCUatR1jfNcSJcXYWCu
         T1fahu31tnoXTeIz5hVbkC1WhuxRuJzE2ClCBzvK3Hl4qXBre+KrdN7RxAAqu7I+tv
         u+rnTju1nGk7Vz3Omr9GCU4h2Cdl7XXdKLgSWrw0cOvZK/v/MAxu1P37u62f3ptNtx
         q9VqTngsTWabI+jwrHdEtb40cyC1fsDHQEuU3KBtIVtUmxLBuNoez50K44VYPWZz4/
         ECVtQe8ZfJlAA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id F229FCC13B1; Sat,  4 Jun 2022 00:32:51 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 04 Jun 2022 00:32:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: rob@janerob.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-DdrnSF1eIQ@https.bugzilla.kernel.org/>
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

--- Comment #252 from Rob Miller (rob@janerob.com) ---
(In reply to Denis Pauk from comment #251)
> Created attachment 301099 [details]
> Asus WMI for nct6775 v5.18 base (2022.06.03)
>=20
> (In reply to Rob Miller from comment #250)

> Could you please check?

Score!

sensors command fully working, no issues in dmesg, no 'lax' boot parameter.

Thank you! and well done!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
