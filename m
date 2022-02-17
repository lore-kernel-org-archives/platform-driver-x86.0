Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE02EC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Feb 2022 16:39:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243065AbiBQQjv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Feb 2022 11:39:51 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239518AbiBQQju (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Feb 2022 11:39:50 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 78A552B2FD7
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 08:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645115974;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=60vyc0b4nN4BXSiqacPPcG6kOA73NTPkBJhsf6awROs=;
        b=F5johthHhTJkH/BbEThX6jB75o0JxrVELKVlETjvdGtCNaU1OEidZONutfWFNdA5UlnO7V
        HsGDjPWTbP2v5gR82yTts6tdJsmQa36GvG0ug2hIwxXe1rvknnwmJOvmd7zQOMhTOdQaG/
        xW+g7zy9W3G8ySW4DPmjbreycBCAEI4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-7zY1VUwZPYaSSwIeGNFZ-g-1; Thu, 17 Feb 2022 11:39:33 -0500
X-MC-Unique: 7zY1VUwZPYaSSwIeGNFZ-g-1
Received: by mail-ej1-f72.google.com with SMTP id o4-20020a170906768400b006a981625756so1810342ejm.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 08:39:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=60vyc0b4nN4BXSiqacPPcG6kOA73NTPkBJhsf6awROs=;
        b=k/oSqanUSE10ttza6AFRJ6MOA8orXnZGFWCeD8WlrjuodraC8d/lbX8dSlt4GNNy49
         SMO/Q6nrj2NqfF3NPX+eaEZs6oz8nvyXdWxgcnlWFD3toDSNun0O8lW6mPOTb3fxdqc7
         raDevEOF39ZlkdNmpfbcnjU+Mjw9Ayjb9Mtm7y4E61CnQ9gJqytiuKZKgjPCMGyMo6MF
         FczAbhhCh1ym9sxJQ3cc7/Xroct4orvLSYWIxEvbSvke87s5cJvlzCStdHCfriH2WCnd
         YCHlIPH/x4yuidm7nksv/ZDVI2/zRQb+h2sCNcg10URIwd6N7pEM6y0DE6CPZ30LNNLq
         Kxig==
X-Gm-Message-State: AOAM533zSYUma4t6BjDQJJltNHIC2KYldOreFs8/AUmYBNOzk0YsKR3+
        1XkzQY3JALFRzp94qRgigQtOCK6WX4knHwuz4NpX5xt2i8dWGN21FRRpFllrAn7uy6kSUFu2mXP
        yaaC37Yyc8OiGI4Yd5mahTpA6yk8Z2Nrx9g==
X-Received: by 2002:a05:6402:170e:b0:40b:657:ac3f with SMTP id y14-20020a056402170e00b0040b0657ac3fmr3458523edu.354.1645115972160;
        Thu, 17 Feb 2022 08:39:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzD4B0jnQS5xGUUDwzwJQnz44w52qSjS3orl0qstsqyC4Qxe418D/FWf5PmfKfzCsIOybwkhA==
X-Received: by 2002:a05:6402:170e:b0:40b:657:ac3f with SMTP id y14-20020a056402170e00b0040b0657ac3fmr3458488edu.354.1645115971990;
        Thu, 17 Feb 2022 08:39:31 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id d27sm1335884ejo.224.2022.02.17.08.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 08:39:31 -0800 (PST)
Message-ID: <3d178ca8-2fa9-1886-a04c-f3722db131eb@redhat.com>
Date:   Thu, 17 Feb 2022 17:39:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 5.18-rc1
Content-Language: en-US
To:     "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "prarit@redhat.com" <prarit@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <cbd2f7727419301acc17c4479b81637829db4c9f.camel@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <cbd2f7727419301acc17c4479b81637829db4c9f.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

<added the thermal maintainers to the To: list>

On 2/15/22 20:21, Pandruvada, Srinivas wrote:
> Hi Hans,
> 
> Please check the pull request for intel-speed-select tool.
> 
> To build the tool, we have dependency on linux-next commit
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/thermal?h=next-20220215&id=e4b1eb24ce5a696ef7229f9926ff34d7502f0582

Hmm, that means that if I merge this into pdx86/for-next which
is based on 5.17-rc1 then this won't build, which is bad.

So I'm going to either need some immutable branch from the
thermal maintainers to merge into pdx86/for-next,
or we can just merge the intel-speed-select changes through
the thermal tree for the 5.18-rc1 merge window.

Either way is fine with me.

Regards,

Hans


> 
> 
> The following changes since commit
> ae707d0eb707b5fc658e870dbd8b21887b0a5240:
> 
>   platform/x86: intel_cht_int33fe: Move to intel directory (2022-02-11
> 10:52:56 +0100)
> 
> are available in the Git repository at:
> 
>   https://github.com/spandruvada/linux-kernel.git intel-sst
> 
> for you to fetch changes up to
> 9aa7f0d5fe526cb9ceeea0787db0dc1c081bc61d:
> 
>   tools/power/x86/intel-speed-select: v1.12 release (2022-02-15
> 11:12:55 -0800)
> 
> ----------------------------------------------------------------
> Srinivas Pandruvada (3):
>       tools/power/x86/intel-speed-select: OOB daemon mode
>       tools/power/x86/intel-speed-select: HFI support
>       tools/power/x86/intel-speed-select: v1.12 release
> 
>  tools/power/x86/intel-speed-select/Build         |   2 +-
>  tools/power/x86/intel-speed-select/Makefile      |  10 +++-
>  tools/power/x86/intel-speed-select/hfi-events.c  | 309
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> ++++++++++++++++++++++++++++
>  tools/power/x86/intel-speed-select/isst-config.c |  54 ++++++++++++++-
> ---
>  tools/power/x86/intel-speed-select/isst-daemon.c | 244
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> +++++++
>  tools/power/x86/intel-speed-select/isst.h        |  13 +++++
>  6 files changed, 617 insertions(+), 15 deletions(-)
>  create mode 100644 tools/power/x86/intel-speed-select/hfi-events.c
>  create mode 100644 tools/power/x86/intel-speed-select/isst-daemon.c
> 
> Thanks,
> Srinivas
> 

