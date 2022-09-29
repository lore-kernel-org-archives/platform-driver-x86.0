Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27064C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Sep 2022 18:17:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235586AbiI2SRM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 29 Sep 2022 14:17:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235182AbiI2SRL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 29 Sep 2022 14:17:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13AB01F65EE
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Sep 2022 11:17:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A250F62130
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Sep 2022 18:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D772C43147
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Sep 2022 18:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664475430;
        bh=Cxq3p5LQD5SIQFodcPwvO9EjTQ1LE06y1GsKZwOduMk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Xcb9q73iZ0BBkexEFv/U5zZgPZZ6G+MTeTciul/Kh0GqoWbFi+l7KGKuCHdOooQEx
         QD4sIMPFQ+y+EHsKVK81GM5pwCZAY6Z4Wj63mMAUaXeIAqt2er6e+sVTofSYztW8Sw
         tMuEggUQwECzwg0h63+P2srS7X1j/30b7/ZycHYmKXFfZWtTVXBp5i3x/i4HNQt2e8
         eQK7zsJRsUZrCDBb5Rf1LVYzqm/3eV6xuF6WyJGpdh1XFhRNc/y//D78rjeoViB+Vl
         GsIvu/oOUhiPNthFrWHDu13L/Ire475kquGVUZPPavvReKraL4+HBgNPqa1fmI9BBp
         K9XpyXeVg2gwA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id F0420C433E4; Thu, 29 Sep 2022 18:17:09 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 201885] acpi PNP0C14:02: duplicate WMI GUID
 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:01)
Date:   Thu, 29 Sep 2022 18:17:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kenny@panix.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201885-215701-DtzdPwu0LS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201885-215701@https.bugzilla.kernel.org/>
References: <bug-201885-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D201885

--- Comment #19 from Kenneth R. Crudup (kenny@panix.com) ---
(In reply to Laurent Bonnaud from comment #18)
> Thanks a lot! I am looking forward to kernel 6.1...



Was this anything but just cosmetic? I looked at the patch and am running it
now and nothing in the dmesg has changed (nor any functionality) except the
messages aren't printed any longer.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
