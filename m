Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B056C4320A
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Aug 2021 11:45:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 788D461037
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Aug 2021 11:45:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236404AbhHCLpZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Aug 2021 07:45:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:35714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236332AbhHCLoz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Aug 2021 07:44:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 46375610A0
        for <platform-driver-x86@vger.kernel.org>; Tue,  3 Aug 2021 11:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627991084;
        bh=s02tD0y7OdN2473cg8cOEgA+urqFTg6HItbb5lxiCPc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=qFzECPwFOM8SIojT1yiy52/+mnl7eWWNFLT88lmlVqkmRPsbzhRMby2cWVb4p/18R
         MXp40Yefzzc7MMEfGusxBzLEOZTZp9buG+jBrgrmXF02cngmM2LIw2mQEM+hDTf+SD
         AJRkQ5bvgE51cmv+rZ5GwKq6M2u+UriqNr6fEgyiHLRsGo0braKk8qlIfRugh5DpWs
         XgaRmVnTEijUHz+RCFxZS3MkYaClnH389TA0DAUoAKLvxiRaeRpyZ+M3DlrD0qWZfb
         u5WF5tLIOFA/I1l3p1TySjHo9WW+jKDHa94n7ztlCz06Qz9e4BQyxZwoM0ss1oxQIJ
         G55E2de8n4gVQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Tue, 03 Aug 2021 11:44:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wse@tuxedocomputers.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213579-215701-a8szQ6HjzF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213579-215701@https.bugzilla.kernel.org/>
References: <bug-213579-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213579

--- Comment #48 from wse@tuxedocomputers.com ---
More testing with same result: Hardcoding the adress to 0x2C works on widno=
ws,
but breaks on other values including 0x8C

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
