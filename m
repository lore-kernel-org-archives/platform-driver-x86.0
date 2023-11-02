Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 404D9C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Nov 2023 06:38:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbjKBGir (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Nov 2023 02:38:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjKBGiq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2023 02:38:46 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B7FF10E
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Nov 2023 23:38:44 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E04AAC433C8
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 06:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698907123;
        bh=SvLYUfoPpUFRyvvxqPHQiHFovrq56bq0vf1QGuIc7iI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=aZE3CfOzK/MeLBVkrPUubZayrXBDEvnmNRT0CM994k3ARhRJHMYMyk3Y27LGnacyR
         3QgSIrQqQCb0SESqT5P3kM6qoQ2bf/UEZ6hnAZVywBEnYyJ4q68Xo+com1AyLxOPfJ
         wB/yWMY7H8uvxWGaF6DWl8rrG3u5bEdIv6NfECClEw1gZ4/VE5umSH0RHFXMtuXdud
         IFoNIkjxlw8KdmTNnEZtCXHfJiknGo8eHFhTx5JBxcpaBrRDKqasS+GQjAq+0LDBic
         lf8KgRP/+MsuWExTu6TPDygSKMvVv8BQzY4UIMyVugbp0I4jt2pwpjKYiwGa5muwOl
         wV7eh5LVZlU4Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B7D54C4332E; Thu,  2 Nov 2023 06:38:43 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Thu, 02 Nov 2023 06:38:43 +0000
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
Message-ID: <bug-218092-215701-oERRmH1A9R@https.bugzilla.kernel.org/>
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

--- Comment #19 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
(In reply to Mario Limonciello (AMD) from comment #18)
> If you do a git checkout then it would be 'git am foo.patch'.
> If you download a tarball it would be 'patch -p1 < foo.patch'.

I quess, I am gonna extract tarball then open it and open terminal on it. T=
hen
I use 'patch -p1 < foo.patch' command. Am I right?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
