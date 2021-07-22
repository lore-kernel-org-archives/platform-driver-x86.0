Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9037C6377D
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Jul 2021 12:08:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C597A6135D
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Jul 2021 12:08:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbhGVL2G (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 22 Jul 2021 07:28:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:51930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231724AbhGVL2F (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Jul 2021 07:28:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 807A261353
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Jul 2021 12:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626955720;
        bh=qsm1PHp/X289uqkkFoZuINQgMtPtMg128Fgy8GSMp5o=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Bjg8oauJAhz/jlB2nOTvhdTFFcqCwJrHqqJ73pPdnafEr+zsWIjMkgXLRLSNCPLNw
         zSZ7zVFYKoMBYd4LvRqZIQblU+/9wpnLqyboAKJtxHor3OZbc/LyclFmmTU/d4xWMT
         v4sLR5nlGMBdbgJKgHSapXJ6fgnNrPcNHSRS+1ArdWlv3vXGgFe2k/tHS4sYkh/U1x
         kTkwSmczyJO2nFHfOL+w1n5hWlgRJ+pRMC8+9F/zeljcLxchbr86NHIY+d+Zby5cYl
         +Q4oIA7rGMcaLCSqRqJRCNfnHUNo3qbDWgb35NoyCa1QspGW/Ao23rg8rwb6cP98BY
         cguXGUWQrwn6A==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Thu, 22 Jul 2021 12:08:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rod.thomas@talktalk.net
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213579-215701-5BJe4ychIg@https.bugzilla.kernel.org/>
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

--- Comment #37 from Rod Thomas (rod.thomas@talktalk.net) ---
(In reply to Riccardo Mori from comment #33)
> Created attachment 297991 [details]
> dmesg working
>=20
> Ok, with the map from pin 44 to pin 140 it is indeed working
> So the issue is actually a wrong pin number.
> At least now we have a workaround for this.
>=20
> Thank you very much to everyone that helped.

Sorry to be a noob but just want to understand this before I embark on my f=
irst
kernel build.
My situation is identical to Riccardo's so presumably I can use the same ha=
ck.
However I don't fully understand:
a) Where 44 comes from - is this the GPIO pin that corresponds to acpi pin =
57?
b) Where the replacement 140 is obtained from - is this just a free pin?
Thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
