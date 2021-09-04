Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 641B4C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 21:07:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3AD9F60F45
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 21:07:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbhIDVIc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Sep 2021 17:08:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:55890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229708AbhIDVIb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 17:08:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9F82760F90
        for <platform-driver-x86@vger.kernel.org>; Sat,  4 Sep 2021 21:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630789649;
        bh=QHfOsrRT9lToYodSewkydkHBJI+gj9KiuFnOFK8g9pk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ab7coJaAVB1Ico/lfdkqXjbT1gNmvud4Nk+29R9N229zNvUIgDtII/lvJdtJAcu5E
         Q/Oc0Bsbt6hE5nj+L+3LR/ra+HoO0LsvqTj72wMxMkHY+7uEamocJdWgY1uiKcZShB
         IbN24b85h45eRDgNtPBomm6MZjxCAgSQrCMOMzssGO9V3XMt7vEAY9vxZ/qX/+Unrn
         uf+bLm32eCFEkw7M6ZCw0xWqjMmGflF2MzlBw52bex8z8c7G01CcpBALNVKc0qPPBL
         HEaz9aIyhjBhAkTDU6tBMxYuJwUgaWVMnh2LzzSWIXsjEs850MvCM7q4gia4tP2Dw1
         5ieXU8vyH1dFg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 04 Sep 2021 21:07:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pobrn@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-qpfA9SsMu8@https.bugzilla.kernel.org/>
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

Barnab=C3=A1s P=C5=91cze (pobrn@protonmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pobrn@protonmail.com

--- Comment #89 from Barnab=C3=A1s P=C5=91cze (pobrn@protonmail.com) ---
As a side note: using dkms is much faster than recompiling the whole kernel.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
