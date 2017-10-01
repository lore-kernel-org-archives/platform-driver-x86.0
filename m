From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 6/8] platform/x86: dell-wmi-smbios: Add a sysfs
 interface for SMBIOS tokens
Date: Sun, 1 Oct 2017 11:51:52 +0300
Message-ID: <CAHp75Vf34xOgBSNPxwUrGatX_+cWOP_gG3zurzBmeGWh+Duhhg@mail.gmail.com>
References: <cover.1506571187.git.mario.limonciello@dell.com>
 <64094c86a6083c3d4c34d1f005e8a71d07b61240.1506571188.git.mario.limonciello@dell.com>
 <20170930021059.GE13307@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:33143 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750953AbdJAIvx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 1 Oct 2017 04:51:53 -0400
In-Reply-To: <20170930021059.GE13307@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Mario Limonciello <mario.limonciello@dell.com>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>

On Sat, Sep 30, 2017 at 5:10 AM, Darren Hart <dvhart@infradead.org> wrote:
> On Wed, Sep 27, 2017 at 11:02:18PM -0500, Mario Limonciello wrote:
>> Currently userspace tools can access system tokens via the dcdbas
>> kernel module and a SMI call that will cause the platform to execute
>> SMM code.
>>
>> With a goal in mind of deprecating the dcdbas kernel module a different
>> method for accessing these tokens from userspace needs to be created.
>>
>> This is intentionally marked to only be readable as root as it can
>> contain sensitive information about the platform's configuration.
>>
>> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
>> ---
> ...
>> +static ssize_t tokens_show(struct device *dev,
>> +                        struct device_attribute *attr, char *buf)
>> +{
>> +     size_t off = 0;
>> +     int i;
>> +
>> +     for (i = 0; i < da_num_tokens; i++) {
>> +             if (off > PAGE_SIZE)
>> +                     break;
>> +             off += scnprintf(buf+off, PAGE_SIZE-off, "%04x\t%04x\t%04x\n",
>
> Minor Coding Style nit - spaces around binary operators: 3.1) Spaces

Fresh looking to this excerpt gives me an idea that we may actually
predict how many tokens to write beforehand. It makes output also
cleaner in a sense to not disrupt a last token in the middle.

Something like
tokens_to_print = min(da_num_tokens, (PAGE_SIZE  - 1) / 15);
?

-- 
With Best Regards,
Andy Shevchenko
