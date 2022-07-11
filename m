Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B74B4C43334
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 06:57:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbiGKG5B (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 02:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiGKG47 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 02:56:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35BC813F46
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 23:56:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C671061219
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 06:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33F96C34115
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 06:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657522617;
        bh=oKzFjaRBYlNZWdpgeg6a0bCwm8Oruvf5oSz/4115284=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=sTzbzsVG77637eEVWo+eAopfzCtNnpIAGExb3NqfaU1LS3BbFosjhbqvEOWAWCIzl
         Kn88ex6cEQyDdobrfa+sCrtFluaPLrdjwHKUgi6qCYnYwt8TC7sYesYKPbiIW6hfnH
         vLM9HHXSbmbLuymN5n/SNeyQFcBA1FM9qMBB2+5i6ShJmqA+L2KZb63HpmZkVUV0AV
         mOlmZ5Rategp6PEXtxhFuTa52Vi/rhkOCR2QHWbclNj4XV84qH3D8MakRGj0cC5u0P
         l+q046Blmitp7K36g//8dam2AcuiyeoSrT+kjI/p1AthBEIgYhjw7cbMnja6N0evZE
         n+wXOM5gACmNg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 21BB8CC13B0; Mon, 11 Jul 2022 06:56:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216230] "irq9: nobody cared" on Thinkpad T14 Gen1 (AMD) when
 s2idle is enabled
Date:   Mon, 11 Jul 2022 06:56:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: madcatx@atlas.cz
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216230-215701-bMoLhMOLfH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216230-215701@https.bugzilla.kernel.org/>
References: <bug-216230-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216230

--- Comment #3 from madcatx@atlas.cz ---
Created attachment 301386
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301386&action=3Dedit
/sys/kernel/debug/gpio when there is no issue

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
