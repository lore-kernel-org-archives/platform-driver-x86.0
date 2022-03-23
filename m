Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A1EC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Mar 2022 09:47:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239488AbiCWJtL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Mar 2022 05:49:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241948AbiCWJtJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Mar 2022 05:49:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 442EA25C7E
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 02:47:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D44A160B64
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 09:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3FD4CC340E8
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 09:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648028859;
        bh=069bxH+4ajrrkq+ABK9Utz2JosizG711aoe3Yoq8efU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=nG3d3m4b/+DORGLKLk7waPhiQWMhAH6wEbp4N9TJFCi6ibd/3r59xGCjLdjgoA+dG
         DDrPmvL1h/ytkpzrc97wSoAACVbE3C/duMXixTEIJov9RdddIz5xFCxBOjCYIn+2se
         9u3PMVg+dXoZWCejVt54OOwHhrn4DsVaLnObSXJJJLiAAeQNMw1T3NZBXLoBXomUWj
         JmGEM/fefpRIMML73XUHTzretyQrsSoRDbsQps43jd6+uE826R+DXZ6IqjCwo22vpC
         KCShl/RcULCjw3OnZQvzFS0GqeVj7RTRXbsOrJnEleV3ZPgci2legeZhYw+CNtyKRg
         delVOL1pgzy8w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 23991C05F98; Wed, 23 Mar 2022 09:47:39 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215730] acpi_bus_register_driver() does not work on Alder Lake
Date:   Wed, 23 Mar 2022 09:47:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: xuemin.wu@dbh.dynabook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215730-215701-xKip6azhxk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215730-215701@https.bugzilla.kernel.org/>
References: <bug-215730-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215730

--- Comment #8 from xuemin (xuemin.wu@dbh.dynabook.com) ---
All functions which depending on toshiba_acpi are not working.

static struct acpi_driver toshiba_acpi_driver =3D {
        .name   =3D "Toshiba ACPI driver",
        .owner  =3D THIS_MODULE,
        .ids    =3D toshiba_device_ids,
        .flags  =3D ACPI_DRIVER_ALL_NOTIFY_EVENTS,
        .ops    =3D {
                .add            =3D toshiba_acpi_add, // =3D=3D=3D> here
                .remove         =3D toshiba_acpi_remove,
                .notify         =3D toshiba_acpi_notify,
        },
        .drv.pm =3D &toshiba_acpi_pm,
};

the toshiba_acpi_add(...){ ...} not be excuted on that device.
Thanks.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
