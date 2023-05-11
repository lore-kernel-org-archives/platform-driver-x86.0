Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6CA8C7EE22
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 May 2023 20:35:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239099AbjEKUfg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 11 May 2023 16:35:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjEKUfd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 May 2023 16:35:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FCB27298
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 May 2023 13:35:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B496A651A4
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 May 2023 20:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1CA0EC433A8
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 May 2023 20:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683837331;
        bh=utKQbSCfrFkOsGZcYEOiOhx+8v8WMNwLnZtmEAq4yho=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=X22RvI5z8iEGX7jSyB6lrDnN2TQZK5+pecOl7uaEXvwxhJFjtcUVA0k6fHckRkkME
         dUwu/tj8I9I67YGYLjLWzf67gNQPu3HruxyPVCKHMINJeSyb34c25/T3b/JPNPXRPO
         TEIOtSC1xMKJ2VXxs+g012RUq35PM7lNlQ9BFzrsa4Rotjy78zHKlHiBtSnC0/a3vO
         g7YVnbsi1h71v+woU7v1r6pW6fo7FgB1bfbTxkRTMQipxfJb/ZwcWa8D1fi4SMxDUr
         c44u/AQNQrLeGmM/67Cje4l3D87TiETJIbROkZohnoK95Wr8nNJyoLHoPsTk/jDvrC
         ZH+qMINXmtEHQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0C77DC43143; Thu, 11 May 2023 20:35:31 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 11 May 2023 20:35:28 +0000
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
Message-ID: <bug-204807-215701-c4U58tX9pk@https.bugzilla.kernel.org/>
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

--- Comment #329 from Denis Pauk (pauk.denis@gmail.com) ---
(In reply to Jannik Gl=C3=BCckert from comment #328)
> Created attachment 304249 [details]
> ASUS TUF B650M-PLUS WIFI
>=20
> Hi, is this the correct place to also report issues with the new ASUS
> NCT6799D support in kernel 6.3?
>=20
> I'm on an ASUS TUF GAMING B650M-PLUS WIFI , kernel 6.3.1
>=20
> Trying to modprobe nct6775 fails with ENODEV, doing so with force_id=3D0x=
d428
> works:
> [ 1600.922632] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
> [ 1600.931439] nct6775: Refusing to enable a Super-I/O device with a base
> I/O port 0
>=20
> However, all sensor values are unlabeled.
>=20
> Or did I misunderstand, and NCT6799D is not meant to be fully supported y=
et?
>=20
> Attached are dmidecode, acpidump, and the readings from sensors.

Upstream code has support for asus boards with such sensor. In same time
upstream code does not have support for sensor itself. And need to apply
additional patch from
https://patchwork.kernel.org/project/linux-hwmon/patch/20221228135744.28175=
2-1-linux@roeck-us.net/.

Patch from comment #327 also contains this patch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
