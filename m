Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24676C761AF
	for <platform-driver-x86@archiver.kernel.org>; Sun,  2 Apr 2023 14:15:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbjDBOPy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 2 Apr 2023 10:15:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230360AbjDBOPx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 2 Apr 2023 10:15:53 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A45BC2782F
        for <platform-driver-x86@vger.kernel.org>; Sun,  2 Apr 2023 07:15:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 61722B80E94
        for <platform-driver-x86@vger.kernel.org>; Sun,  2 Apr 2023 14:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 225CFC433D2
        for <platform-driver-x86@vger.kernel.org>; Sun,  2 Apr 2023 14:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680444948;
        bh=heoeYLzHZG6EVFdYZTTFsykBrVdAEV17c1coRqDsOM4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gPlkhi+K0BpzH7BZnkbA0dO62PKPcPsTYzsCnm8upK9NvVvTJrUvGhtmdS5ME8+B9
         Pu5MyGTanvP8KT2aOXQ0ZLRcPy8YgMIkjwHwox3UbI/F/BSRPoz73OgO/aW6JScwHK
         JjPTjswHjdL8XbE50+cMwH7Tm/I5cPeB6J3mOCxf4EsyuzuaDiBazXDVLjdzyWsncr
         o1YTagniDUjgfcxl5UZhQEpZGcap8BYi/AcwGyELjTgI54JSjH4/hoOJWnIeFoF4E3
         iMfn/xB/NyIzvHEYYqox7XWNxoAdGdO4xzX267ZPAncK9Jt45e1w1wkpsIdtB+usQ3
         6A0g9cG7Cjupw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id F3E10C43143; Sun,  2 Apr 2023 14:15:47 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 02 Apr 2023 14:15:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jeroen@beerstra.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-cc2t7V0qk3@https.bugzilla.kernel.org/>
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

--- Comment #323 from Jeroen Beerstra (jeroen@beerstra.org) ---
Op 01-04-2023 om 15:09 schreef bugzilla-daemon@kernel.org:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D204807
>
> Denis Pauk (pauk.denis@gmail.com) changed:
>
>             What    |Removed                     |Added
> -------------------------------------------------------------------------=
---
>   Attachment #304011|0                           |1
>          is obsolete|                            |
>
> --- Comment #321 from Denis Pauk (pauk.denis@gmail.com) ---
> Created attachment 304071
>    --> https://bugzilla.kernel.org/attachment.cgi?id=3D304071&action=3Ded=
it
> Asus WMI for nct6775 v6.2.9 base (2023.04.01)
>
> Updated patch version.
>
>
> (In reply to Jeroen Beerstra from comment #319)
>> (In reply to Jeroen Beerstra from comment #311)
>>> (In reply to Denis Pauk from comment #310)
>>>> Could you please check new one ? I have rebased patch to 6.2.7
>>> Applies, compiles, and works just fine. Thank you very much for your ha=
rd
>>> work, hope all of this lands in 6.3.
>> Same for 6.2.8. I did notice these warnings though:
> Thank you, should be fixed in new patch.

Yes it is, thank you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
