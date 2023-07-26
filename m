Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ECA4C001B0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Jul 2023 14:03:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231325AbjGZODQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Jul 2023 10:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233643AbjGZODC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Jul 2023 10:03:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 330FF2701
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 07:02:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C10AA61AF2
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 14:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28454C433B8
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 14:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690380178;
        bh=PbxPAhBaRo2c4IqN3YfAw0L9ScrdbQEuMTyJWB5xGjk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=soxl40ZV9aBk+BMEb3ohcl6oUJBre5fW7Lli3k4/Hf1I8ZKXkNb7ns4b8dvGc8Z7U
         ElGGq9Mxnw7AR0/3XmHl301MACY8Eq8LyViitP6kglaY4IdYkJ9PHn6C6XqUoolSeS
         YoD/GptFfKue7S33ceuyjB2LZ9obri2xvJkoO4IcUFbqkvAotkZClopTZuZMOcXpo+
         Vge+K1cENM8nDe1r2jsuhpTQQf6sSwViZCjmKP+Rvs97bzSm3NSTscpkybBxfWPBs7
         38xWJgEBoj8nu8J+/SDrYp+BuwVvY2GTU+tmdlEM/oicw2WwXBQMeKtWNfn1+KpRiD
         9ujFrIClswEPA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0749BC4332E; Wed, 26 Jul 2023 14:02:58 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217696] Looking for a way to enable power saving mode for Ryzen
 APUs, along with limiting the upper temperature and total power consumption
Date:   Wed, 26 Jul 2023 14:02:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217696-215701-TevhLJvANw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217696-215701@https.bugzilla.kernel.org/>
References: <bug-217696-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217696

--- Comment #20 from Artem S. Tashkinov (aros@gmx.com) ---
I'm a little bit lost in all of that.

Originally I was looking for a way to control my APU TDP(TTP) and maximum
temperature threshold *without* using ryzenadj because CPU control registers
are locked in secure boot mode.

The second issue is my 7840HS never going above 4.5GHZ either in Linux or
Windows.

Trusted Execution Environment (TEE) or not I wonder if my firmware is simply
buggy and there's an artificial CPU frequency limit set by HP for no reasons
and whether I should continue pushing them to released fixed firmware or if
your fellow AMD engineers could politely ask HP to remove the restriction.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
