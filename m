Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B116C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Nov 2023 13:27:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347457AbjKBN1E (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Nov 2023 09:27:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347433AbjKBN1D (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2023 09:27:03 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CFE2187
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 06:27:01 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19CE1C433C7
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 13:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698931621;
        bh=MMM5rnCafi9pWygHEfkB8Fhtgalymyp5uMo5y6wyoDE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fnS2lJB+egwUD6B0RUagatu6UFHnfm9vnzxdrcJI4I+sMXcOOt/CLxYfUBRar8DR3
         l3pksgqn2xw1zyPPmZPsK/mmCcGfhravxkDp1XQcbqmNk5BUvTW77BBVu+AN/M/Ib0
         4tQTZ+J5CzkOC6C8G2z9bUsm1tdqcLEi3SDCKFVhcL79kEIDBBVvPZiLPEAYUD1smf
         4uAUKkLwT/hx/MkAWRPtZ7wuSZyU5GxOEtkQnt7u/R3vk80ZqeORXmSGcl3lJgKZwN
         M94GA6jhGpIi0Y2roeBBqM0uW77EtWqXEAW+irwbuyp/AXHpQgENc/nLGA6UPnRAeD
         7+gmv3NJ06byw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 01BCDC53BD0; Thu,  2 Nov 2023 13:27:01 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Thu, 02 Nov 2023 13:27:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218092-215701-RY7BCVZ3Wk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218092-215701@https.bugzilla.kernel.org/>
References: <bug-218092-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218092

--- Comment #24 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
The reason to copy the config is to give you a shortcut to have the same co=
nfig
you're already using without having to learn the entire kernel config system
and what your system actually needs.  It's literally the filename ".config"=
.=20
So:

# cp /boot/config-6.5.0-10006-tuxedo .config

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
