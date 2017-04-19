From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] hp-wmi: Fix error value for hp_wmi_tablet_state
Date: Wed, 19 Apr 2017 19:21:20 +0300
Message-ID: <CAHp75VfOP0bnkWfAKPRpb5kBHj7ABeR1uhZwYdNFp25JUnO9Yg@mail.gmail.com>
References: <20170409135608.15621-1-carlo@caione.org> <20170409135608.15621-2-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f169.google.com ([209.85.220.169]:33786 "EHLO
        mail-qk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965756AbdDSQVV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Apr 2017 12:21:21 -0400
In-Reply-To: <20170409135608.15621-2-carlo@caione.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Carlo Caione <carlo@caione.org>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux@endlessm.com, Carlo Caione <carlo@endlessm.com>

On Sun, Apr 9, 2017 at 4:56 PM, Carlo Caione <carlo@caione.org> wrote:
> From: Carlo Caione <carlo@endlessm.com>
>
> hp_wmi_tablet_state() fails to return the correct error code when
> hp_wmi_perform_query() returns the HP WMI query specific error code
> that is a positive value.

>         int ret = hp_wmi_perform_query(HPWMI_HARDWARE_QUERY, 0, &state,
>                                        sizeof(state), sizeof(state));
>         if (ret)
> -               return ret;
> +               return -EINVAL;

Shouldn't be something like

if (ret)
 return ret < 0 ? ret : -EINVAL;

Looking into the code it looks like it may return all possible values:
0, negative, positive.

-- 
With Best Regards,
Andy Shevchenko
