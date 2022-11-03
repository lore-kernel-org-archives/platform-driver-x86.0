Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 434F5C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Nov 2022 20:28:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbiKCU2u (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 3 Nov 2022 16:28:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbiKCU2t (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Nov 2022 16:28:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF8A31AD
        for <platform-driver-x86@vger.kernel.org>; Thu,  3 Nov 2022 13:28:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 729B561FF0
        for <platform-driver-x86@vger.kernel.org>; Thu,  3 Nov 2022 20:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB214C4315B
        for <platform-driver-x86@vger.kernel.org>; Thu,  3 Nov 2022 20:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667507327;
        bh=HliaEf/58qPsaVmddannfLPeR5FFobJlGQY7cEiD4A0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dDfGSVfIKiu2Ze88yW2bdQFNR9bN1/+NlcNHmQDF+wk7RfhSsky3vMujoZzqElUM2
         rLFB3THE6f+vSBmP3UupT9fVppyxXt0D9dYJ5/y+f3bv5AGkV7N7zi7SmabKdd7baL
         TFPi9PZNMkDR4Proq57sxghR1p/ZXTqASaA44Ax8ljrjvh0YPE3325PmFAJwjXn53z
         zC+g9QX1guiEhv2Gm/sRMwrgfF2fVBjaTN43e4T7rDOlVc7L/WwNVVUXWnqW3ZrvEO
         zyIm7R/XNBrBHIya3Hxqa3CPa5mWNar7fQVTlFRPARKHN0lefZuWiiwtlb6beBSvYi
         ivjdEMwJXs+VA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BA8FFC05FD4; Thu,  3 Nov 2022 20:28:47 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 03 Nov 2022 20:28:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pauk.denis@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-204807-215701-LUzUv4ZlEu@https.bugzilla.kernel.org/>
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

Denis Pauk (pauk.denis@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #303045|0                           |1
        is obsolete|                            |

--- Comment #267 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 303126
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303126&action=3Dedit
Asus WMI for nct6775 v5.20 base (2022.11.03)

(In reply to zykr.caswell from comment #266)
> TLDR: B-->0 and it works!

Thank you, I have updated patch with your board.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
