Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BE4C64EC4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Feb 2023 22:46:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbjB1Wqj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 28 Feb 2023 17:46:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjB1Wqj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Feb 2023 17:46:39 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21CD431E16
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Feb 2023 14:46:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A772161225
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Feb 2023 22:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3EB7C433B3
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Feb 2023 22:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677624396;
        bh=DxeyK2mISFktwrJih+V1mCchgQdP4OzRD0O+JQtStVU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=B2jky+37DGMIVuGPRB5HS3xPt9eYSRgW8yzwNcTw72YjJ5YYohU7sIQKfpU1HbbnN
         iuUp/ZfHwfQxhFLSyyMrxmn5WebJ47WFz4TxORwPFRzxPXXECkQ4oHsiTvX5w1IRQl
         bfN7M6ReZh3ApL3Q4eg1THUUUXrv2DiBcqQWTHzy3kdSAF36n0LRaBUBlE9tPakFf2
         zKNVpUfPpA0Y+9dMOCJC0dY5lJhYJYI8FiUjfxCHpR2ykBIIXfbCYboMTyGMDKzixN
         H/6RVp0ioIWRlJUaHBu9YZs0H8JkZZaDOGHZdtTj8rM+MRQP8BSg0Q3zyVGlY0xzmS
         0mgOAcsYYFYEQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C47E5C43144; Tue, 28 Feb 2023 22:46:36 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 28 Feb 2023 22:46:33 +0000
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
Message-ID: <bug-204807-215701-88I4aCBKZ1@https.bugzilla.kernel.org/>
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
 Attachment #303789|0                           |1
        is obsolete|                            |

--- Comment #301 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 303816
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303816&action=3Dedit
Asus WMI for nct6775 v6.2 base (2023.02.28)

Add A320/B350/B760/Z590 boards.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
