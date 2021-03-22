Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCE1C433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Mar 2021 11:33:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F8B66198E
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Mar 2021 11:33:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhCVLcq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 22 Mar 2021 07:32:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:40292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230236AbhCVLc2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Mar 2021 07:32:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9B88B619A3
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Mar 2021 11:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616412748;
        bh=K5rQPrcGiAtXXZcE2zOjREzSRxK7AcmeA3hKJ037ZmY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jejjpKle6qvGXmTghrT1HrzLEOSZTw6IMSl9Wlq4xXDbYdfhzuDt8osERNogR69UO
         Z11GMTvS9qJixt/XdMDYGRW70iXLOl2/hS+YYkFLK68BZ16+ibtmYOD/3aQP+5Skkd
         YQrw888QhAiIvq7NMOFl+wefx7ABG7pp/jYbjGwppWfyQBqEaw0keuu39dtQ4wqnpc
         ZrgsBxOzKlo9WOr6rF2+l7M0mPX0+BmYmWRtVwW7PiLMOhjItAnYC3+zUQP8rEtD5P
         I7NV5TV8B0L53o0iajeTyaTwKZD63xzllV0tF/j/NaLpoy+j1zifzaMS6yA+FLRugu
         gJBld2NX+yArA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 22 Mar 2021 11:32:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-UTJT3KedDv@https.bugzilla.kernel.org/>
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

Andy Shevchenko (andy.shevchenko@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |andy.shevchenko@gmail.com

--- Comment #51 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to Artem S. Tashkinov from comment #49)
> (In reply to Andy Shevchenko from comment #48)
> > Matthew gave a really good explanation on techical background what's go=
ing
> > on. What you really need is to amend existing driver(s) or provide a new
> one
> > to fulfill the functionality you want to have.
>=20
> I'm not a programmer let alone a person who understand the innards of the
> Linux kernel to even attempt to fix the issue, not to mention that:
>=20
> > Note I believe that this will not be a whole lot of work (but its not
> trivial
> > either).
>=20
> Maybe we have ... kernel developers who can do that instead, for instance
> lm-sensors maintainers. I don't know. I'm confused. I did my best to repo=
rt
> the issue. Meanwhile I'll continue to use the hack since I want to monitor
> my HW right now - not a few years later when someone finally ventures to
> scratch the itch. Thank you very much ;-)

Artem,
I feel your pain. Believe me, I have got into the similar situation(s) myse=
lf
being actually a kernel developer! I'm often being frustrated, but that's h=
ow
it works in Linux and in OSS in general. The root cause here is the product=
ion
model used by world of Windows and world of Linux (and besides the downsides
like above I prefer the latter). For Windows the drivers are made for *THE
product* while in *nix world the drivers try to cover as many products as t=
hey
can with regard to the similarities and compatibility of the corresponding =
IPs.
That's why people often see "oh, hey, it works in Windows!" Yes, it works, =
but
if and only if you are using the very same *THE product*. Step right or left
will be a suicidal in that model. The Windows model is very fragile because=
 of
this and requires 10x times more resources to develop the code. OSS communi=
ty
simply does not have such resources to fulfill a job and due to economical
reasons even Micro$oft also found advantages in the OSS model (but not with=
 the
drivers, unfortunately). The best help for you and for the rest is to be on=
 the
constructive side. You see, you even may yourself to develop a solution and
become (a well paid) kernel developer. Or just for fun (look at the example=
 of
Intel IPU3 CIO2 camera glue layer (to support Windows only platforms) which=
 is
done solely by one guy who declared that he even didn't know C programming
language before!

So, please, do not blame people here, it's rather the problem of the model.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
