Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BB3C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 31 Oct 2023 18:25:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231173AbjJaSZF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 31 Oct 2023 14:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbjJaSZF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Oct 2023 14:25:05 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3AB4F9
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 11:25:02 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56CAFC433CA
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 18:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698776702;
        bh=Q9Q7558keTVwid5P84Dt/uvEmMRO/6Abe0z3ZzUIjuI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fCIwmR+1fskHV6RiE3byl03zT60RxlemVEp4Ys3wYuUpu1s3z79AQuMTxd1DNJ1gW
         G0otaYVBZetBuem0/XfFlO3OvwWK5TS4UrPpeBVijJ9yed2ZawAsij94Zgwpey4idy
         3w+lJsS/PRexUcfO+qZqEdqrk7ox/7XqYTY5b13EW9KxCff+URzlcoYLcdjCR/OJu0
         mmgYyx5OfOcsN1KKWzNIWEAquTYFFL6dc/Nj2n6Y3L8cqkMSVd93BiBTC9eTigRxvp
         xx/TARQnsya1Cd75XzGnnRpu3mlTiOHF+FAlVdH2Qpnnpo4rps7JitRfAd5j4mXgY2
         PBajNu8cPtdMQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 38CCCC4332E; Tue, 31 Oct 2023 18:25:02 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Tue, 31 Oct 2023 18:25:02 +0000
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
Message-ID: <bug-218092-215701-PsZC22o0in@https.bugzilla.kernel.org/>
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

--- Comment #3 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
(In reply to Mario Limonciello (AMD) from comment #1)
> Have you already updated your BIOS to the latest BIOS?

I have latest BIOS, it's version:
https://pcsupport.lenovo.com/tr/tr/products/laptops-and-netbooks/thinkbook-=
series/thinkbook-15-g2-are/downloads/driver-list/component?name=3DBIOS&id=
=3D5AC6A815-321D-440E-8833-B07A93E0428C

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
