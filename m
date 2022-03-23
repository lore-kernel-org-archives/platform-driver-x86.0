Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C03C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Mar 2022 06:13:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241535AbiCWGOh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Mar 2022 02:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232665AbiCWGOh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Mar 2022 02:14:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 816355F9E
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Mar 2022 23:13:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3FCD9B81DFE
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 06:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D57FEC340F2
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 06:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648015984;
        bh=t8VQoo6qXYlCfJ7sYK/SH/YTzpJs+rzbs/GHed6MgyY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=B33rVqx7IEnFa4vOUwp++Kx99a7OWQl8RDG8eNvsxvXBoywj0xkZVH7Hfq1OSuzWv
         +pRNo2pS1LT/tXiXeqTG0r1p6l6Yb7mxmaW8L8kUqdZ/TuPBPfvYnIiqOzDGaRqpqC
         mD+VPxcYgFDgXZDljSe8UOX3A/wHNsUhaql5ul21utdxhaBQJGhvwe3o4ZmFjrpDf5
         /A1IRBxnVnoGOTnX0EZpb9qKZ2u+Ui3iERwnV/bJNtHX2hR/E9i/3kQG7h5NBbyRyU
         IAnaqgYloUDEiZ+SP9RwpjUcaPuKjzsTu1nwFUA/PkOos6DDEsYpkGCQQUmoqpyHhw
         qAUWuFcjo4UcQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B72CAC05F98; Wed, 23 Mar 2022 06:13:04 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215730] acpi_bus_register_driver() does not work on Alder Lake
Date:   Wed, 23 Mar 2022 06:13:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mjg59-kernel@srcf.ucam.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215730-215701-Zn8sK4tS2P@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215730-215701@https.bugzilla.kernel.org/>
References: <bug-215730-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215730

--- Comment #4 from Matthew Garrett (mjg59-kernel@srcf.ucam.org) ---
Yes, no devices supported by toshiba_acpi are present in your ACPI tables, =
so
this is expected. Any functionality that toshiba_acpi has is probably
implemented via WMI instead on this device.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
