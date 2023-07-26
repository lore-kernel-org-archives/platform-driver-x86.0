Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 652ABC001B0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Jul 2023 10:03:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231578AbjGZKDV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Jul 2023 06:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231421AbjGZKDT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Jul 2023 06:03:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5F01BF
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 03:03:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3A10861A2D
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 10:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A095CC433C7
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 10:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690365797;
        bh=gdwJY0ZCSXcqtbtHRHwmNPrIC9GUFgtH3mnNe7yeMf0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=RabWsPYZa3qVZLqU8QALvjavt/CekFJO5xVOnM51HHzo6xvhKOnqchm4sPjZFzv5G
         P5iWDKFEM3bxhsmnh+t/AxLacHw0/IRlxzLBogIwFQTU3fMRaeo/jwYASf9GG3t9uC
         Hu8G5b8pTeKyBcgSClZcc0dpaALvENO1a1MyWFY5hJqFErJAQbN3UDbACP30Xir9UV
         l1YlxUtl6+RAbYEgfCPHfA2VjlwzG0cisa9xejXpCaXEdh7E9cDcKRSUEk3/fHGei8
         SOyISabYmZ1NKqz0w4+aX+4KSo8r0F6NTMqF3TUyVbezpDdBHmCHby7WdlrvLCBHu5
         oFZB5XqgGSyMQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 77759C4332E; Wed, 26 Jul 2023 10:03:17 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217696] Looking for a way to enable power saving mode for Ryzen
 APUs, along with limiting the upper temperature and total power consumption
Date:   Wed, 26 Jul 2023 10:03:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217696-215701-IL1l8aIeLE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217696-215701@https.bugzilla.kernel.org/>
References: <bug-217696-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217696

Armin Wolf (W_Armin@gmx.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |W_Armin@gmx.de

--- Comment #17 from Armin Wolf (W_Armin@gmx.de) ---
You might also check if CONFIG_I2C_HID and CONFIG_I2C_HID_ACPI enabled.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
