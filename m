Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B89C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Feb 2023 11:01:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbjBPLBu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Feb 2023 06:01:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbjBPLBt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Feb 2023 06:01:49 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBB4832E63
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Feb 2023 03:01:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 345A961F8A
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Feb 2023 11:01:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96C9CC433B3
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Feb 2023 11:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676545304;
        bh=IWCKLTeaxsr5YIgpce/IPOXci4R2OKnIcbcCRbQsOqw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ktTCsBc88i1FS4VfYBUFyTH+9tjIeIvC1kUWBQXobfiE7cm9JKKuIwO8az13lFEyt
         jV4tNuCoPi50tkuKMvWiuVyXE1esMj53GVY9UNBpbiYURBl2/8LoMspMktgioRliU6
         fxJ9NaCEw11FArMoxu2pJOJAQ0yoxtjEdIetzY6OE2j85mmNBCfNUPuAIrofg/lfFs
         2M/1XZjfDovPUSZ7kPB4ja8MR8kSn+1C5ubjQKMcF/hb6pQiPbrwLU40dlePgt4D79
         Q0Ux98u5vTYzvf/NaU6Bn1BJcFe5x6epoVU2iYHOfY2TyMBUsb2MwxXN86aslyj/8a
         NmICPvqaAI15A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 870D4C43141; Thu, 16 Feb 2023 11:01:44 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 16 Feb 2023 11:01:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: forum1@m.pekholm.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-jiS6P9E8Tl@https.bugzilla.kernel.org/>
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

--- Comment #295 from P=C3=A4r Ekholm (forum1@m.pekholm.org) ---
(In reply to Jeroen Beerstra from comment #294)
> For me, on 6.1 ML via elrepo. I needed to apply patch and modprobe nct677=
5.
> Lmsensors did not detect my sensors. Other than that it just works :)

Isn't this patch included in kernels after 5.17?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
