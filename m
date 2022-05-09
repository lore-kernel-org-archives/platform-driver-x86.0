Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810C2C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 May 2022 13:50:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236510AbiEINx6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 May 2022 09:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236507AbiEINxy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 May 2022 09:53:54 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B449201306
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 May 2022 06:50:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BD7C5B8169F
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 May 2022 13:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 844DCC385AB
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 May 2022 13:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652104197;
        bh=eF9muj7jm6rHgAgqsr6HrHAUSg8RgOgFMp3N73UgfbA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LqWBxl2gb5hkbHejgVjpd6/fx6QtT5RzK553qJiNUIMaus6JAXhkSYsJQbpZXXX0r
         z13151jSiAHEWSFk3hnXYQIgOwrJ21iKh4Lksg/QawOcIhjJC9gZD1JkKQBuD5VyXA
         /I9bFI3gzmPWh3LAA5cLjfQhe8JRAngWxhLQr8kV6ou4uUkpkCDr+rX666lOD1+VCY
         VZfqyz8XJZiXExkgvUokVABBMyDDI0/qUcRMLMQmiYfnQpXQOFiJGRAzvjMjdyi9Zv
         KsCQq3v9EHrWGssOcCBCAx6Mxk9VQP6BwacKUyMKCdhHPtZZEV7YH32bmiE5pAQ/2t
         TJ4GKpfjUVOug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 72E05CAC6E2; Mon,  9 May 2022 13:49:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 09 May 2022 13:49:55 +0000
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
Message-ID: <bug-204807-215701-Fq3W2Euzet@https.bugzilla.kernel.org/>
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

--- Comment #237 from Denis Pauk (pauk.denis@gmail.com) ---
(In reply to renedis from comment #236)
> Created attachment 300905 [details]
> acpidump -b -n DSDT for H410T
>=20
> (In reply to Denis Pauk from comment #232)
> > (In reply to renedis from comment #228)
> > > Thanks all for the effort en support. please also add:
> > >=20
> > > cat /sys/class/dmi/id/board_name
> > > PRO H410T
> >=20
> > Could you please share dsdt dump? (acpidump -b -n DSDT)
>=20
> Sorry for the late reply.
> There you go, see attached file.

Thank you, could you please check patch attached in #235?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
