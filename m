Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F99FC6FD1D
	for <platform-driver-x86@archiver.kernel.org>; Fri, 17 Mar 2023 12:15:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbjCQMPz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 17 Mar 2023 08:15:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjCQMPy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Mar 2023 08:15:54 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58252DCA5C
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Mar 2023 05:15:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id AC9DECE2035
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Mar 2023 12:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18E4DC433A4
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Mar 2023 12:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679055350;
        bh=MGyxqxgfGaSJtqr9AUeiksT3rV5yYnLFMiM9Z5TBrr0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=b2oqJSy3zpDAiYTxH5V2MPcgVZNL3ODFT2if38+nDWxBso4haaO1NEMCYkXVKZUky
         9j1AnnDuhPind+ysjv6LkbZrX0EJXuPn095n/PqdY/ndnvuz2mum27NnRqzBeXgh0a
         HWL6lCadg+gvxIpvAV4LB8KmzCttPvFLYK4Y34pgmNB1C49rXj+dM4sQq7a5YOVsi9
         0zI6YFrZZPNYastlghH5CqDn6KKhJzopm94Jf1PUuETkMw7hmj+T0uqaXsHnt+z0Ps
         +aVYJT/UcQPSMXGVcMnJNJCfwHbnaiIyuiGKfr64kfcWPU+NZLjASXeqEEaOENTrQQ
         DV7tuRBUQeykQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 09AADC43142; Fri, 17 Mar 2023 12:15:50 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 17 Mar 2023 12:15:48 +0000
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
Message-ID: <bug-204807-215701-yc0lbXDbYH@https.bugzilla.kernel.org/>
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

--- Comment #309 from Jeroen Beerstra (jeroen@beerstra.org) ---
(In reply to Denis Pauk from comment #308)
> Created attachment 303968 [details]
> Asus WMI for nct6775 v6.2 base (2023.03.16)
>=20
> Clean up previous patch, add more boards.
>=20

How do I apply this patch to 6.2.6? It reports:
Reversed (or previously applied) patch detected!  Assume -R?

And not all changes apply :/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
