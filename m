Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A10C433FE
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Oct 2022 18:56:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbiJNS4V (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Oct 2022 14:56:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbiJNS4V (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Oct 2022 14:56:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EEBD1D066A
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Oct 2022 11:56:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0D38EB8241C
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Oct 2022 18:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE391C43142
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Oct 2022 18:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665773777;
        bh=snirEDWmPRipEqOZr9SR+m7PCfIrulGEhVhbCNJ2RxQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Ji0aYq3ozdMs5gBjuVviouiusr497egfjL+peDP9MHSI4eOes41ce8exQTFYQNX36
         5RTa0ofmYyYLA94YHMtlCwO9cHZrl2zFLcq0S95SQcCa4RiJ99l9EHCPz2QH2cSogZ
         F3uB4oeo5Gm4yCJrC/uFGP6ytl5l8sW0RSbW5BhdPGzkEm3a5+vcRbZY/fomrIwa5Z
         ymwHMCGlSgX3DeZSnjndefPpcdu9R/74AR1n9w3OD3HnfTZBGzvR+U1BiAJ1APBiFb
         D1MxiLlt47HAgUsCL4vUexTtZ7mLeNkMvCcZV+0qzND7t3VJyNemuG2PAQoNHDNmxQ
         vXK9jfFgyOPTA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B0F3EC433E9; Fri, 14 Oct 2022 18:56:17 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 14 Oct 2022 18:56:15 +0000
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
Message-ID: <bug-204807-215701-vcsBrOHDjn@https.bugzilla.kernel.org/>
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
 Attachment #302999|0                           |1
        is obsolete|                            |

--- Comment #259 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 303000
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303000&action=3Dedit
Asus WMI for nct6775 v5.19 base (2022.10.14)

(In reply to Vladdrako from comment #258)
> @Denis Pauk
> Something wrong with the patch, it has only commit headers :)

Could you please check now?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
