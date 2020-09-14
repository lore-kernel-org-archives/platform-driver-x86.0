From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] Introduce support for Systems Management Driver over WMI
 for Dell Systems
Date: Mon, 14 Sep 2020 10:45:02 +0200
Message-ID: <c5a6e340-66ec-e03b-a9a8-9c61b9f388d5@redhat.com>
References: <20200730143122.10237-1-divya_bharathi@dell.com>
 <aa23d8b8-6c6b-b6f2-e916-1defff8a9b26@redhat.com>
 <DM6PR19MB26362B2A2CDFE73BE167FD34FA2E0@DM6PR19MB2636.namprd19.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DM6PR19MB26362B2A2CDFE73BE167FD34FA2E0@DM6PR19MB2636.namprd19.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Limonciello, Mario" <Mario.Limonciello@dell.com>, Divya Bharathi <divya27392@gmail.com>, "dvhart@infradead.org" <dvhart@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Bharathi, Divya" <Divya.Bharathi@Dell.com>, "Ksr, Prasanth" <Prasanth.Ksr@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

Sorry for being slow with getting back to you on this.

On 9/1/20 4:22 PM, Limonciello, Mario wrote:
>>
>> "A read-only attribute enumerating if a reboot is pending on any BIOS attribute
>> change."
>> does not really seem to make much sense. I guess what this is trying to say is:
>>
>> "This read-only attribute reads 1 if a reboot is necessary to apply pending BIOS
>> attribute changes"?
>>
>>                0:      All BIOS attributes setting are current
>>                1:      A reboot is necessary to get pending pending BIOS attribute
>> changes applied
>>
>> Or some such. I'm not really happy with my own text either, but I think it
>> better explains
>> what this attribute is about then the original text, right ?
> 
> I think that text does read better, Divya and team will reword it.
> 
> <snip>
> 
>>> +           display_name_language_code:     A file that can be read to obtain
>>> +           the language code corresponding to the "display_name" of the <attr>
>>
>> This needs to be specified better, e.g. this needs to say that this is an
>> ISO 639‑1 language code (or some other language-code specification)
> 
> Ack.
> 
>>
>>
>>> +
>>> +           modifier:       A file that can be read to obtain attribute-level
>>> +           dependency rule which has to be met to configure <attr>
>>
>> What is the difference between modifier and value_modifier ? Also this need to
>> be specified in more detail.
> 
> Ack.
> 
>>
>>> +
>>> +           possible_value: A file that can be read to obtain the possible
>>> +           value of the <attr>
>>
>> This is an enum, so possible value_s_ ?  I assume that for a enum this will list
>> all possible values, this also needs to specify how the possible values will be
>> separated (e.g. using semi-colons or newlines or ...).
> 
> Yes correct.
> 
>>
>>
>>> +
>>> +           value_modifier: A file that can be read to obtain value-level
>>> +           dependency on a possible value which has to be met to configure
>> <attr>
>>> +
>>> +What:              /sys/devices/platform/dell-wmi-
>> sysman/attributes/integer/<attr>/
>>> +Date:              October 2020
>>> +KernelVersion:     5.9
>>> +Contact:   Divya Bharathi <Divya.Bharathi@Dell.com>,
>>> +           Mario Limonciello <mario.limonciello@dell.com>,
>>> +           Prasanth KSR <prasanth.ksr@dell.com>
>>> +Description:
>>> +           This directory exposes interfaces for interaction with
>>> +           BIOS integer attributes.
>>> +
>>> +           Integer attributes are settings that accept a range of
>>> +           numerical values for inputs. Each BIOS integer has a
>>> +           lower bound and an upper bound on the values that it can take.
>>> +
>>> +           current_value:  A file that can be read to obtain the current
>>> +           value of the <attr>
>>> +
>>> +           This file can also be written to in order to update
>>> +           the value of an <attr>.
>>> +
>>> +           default_value:  A file that can be read to obtain the default
>>> +           value of the <attr>
>>> +
>>> +           display_name:   A file that can be read to obtain a user friendly
>>> +           description of the at <attr>
>>> +
>>> +           display_name_language_code:     A file that can be read to obtain
>>> +           the language code corresponding to the "display_name" of the <attr>
>>> +
>>> +           lower_bound:    A file that can be read to obtain the lower
>>> +           bound value of the <attr>
>>> +
>>> +           modifier:       A file that can be read to obtain attribute-level
>>> +           dependency rule which has to be met to configure <attr>
>>> +
>>> +           scalar_increment:       A file that can be read to obtain the
>>> +           resolution of the incremental value this attribute accepts.
>>> +
>>> +           upper_bound:    A file that can be read to obtain the upper
>>> +           bound value of the <attr>
>>
>> Are these integers or also possibly floats? I guess possibly also floats, right?
>> Then at a minimum this should specify which decimal-separator is used (I assume
>> we will go with the usual '.' as decimal separator).
> 
> In practice they're integers, but I don't see why they couldn't be floats.

Hmm, that is a bit hand-wavy, for an userspace ABI we really need to define
this clearly. Either it is integers (which is fine), or it is floats and we need
to define a decimal-separator as part of the ABI.

Note the reason why I started wondering about this in the first place is the
scalar_increment attribute. I think that can use some clarification too.

Regards,

Hans
