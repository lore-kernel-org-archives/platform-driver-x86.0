Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E84C61D97
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Nov 2023 12:33:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235114AbjKVMdS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Nov 2023 07:33:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbjKVMdR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Nov 2023 07:33:17 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5046D92
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Nov 2023 04:33:14 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD208C433CB
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Nov 2023 12:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700656393;
        bh=Ua4L5VUqsW9m9gviKwguvpWsbuwl3Uwacbl1x10oX0A=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=i7OlKAX/xsQ8j43eRiaMTbKzykh1azXZdygq5lnlyfSQj1zL9XJdLKA5NP1xIYKnM
         3NivsjphLD7+u4lz/d5PES7ZDK3MKR+IB2oVFMjJa06540XTLh2DgR4oAcCCAV+zd7
         TINmSH8MmwVRhlK9gO5C9iIDnNHgIVCXAoYJUyOO/2+6cvkJzX8hdECnE7dmpLCG5H
         TJUIMflhtMuL9j8sK0J/M2bUQOlzYtUntHURc8+/mOK7LD+32naL/hWNxNimIvFnyD
         F4BiXSGIw5D4mpFFEn3BThl7kQGqmrA1JlMY13p6a/ooldwuxBksOcHfyRGE+MxJbZ
         XZrc77yRwvQGQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C7B63C53BD5; Wed, 22 Nov 2023 12:33:13 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 203191] The fan speed reports to 65535, despite the fan is
 stopped
Date:   Wed, 22 Nov 2023 12:33:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jdelvare@suse.de
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status
Message-ID: <bug-203191-215701-a6QIlLEZu5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203191-215701@https.bugzilla.kernel.org/>
References: <bug-203191-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D203191

Jean Delvare (jdelvare@suse.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |ASSIGNED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
