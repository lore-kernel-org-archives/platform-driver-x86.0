Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5643AC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Dec 2021 10:43:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232982AbhLEKqj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 5 Dec 2021 05:46:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232973AbhLEKqi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Dec 2021 05:46:38 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3DDDC061714
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 02:43:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A791BB80D3A
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 10:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C7D5C341CF
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 10:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638700988;
        bh=XcYcaRFO3o4B4bvdVXa/jEFIxKMGaXexn9bdFE2RlHE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=k6sjnU2T974jOxJ0PAwmA+9Kc8rgnwCnl6X0km/hMkOhMHZu1cETGkiVVoj0iMNhE
         GWFL8wCo53b8FrJZldoVnNvBcVu8Crk498rdCgQ2C2EhRYzW1K2W8zOtyPdc7HsMKP
         5WKMfmmkTAUugPRNQun0JZS9YOqDEAXD8/HzPpfjJYDXYKYo4j+LB59TCAUf0EZbM5
         oEOkaFNqD+WEx/L/e8qqHMXfr+kyCXjXHP66WwteRRpM9M8AT7XiUxH2qh08R3ICd3
         28PXwZV06noxx71x0NdRria/5lkzawPJAQuI7dpegHb/Vd+WUV7V8Lz/r/cal8kcje
         moUDox38g1PGg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 4581561164; Sun,  5 Dec 2021 10:43:08 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 05 Dec 2021 10:43:06 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-V8LNNkY7mJ@https.bugzilla.kernel.org/>
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

--- Comment #175 from Denis Pauk (pauk.denis@gmail.com) ---
(In reply to Mikhail from comment #174)
> (In reply to Denis Pauk from comment #173)
> > Created attachment 299757 [details]
> > Rebased patch with i2c v5.15 28.11.2021
> >=20
> > Code have sent as part of https://lkml.org/lkml/2021/11/28/225 + i2c.
>=20
> I see that my M/B "ROG STRIX X570-I GAMING" not listed in patch. And yes I
> checked patch and can confirm that CPU FAN sensor monitoring still absent
> for my M/B with this patch.

What do you mean by missing "CPU FAN"? It has returned zero or does not exi=
st
in listing?=20

It case it has returned zero, could you attach result of "acpidump -b -n DS=
DT"
?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
