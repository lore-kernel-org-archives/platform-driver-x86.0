Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592CFC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Sep 2021 20:39:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2EB4B61183
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Sep 2021 20:39:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233618AbhINUkl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Sep 2021 16:40:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:46850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233555AbhINUkl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Sep 2021 16:40:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id A6C9B61178
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Sep 2021 20:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631651963;
        bh=mykGjAi//z5KnSc+HXpViy9g9RFO4YHHwyJLMOToRuE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=sv+zShbgiGqvvEalxiotntPQb4JUTKq3t+erRqv+cWdtfXzTLWmPIuiVcdjUdrObW
         awTsNyGbBUFa6oi/D7/P1aI2VlR36WMZsfhVJ1W2N1D1Rbo/U5GdcHiiOxIA7GF3f1
         aZPXKg2VNX0+RMTCtcgRiWNYP2WSDdnIQVVMiSexNAyeWUTnt9eNf5oIUIq+uvyLNp
         sij4MBsd4e4nc5+F7UOstgxAE4mTJ88zd/JBevqZzWx3q7k8AF0zMvhhtp2pjGNpDI
         EwCochT7SxGzzacp+VKf6syK9D0OQg2Cfd2f84H4AetI55Tr5bqH03kOZNd2hQNsoz
         DudmiNiFY412Q==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 14 Sep 2021 20:39:22 +0000
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
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-204807-215701-G7tcGANFNQ@https.bugzilla.kernel.org/>
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

Denis Pauk (pauk.denis@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #298703|0                           |1
        is obsolete|                            |

--- Comment #110 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 298805
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298805&action=3Dedit
POC: Add support for access via Asus WMI to nct6775 with debug

Add more debug information about what is wrong with match vendor/board name=
s.

(In reply to Jonathan from comment #109)
> Created attachment 298799 [details]
> dmesg for boot with Denis's patch applied

Could you add your board to list and recheck?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
