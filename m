Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 964ADC4332F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Oct 2022 07:32:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbiJNHcY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Oct 2022 03:32:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbiJNHcY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Oct 2022 03:32:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4147A1B8642
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Oct 2022 00:32:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C59F461A34
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Oct 2022 07:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E0D7C433D6
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Oct 2022 07:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665732742;
        bh=XTrBrGmfX4Gz5oIWkpVi8Lw0JsEPtaKr+QVVJsQd/a8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Go2skOutKbNAfmfib91vvHEPrTZQm0daeQbAPab9h546aDj2d1+qjl2Fn61hrfxUy
         DJs1R4QjsGqaNFkhZPGcdSyUDtjwTFSeISoxztjpRg9rMQcvyKdVfUi6V3M4rDZW2T
         vgli1BBQXr76p/CwKgnKZ7i9vdDpoWNE3puEJ/SSJ88114CqHZzb0o0zlsxNT5T0ax
         oJhFenGYhuc2WI2CxkHxt+3lV//Sc/g12xGhlumwI0+2nwxHOFewCuZ9z0FzyCVNTB
         LfkZytM7ORsoTJl234ZWKUAuUKV8tqOyiNNdnuD+ug9YQn7+qHXz6nNkVsbjMKozhN
         lxbJFNtQxg5Og==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1E5ACC05F8D; Fri, 14 Oct 2022 07:32:22 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 14 Oct 2022 07:32:20 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-204807-215701-SY9xnz4kXr@https.bugzilla.kernel.org/>
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

Denis Pauk (pauk.denis@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #301099|0                           |1
        is obsolete|                            |

--- Comment #257 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 302999
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D302999&action=3Dedit
Asus WMI for nct6775 v5.19 base (2022.10.14)

Hwmon changes v5.19..v5.20 + nct6775 locks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
