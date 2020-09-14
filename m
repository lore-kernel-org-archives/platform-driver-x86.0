From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] Introduce support for Systems Management Driver over WMI
 for Dell Systems
Date: Mon, 14 Sep 2020 10:57:53 +0200
Message-ID: <25c9e901-ed28-eb87-bd89-652c3710b62b@redhat.com>
References: <20200730143122.10237-1-divya_bharathi@dell.com>
 <aa23d8b8-6c6b-b6f2-e916-1defff8a9b26@redhat.com>
 <DM6PR19MB26362B2A2CDFE73BE167FD34FA2E0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <c5a6e340-66ec-e03b-a9a8-9c61b9f388d5@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c5a6e340-66ec-e03b-a9a8-9c61b9f388d5@redhat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Limonciello, Mario" <Mario.Limonciello@dell.com>, Divya Bharathi <divya27392@gmail.com>, "dvhart@infradead.org" <dvhart@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Bharathi, Divya" <Divya.Bharathi@Dell.com>, "Ksr, Prasanth" <Prasanth.Ksr@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 9/14/20 10:45 AM, Hans de Goede wrote:

<snip>

>>>> +           lower_bound:    A file that can be read to obtain the lower
>>>> +           bound value of the <attr>
>>>> +
>>>> +           modifier:       A file that can be read to obtain attribute-level
>>>> +           dependency rule which has to be met to configure <attr>
>>>> +
>>>> +           scalar_increment:       A file that can be read to obtain the
>>>> +           resolution of the incremental value this attribute accepts.
>>>> +
>>>> +           upper_bound:    A file that can be read to obtain the upper
>>>> +           bound value of the <attr>
>>>
>>> Are these integers or also possibly floats? I guess possibly also floats, right?
>>> Then at a minimum this should specify which decimal-separator is used (I assume
>>> we will go with the usual '.' as decimal separator).
>>
>> In practice they're integers, but I don't see why they couldn't be floats.
> 
> Hmm, that is a bit hand-wavy, for an userspace ABI we really need to define
> this clearly. Either it is integers (which is fine), or it is floats and we need
> to define a decimal-separator as part of the ABI.
> 
> Note the reason why I started wondering about this in the first place is the
> scalar_increment attribute. I think that can use some clarification too.

p.s.

I just realized that the lower_ / upper_bound attributes would be
better if they were renamed to min_value and max_value then everyone
will immediately understand what they are without even needing to
consult the docs.

Regards,

Hans
