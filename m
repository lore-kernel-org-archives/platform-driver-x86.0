Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 863F2C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Feb 2022 21:19:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233808AbiBUVUD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Feb 2022 16:20:03 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232375AbiBUVUC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Feb 2022 16:20:02 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6940EAE74
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Feb 2022 13:19:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F0CE1611EE
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Feb 2022 21:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5834FC340F1
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Feb 2022 21:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645478377;
        bh=Ilhd21jC4i55S3rDAQz+KdEVNqzjZ4a3xX38/uscjJw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=oF5PvnaLYnviCQQukfQGBhBGl6WrzXTPGdYrvZqcjEaCaWusZafTybLgzGsbhetqH
         FbDJnYsH5YbWvkt3djtOuHKByW5wXV8cbNzrjEECda1eZyGa6b43PILAUKl87RhEmy
         D1MYZrmFMXgK12p+s7ddYJ/82j0hb3kkaoc8CQ17IWBOgwulPTjvHCmlAcRXy/Kq1i
         aZTB++kFlHjfDskbZ0oin214RmsuInZLy5rfz6+8B2pGNa4BrDjq39iw6OJgQfj2To
         nuDd2WkO73QR9WkjxojMQJSkVlQQcdhikkiLwp+naLbIPIZxPW7oHcKDMzJYlK1FEO
         oMtlP8xZKVFgA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3F76CC05FD2; Mon, 21 Feb 2022 21:19:37 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 106031] Regression in 4.2.x: in airplane mode each time I open
 my laptop lid
Date:   Mon, 21 Feb 2022 21:19:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: emmanuel.grumbach@intel.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-106031-215701-Cs3SM5QEow@https.bugzilla.kernel.org/>
In-Reply-To: <bug-106031-215701@https.bugzilla.kernel.org/>
References: <bug-106031-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D106031

Emmanuel Grumbach (emmanuel.grumbach@intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |CODE_FIX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
