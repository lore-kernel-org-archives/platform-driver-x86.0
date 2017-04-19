From: Carlo Caione <carlo@endlessm.com>
Subject: Re: [PATCH 1/2] hp-wmi: Fix error value for hp_wmi_tablet_state
Date: Wed, 19 Apr 2017 18:24:04 +0200
Message-ID: <CAL9uMOHuC5Phg8UcCvrDwqCiCcndEF4co8R_jgPQ+LTd8WN=BQ@mail.gmail.com>
References: <20170409135608.15621-1-carlo@caione.org> <20170409135608.15621-2-carlo@caione.org>
 <CAHp75VfOP0bnkWfAKPRpb5kBHj7ABeR1uhZwYdNFp25JUnO9Yg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ua0-f181.google.com ([209.85.217.181]:33678 "EHLO
        mail-ua0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966254AbdDSQYF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Apr 2017 12:24:05 -0400
Received: by mail-ua0-f181.google.com with SMTP id q26so22561209uaa.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Apr 2017 09:24:05 -0700 (PDT)
In-Reply-To: <CAHp75VfOP0bnkWfAKPRpb5kBHj7ABeR1uhZwYdNFp25JUnO9Yg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Carlo Caione <carlo@caione.org>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>

On Wed, Apr 19, 2017 at 6:21 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Sun, Apr 9, 2017 at 4:56 PM, Carlo Caione <carlo@caione.org> wrote:
>> From: Carlo Caione <carlo@endlessm.com>
>>
>> hp_wmi_tablet_state() fails to return the correct error code when
>> hp_wmi_perform_query() returns the HP WMI query specific error code
>> that is a positive value.
>
>>         int ret = hp_wmi_perform_query(HPWMI_HARDWARE_QUERY, 0, &state,
>>                                        sizeof(state), sizeof(state));
>>         if (ret)
>> -               return ret;
>> +               return -EINVAL;
>
> Shouldn't be something like
>
> if (ret)
>  return ret < 0 ? ret : -EINVAL;
>
> Looking into the code it looks like it may return all possible values:
> 0, negative, positive.

When the HP WMI query returns a positive value something went wrong.
hp_wmi_perform_query() returns 0 on success.

-- 
Carlo Caione  |  +39.340.80.30.096  |  Endless
