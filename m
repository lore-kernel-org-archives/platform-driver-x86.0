Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 466F2C38A02
	for <platform-driver-x86@archiver.kernel.org>; Sun, 30 Oct 2022 09:54:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbiJ3Jyw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 30 Oct 2022 05:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbiJ3Jyv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 30 Oct 2022 05:54:51 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DAB4CE39
        for <platform-driver-x86@vger.kernel.org>; Sun, 30 Oct 2022 02:54:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3EE5DB80D77
        for <platform-driver-x86@vger.kernel.org>; Sun, 30 Oct 2022 09:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA9ECC4347C
        for <platform-driver-x86@vger.kernel.org>; Sun, 30 Oct 2022 09:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667123687;
        bh=RJ75B+is+MClCffNYX/uxC5QxLwRMzbABKPZh0bGPFc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mMrNRjCTbWz//MQ+XvvZgQinkBPLXRDAzlFoD6DzpK4wI5nfVnpMeHIlJxuuKB515
         Okye2Rer+X4zOc6McN/GJ7wAb4mtsNwRN68t/98v1UGLq7uwCVF9NVdDO/aSq+Any5
         oUOG41fDL8VU4G45hdzCHn2UbzM5fEj9hK+T54z8EK5opH/VEw49LZKRLJ0MVASIn/
         Cewmdpd2Y5sLkj49PlyF/1kh2Pt/izwzmsAC2YE5nw+kVIYbPVhxVX1rXsYOqqEjhg
         CTMHb5DW0OFSqiEn4ZWz90S2tEBeedN+tfoNi65Jdr6URuomqBYKp07J9QiBvuwcgV
         8+Arz+GbBdWpw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 951E4C05FD4; Sun, 30 Oct 2022 09:54:47 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Sun, 30 Oct 2022 09:54:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214899-215701-4LcpyCZ1cm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214899-215701@https.bugzilla.kernel.org/>
References: <bug-214899-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214899

--- Comment #60 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to Gerald Nunn from comment #59)
> Tested the patches on a Lenovo Slim 7 (i7-1260p) which is the updated
> version of the Ideapad Slim 7 Pro and it works great. Using Arch with ker=
nel
> 6.0.5

That is good to hear, we are waiting for:

https://github.com/acpica/acpica/pull/786

to get merged and the fixes should land in the mainline kernel pretty quick=
ly
after that.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
