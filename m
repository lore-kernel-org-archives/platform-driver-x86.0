Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A805FC54EE9
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Sep 2022 18:42:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbiIGSmw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Sep 2022 14:42:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbiIGSmw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Sep 2022 14:42:52 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3805981B0C
        for <platform-driver-x86@vger.kernel.org>; Wed,  7 Sep 2022 11:42:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E8810B81E07
        for <platform-driver-x86@vger.kernel.org>; Wed,  7 Sep 2022 18:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8A92C433D6
        for <platform-driver-x86@vger.kernel.org>; Wed,  7 Sep 2022 18:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662576168;
        bh=6BqS+kyeA3RB0ig6VhEyH8gZaIra+bjcVs3gJBTaTyM=;
        h=From:To:Subject:Date:From;
        b=YAbMi0IvJ5+qbyf1Cb9rg48qmCmNtJic/rjPwf7/abJXKCmqIwEOWXst8qwn0z0WF
         QxVR6r/G1k6v3PJZDZtpGuZMnXPgXJ+RuvVbF7XCciazqbevtrXAovKZbDzSox3VyK
         LxZvlNUWZVmwSiMkvI5j7JugJK5LsU3tJ7kqAtqJwKSQrqgPgIQrY8ouc5+ffKvoxX
         cWFnA7XNMxbAw2wg+gtxcm0GUDFzMkGpQ/zpXz60Sz2OXyfgjhgj1F+skOjrXvSBfv
         Nd5oy3+FHX9DKdJ//Y7QPG2BERwUBS5CW6kXwkbHifrDAK/7ky8GF00ZO2V+gIN0mD
         dQfMqydoCv43g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 85167C433E6; Wed,  7 Sep 2022 18:42:48 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216460] New: lenovo-thinklmi doesn't export a 'type' attribute
 and doesn't populate possible_values properly
Date:   Wed, 07 Sep 2022 18:42:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216460-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216460

            Bug ID: 216460
           Summary: lenovo-thinklmi doesn't export a 'type' attribute and
                    doesn't populate possible_values properly
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.0-rc3
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: mario.limonciello@amd.com
        Regression: No

The firmware-attributes documentation (
https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-class-firmware-a=
ttributes)
indicates that all drivers that support firmware-attributes need to support=
 the
'type' attribute.

This is important for userspace software to know how to interact with the
driver.=20=20

fwupd 1.8.4 added support for the firmware-attributes class API, but since
lenovo-thinklmi doesn't meet it shows the following error on every boot.

KERNEL BUG: 'type' attribute not exported: (failed to load type: Failed to =
open
file =E2=80=9C/sys/class/firmware-attributes/thinklmi/attributes/MCRUSBHead=
er/type=E2=80=9D: No
such file or directory)

A workaround has been landed in fwupd to avoid this attribute and hardcode =
the
known behavior of the current driver when it finds it.

It seems like all the attributes are actually "enumeration", so the
lenovo-thinklmi kernel driver should probably just export a type sysfs file
with "enumeration" hardcoded for all attributes.

Also though, the possible_values key is not populated either.  Instead the
values are put into the "current_value" string.  On a Lenovo P620 the follo=
wing
happens:

$ sudo cat
/sys/class/firmware-attributes/thinklmi/attributes/NUMA/current_value
Auto;[Optional:NPS1,NPS2,NPS4,Auto]
$ sudo cat
/sys/class/firmware-attributes/thinklmi/attributes/NUMA/possible_values
cat: /sys/class/firmware-attributes/thinklmi/attributes/NUMA/possible_value=
s:
Operation not supported

That is the userspace software tears apart the current_value string and ins=
tead
puts it into what the possible_values are.  This should be the responsibili=
ty
of the kernel driver.  Even if the firwmare returns all that in current_val=
ue,
the kernel driver should be doing the splitting so that userspace doesn't n=
eed
to carry quirks for different kernel drivers behaving differently.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
