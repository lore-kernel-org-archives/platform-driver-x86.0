Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D98C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Nov 2023 14:09:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbjKBOJW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Nov 2023 10:09:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjKBOJW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2023 10:09:22 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65A76130
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 07:09:16 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10DAFC433C8
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 14:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698934156;
        bh=4Fal2sVVvl5rGh4Me2ULr725sH7btCYCxOiIxnlwQzE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YGPP4P4MF5a3wlEO8Xp21pTlPKvhBe1+smXo2nC/GgJrFeyf46eOmZluNBr15eiwm
         NAjL+hwumzT3jVMwjwYMW0vzUuCdK9xy9vASNLxpflxz/X6K5W+kd6dN70DZ1RAlsz
         NlW1gGe72w+SpkMkzfDm6+AQLcxjvUsHy9pWRU2AQVbwHxGOla8fT8qJ0aJNIRCdWc
         nr+nVinDYJ82nDVPnyww17sF6FabP0bC4808utL80ciCmiyPoMD1W50hhosXEVEfir
         t71tavJw58CO+PZhTQ2cWH+lUuF6f0U7ZWVb7okitGzt9o/aLvHoq68OUsUNdIsKff
         2/ee6alFsYEag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id ECDDBC4332E; Thu,  2 Nov 2023 14:09:15 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Thu, 02 Nov 2023 14:09:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ertugruluyar.personal@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218092-215701-cCKY3lIax7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218092-215701@https.bugzilla.kernel.org/>
References: <bug-218092-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218092

--- Comment #29 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
(In reply to Mario Limonciello (AMD) from comment #28)
> Yeah like I said, you need to install build dependencies.  You can do them
> manually one by one or you can use 'sudo apt build-dep $SOURCE_PACKAGE' to
> do it.
>=20
> I don't know the name of the source package used for Tuxedo.  It's someth=
ing
> like this:
>=20
> # sudo apt build-dep linux-image

I tried this: https://phoenixnap.com/kb/build-linux-kernel
sudo apt-get install git fakeroot build-essential ncurses-dev xz-utils
libssl-dev bc flex libelf-dev bison
And it's start to build. Then I keep enter to choose default options for
questions.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
