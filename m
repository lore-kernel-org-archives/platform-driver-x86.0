Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E93CC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Dec 2021 16:09:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355151AbhLDQNV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Dec 2021 11:13:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244750AbhLDQNT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Dec 2021 11:13:19 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C92F8C061751
        for <platform-driver-x86@vger.kernel.org>; Sat,  4 Dec 2021 08:09:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 12DC5CE02C3
        for <platform-driver-x86@vger.kernel.org>; Sat,  4 Dec 2021 16:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3EDF8C341CB
        for <platform-driver-x86@vger.kernel.org>; Sat,  4 Dec 2021 16:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638634190;
        bh=vn9hwA0dN3BuZCAsvU1pEEefPorUA4zzEXy5E9FInRI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=R5igE4ODbJEju9LWGtGx/rcZsrG4j7UqFufebYLv9EY5yVx+nzYywkcMUAsHtjZFv
         Sh4xkii703Egs3XNXu0Vj9wORtq8jiXE47YdP/IFVCEFWqCj5D/RDZNFLVCyzgbRwI
         cZLWv4gpsM/nw53HQ2gzHwnBLfGy97ZkPgIJz8MPxAXU6xb2fpOSpXuBw4HQ84zENf
         NpFIPN3z/dM9UQwCKa1VwZ0MLr8wbZRpj4QXfBnx82IsORzOWYEaQhZl3MVMDQQq95
         Qu+Nw6fgd4JwudnBoxp9nCZoCVmFO7bd/lBgU5mEGchi/0mTFWCfeeeolJn8adfPu9
         enNPtVgA4FCqQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 209E961130; Sat,  4 Dec 2021 16:09:50 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 201885] acpi PNP0C14:02: duplicate WMI GUID
 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:01)
Date:   Sat, 04 Dec 2021 16:09:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hxss@ya.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201885-215701-txfPj9rtNy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201885-215701@https.bugzilla.kernel.org/>
References: <bug-201885-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D201885

--- Comment #15 from Sergey S (hxss@ya.ru) ---
# lspci -Ds 0000:00:00.2
0000:00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD] Renoir IOMMU
        Subsystem: Advanced Micro Devices, Inc. [AMD] Renoir IOMMU
        Flags: bus master, fast devsel, latency 0, IRQ -2147483648
        Capabilities: [40] Secure device <?>
        Capabilities: [64] MSI: Enable- Count=3D1/4 Maskable- 64bit+
        Capabilities: [74] HyperTransport: MSI Mapping Enable+ Fixed+

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
