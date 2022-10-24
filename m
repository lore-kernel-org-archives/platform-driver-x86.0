Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E4FCFA373F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 Oct 2022 16:01:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232556AbiJXQBp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 24 Oct 2022 12:01:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231866AbiJXP7o (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Oct 2022 11:59:44 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E63005B7B9
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 07:55:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E82D4B819ED
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 14:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9BE55C43470
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 14:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666622973;
        bh=s6hlOQn7rSgLMAeZpQD4bpLVCEvQLyQQA257kYhnduY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=HLhxvef37RaosrvZZD1rr5B06C8waaTnRM6aEvlIdi4aJmcwhSU3iH+x1HTuVnrwK
         MlIjpm2c/8kqrCBmvDwGdPMqAXzJkg4Ah5stcYs91VADatB8JecQ9Mr3HgAC7Sn8YJ
         QtftGILzvVYYgBDLiNo/KfEHvImSqXcyd0GZUxjPGzDVRr0VzAKLLkxNN4/N1wCIlL
         Ic9OHA5FPkgTSOe/oDN3ksREm6aOrdHLcxqGDDubLHd+4aWTx5KI71l3B7Qk1fC3km
         WXO115NSLYJ/jWAU/y9++rIA55en10zNGj6OF11Slm7xSKPlLo5CMRzOsS8r3ojl7R
         RHRbfUaaKVIkw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 87C9FC05F8D; Mon, 24 Oct 2022 14:49:33 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 203191] The fan speed reports to 65535, despite the fan is
 stopped
Date:   Mon, 24 Oct 2022 14:49:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: s.fabri@deeperception.eu
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203191-215701-CBsj7kSxpX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203191-215701@https.bugzilla.kernel.org/>
References: <bug-203191-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D203191

--- Comment #12 from Stefano Fabri (s.fabri@deeperception.eu) ---
Kernel 6.0.3

- cat /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon7/fan2_input is always
fixed at: 65535

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
