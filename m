Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23936C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Apr 2022 19:55:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234868AbiD0T6u (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Apr 2022 15:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235172AbiD0T6s (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Apr 2022 15:58:48 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C91675E76
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Apr 2022 12:55:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 39F52B82A5E
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Apr 2022 19:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DAA28C385AE
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Apr 2022 19:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651089333;
        bh=pZU07roqRMpTnNf8mPoDJ4v4BUJMCAqsiy1fhYnpHoM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ERXXtD9MRIFfaoF3iJ72caWUcTlO9/w/mf2eqHeginZUrlwnN9LvVM3pwpczfRN4I
         pHl92U8PRffKe8vFrTyTAFe+QALEzNHbrh5cCKqq3XC3pKVcB9GEOqKR9IkT06a1Q+
         32QIxSLS4kIHGn8zZi+fXXxYoTonSBZtv2b3DQ7/4m/wJqmoocQycrR7j02vEWrKi5
         1eo8NqcnIG6FphTFJvS7vsSC55bhSu/wObLFs0oQy2Yfw/tzfGIZTWFdUQ+QDCyqXi
         r5uxakSzAR1JUK3xnz+wr6d68qAsc3psGCYNOtI0HUulAKM8VQbCD1CLxFslH0RSF+
         H3SibmoaknrTQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CCCC6CC13B1; Wed, 27 Apr 2022 19:55:33 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 27 Apr 2022 19:55:31 +0000
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
Message-ID: <bug-204807-215701-U1MNGkaFBQ@https.bugzilla.kernel.org/>
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

--- Comment #232 from Denis Pauk (pauk.denis@gmail.com) ---
(In reply to renedis from comment #228)
> Thanks all for the effort en support. please also add:
>=20
> cat /sys/class/dmi/id/board_name
> PRO H410T

Could you please share dsdt dump? (acpidump -b -n DSDT)

(In reply to Hubert Banas from comment #229)
> Would it be possible to get these new motherboard in during Linux 5.18 me=
rge
> window?

It can be part of 5.19+ if patch will be accepted before start of the new m=
erge
window. (I have not sent patch yet.)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
