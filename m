Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37909CE7A89
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Sep 2023 09:12:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232764AbjIYJMu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Sep 2023 05:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232821AbjIYJMi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Sep 2023 05:12:38 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE4F61BF
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Sep 2023 02:12:32 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BAF72C433C7
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Sep 2023 09:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695633151;
        bh=UrOtkpVpGsSQGkg0OdOztiiL5VzLVCx3uLOEluMSTbc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=m07jHsl9vdeMpeeoJ+vR3v1P5KZ4eEEqgsjnlontLpCq72b9/nr1Y55aEdLyGiEmo
         h5jp253nLtMET5c2fiJl3G2LsbLT1RA8jsHYe27pIlbAXHcHwFHhTpEHIRnom6dTXx
         XnYCHNQwAdI9w6sGie774I+0YWB+3XLiljEQmACNinHWOHxbcWExxohrZ9dikLlfds
         +b15KKfiu6DQLP88gRVubLIfCYbzoE9qNHY+gscucMlzABdvyTL7qM1Jy06BkcxS8o
         MVjN4RI4/LXip7FIyp+AHQbbT2H4N/zcR8sR39N2OjfcAFaC9UFXvuKypdIeFVGADZ
         RDKpRj+369P0Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9B392C4332E; Mon, 25 Sep 2023 09:12:31 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217947] WARNING at drivers/acpi/platform_profile.c:74 in
 platform_profile_show()
Date:   Mon, 25 Sep 2023 09:12:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jirislaby@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217947-215701-1XB9A4OeET@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217947-215701@https.bugzilla.kernel.org/>
References: <bug-217947-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217947

--- Comment #1 from Jiri Slaby (jirislaby@gmail.com) ---
Created attachment 305147
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305147&action=3Dedit
DSDT

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
