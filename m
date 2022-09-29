Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD4BC433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Sep 2022 18:21:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235550AbiI2SVm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 29 Sep 2022 14:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234163AbiI2SVl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 29 Sep 2022 14:21:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C297411BCE9
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Sep 2022 11:21:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6129F620DF
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Sep 2022 18:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1CF3C43147
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Sep 2022 18:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664475699;
        bh=4SN8zQE1FT2SjNMxqupMpeuXZnzvCImV5hkqpX7X0M8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=nAmDjr9aGSDsyFxTKWV8SAM95EWX9q49FFAQGMarLpA8DNam6gGW5mkqpySN3ioPr
         4dontLJOwOzf/pDQ3RSwRpHLtgfll7YmcGyrtidvV2BfGzPIfi4DeHJ483//r1+NO7
         z5PPM7OkWnEDcbH0tZ27eCEckvFK/7OeTjxszY07CPKKmIuX5FD8EDNrMMFPvuXXhP
         tXwdrpva8SU06oM/yN75o/B9NuhMMiNGcB5ctbWoMu1f1/7FeLrB6CeOHjy4aF1vGq
         y6loDLNLXDQu83KwgrSsAMimuUxHa/crg9LKgcgIa4eOVv5MlCxArLDFJfjf+RkvEE
         9auFghEIoQj+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B195CC433E6; Thu, 29 Sep 2022 18:21:39 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 201885] acpi PNP0C14:02: duplicate WMI GUID
 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:01)
Date:   Thu, 29 Sep 2022 18:21:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201885-215701-n4m8yNPIbN@https.bugzilla.kernel.org/>
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

--- Comment #20 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
During the architectural design of the WMI subsystem an assumption was made
that there was a 1:1 mapping of WMI GUIDs (that is they're unique).  This
hasn't caused MAJOR functional problems, but this was proven wrong, as it's
possible to fetch multiple BMOFs.

This change makes it so that if you have the wmi-bmof driver loaded on your
system you'll be able to fetch all of the BMOFs.  If you look in
/sys/bus/wmi/devices, you should see more entries with this patch in place.

If the same GUID is used multiple times on a system for any reason beside
wmi-bmof, that driver may need to be changed too.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
