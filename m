Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A6CC4167B
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Nov 2023 13:58:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376685AbjKBN6d (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Nov 2023 09:58:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376579AbjKBN6d (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2023 09:58:33 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 108AF199
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 06:58:28 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD302C433C8
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 13:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698933507;
        bh=rfOSUoljdSN1gHyKV0zKqBJqX5cenBCCObmfUnI5rV8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YDh2RrlsU2LmNFoHnMRw2+LYyuoMZiKihdMMUNe/T34MKXq4NL7desalyffLwva3u
         FqcryGCcU5sj9uzuD1951kRwPG7suGK1Pw7goMzlkUtyRyfS3QT8YDSJy8WCzM2VDi
         IwKH+LzumxGm8TLczznn3kfsHehStDw57eN3j8svUh+GGMcTnxHk19pMcZa57kPY+R
         jkcaYEl9sOTCRBZldqzynty/+DFVXa8kXaVaEqrKiFtPn8NTfKW/zD6FRLUMxqQBXJ
         LiG2Dmc6gPB5adtMxSe9D52dLy6A7t7/8zeeqsMBEl7vq84jJUppszG5wkjLnLfl4W
         Sd+I6L91x+rkg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 98B51C53BD0; Thu,  2 Nov 2023 13:58:27 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Thu, 02 Nov 2023 13:58:27 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218092-215701-K8K97EgeJT@https.bugzilla.kernel.org/>
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

--- Comment #28 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Yeah like I said, you need to install build dependencies.  You can do them
manually one by one or you can use 'sudo apt build-dep $SOURCE_PACKAGE' to =
do
it.

I don't know the name of the source package used for Tuxedo.  It's something
like this:

# sudo apt build-dep linux-image

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
