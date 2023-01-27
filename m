Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4653CC38142
	for <platform-driver-x86@archiver.kernel.org>; Fri, 27 Jan 2023 20:15:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbjA0UPI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 27 Jan 2023 15:15:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233437AbjA0UPA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 27 Jan 2023 15:15:00 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBD0D2D50
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jan 2023 12:14:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 91E42B821D3
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jan 2023 20:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13B49C433A7
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jan 2023 20:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674850497;
        bh=v47kvfwosodrNIsx5YLlWJq9DUP267KcWcvXon5B9ro=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=la09+67MMULPJUlBJvmqu3dlEfHeHO27tsWQXaR4jsDFPtTPpc7++uM4a1FaZjDBS
         P3LLWHLw7uAeGrjQ+JRbd1oiyhrEsewoFgywSUzHsQiz2Bg32E+5ekJ/t9Y6pdo/fq
         YJREW2mgnsyQUm0NsqAo6w2zRZlHyNsKztb2RB9suCNo3UYVlUCCdNJU9sotPZcmJr
         cKG5qcjcPIyjladRRRBweEU36qeAbhay3VbzeWXZXQOcpOA4lRu8FrxRZMkPwHPnu/
         y9ixJK0UpSslB5CnvBnumffw54pK9DWZ3WFaEhYs7RO4b+VaqOZHXvftzixMZP7paZ
         MIlhuUc+Ypaxg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 055FDC43142; Fri, 27 Jan 2023 20:14:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 27 Jan 2023 20:14:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: robert.kling@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-204807-215701-xvdQKox2ub@https.bugzilla.kernel.org/>
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

Robert Kling (robert.kling@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |robert.kling@gmail.com

--- Comment #287 from Robert Kling (robert.kling@gmail.com) ---
Created attachment 303659
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303659&action=3Dedit
dsdt.dat Z170 PRO GAMING/AURA

Hello, would it be possible to add support for Asus Z170 PRO GAMING/AURA?

cat /sys/class/dmi/id/board_name:
Z170 PRO GAMING/AURA

dmesg:
2023-01-27T13:10:42+0100 kernel: nct6775: Enabling hardware monitor logical
device mappings.
2023-01-27T13:10:42+0100 kernel: nct6775: Found NCT6793D or compatible chip=
 at
0x2e:0x290
2023-01-27T13:10:42+0100 kernel: ACPI Warning: SystemIO range
0x0000000000000295-0x0000000000000296 conflicts with OpRegion
0x0000000000000290-0x0000000000000299 (\_GPE.HWM) (20220331/utaddress-204)
2023-01-27T13:10:42+0100 kernel: ACPI: OSL: Resource conflict; ACPI support
missing from driver?

Setting acpi_enforce_resources=3Dlax kernel parameter results in 'sensors'
returning much more data like fan speed, voltage etc.

Thank you for your work!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
