Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D753C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 May 2022 19:18:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238850AbiESTSE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 19 May 2022 15:18:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236174AbiESTSD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 May 2022 15:18:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8E12954AD
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 May 2022 12:18:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 62F8761BFB
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 May 2022 19:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0ABFC341DB
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 May 2022 19:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652987881;
        bh=yK+VjZ2LWikJ1xnXtUkqZH+TYNP0kzVI85+rJUpkL0U=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=VGmKVsgSKi9dnAkmr3bqNgj9uHVM0YK5ivu3TtszUV+vPjryH1fy/u25NxtUgtmXe
         8nHSTEV2QtPw8zQk06Z0dJDgBYJ3asaodiX8Ye0N+yuj3gk3RjRTVm9RAdbJxJlwAG
         7Y5tpZKhyiG2+kHKg+OAmtyxYSW3PinBMBa9Okbq2xHK3R+dtHmmWGkUOLB85aYg/H
         04h8Opifd4fNf26Y5zaoDT6NXs5x+z5r044nDPyWJ0EUYsI8ly+LsX4QUPY03/9mXz
         n172QU9YgAecE8bfe/NLn0aRQKfRG3lGw17/Cdc+TtVI8w+sp8QpQHXJDk+1iGP179
         MtEGqdr8I00DA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AEA87CC13B3; Thu, 19 May 2022 19:18:01 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 19 May 2022 19:17:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pauk.denis@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-oSH7GQ3nHH@https.bugzilla.kernel.org/>
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

--- Comment #242 from Denis Pauk (pauk.denis@gmail.com) ---
(In reply to Mikhail from comment #241)
> Denis, please answer the question.
> The driver `nct6775` I should manually loaded after each boot? Or it shou=
ld
> be loaded automatically?

Driver should be automatically loaded on next reboot after modules_install.=
=20

What do you have in dmesg after 'modprobe nct6775' or 'insmod
<path>/nct6775.ko' ?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
