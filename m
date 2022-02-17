Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC405C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Feb 2022 18:52:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244697AbiBQSwU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Feb 2022 13:52:20 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244704AbiBQSwK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Feb 2022 13:52:10 -0500
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF9516350
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 10:51:39 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id l125so14985673ybl.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 10:51:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/CATSLwq/ft5D1XaBzta42vJv+GHdzZvGkqELT/HRpM=;
        b=pGoEDEHP08a7URdTDNkaexpeBWQL5KApT7JoawrYYw3tekFwle3IEgZB8RZuIdzWOp
         FYs6xrAA89kfLGuzKdY/PxSWUfSJx7vpkAZ2Tj+vkwgkrDowQYBHz5todAUonj+DX75+
         +9FW93JHE6V5+BfFsiUkmGP35+FwkK6ecyNmL+F+8gMt9KANDcJsJi5F4qJDKAuidtcT
         7D7h5pb1q9ddEuIjRjJXYpgxuZrlHKBananVeZQg8NBKJYSFMsGwbN2lYi6PgzfML1vt
         CtyWygDyylNCLp/JrlrBe5a9Q+VVlnGDaiFLNl1tchz0TeU/X6IRAVxpvUZLH7Pov6VO
         hbbA==
X-Gm-Message-State: AOAM533SJMNRWZyr5+L3kKB7FM3GKE5qL+CFnRWs3wnsV+xocGKvpPwH
        JlN9SkRDxDsHUFOW+b5HyFkAz+o8o0tK3khZmOY=
X-Google-Smtp-Source: ABdhPJw0VoRUfuPAS8UHRjLgQMYx8CGZzTbvZsllvM6iwsoyEXUnveDFbBawOzIttjVlwLLdOC8y3NrD/JKROH/u084=
X-Received: by 2002:a25:6906:0:b0:611:ab5f:ff52 with SMTP id
 e6-20020a256906000000b00611ab5fff52mr3691099ybc.365.1645123899022; Thu, 17
 Feb 2022 10:51:39 -0800 (PST)
MIME-Version: 1.0
References: <cbd2f7727419301acc17c4479b81637829db4c9f.camel@intel.com>
 <3d178ca8-2fa9-1886-a04c-f3722db131eb@redhat.com> <CAJZ5v0hdA8YDgHyjV3tXbPwyETRi=EJG_8R6=QX3S9ZtaEV8cg@mail.gmail.com>
 <5ce192a8-ced8-0bf1-6825-d65cacfc8b3e@redhat.com> <CAJZ5v0hmBwziRS7uMjK+CAz-D1CuyCA4dt3n0QPc62Uy1MgUpQ@mail.gmail.com>
 <8218cf7d6ec5b474dcb26999d9d4d8ba2fe840ec.camel@intel.com>
In-Reply-To: <8218cf7d6ec5b474dcb26999d9d4d8ba2fe840ec.camel@intel.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Thu, 17 Feb 2022 19:51:28 +0100
Message-ID: <CAJZ5v0hfQ7_K_FZQhQNTAw4b9q_u5TAAZ6hTQcKdvrB3758gJA@mail.gmail.com>
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for 5.18-rc1
To:     "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
Cc:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "Zhang, Rui" <rui.zhang@intel.com>,
        "prarit@redhat.com" <prarit@redhat.com>,
        "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Feb 17, 2022 at 7:36 PM Pandruvada, Srinivas
<srinivas.pandruvada@intel.com> wrote:
>
> On Thu, 2022-02-17 at 19:20 +0100, Rafael J. Wysocki wrote:
> > On Thu, Feb 17, 2022 at 5:43 PM Hans de Goede <hdegoede@redhat.com>
> > wrote:
> > >
> > > Hi Rafael,
> > >
> > > On 2/17/22 17:41, Rafael J. Wysocki wrote:
> > > > On Thu, Feb 17, 2022 at 5:39 PM Hans de Goede
> > > > <hdegoede@redhat.com> wrote:
> > > > >
> > > > > <added the thermal maintainers to the To: list>
> > > > >
> > > > > On 2/15/22 20:21, Pandruvada, Srinivas wrote:
> > > > > > Hi Hans,
> > > > > >
> > > > > > Please check the pull request for intel-speed-select tool.
> > > > > >
> > > > > > To build the tool, we have dependency on linux-next commit
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/thermal?h=next-20220215&id=e4b1eb24ce5a696ef7229f9926ff34d7502f0582
> > > > >
> > > > > Hmm, that means that if I merge this into pdx86/for-next which
> > > > > is based on 5.17-rc1 then this won't build, which is bad.
> > > > >
> > > > > So I'm going to either need some immutable branch from the
> > > > > thermal maintainers to merge into pdx86/for-next,
> > > > > or we can just merge the intel-speed-select changes through
> > > > > the thermal tree for the 5.18-rc1 merge window.
> > > >
> > > > That can be done.
> > > >
> > > > > Either way is fine with me.
> > > >
> > > > OK
> > >
> > > Thanks for the quick reply.
> > >
> > > If you don't have any preference I think it makes sense to merge
> > > the intel-speed-select changes through the thermal tree for
> > > the 5.18-rc1 merge window, as the changes tot he tool build on
> > > kernel work done there.
> >
> > Right.
> >
> > Srinivas, please rebase this on top of commit c95aa2bab974 (the head
> > of my thermal-hfi branch) and resubmit with a CC to linux-pm.
> >
> I see these branches at
>  https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git
>
>  remotes/rafael-pm/acpi
>   remotes/rafael-pm/bleeding-edge
>   remotes/rafael-pm/devprop
>   remotes/rafael-pm/linux-next
>   remotes/rafael-pm/master
>   remotes/rafael-pm/pm
>   remotes/rafael-pm/pnp
>   remotes/rafael-pm/testing
>   remotes/rafael-pm/thermal
>
> There is no thermal-hfi publicly visible. Is this OK to rebase on top
> of thermal or linux-next?

thermal-hfi should be visible now.
