Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271C5C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 10 Jan 2022 20:17:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243965AbiAJURU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 10 Jan 2022 15:17:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343500AbiAJURU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 10 Jan 2022 15:17:20 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F36EC061756
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Jan 2022 12:17:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9ACB461447
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Jan 2022 20:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09DA2C36AF7
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Jan 2022 20:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641845839;
        bh=NPFHAT8w3YoClZpL30+E+pVZt2ZXcJPTvWUx7/jWoSE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gAC+FS0a0zVW1aHF9vBvxqbOvvRpxBmgQBPz7OKix2NBgIDedKIDV1Oab1RjWQFIm
         tlgofOap32K0jmxxOEMhghgC/Ye/Go4LTz37D/m1/Vbbh1WSnTNowAE7MZ+Srr1lFp
         8nhrsvfsm6UEosoetH1zUG0BBull61uEOz5FO1Emv1jWxUPlLEO+eXO1BvQEjbzmWq
         5KspRrF4Y1rRuQhojVjvvp6F6LQkrADbynEcwIqDx6baoBgrw1gV6klYUPL7doV0J4
         QjXdFq29GL/NQq3mwPgrTKT9CbyOtCxeuh+AcYeSSEYZaMefjz6M9mfKFal2H0GNrg
         WeXdGmLXovGeQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id ECB8FC05FF4; Mon, 10 Jan 2022 20:17:18 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 10 Jan 2022 20:17:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jonfarr87@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-pNPfl0efof@https.bugzilla.kernel.org/>
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

--- Comment #204 from Jonathan Farrugia (jonfarr87@gmail.com) ---
(In reply to Jonathan Farrugia from comment #203)
> As of Kernel 5.15, and now 5.16 too. My board no longer reads my chip eit=
her
> - nct6798.
>=20
> Works fine up to Kernel 5.14.21 though.
>=20
> How can I help re-adding this support back in?
>=20
> Thanks

Forgot to add my board details:

cat /sys/class/dmi/id/board_name=20
PRIME B550M-A

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
