Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2CF3C001DC
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Jul 2023 14:35:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbjGZOfR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Jul 2023 10:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231929AbjGZOfQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Jul 2023 10:35:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C54AB4
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 07:35:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9D2756138B
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 14:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C2B2C433C9
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 14:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690382115;
        bh=kFlr029ap/Vq01olgYj7tW8HH9NeMovQWcfJ7Q229C4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Ch8XDawpxZ/81NwSFtVLgB8njeCNanAORbwxDpiFaeqgtIXcYulQ7PNTdHkjpWaQ7
         i5dTZODSL15g2pL9IzSEhT118Eov55EHwFa6CMaOcuqJgCRkbtuCYWdDARIorbI8kp
         xexhTpREHCvo6kYuAMnKVrERjIb4RGNnf5HGujZ4UpS7mZkxLiRAZ4H4FSPqXFv0kw
         iFKjr2w7VI5fkI5eFbtJj8CxQ62zsc+P7ZtVIKcLepKaWtCa7lNFt9aNBtrns7DnpT
         JKGE+WWi/0yVjtrwIruCX6gfPJ+ZhpD08HTdfHTRVZJ8nnLfs8dbVRADz6Am8jqo2Z
         KqXNf5BeSEgKg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 15F26C4332E; Wed, 26 Jul 2023 14:35:13 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217696] Looking for a way to enable power saving mode for Ryzen
 APUs, along with limiting the upper temperature and total power consumption
Date:   Wed, 26 Jul 2023 14:35:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: priority bug_status cf_kernel_version resolution
 bug_severity
Message-ID: <bug-217696-215701-5ao5JubJzq@https.bugzilla.kernel.org/>
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

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Priority|P3                          |P5
             Status|ASSIGNED                    |RESOLVED
     Kernel Version|                            |GIT
         Resolution|---                         |WILL_NOT_FIX
           Severity|high                        |enhancement

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
