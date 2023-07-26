Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A73FCC001DC
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Jul 2023 10:01:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231622AbjGZKB3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Jul 2023 06:01:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231453AbjGZKB2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Jul 2023 06:01:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2CD397
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 03:01:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7F3A461A35
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 10:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8E2EC433C8
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 10:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690365686;
        bh=ptMcKNzCOskwDb676CJcbOCp8jGmgOH8GgsrpjBPPnY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=n8GJonC6TJYO296nq2L3Y6PBEbanq43NJO2BrI9tLulXpOxA6SDySiEWflPI9VAc0
         PboPkfY9r/Ydj736//Sy6Bc19Cfijpb863pQtfGviTpuk/zF2SAXt4BeeqozjLnLOK
         9PDb5Qp5Y8aoL8RG7TEBkx/nGy+IvHvFVhyxJJ6ugh6s0VJFMAXOS/oVzP2Ydjgabg
         GqSJfJea/IiIEI6oaebKAKtXewQga781asShDupe8qHGD0xFyVJLDXtP9B2E7HisWg
         g/YnfwVAzCluWOFiS4LFdI7gjO/zeSXXiIPcrpixIRvbyp5WWCe+6ebm63E8wujMzB
         qnUq7lDPAR/Nw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C9278C4332E; Wed, 26 Jul 2023 10:01:26 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217696] Looking for a way to enable power saving mode for Ryzen
 APUs, along with limiting the upper temperature and total power consumption
Date:   Wed, 26 Jul 2023 10:01:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217696-215701-OyUUCbwppJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217696-215701@https.bugzilla.kernel.org/>
References: <bug-217696-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217696

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g

--- Comment #16 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Artem, you can take Fedora's kernel config as a start for your local build
kernel, copy it over the .config file and then run "make oldconfig".

You can find Fedora's kernel config e.g. here:

/lib/modules/6.4.4-200.fc38.x86_64/config

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
