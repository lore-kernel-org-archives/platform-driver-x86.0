Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD94EC43334
	for <platform-driver-x86@archiver.kernel.org>; Sat,  9 Jul 2022 18:02:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiGISCG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 9 Jul 2022 14:02:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiGISCF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 9 Jul 2022 14:02:05 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A7D61C932
        for <platform-driver-x86@vger.kernel.org>; Sat,  9 Jul 2022 11:02:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E11D7B801BF
        for <platform-driver-x86@vger.kernel.org>; Sat,  9 Jul 2022 18:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B743C341C7
        for <platform-driver-x86@vger.kernel.org>; Sat,  9 Jul 2022 18:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657389719;
        bh=2QMc1nnx2Uw8LKiGKmbHV1wJvBRUy3xCNO51Y9gHDxo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=s8CCssL3rt9/XsjK4A9Uv0whkjJIwh/4R06SK/VIaaKRG7OtswLPyXXG+n7p96wwv
         vgWekin3QDoIieozQNOqq2sNCQsLwoiJHjPsqEX+OVVYqvy+Hwu8Q7G/FAcwSLScO4
         KxCBj/UpfN6EoScdvtbYF87QsQVSKrh1N6lGA0Z9N+XSC7Fd9z+91Oe5dRF5E4PfF5
         V/1cVgcRLI5QDPtUY38/8rkpyQ5zGpiharoRp649lVu2p/mT6lFixk0Bq5IMbjnfOO
         pxdbFTQLjV1DEBX+yEQSCAHD0jxxdfY6MjMpQ6AV9jp95+41fdEGsm4kN+vBLTc9BI
         ffTBUiXO63koA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6A133C05FD6; Sat,  9 Jul 2022 18:01:59 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215993] Serial Bus Multi Instantiate driver fails to allocate
 SPI device CSC3551:00
Date:   Sat, 09 Jul 2022 18:01:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215993-215701-55Y57VmNzI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215993-215701@https.bugzilla.kernel.org/>
References: <bug-215993-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215993

--- Comment #16 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to Supasak Sutha from comment #15)
> Created attachment 301381 [details]
> dmesg after apply andy's comment#13

Thanks! I have three news, one bad and two good:
1) (good) I'm quite sure the above link will fix your boot issues on v5.19-=
rc5;
2) (good) The last change with error code fixes serial multi-instantiate dr=
iver
to probe the codecs, but...
3) (bad) something else is still wrong (or missing).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
