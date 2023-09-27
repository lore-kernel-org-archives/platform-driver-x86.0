Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D7B8E7F14B
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Sep 2023 00:50:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbjI0AuC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Sep 2023 20:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbjI0AsB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Sep 2023 20:48:01 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBAABCEB
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Sep 2023 17:06:00 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96B37C433C7
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Sep 2023 00:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695773160;
        bh=JO0+m6I7lSTJ4MqWEhizpVL98+vifl7RdT030pGroaA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Do7pM/ea5N1EClSZ6Ju+I/wkHYsWI+WOpmhRV51l5UrmEPIrIz4elt2N59Gag+Ice
         ejE6mNU+19FE/pwX2WxQmb0LXPgMAb21HvxaB3vOONrznRA3OGuko6vUBVVwv5Fms8
         QGCT4Sqe8Krd8gXWivjkfMnudYDyMIZV8yd9ouaYt5qplCdHdV8kAdnUQOssoV4iXd
         xSQzD/NqoZrH8OY2Ve/6Abfh66FSOf5hVf+Ckxx8bYgIaExhbDZRcd1JA9Px7PhiqS
         7k0XOpmj5jjU+U1ZEaBwYBml00Mj+jQcxdI0e+LljoBfuEE44ui0w5ytSSnbqWXBwh
         EuBOzAAROL/Wg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 83882C4332E; Wed, 27 Sep 2023 00:06:00 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217947] WARNING at drivers/acpi/platform_profile.c:74 in
 platform_profile_show()
Date:   Wed, 27 Sep 2023 00:06:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mpearson-lenovo@squebb.ca
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217947-215701-Adfh8wVM3M@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217947-215701@https.bugzilla.kernel.org/>
References: <bug-217947-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217947

--- Comment #5 from Mark Pearson (mpearson-lenovo@squebb.ca) ---
Ah yeah - need to add:
case DYTC_MODE_MMC_BALANCE:
underneath=20
case DYTC_MODE_PSC_BALANCE:
in function convert_dytc_to_profile
(same as is done for the MMC block above)

I think that will cure that error.

Still tracking down HW here :(
Mark

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
