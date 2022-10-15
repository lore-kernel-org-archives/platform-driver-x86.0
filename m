Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B87C4332F
	for <platform-driver-x86@archiver.kernel.org>; Sat, 15 Oct 2022 13:33:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbiJONdI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 15 Oct 2022 09:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbiJONdH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 15 Oct 2022 09:33:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D3CB50B95
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Oct 2022 06:33:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0858860E26
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Oct 2022 13:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6281FC43145
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Oct 2022 13:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665840784;
        bh=IbCzl88dFWyhkK5E/qLDNzOYeUkuhh/5584gdzQcnxE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=c/lySSs1HIoV+cFdlDjk179vu9YAIdWYeBaeViYj6X6JMqcJt2uydBWUlE1ymkgS3
         D3eCn5b52TdPZGTv0ij67ef/3e6jO7m7OO4AoQKij0aMwBuSKzBHn0l6FOd18hZjJo
         Dt6/EySjK4XF165A+R6rtLNsfFiyjBVTi8dSYLYXdIhcfC6p+2q2NGrP/XPeOLw0oS
         uOkIQZEhq9wL0RaXyo+ZL60oytx2SEmS2zGXDRhV+wiyH9Bw5Xto7GtPQzSMeeTHM1
         gm+pBFeHAUglnp6MTeEd4VcYfgJZLWX13LsnySMtRLlk8hm+KVBstrVQ4Qla+uy63d
         qDjxYGbHVBmbw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5552BC05F8A; Sat, 15 Oct 2022 13:33:04 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 15 Oct 2022 13:33:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: vladdrako007@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-LRI4pgrFZl@https.bugzilla.kernel.org/>
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

--- Comment #260 from Vladdrako (vladdrako007@gmail.com) ---
(In reply to Denis Pauk from comment #259)
> Created attachment 303000 [details]
> Asus WMI for nct6775 v5.19 base (2022.10.14)
>=20
> (In reply to Vladdrako from comment #258)
> > @Denis Pauk
> > Something wrong with the patch, it has only commit headers :)
>=20
> Could you please check now?

It works ok, thanks.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
