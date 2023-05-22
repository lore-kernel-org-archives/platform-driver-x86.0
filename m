Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE29FC7EE26
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 May 2023 07:52:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232062AbjEVHwH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 22 May 2023 03:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231678AbjEVHvk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 May 2023 03:51:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17F811993
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 May 2023 00:50:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 56D5861EA9
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 May 2023 07:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC3AAC433D2
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 May 2023 07:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684741738;
        bh=sGz8XHgj2Jv6HUhkSVWoOB+BOVnR/cwUIwYGYUGLJkY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=SH4WS97L2LbVffuf3nD5OYd39G9SiixxYfx4gz1AG++9deJJTP5KZMXWpLOoaVF9b
         EP/85lcbZtnysQvd88gnmW3OKabrXZe8aainONv/t+HQ2DszNKfPzktgfN4HR4TTrf
         0+3ZYkVdZ9djE0wB8y2DED4mFy2HL1sKHasNmqmPch4De83X/8fuYf+btJ34/VV1uR
         4V+Bnnm67BfIcb5rXa7s4PR1GZvnj4QBdwOvLjfqOlENmRBOFHF/+2byhQjcS5OQ7k
         eXHsJdse5Vgic3isV4fthuwrMaJ6Q1lSVHPwBSndd8EiBYyrh726RxirQVShEM7pMe
         nsAGxINPHBNQA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AE307C43142; Mon, 22 May 2023 07:48:58 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 22 May 2023 07:48:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: gregory.duhamel@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-SneaFaarGW@https.bugzilla.kernel.org/>
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

--- Comment #330 from Gregory Duhamel (gregory.duhamel@gmail.com) ---
Hello,

i've this board :=20

Base Board Information
        Manufacturer: ASUSTeK COMPUTER INC.
        Product Name: ROG STRIX X670E-I GAMING WIFI

But no sensors are detect on Kernel : 6.3.3-200 (Fedora)

Can someone please help me understand where is the issue (if any) ?

Thanks a lot !

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
