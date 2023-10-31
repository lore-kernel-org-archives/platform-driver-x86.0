Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A90E2C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 31 Oct 2023 18:35:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbjJaSfr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 31 Oct 2023 14:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231180AbjJaSfr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Oct 2023 14:35:47 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 006FEB4
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 11:35:44 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9FFD2C433C8
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 18:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698777344;
        bh=JrHGOzWKU81v3rJV8GhxrVu5X4AfD5ldPYrRR/ESqKE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=qNFbWLWNiLlK68RQV3Jxs6gKsjXEWPFwkqC+toi1lIFlm2LJAwrcw7l1xbt8jaHA5
         6tjnKD6Z2S/IrSX8jiPN9l3NwVQVIoyx9/iRX2Zf9WJncWg+m/zLcViYU988aoO37d
         dhEX6j85yPYDs7dHEDvPjxrD8AblNNsvUiPnbICCkUhuB5LrQ1egovoo5C71tdh9Wd
         npETjV/1UpyHhuw6HhvX9+YXtpDTwCKZA+PD2M3S9edxLvivpGnDNoMlRbhjpNq2Jf
         FP/DudSLwwyv64sRJwWcwfksKdlIV15qUqR81jHnNt/W8cJInuZ1a5xhPGkoAWCBv5
         POfjVVEHe5RbA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8F0E9C4332E; Tue, 31 Oct 2023 18:35:44 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Tue, 31 Oct 2023 18:35:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ertugruluyar.personal@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218092-215701-4SuOzUf5bl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218092-215701@https.bugzilla.kernel.org/>
References: <bug-218092-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218092

--- Comment #5 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
Created attachment 305344
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305344&action=3Dedit
dmidecode

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
