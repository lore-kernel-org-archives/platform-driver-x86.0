From: Carlo Caione <carlo@endlessm.com>
Subject: Re: [PATCH v2 1/2] hp-wmi: Do not shadow error values
Date: Wed, 19 Apr 2017 22:25:01 +0200
Message-ID: <CAL9uMOGw_mPxzSjyFKcs7PT9b0FMow1gujiBEMQJEbcznjgfLg@mail.gmail.com>
References: <20170419174154.16518-1-carlo@caione.org> <20170419174154.16518-2-carlo@caione.org>
 <20170419201120.GA17351@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ua0-f180.google.com ([209.85.217.180]:33324 "EHLO
        mail-ua0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936973AbdDSUZI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Apr 2017 16:25:08 -0400
Received: by mail-ua0-f180.google.com with SMTP id q26so29773730uaa.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Apr 2017 13:25:07 -0700 (PDT)
In-Reply-To: <20170419201120.GA17351@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Carlo Caione <carlo@caione.org>, Andy Shevchenko <andy@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org, Linux Upstreaming Team <linux@endlessm.com>

On Wed, Apr 19, 2017 at 10:11 PM, Darren Hart <dvhart@infradead.org> wrote:
> On Wed, Apr 19, 2017 at 07:41:53PM +0200, Carlo Caione wrote:
>> From: Carlo Caione <carlo@endlessm.com>
>>
>> All the helper functions (i.e. hp_wmi_dock_state, hp_wmi_tablet_state,
>> ...) using hp_wmi_perform_query to perform an HP WMI query shadow the
>> returned value in case of error.
>>
>> We return -EINVAL only when the HP WMI query returns a positive value
>> (the specific error code) to not mix this up with the actual value
>> returned by the helper function.
>
> So Andy is correct in that we try to avoid shadowing error codes where possible.
> I accepted v1 of this series because it fixed an existing problem in a way
> consistent with the existing code.
>
> Since v1 is already in for-next, let's consider the following a subsequent
> cleanup. Would you please create a new patch to address the shadowing error code
> issues on top of the v1 patch series.

No problem. On its way.

-- 
Carlo Caione  |  +39.340.80.30.096  |  Endless
