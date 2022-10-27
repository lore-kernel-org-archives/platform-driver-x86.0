Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BDCECAAA1
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 Oct 2022 15:27:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235778AbiJ0P1n (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 Oct 2022 11:27:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236116AbiJ0P1b (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Oct 2022 11:27:31 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50F7D175361
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Oct 2022 08:27:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0A46BB826CB
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Oct 2022 15:27:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD688C433C1
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Oct 2022 15:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666884444;
        bh=22qQkyoQtTIuMc9hAQvGzw7qX/l43pDqbSUfGTbyzwo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=QsX4SVVriCZWSh2el9aloDHDyaAnV+TONlk701XB0+jbpE093nClgWy6UhN86+yUf
         dPJh1087mEoM68GV9D1VEZ1of3GnC9R36AMuAtg3zO32+nBnnYMywonkCxwhNJfiwJ
         q02tBBb6g/ilrF7+tbZAinFOWoGn8Q5dCigKixYKpb+hjVTwWL00TC2gKGirqPaz5J
         BkGw9mZWqUZW4IGURxRVXSINpWnZ+K8MOfMz7WBWs4eDHLrugLpU9Wmqu7zKYvaejo
         v4VhSUkWEnzBWNUIn7omaUcfOl79JZfESJghpIzJN2dPYQTKMQFPP77tenMADEqSNr
         t1uqOGAU/7Q+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 958B1C433E9; Thu, 27 Oct 2022 15:27:24 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216468] hp_wmi: HP Elitebook 865 G9 after update BIOS to
 version U82 01.02.01 Rev.A causing rfkill soft blocked wifi
Date:   Thu, 27 Oct 2022 15:27:24 +0000
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
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216468-215701-niXaEQyCWq@https.bugzilla.kernel.org/>
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

--- Comment #7 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
[Public]

+Jorge,

Can you take a look at this?

Something that comes to mind to me is maybe the more modern
platforms shouldn't be using hp_wmi's RFKILL feature anymore.

Aren't there rfkill services provided by all modern wifi drivers now?

> -----Original Message-----
> From: bugzilla-daemon@kernel.org <bugzilla-daemon@kernel.org>
> Sent: Thursday, October 27, 2022 09:58
> To: platform-driver-x86@vger.kernel.org
> Subject: [Bug 216468] hp_wmi: HP Elitebook 865 G9 after update BIOS to
> version U82 01.02.01 Rev.A causing rfkill soft blocked wifi
>=20
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugz
> illa.kernel.org%2Fshow_bug.cgi%3Fid%3D216468&amp;data=3D05%7C01%7Cm
> ario.limonciello%40amd.com%7C01a1b92da9704ede465f08dab82bbf27%7C3d
> d8961fe4884e608e11a82d994e183d%7C0%7C0%7C638024795272794223%7CU
> nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI
> 6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DZVHHH70%2
> FoyrXWVbad9GvomwvlYaGwhpdQEiGEXJNFcg%3D&amp;reserved=3D0
>=20
> Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:
>=20
>            What    |Removed                     |Added
> -------------------------------------------------------------------------=
---
>           Component|Platform                    |Platform_x86
>            Assignee|drivers_platform@kernel-bug
> |drivers_platform_x86@kernel
>                    |s.osdl.org                  |-bugs.osdl.org
>=20
> --

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
