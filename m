Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F85C433B4
	for <platform-driver-x86@archiver.kernel.org>; Fri,  7 May 2021 20:18:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C59460FD8
	for <platform-driver-x86@archiver.kernel.org>; Fri,  7 May 2021 20:18:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbhEGUTh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 7 May 2021 16:19:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:45394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230021AbhEGUTg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 May 2021 16:19:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id BE8AB61460
        for <platform-driver-x86@vger.kernel.org>; Fri,  7 May 2021 20:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620418715;
        bh=K2Q5WwKByTIWCblmnSmeFJ9Xdt91MdgRhmKtsPk0fqw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=UXI4cVUiph4j+Afxwtqih1rkWlBo5foPIfF8cQjM0+5uW5xh8PI5y+SR/F9To+lwe
         C7d+0zwJiyvcx1+KzdJ08qGNxhFcoTInRo6lVv3A5hoVUaB/OGPmOjg4IuakELhci1
         Fu4RcNt9lrDg+wpQtNPK8C71Zwc6meTW2uJB6mHsJ3pEr2JWKdK4DWWBXWnnKIuWzP
         yMnk6IruuQE9o3wpAcIFKAgPqPXUGMT6t2eiWfV32Ka52bvlUyNuVO543L+Dg9KFUn
         OCndy2vvSpmhoxyqh5ObVUdGXQiVo4fm/zqwPqRhHrs7ecEPScmmYPZ8tfFrCs4TPQ
         72WQ+3SGW+xkQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 212985] ideapad_acpi: VPC2004:00: DYTC interface is not
 available. platform_profile interface is unavailable
Date:   Fri, 07 May 2021 20:18:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bp@alien8.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform-driver-x86@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc assigned_to
Message-ID: <bug-212985-215701-vNvvdinmqn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212985-215701@https.bugzilla.kernel.org/>
References: <bug-212985-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212985

Borislav Petkov (bp@alien8.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bp@alien8.de
           Assignee|platform_x86_64@kernel-bugs |platform-driver-x86@vger.ke
                   |.osdl.org                   |rnel.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
