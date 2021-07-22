Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D4CFC6377D
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Jul 2021 13:30:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E85760FF2
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Jul 2021 13:30:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232101AbhGVMuI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 22 Jul 2021 08:50:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:44754 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232064AbhGVMuH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Jul 2021 08:50:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 59B6160FED
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Jul 2021 13:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626960642;
        bh=R3St8WYY3jGi2eK9RAoeFOSuAAlQKD4oiTndHP0Upqg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Su3RX4DyT1i1QNtmIAEZRxWkE6cNF2x1qcmFJp+f37BJ7+pjmRJHFuEXAthxYFMQI
         cGzW656I3y2Mi2hr0TaUzZuMX1sdkYClN9CsitLh0zAk+yYHh8pkEKs7rz5tbP7wdc
         HyBSZPPxlSW5F2D15ynmSETKWD9KkSBpFbZcNL/pmdaGfTTFvlYvF3grkf4YiX8mjO
         ZHnpJ6aMU2/lwaGyyUFFvFQs+qhCPnPOL8+Ot4ToD/AOxiKuSpOpAmo/NfKp1law2B
         YIokn1uhb/N4sz4hl5K3Y0ixEYxqmo9kgXb7/q/wNJAtsEX7dOjaX7DVimzBCxxKPD
         AAX1lNHgWOplg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Thu, 22 Jul 2021 13:30:42 +0000
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
Message-ID: <bug-213579-215701-s1Bq1NrXAv@https.bugzilla.kernel.org/>
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

--- Comment #38 from wse@tuxedocomputers.com ---
a) CPU Pin 57 =3D GPIO Pin 44
b) CPU PIN 37 =3D GPIO PIN 140
I don't know where one can look up the mapping CPU Pin <> GPIO Pin, Andy
Shevchenko did.
Pin 37/140 is not choosen randomly, but it's the pin the touchpad interrupt
line is physically attached to on the mainboards of the Tongfang GMxTGxx and
the Clevo NH5xHP.
I found this out by looking up the schematics of the Clevo and the linux so=
urce
code: https://bugzilla.kernel.org/show_bug.cgi?id=3D213579#c28

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
