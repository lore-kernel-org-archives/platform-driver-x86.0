From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH 3/3] platform/wmi: Expose the raw WDG data in sysfs
Date: Tue, 1 Aug 2017 13:19:16 -0700
Message-ID: <CALCETrX0zqq3xQgNBx41R9ZCT3_bB4EoXGrY3jWLK0e0Koo=EQ@mail.gmail.com>
References: <cover.1501601667.git.luto@kernel.org> <e6df9d038af0a0ce4d4119395aaea58366ade26d.1501601667.git.luto@kernel.org>
 <20170801200313.GC3110@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752096AbdHAUTi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Aug 2017 16:19:38 -0400
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com [209.85.213.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D8D9522CB7
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Aug 2017 20:19:37 +0000 (UTC)
Received: by mail-vk0-f54.google.com with SMTP id u133so10589744vke.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Aug 2017 13:19:37 -0700 (PDT)
In-Reply-To: <20170801200313.GC3110@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>

On Tue, Aug 1, 2017 at 1:03 PM, Darren Hart <dvhart@infradead.org> wrote:
> On Tue, Aug 01, 2017 at 08:37:28AM -0700, Andy Lutomirski wrote:
>> This adds a sysfs binary attribute 'wdg' on the bus device
>> (i.e. /sys/class/wmi_bus/wmi_bus-*/wdg) that contains the raw _WDG
>> data from ACPI.  This can be used along with the wmi-bmof driver to
>> decode the raw interface data from ACPI.
>
> I don't recall seeing mention of this is the documentation I read as a
> requirement to decoding the interface with the bmof. Do Windows systems export
> _WDG to userspace?
>
> Why do we need to export _WDG?

This was a feature that Pali asked for.  Pali, since you seem to be
working on userspace tooling, can you explain exactly what you'd use
it for?

On my laptop, at the very least, it would allow user code to determine
that there's a WMI GUID that doesn't show up in sysfs.  It doesn't
show up in sysfs because the ACPI methods are completely missing, but
it's still there in WDG.  This prints a warning when wmi.ko is loaded,
but maybe the userspace tooling would care, for debugging if nothing
else.
