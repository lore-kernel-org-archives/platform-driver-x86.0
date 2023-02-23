Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF89C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 23 Feb 2023 21:32:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjBWVc2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 23 Feb 2023 16:32:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjBWVc2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Feb 2023 16:32:28 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6285356505
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Feb 2023 13:32:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3B751617B2
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Feb 2023 21:32:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53C6BC43446
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Feb 2023 21:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677187946;
        bh=l4vwhtI3QSKmVXuLK5SQuhwIb1gotqGcbcUxjbtgjiU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=BEyBzjvwwCT8fiMJENwrzdw9iSlGglmNQF802E27Uka4aDuT/kVJHcCCGMM0/WjC4
         9Okw7miAV1Umv2qiL+Xcsv1C8E+JrOH04Ic1/h3vkLjgPWOOFkCHcKOJtShlaq+cX3
         6Skr+NJDiClm1tvI47Y1eR9dohRK7d/q44jsDWTfIPNZd6w4CyHrV8aszFUeFTZm8r
         O3tYKa6mbyjlq6vLUyW7Z9VJB3XT61xxrjlF/GWYAplvPnWkVeUr2KPtFXvMuhHpTP
         pdQq0RK339jIBiHsJUh21GDM07GO+sYgIGxOnaGbok2PCtq+As/63kGHGIojCNpEQ5
         P5z6Zj83KL82g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 445C7C43142; Thu, 23 Feb 2023 21:32:26 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 23 Feb 2023 21:32:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: de99like@mennucci.debian.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-HuJl1RUxbF@https.bugzilla.kernel.org/>
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

--- Comment #299 from A. M. (de99like@mennucci.debian.net) ---
hi all.
I have added my mobo a week ago to the list. It works fine. Someone may add=
 it
to the whitelist.=20

# cat /sys/class/dmi/id/board_name

PRIME A520M-A II

Thanks. a.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
