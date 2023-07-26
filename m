Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2085C001B0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Jul 2023 14:17:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234368AbjGZORV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Jul 2023 10:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234275AbjGZORC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Jul 2023 10:17:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C72E04486
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 07:15:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 443E461B04
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 14:15:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A17CFC433C9
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 14:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690380933;
        bh=KIQCbKV/eDKHp/0d10ByLbj9JaeuVkORMs0MI0COMKE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=nCJqFefkbzpRkZOkPJSaEOAdI8m8nFliIUPkjwIeFjFJ5EYOgdAgSyxid8U9PSkkc
         shkBTUKBcNRbJPTKRNEKANWELcN48T7vTZOH8bVKTVKPoQGowQydTxjzOKE0HNzYdZ
         Zt412+FmNX9Guj6fuVtLJ4WzRnkTW3ImZITLTctqiK2XUQ0aat5TghvRf8fSo33UNf
         yjpqi9ol9FApjvdMThGpf/r0V6RE9s5P6mK75Pl7hvdS53ZPzQ8wE31hyRv3Y0IX8t
         CsMLDB5uYi+LM2nGuKg3AnMDINTWXKrCYHaFSU0lrUmtB1VZzPSXhJOWudXnTzz0zA
         IVaXOKziNGuQg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 79AF3C4332E; Wed, 26 Jul 2023 14:15:33 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217696] Looking for a way to enable power saving mode for Ryzen
 APUs, along with limiting the upper temperature and total power consumption
Date:   Wed, 26 Jul 2023 14:15:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217696-215701-ywCLXDYju4@https.bugzilla.kernel.org/>
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

--- Comment #21 from Artem S. Tashkinov (aros@gmx.com) ---
The patched driver outputs slightly different debug messages:

amd-pmf AMDI0102:00: registered PMF device successfully
amd-pmf AMDI0102:00: supported functions:0xe0c3 notifications:0x10
amd-pmf AMDI0102:00: system params mask:0x3 flags:0x1 cmd_code:0x0 heartbea=
t:60
amd-pmf AMDI0102:00: Failed to register SPS support, this is most likely an
SBIOS bug: -17
amd-pmf AMDI0102:00: SPS enabled and Platform Profiles registered
amd-pmf AMDI0102:00: registered PMF device successfully
amd-pmf AMDI0102:00: Sending heartbeat to SBIOS

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
