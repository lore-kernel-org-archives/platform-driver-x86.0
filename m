Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F609C433B4
	for <platform-driver-x86@archiver.kernel.org>; Fri,  7 May 2021 22:56:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2773860698
	for <platform-driver-x86@archiver.kernel.org>; Fri,  7 May 2021 22:56:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbhEGW5r (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 7 May 2021 18:57:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:52138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229470AbhEGW5q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 May 2021 18:57:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3C8DF60698
        for <platform-driver-x86@vger.kernel.org>; Fri,  7 May 2021 22:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620428206;
        bh=+brV/Bhod+Qx5AUaMzaDiMAnhTvdcOyVwmD1NKSqlZI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=kKQ0GplSJlWIpnCdVf2VWdaYkfpkyIGTsVleE2hwfC/fIgzj4gpjCB7UoLcvBmUT5
         YUsNJ1mxxLXXPnxbLw4085GItguLwSW5w70JBvv68IMSJBZ3uBMxkxJHFbM848dyOg
         QXv3uVQbD0GWo7LZ1RcURS1KcT/iGq8cZFNmDpvRIv/1UcVQu5uuZ2xVdKdVSgbsXA
         MKSSydhaY60ou10lBC3DFZAQfsj8ffdpwBT6OVrcZQ1T533qFpJahfgmsWhz9kmjpG
         C2SEuAjTDXvUWadvfvoO1uR9O5a3Uf4x6wQP5KmgIa2LfKiKgH26utM8G+bdmZ7Xqx
         jRDL9vi15eYLg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 212985] ideapad_acpi: VPC2004:00: DYTC interface is not
 available. platform_profile interface is unavailable
Date:   Fri, 07 May 2021 22:56:45 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tsweet64@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform-driver-x86@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212985-215701-NAk3TRrag0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212985-215701@https.bugzilla.kernel.org/>
References: <bug-212985-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212985

--- Comment #2 from Tim S (tsweet64@protonmail.com) ---
Thanks a lot.

> Can you check if the VPC2004 ACPI device has a method named "DYTC"?

If I'm understanding correctly, you're saying to check the disassembled ACPI
tables, right? The disassembled dsdt.dsl does appear to contain a DYTC meth=
od:

        Device (VPC0)
        {
            Name (_HID, "VPC2004")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_VPC, Zero)
            Name (VPCD, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (DYTC, 1, Serialized)
            {
                ITSV =3D Zero
                ITSM =3D Zero
                Local0 =3D Zero
                Local1 =3D (Arg0 & 0x01FF)
                Local2 =3D (Arg0 & 0xFFFFFE00)
                Switch (Local1)
                {
                    Case (Zero)

         ....

I'll attach the full file, in case it is needed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
