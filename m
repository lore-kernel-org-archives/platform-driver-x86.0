Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A2FC433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Mar 2022 03:57:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239137AbiCXD7J (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Mar 2022 23:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231992AbiCXD7J (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Mar 2022 23:59:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 828E9939C7
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 20:57:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 186D161964
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Mar 2022 03:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B1DFC340F0
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Mar 2022 03:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648094255;
        bh=Goeullsdc22Kd68BSSI/ueRJo/3itcntYVpYe94D0bk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=G8XbSr3VRyruLGGJjiI1wC4/MlPV3GV5pdSq3lqcfpUMo8otFIrh2QGl42ZrkcU83
         4AutijyR9jLPFbSmdb+NfV4oECg+nb7rFBHVmFTbyLg2KNuabZqfsDfp6usnJkm1Ot
         QIoiWisbwgJNJ8TVGghDW0himdUxNYkAr15jTOdeBnQBUIqciQ8WcWTZr9ckHNmtBe
         2eFQkIMiWQAvkOcjA5Nc1fQH1GzYga/GIcD6/6WFCMdIzH3xo2YsgBFOw5ntA0czEj
         RKKhH6ypZ6dgijLnM35qeN/MM3jWIKSTwOJHlCiF0EOeX++vaMGRy8nskFO7eFmSGL
         epqTjkntEGoUQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4F5C3C05FD0; Thu, 24 Mar 2022 03:57:35 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215724] acpi_bus_register_driver does not work on Alder Lake
Date:   Thu, 24 Mar 2022 03:57:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: xuemin.wu@dbh.dynabook.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: acpi_power-other@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215724-215701-npB4Djn96i@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215724-215701@https.bugzilla.kernel.org/>
References: <bug-215724-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215724

xuemin (xuemin.wu@dbh.dynabook.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
