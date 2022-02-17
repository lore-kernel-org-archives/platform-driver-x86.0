Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60254C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Feb 2022 16:41:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238681AbiBQQll (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Feb 2022 11:41:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241868AbiBQQlk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Feb 2022 11:41:40 -0500
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CA152B355E
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 08:41:21 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id v73so1886306ybe.12
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 08:41:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ddywmLba4flE0Vcx/6pD3NC7BJywqqTNrGnzRYlWcso=;
        b=Qbc7k/kbTvCE4NQxc933gtNq8WfsEdp0F3RZUvSe3g4hsiPtoY7LKtibijml7cXfSK
         Dp+qbbQEqMckmd+6mW6fcimuSRH/bw5J5GhygWbSDEumywfdiPIoJKDXUd5uBl44bTwj
         xlVY93ZL0cTckrjy8BCulZnP/3of1Tqm1DUMNS3ls/p/oMW/cdLKcN57+siPIBUvUTEy
         epqzY13JLWx8lbSd1EyPBWKHNJciOz+zykAuimaddGyYGQHco5EQ93PaIJHEcMLAbNS0
         1tEIYTM27ptVYxobas9EGyOTMV63tA0PwvJd+L7NNkxrT7deB5pwMcegpjnBkUz5gflS
         Bpmw==
X-Gm-Message-State: AOAM532tbdJhfEYSDekhOc5lmrNzRGN0LFWOf88+QxLNFyqBI3gRldp1
        ikAqf55FvlTmbMIUnqIAPPev3qeiPZYTWiwg8ybdF0lu
X-Google-Smtp-Source: ABdhPJzViUujwhj+XJsBBGVAlOHeCixBo8dP7Mw8riv2jxm+8cz3cWOj4tp/s/+whRFd/HAK1D2C22Yjt/ktwv2VmWQ=
X-Received: by 2002:a25:378f:0:b0:61d:8e8b:6cf5 with SMTP id
 e137-20020a25378f000000b0061d8e8b6cf5mr3179529yba.622.1645116080685; Thu, 17
 Feb 2022 08:41:20 -0800 (PST)
MIME-Version: 1.0
References: <cbd2f7727419301acc17c4479b81637829db4c9f.camel@intel.com> <3d178ca8-2fa9-1886-a04c-f3722db131eb@redhat.com>
In-Reply-To: <3d178ca8-2fa9-1886-a04c-f3722db131eb@redhat.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Thu, 17 Feb 2022 17:41:08 +0100
Message-ID: <CAJZ5v0hdA8YDgHyjV3tXbPwyETRi=EJG_8R6=QX3S9ZtaEV8cg@mail.gmail.com>
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for 5.18-rc1
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
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

On Thu, Feb 17, 2022 at 5:39 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> <added the thermal maintainers to the To: list>
>
> On 2/15/22 20:21, Pandruvada, Srinivas wrote:
> > Hi Hans,
> >
> > Please check the pull request for intel-speed-select tool.
> >
> > To build the tool, we have dependency on linux-next commit
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/thermal?h=next-20220215&id=e4b1eb24ce5a696ef7229f9926ff34d7502f0582
>
> Hmm, that means that if I merge this into pdx86/for-next which
> is based on 5.17-rc1 then this won't build, which is bad.
>
> So I'm going to either need some immutable branch from the
> thermal maintainers to merge into pdx86/for-next,
> or we can just merge the intel-speed-select changes through
> the thermal tree for the 5.18-rc1 merge window.

That can be done.

> Either way is fine with me.

OK
