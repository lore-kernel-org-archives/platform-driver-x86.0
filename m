Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0473C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Mar 2022 05:46:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236943AbiCWFrk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Mar 2022 01:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbiCWFrj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Mar 2022 01:47:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 277AC710C8
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Mar 2022 22:46:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BDC94B81DC9
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 05:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 645B0C340E8
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 05:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648014367;
        bh=QIP17ICUJSGXm1byl23fwlTKT7Ub/ZjbuJUA0eSRwuk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ohVDtRrSYrsLpexC0ZzkNZ77jx56wj6gHuP96KCYNYvYKrUxeQeMJY7buMDivRRpJ
         AbU77lWe+lIMV8Hgilc1gfDlIEpKCYylmvj9cllkH0qVaug70cQERTTcUa3gxTKkRw
         b+0awOMZXzolbapO4AfhPSSjoa8olBZm1Ygum24YyDfBAsHZ6IJg9Cv1IH0P7llYTF
         qAOQ50sfBpZPLQdL5iPjtYOY7dzI8S3cERPAVnW25fCacksMQtfAH/51SU8/wb6SSu
         73Ny6GotIVAPtBDcqvNx60Xs3vAdycBOMGFn7d8m4XUz0tvPODNeTHdvuUWSjqMvdH
         7eVFqDH9uVwkA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 441C0C05F98; Wed, 23 Mar 2022 05:46:07 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215730] acpi_bus_register_driver() does not work on Alder Lake
Date:   Wed, 23 Mar 2022 05:46:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: xuemin.wu@dbh.dynabook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215730-215701-lLvE0KzOqS@https.bugzilla.kernel.org/>
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

--- Comment #3 from xuemin (xuemin.wu@dbh.dynabook.com) ---
(In reply to Matthew Garrett from comment #1)
> Can you attach the output of acpidump? It's unlikely that this is down to
> the CPU, but more likely that the device ID has changed.
Hi Garrett,
Thank you for the infomation.
Please see the attached file above.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
