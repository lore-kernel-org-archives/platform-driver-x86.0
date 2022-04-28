Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939E1C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Apr 2022 11:04:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240476AbiD1LHr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Apr 2022 07:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230363AbiD1LHq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Apr 2022 07:07:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 825FA187
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Apr 2022 04:04:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 01C6861F1F
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Apr 2022 11:04:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65173C385D1
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Apr 2022 11:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651143871;
        bh=IaS37S8XrTv1SeiJkjQHr4XMmaSy5DaA4D0avv0Rt3o=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=pR+hfzdyM/n/XWDU2P0V6Q35z/v5mQ76jiX8Efc/dNu7X7LitemzYgc3yTp0eF1dd
         HVWvT5rAulaBPckAJ+Z99sDQ1Lre3wWG7ndSTsue6S7P66SYT8tBxrICUS1gBMdHfN
         qZEIZYrJ0WwcLm7Tpj+vjjVgKxFyg6E5zP9h9c8lqsIm1VBpxHdk5azUYdip/Vce1E
         rUYDAyXATfR1DcPDZEM5gY7F/MtCdyBj07bJeBJe/L4vo4vHRyvjzpMSt/stRr7qmf
         pmUKq0E7Vi9+SmtnLTMtkCyo8J2aJnEN31g7nLAXrO3Ca9aNF9DC9q/p7PTjEME/3e
         623iKaNKcA8og==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 569E6C05FD6; Thu, 28 Apr 2022 11:04:31 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 28 Apr 2022 11:04:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: hubert.banas@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-45bEDBJz5O@https.bugzilla.kernel.org/>
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

--- Comment #233 from Hubert Banas (hubert.banas@gmail.com) ---
(In reply to Denis Pauk from comment #232)

> (In reply to Hubert Banas from comment #229)
> > Would it be possible to get these new motherboard in during Linux 5.18
> merge
> > window?
>=20
> It can be part of 5.19+ if patch will be accepted before start of the new
> merge window. (I have not sent patch yet.)

Sounds good. Thank you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
