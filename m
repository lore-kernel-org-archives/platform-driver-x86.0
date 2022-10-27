Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80463FA3740
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 Oct 2022 14:58:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235522AbiJ0O6n (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 Oct 2022 10:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235770AbiJ0O6d (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Oct 2022 10:58:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38DFBD73E0
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Oct 2022 07:58:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AFF756236A
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Oct 2022 14:58:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22C3FC433D6
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Oct 2022 14:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666882710;
        bh=w4iAPyMMkU8Wb375ZoBvTZBvcVXWuzpoy4xUbYibUcM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Dn1upbo8xsua3K2r5KV0hINr4pOo0Tp9TXT7463cLrArI0vsbUjDtGzmdo3tw93Dv
         3ffEhQ04nxyUdUeUxrZpgNZZ8+Dm8zMaei2osS+4p8/GVlwGvlDCHrQpcHEK6G9DyP
         f5pwo/duxE8HbUyawBQZeBPZQhy3EGhpK9q7QzhIX5StWt6G5R78Q2EEjbsx4/rRVU
         WZWnGNn+7T0k+agnd2Ai4EXhAjNvTkxoExunIWOAkfHjVvUzcCeOpZ1OiqMZcLd10V
         HKw20JxCNVxRqjSAwWfl8/vtNPSSszn7Xvq+ETdu+7IJgn5Cfxmp0on9BsoqqZv3yJ
         LLJ9JyKE6GeEA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 12F22C433E6; Thu, 27 Oct 2022 14:58:30 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216468] hp_wmi: HP Elitebook 865 G9 after update BIOS to
 version U82 01.02.01 Rev.A causing rfkill soft blocked wifi
Date:   Thu, 27 Oct 2022 14:58:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to
Message-ID: <bug-216468-215701-QHBdtq8AGO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216468-215701@https.bugzilla.kernel.org/>
References: <bug-216468-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216468

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Platform                    |Platform_x86
           Assignee|drivers_platform@kernel-bug |drivers_platform_x86@kernel
                   |s.osdl.org                  |-bugs.osdl.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
