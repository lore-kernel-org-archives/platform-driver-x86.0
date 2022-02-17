Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0AEEC433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Feb 2022 18:21:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244161AbiBQSVO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Feb 2022 13:21:14 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbiBQSVO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Feb 2022 13:21:14 -0500
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE17A2B2FF1
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 10:20:59 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-2d310db3812so41414827b3.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 10:20:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DxMcvH8dZ6bkamJKDFGtitHTLwQY9lL/c8AW9FP0yws=;
        b=afRH3RVJDWhaE8C486ZfIzcfcZiuu9c+9/oFcPZDhYCYGsXrfbPzw3wZ9G18K9zGTr
         imexcbMT6zVoGUlnwxJF6k3O65PZLab3FL1ESIcYWSvi3YDQDdyadqjrpfd5zTQM6Hij
         0jS7IO4FHuztzqWEUDcmHHAtxfNfbq5/+NxkFU/aS0BtRdmhnQHcWsPXdkMS4wNZIYRE
         xKu8+on7L4jRCh+BbVtlet8ThE0dQXOPwsKMbRBbs5Xo0mrlZHgBHbbZkiVwbfntuHKp
         gHtVYGPBXwmaRGA5UVP+uDMIpuKK47b9Syt6wZyDgJGARc3zJ3m3PrtjzONH923MJQiu
         OZjg==
X-Gm-Message-State: AOAM532lJNh26EddJHfT9VvQKzKX7vZJgPL4cI6oxdLJRRz16tIyiD3S
        ekIFmE19uuQ7IyX1Q/wdvwuCwP1z6xDrA3VQuDE=
X-Google-Smtp-Source: ABdhPJwt9olYYbypIFfG5V9AQnQwjWRid3YcGPG6PF/qV/xIE7NF7jbOxHGBVWx2AyfToSmr++t6zdYc+rZ38swQ3EE=
X-Received: by 2002:a0d:c244:0:b0:2d1:1fbb:180d with SMTP id
 e65-20020a0dc244000000b002d11fbb180dmr3908083ywd.196.1645122059005; Thu, 17
 Feb 2022 10:20:59 -0800 (PST)
MIME-Version: 1.0
References: <cbd2f7727419301acc17c4479b81637829db4c9f.camel@intel.com>
 <3d178ca8-2fa9-1886-a04c-f3722db131eb@redhat.com> <CAJZ5v0hdA8YDgHyjV3tXbPwyETRi=EJG_8R6=QX3S9ZtaEV8cg@mail.gmail.com>
 <5ce192a8-ced8-0bf1-6825-d65cacfc8b3e@redhat.com>
In-Reply-To: <5ce192a8-ced8-0bf1-6825-d65cacfc8b3e@redhat.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Thu, 17 Feb 2022 19:20:48 +0100
Message-ID: <CAJZ5v0hmBwziRS7uMjK+CAz-D1CuyCA4dt3n0QPc62Uy1MgUpQ@mail.gmail.com>
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for 5.18-rc1
To:     Hans de Goede <hdegoede@redhat.com>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "prarit@redhat.com" <prarit@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Feb 17, 2022 at 5:43 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Rafael,
>
> On 2/17/22 17:41, Rafael J. Wysocki wrote:
> > On Thu, Feb 17, 2022 at 5:39 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> <added the thermal maintainers to the To: list>
> >>
> >> On 2/15/22 20:21, Pandruvada, Srinivas wrote:
> >>> Hi Hans,
> >>>
> >>> Please check the pull request for intel-speed-select tool.
> >>>
> >>> To build the tool, we have dependency on linux-next commit
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/thermal?h=next-20220215&id=e4b1eb24ce5a696ef7229f9926ff34d7502f0582
> >>
> >> Hmm, that means that if I merge this into pdx86/for-next which
> >> is based on 5.17-rc1 then this won't build, which is bad.
> >>
> >> So I'm going to either need some immutable branch from the
> >> thermal maintainers to merge into pdx86/for-next,
> >> or we can just merge the intel-speed-select changes through
> >> the thermal tree for the 5.18-rc1 merge window.
> >
> > That can be done.
> >
> >> Either way is fine with me.
> >
> > OK
>
> Thanks for the quick reply.
>
> If you don't have any preference I think it makes sense to merge
> the intel-speed-select changes through the thermal tree for
> the 5.18-rc1 merge window, as the changes tot he tool build on
> kernel work done there.

Right.

Srinivas, please rebase this on top of commit c95aa2bab974 (the head
of my thermal-hfi branch) and resubmit with a CC to linux-pm.

Alternatively, you can just send a patch for me to apply.
