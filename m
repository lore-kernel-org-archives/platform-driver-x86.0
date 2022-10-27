Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB14AECAAA1
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 Oct 2022 15:51:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233652AbiJ0PvQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 Oct 2022 11:51:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234911AbiJ0PvP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Oct 2022 11:51:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 295DB180279
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Oct 2022 08:51:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D7D18B826F8
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Oct 2022 15:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 836B7C433D7
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Oct 2022 15:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666885871;
        bh=3yWVH1Ghjadg0AyMZEI+PYW+fCcwwcqcU/tGhgFSVwY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lJ6PIsneomsxBMeBkK6BFVZKvpPTXoHKcVLWrZNt3aXo72g8aPxISDI7g69BYeh+i
         KnWItWNb1b1/T6J2O/yz4uKTSp7KTj/WfRyj0AhmkGYUpPLqNIDLG7UtQw+rimmnjH
         m0wOp5uUqPJI9G+H1ZRQjAQ3KiLrmuPCHQF57jEcEWHpw3QLpDVSLPjT8n1hxgHCr8
         jEvlmuP78b+9k9lvPw3NakndbLKRqF5cjK3tjfoSt5ktiewMV0TY5RIF9xs44S6kEm
         T0C2cejBccguZuIZXLFuNOHLvuKi/CWqW1D4/5N41EfVgeNsnITTAgDTp9hz6rERZy
         aaMbaMw8SSkCg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6C74AC433E9; Thu, 27 Oct 2022 15:51:11 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216468] hp_wmi: HP Elitebook 865 G9 after update BIOS to
 version U82 01.02.01 Rev.A causing rfkill soft blocked wifi
Date:   Thu, 27 Oct 2022 15:51:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jorge.lopez2@hp.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216468-215701-qZVeZEhnIW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216468-215701@https.bugzilla.kernel.org/>
References: <bug-216468-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216468

--- Comment #8 from jorge.lopez2@hp.com ---
Ok, I will take a look.


Regards,

Jorge Lopez
Hewlett-Packard

"Once you stop learning, you start dying"
Albert Einstein

From: Limonciello, Mario <Mario.Limonciello@amd.com>
Sent: Thursday, October 27, 2022 10:27 AM
To: bugzilla-daemon@kernel.org; platform-driver-x86@vger.kernel.org; Lopez,
Jorge A (Security) <jorge.lopez2@hp.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Subject: RE: [Bug 216468] hp_wmi: HP Elitebook 865 G9 after update BIOS to
version U82 01.02.01 Rev.A causing rfkill soft blocked wifi

CAUTION: External Email
[Public]

+Jorge,

Can you take a look at this?

Something that comes to mind to me is maybe the more modern
platforms shouldn't be using hp_wmi's RFKILL feature anymore.

Aren't there rfkill services provided by all modern wifi drivers now?

> -----Original Message-----
> From: bugzilla-daemon@kernel.org<mailto:bugzilla-daemon@kernel.org>
> <bugzilla-daemon@kernel.org<mailto:bugzilla-daemon@kernel.org>>
> Sent: Thursday, October 27, 2022 09:58
> To:
> platform-driver-x86@vger.kernel.org<mailto:platform-driver-x86@vger.kerne=
l.org>
> Subject: [Bug 216468] hp_wmi: HP Elitebook 865 G9 after update BIOS to
> version U82 01.02.01 Rev.A causing rfkill soft blocked wifi
>
>
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugz<=
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugz>
>
> illa.kernel.org%2Fshow_bug.cgi%3Fid%3D216468<http://illa.kernel.org%2Fsho=
w_bug.cgi%3Fid%3D216468>
> &amp;data=3D05%7C01%7Cm
> ario.limonciello%40amd.com%7C01a1b92da9704ede465f08dab82bbf27%7C3d
> d8961fe4884e608e11a82d994e183d%7C0%7C0%7C638024795272794223%7CU
> nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI
> 6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DZVHHH70%2
> FoyrXWVbad9GvomwvlYaGwhpdQEiGEXJNFcg%3D&amp;reserved=3D0
>
> Mario Limonciello (AMD)
> (mario.limonciello@amd.com<mailto:mario.limonciello@amd.com>) changed:
>
> What |Removed |Added
> -------------------------------------------------------------------------=
---
> Component|Platform |Platform_x86
> Assignee|drivers_platform@kernel-bug
> |drivers_platform_x86@kernel
> |s.osdl.org |-bugs.osdl.org
>
> --

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
