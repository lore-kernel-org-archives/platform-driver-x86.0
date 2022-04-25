Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0B0C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Apr 2022 19:46:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240687AbiDYTt2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Apr 2022 15:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239027AbiDYTtZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Apr 2022 15:49:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E4481EEE9
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Apr 2022 12:46:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 38A4C60A6A
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Apr 2022 19:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E52AC385A9
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Apr 2022 19:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650915979;
        bh=DXvp2f7i5UWyVSXgz1piR/chwHd6e3Vp57Qh4AcQ5IQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=py/ZnRZ42lmT9LcMNB10vvf65484wu4HzXQ4S5t4tcB1JPGaP7ICFvr6kej+yvmQs
         B8R8eQzH75+ajdXxAqKTozVtUlVmnJAkxPq+xEB5O2i2NVvG3AVR3hmMl9qX+hXIsW
         km386rcz4vYlXIU5QFJ44STOlzj6Jj2YJSLJ12ShlzmkJ6Pv1A00sgJ2p6EdDiEoo/
         CO2iai7ob8O4FZhSkl8k3rOZo42EsxvP5mMoWPhU9AZbjcCi/Kwtrt6FrS2zpeRobF
         NTi8KfXduh890a7tXgdhzfAwu37/ppZYBj7ofSvQiX4Ch6FtusWH5/ZdAIyHlLS7Uh
         dV8GHJhOH/sLQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7AAB0C05FCE; Mon, 25 Apr 2022 19:46:19 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215883] Unable to resume from suspend with module
 `intel_lpss_pci` enabled
Date:   Mon, 25 Apr 2022 19:46:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: taigi100@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215883-215701-ZxSPvz1oUR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215883-215701@https.bugzilla.kernel.org/>
References: <bug-215883-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215883

--- Comment #5 from taigi100@gmail.com ---
efi partition is vfat, main/root partition is ext4 :)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
