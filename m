Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A8FC46467
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Jan 2023 20:22:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240299AbjADUWJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 4 Jan 2023 15:22:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240235AbjADUVx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Jan 2023 15:21:53 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 340DB33D45
        for <platform-driver-x86@vger.kernel.org>; Wed,  4 Jan 2023 12:21:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C7D2B61804
        for <platform-driver-x86@vger.kernel.org>; Wed,  4 Jan 2023 20:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D357C433F0
        for <platform-driver-x86@vger.kernel.org>; Wed,  4 Jan 2023 20:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672863711;
        bh=i0dZytyXJoDXsDtr4DwVXwClZRpl4zhUajju6+07dS0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=qpGFQwCqQh2hYkb9ttO8KffKTUQeO8zUEac2GBgtpi0M+iu5srhBPTSKSXIFSe9Go
         xuUsUsAqCU8n6TrVa9dB96rFLglibX9vML4XvAIv/CFfhXuFz6jmmgprVpoztnnpHM
         xoV+uC3i1HUC1TRyLq49tTbnZ02lTGyK5yu1NuIhuGX/XuZGUSnDr9el7x3A6O231L
         d7OGZIV/Y492efv84xJEV7ngvQtTddOPcgZBbNKMyvRFgG98Divfx6JCqwgwIsRpOF
         qSdNpnKnPfpGtzAlosIPTHPW9rM9hwJf5zROeCaTSmVWfMaS0cyEyZNqiIZES2q9mr
         CeSI7X1YL+f3A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 21240C43142; Wed,  4 Jan 2023 20:21:51 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 114161] pinctrl-baytrail: Potential Error: Setting GPIO with
 direct_irq_en to output
Date:   Wed, 04 Jan 2023 20:21:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-114161-215701-E0hOLEHIN7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-114161-215701@https.bugzilla.kernel.org/>
References: <bug-114161-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D114161

Andy Shevchenko (andy.shevchenko@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |andy.shevchenko@gmail.com,
                   |                            |jwrdegoede@fedoraproject.or
                   |                            |g

--- Comment #9 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
I believe this is something which Hans (Cc'ed now) has fixed a couple of ye=
ars
ago.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
