Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F5DC001DC
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Jul 2023 10:35:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233912AbjGZKfA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Jul 2023 06:35:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233873AbjGZKe4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Jul 2023 06:34:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 195FB212B
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 03:34:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AB3B261A59
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 10:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 209DBC433C9
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 10:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690367695;
        bh=rId2RxkOOBEw9AajEm2tpKBX6sCdKXKLC8IhWAH2EJE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lqIyMS6mWO7wpQ/ci6xw9oqc8WnFLa2begpjhv+HgnwjHukTJJZ+BrDJJYuNkgkH8
         lT+qMmVW63ygB2KyAQmqsABARSE4tZiYglO34iysIPsBB1KxK3lFfPqLF4atYbtZmW
         v7QtK04DUJHfSlTNwlHdHDT0C+r4vLN3WE8FTC2YWayIwCP8UFzCYGQDsjk86B/e4a
         W7gGiZfounOgoNglY1qIUigMMp41TX7RnVt26dzOZg5Z1LYj90Cclm64w2IzU2UjpQ
         B/zlMXeN/EJo0BHrDl7bgKC7A7RMQDS7YDqEebUgzRdAiTT0a4KX3uJxlFbPhoJZfC
         8yFnEWqgxcNKg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E392DC4332E; Wed, 26 Jul 2023 10:34:54 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217696] Looking for a way to enable power saving mode for Ryzen
 APUs, along with limiting the upper temperature and total power consumption
Date:   Wed, 26 Jul 2023 10:34:54 +0000
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
X-Bugzilla-Changed-Fields: bug_status
Message-ID: <bug-217696-215701-69KSBqwbAZ@https.bugzilla.kernel.org/>
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
             Status|NEEDINFO                    |ASSIGNED

--- Comment #18 from Artem S. Tashkinov (aros@gmx.com) ---
The touchpad troubles have been solved - I needed to enable far from obvious
options:

CONFIG_PINCTRL_AMD=3Dy
CONFIG_I2C_DESIGNWARE_PLATFORM=3Dm
CONFIG_I2C_DESIGNWARE_AMDPSP=3Dy

Thanks to the person who created this page:
https://wiki.gentoo.org/wiki/HP_Elitebook_845_G10

Sorry for the noise.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
