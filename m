Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66C9C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Nov 2023 15:42:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbjKBPm2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Nov 2023 11:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbjKBPm2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2023 11:42:28 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27820137
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 08:42:26 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB0CBC433C9
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 15:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698939745;
        bh=FhC+cUqZ5NZ9X00D5XCsvD6C+6b9jtEA80CzQ7dx8zE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=r6BDxeCfaG/UDIBdCjtDHqycczdmfmPkqjqB6XOgsZAznBm5jXmXPNI7c7pWno0dz
         oY8LL5OnbSwu/q8pK92LkSeX3aXW2FTY/qdlv78c8COSVdSaQQ9dOuqELFBaukPbtG
         ZtkZNlJiP32VOFSFUWc8hwrvL3WemDygCAjjBXwWJw8QDzIU+cm5u/P5t7tEGIa9g5
         y/tyLSH7YpW21aKCm/i5X/e3TvJERG7pBgL/0J2UhPvu7lCTM0K9wi2q+ioyd1sZHz
         PQcRCKhD2/OVrcZBmjus2+9PwS+GX2IgfsvLQblEI7PrubqeNZaOiNFy+WsIyTLubM
         WVPe/kVOkd8nQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 97F14C4332E; Thu,  2 Nov 2023 15:42:25 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Thu, 02 Nov 2023 15:42:25 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218092-215701-RC6SthEzTn@https.bugzilla.kernel.org/>
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

--- Comment #36 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
(In reply to Mario Limonciello (AMD) from comment #34)
> You'll need to scroll up and look at the error to find out what's wrong.
> It's not in the tail of the stuff you shared.

I change my console setting to show unlimeted lines from 1000 lines. But I =
need
to build again to see errors.
If I give you my boot/ conf file, could you build the kernel and send me via
google drive sharing?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
