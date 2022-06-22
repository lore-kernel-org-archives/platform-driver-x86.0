Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCF5C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Jun 2022 08:32:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353208AbiFVIcn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Jun 2022 04:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351464AbiFVIcm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Jun 2022 04:32:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF6081113
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 01:32:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7C0A8618A6
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 08:32:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4FC7C34114
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 08:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655886760;
        bh=xW5tAxFfnxDZXfAcNeuu0OG7H7D5JIv1AYCN26AMttQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lUgB56tS9H/PXros3tAeHlJ/7RMgWjkOywN6MneV2y1BzQxq4YI58wbr67fFayNFm
         1wPtGBR8fgPIrnPaAb4dWELRc1uRvdPi1+i6JZ4YUdHwoW0BHLulZ6a0DEVp1fvwJd
         IWtzNAlSLfKtCdqK5oFgxc6m6QN1QlGcy6dBvU75TN/648zoK+iTcYq/OrGckCg/xT
         zzDIj5jaRnxil0v23AUrgE7E6EOCMN+ftocoOMCX9wtQ7Y/Fs+UAIa2dTfPOO+q01E
         JQWjh+2kdKGklciT/Dabv7A/hPNFxnr69GCJW+6kK6EmePrh8vCj1I2KYGu8F6HB3W
         BhrZK+Dp2Cxsg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D2708CAC6E2; Wed, 22 Jun 2022 08:32:40 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216163] cstates: intel_idle.max_cstate=4 required to eliminate
 flickering of the display on the laptop model 3Logic Group Graviton N15i-K2
Date:   Wed, 22 Jun 2022 08:32:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kovalev@altlinux.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216163-215701-gE0AMiBg2H@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216163-215701@https.bugzilla.kernel.org/>
References: <bug-216163-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216163

--- Comment #2 from Vasiliy Kovalev (kovalev@altlinux.org) ---
Created attachment 301251
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301251&action=3Dedit
/proc/cpuinfo

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
