Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CF4C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sun,  3 Apr 2022 19:07:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359869AbiDCTJh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 3 Apr 2022 15:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231417AbiDCTJg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 3 Apr 2022 15:09:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6872338781
        for <platform-driver-x86@vger.kernel.org>; Sun,  3 Apr 2022 12:07:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EC9EC60B06
        for <platform-driver-x86@vger.kernel.org>; Sun,  3 Apr 2022 19:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5AAB7C341C5
        for <platform-driver-x86@vger.kernel.org>; Sun,  3 Apr 2022 19:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649012861;
        bh=/ODNIwpUOklxyfTd/xHsr9wSzELPNqm8qBtpqsY9Yec=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=pfv1eUdmYw1sDDSSTIh98ZKHs7bEWbZOI+ixDHaPHeXvlzMICV3Ex0rFOT/mZyDJj
         VIMr1DbbfJxM7zaBXcew5V5aG+79uu//8x8ZEoKh8t/6DtsrnqMRA7zRdmyHyvRDg/
         LmcqcsgxHs1lVikFcjElUCblhU0EFxMcoQi3uYRAR0+ugvybcLF9JojsBB5WKFmqFw
         Ed3elrsVwi6XNP7Tmn7hLc3mCzsu8oZsrjpLRgokSqBMvKe4MbEOvyC4e8xVWqthOz
         F9plyuPiRDwS5r0KLVpzS1r92urzEWDIs//VMa7g0vfVXy2HMOG9i0RtPOni54P78+
         x5ylmIqozKp8A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4A53CCAC6E2; Sun,  3 Apr 2022 19:07:41 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 03 Apr 2022 19:07:38 +0000
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
Message-ID: <bug-204807-215701-HWVbYqnX2G@https.bugzilla.kernel.org/>
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
 Attachment #300506|0                           |1
        is obsolete|                            |

--- Comment #231 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 300687
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300687&action=3Dedit
Asus WMI for nct6775 v5.17 base (2022.04.03)

(In reply to renedis from comment #228)
> Thanks all for the effort en support. please also add:
>=20
> cat /sys/class/dmi/id/board_name
> PRO H410T

(In reply to Hubert Banas from comment #225)
> First I would like to thank all of you who contributed to this patch.
> Special thanks to Denis who took it upstream.
>=20
> I have another candidate and was hoping we can have it added to the patch.
>=20
> $ cat /sys/class/dmi/id/board_name
> ROG STRIX X570-E GAMING WIFI II

Could you please recheck with new patch?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
