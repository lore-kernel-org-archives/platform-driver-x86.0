Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942ADC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun, 26 Jun 2022 15:56:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbiFZP4q (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 26 Jun 2022 11:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiFZP4q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Jun 2022 11:56:46 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60BD2DE82
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Jun 2022 08:56:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 20233B80D37
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Jun 2022 15:56:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6428C34114
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Jun 2022 15:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656259002;
        bh=4R3nZwtvcRM0XaAUL8wc17arN5yBXSxo8fNNKLAgNmo=;
        h=From:To:Subject:Date:From;
        b=s9WsjZaZBrU7GESxUCcJ+PnTPYqYfsRhSI+Hdzaapmm4CeaSS+k3/U0/x4OYQ3O/M
         TIHvkCsDd/SSI6e2BVqSeDe6rnYxlK04i3yPQYiooaW5TacE/ag6Wl3PzOVjoU8/aM
         JrGXg9JVzTvKdYcerzWCj8OrIOt7bIj2rE3Ahh4Pu6p9HbZQDdK9P27H2xUC6tYvKl
         UK+igC4FYWWmdetUR/uhV5sbMbZdutRNBcTgvUvfZEdVAjJD8/Kd5lQgrAj9c2tMRQ
         tFXL0TXxbXthfL9eEABWPb0Rwly+W6vOI7m3HW25gqbLo/WgcMCeFinwaS5qJfpED/
         vA++NcNxTV/iw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AD123C05FF5; Sun, 26 Jun 2022 15:56:42 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216176] New: ideapad-laptop doesn't expose rapid charge
Date:   Sun, 26 Jun 2022 15:56:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tinozzo123@tutanota.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216176-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216176

            Bug ID: 216176
           Summary: ideapad-laptop doesn't expose rapid charge
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.18.5
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: tinozzo123@tutanota.com
        Regression: No

Lenovo IdeaPad laptops support a feature named "Rapid Charge", normally usa=
ble
on Windows via Lenovo Vantage. However, this feature isn't exposed on
idepad-laptop.c.
According to the Arch Wiki, this feature is still usable via ACPI commands:

To enable:
# echo '\_SB.PCI0.LPC0.EC0.VPC0.SBMC 0x07' > /proc/acpi/call

To disable:
# echo '\_SB.PCI0.LPC0.EC0.VPC0.SBMC 0x08' > /proc/acpi/call

To check, the wiki uses different commands for different laptops. Three of =
them
are (on all of them, 0x0 stands for off and 0x1 stands for on):
Lenovo IdeaPad 5 14are05
# echo '\_SB.PCI0.LPC0.EC0.FCGM' | tee /proc/acpi/call
# cat /proc/acpi/call; printf '\n'

Lenovo IdeaPad 5 15are05
# echo '\_SB.PCI0.LPC0.EC0.QCHO' > /proc/acpi/call
# cat /proc/acpi/call; printf '\n'

Lenovo IdeaPad Flex 5 14alc05
# echo '\_SB.PCI0.LPC0.EC0.QKCM' | tee /proc/acpi/call
# cat /proc/acpi/call | cut -d '' -f1

Small note, on Lenovo Vantage enabling Rapid Charge disables Battery
Conservation automatically, and enabling Battery Conservation disables Rapid
Charge automatically. The ACPI commands don't have this limitation.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
