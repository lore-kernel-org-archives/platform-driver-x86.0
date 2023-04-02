Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31020C7619A
	for <platform-driver-x86@archiver.kernel.org>; Sun,  2 Apr 2023 14:40:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbjDBOko (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 2 Apr 2023 10:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjDBOkn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 2 Apr 2023 10:40:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECEDB5B95
        for <platform-driver-x86@vger.kernel.org>; Sun,  2 Apr 2023 07:40:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 91F5D6126C
        for <platform-driver-x86@vger.kernel.org>; Sun,  2 Apr 2023 14:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EBCF2C4331D
        for <platform-driver-x86@vger.kernel.org>; Sun,  2 Apr 2023 14:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680446441;
        bh=PnSJgpv9CZBYVn93SgiaP3MY8S47eLPY6MfN5F3yK1k=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=A72dHkJi83pf/6i0CH15CjXpvZauWo3wpm8YfUuAQ0qVDopQVLdJPph/namIrovhF
         AqVC48xosVU0AkEg3s+hOU0L6KahhetczG38BQO4Z2Iw5V6FOxp1MO8ufcArHDWOHL
         B7da9pKXwQKMqT7/T4ayMJ3fx82SjK8Yiffs1TlPw5kV2udHluAnU2IWe9BSa1WnlY
         4sYw2URSPSk36oqf8UXBWN2YLBIWy7Vs/G211SD7KRyKoCFwpWGS0lUQw72JzIrlAd
         +OvccXqQWtzuKdhBXK3n18fN4oz8NPtchW9wyB3bXsx9hlM50i8Wvv+fxAVpZmmBHY
         sR+vfe5AZJPuA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id DC80EC43144; Sun,  2 Apr 2023 14:40:40 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 02 Apr 2023 14:40:38 +0000
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
Message-ID: <bug-204807-215701-7qPloUXJW5@https.bugzilla.kernel.org/>
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
 Attachment #304071|0                           |1
        is obsolete|                            |

--- Comment #324 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 304077
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304077&action=3Dedit
Asus WMI for nct6775 v6.2.9 base (2023.04.02)

Added A620 several boards which have uefi bios download link on official si=
te.=20

(In reply to barfin from comment #314)
> (In reply to Denis Pauk from comment #308)
I have added ugly hack for skip resource conflicts on "H97-PRO GAMER".
Could you please check that it works for your case?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
