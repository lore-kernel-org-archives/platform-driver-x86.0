Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C8A7C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 31 Oct 2023 18:40:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbjJaSks (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 31 Oct 2023 14:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbjJaSks (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Oct 2023 14:40:48 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2BD4A3
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 11:40:45 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91408C433C7
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 18:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698777645;
        bh=cbBhbZfKPgFgKzVNm9FC+ONK7Rzhl7XXgpSI9uG42Xk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mNZI8j+q+lNAzDtTAoz6g7W4Ait9lPnn+a0cA7opgqNKxQjvztx0ErsMhrbb90a+m
         ZrS3u9HVjLb2uvxzYd41JY3S91NF3F6NIBsQ15CO68UwGpWeYk5nHEbXsT3oN2XvVB
         1dM8a2Af5Sgl4kos7VJ/a4DXR5i8YEcYEeKrXODCKqnscCaB7kooxjVF6er6dNGbDs
         7OjW8/zs1dasOmpQHpN1uIi8ETSm7DmQGZdbANzkEIxIGHbvTdLPj847QJpGEqV3zF
         I04QBOYyAUoja07Tn7oLYbiLxSlcS7UT2Rrad3yACS/d+nbW3QHoahEzjPpQgN3T7w
         S9J4cYytPmAxw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 746F3C4332E; Tue, 31 Oct 2023 18:40:45 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Tue, 31 Oct 2023 18:40:45 +0000
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
Message-ID: <bug-218092-215701-nrxJnQin9M@https.bugzilla.kernel.org/>
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

--- Comment #7 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
Comment on attachment 305344
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305344
dmidecode

I used "sudo dmidecode" command and result:

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
