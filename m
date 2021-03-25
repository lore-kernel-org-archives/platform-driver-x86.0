Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C945FC433C1
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 Mar 2021 15:08:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 897BB61A10
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 Mar 2021 15:08:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbhCYPHs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 Mar 2021 11:07:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36331 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230406AbhCYPHX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Mar 2021 11:07:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616684843;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sdW+h3VAQThOQw07Y6OKhgA+HyJmyOTTSfSPPcXsFkY=;
        b=CfUQu8EXuf59o9o1fxK1Z5LGeX/dYTgxy3KNxOiZnEtveKP1v6cWh5vs7/gyf8NhNM1PCp
        yqofuc54AQkYLVVw5iTn2YT7kdgN5gYD5oyPVVmyy4EGnR61sG0fhm5qQPgBD8hwJzhiLD
        5u2A5vtf9cDlmEM+Urr+slYwNWPq3ik=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-nx8xXDo_Pjm3amm6srKRww-1; Thu, 25 Mar 2021 11:07:17 -0400
X-MC-Unique: nx8xXDo_Pjm3amm6srKRww-1
Received: by mail-ed1-f72.google.com with SMTP id p6so2800498edq.21
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Mar 2021 08:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sdW+h3VAQThOQw07Y6OKhgA+HyJmyOTTSfSPPcXsFkY=;
        b=o/5Z7zqpcCEqvq7u9vuofTi8L8RBlklWDrO+Aax2MRWlxs1BU28kgzzTknQ/pKPBRc
         dYnhVT7A/9kz65Vws3LY5dryyETO/1fP7558vd4RS3yXEJShanma972QJG2sAo6jjFrd
         +LKWUTWLJo+xIPjjq1mt9u9LXMb2oxb7hzf5GQZkCIwFVVxA7ayQKuX06cTe4rFcgwd2
         JEsTlwIU4LyivIIav+wxqW5aa+Dg/8uM65S5BkMxoyr0YMJfq9gwwY1KBUN6dRUo+q6M
         J1B/IkwfqxL3fwbhqzUcIYqXeZBsp+muvKnhxB4/25k14HSMCCOVuWyLDUX5rxMeqMUu
         XTnw==
X-Gm-Message-State: AOAM530ThwAs2m8tHbqdeKJ+6kNHiSC41QI6QiaPDI50JRi32gN24N4U
        8nCZEZZ7DQA5q/Lp0jlf8AXN0+RfQyN2JjNfX+Zhc74QV2DNhlfXXYsKJb7uckzkAzBy7+o3NZs
        EEI/jygBBOOQ8hZrusQiglBzbtibUoCIJTLzFWdj78VMAOpZiAXlSNZG5fkLzyXbx9QkA9aT/Oh
        hWw3HkCM0xdg==
X-Received: by 2002:aa7:cb97:: with SMTP id r23mr9506816edt.106.1616684835642;
        Thu, 25 Mar 2021 08:07:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydmbo8ZKmhunzAF9C+bbWnixIH0gXNfgg9UZR6Jx+UkTqtnCZVem1uAMv94NPAhu43ZR44SA==
X-Received: by 2002:aa7:cb97:: with SMTP id r23mr9506770edt.106.1616684835320;
        Thu, 25 Mar 2021 08:07:15 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id oy8sm2537376ejb.58.2021.03.25.08.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Mar 2021 08:07:14 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] ASoC: rt715:add micmute led state control supports
To:     "Yuan, Perry" <Perry.Yuan@dell.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Mark Brown <broonie@kernel.org>,
        "pierre-louis.bossart@linux.intel.com" 
        <pierre-louis.bossart@linux.intel.com>,
        "Limonciello, Mario" <Mario.Limonciello@dell.com>
Cc:     "pobrn@protonmail.com" <pobrn@protonmail.com>,
        "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
        "tiwai@suse.com" <tiwai@suse.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20210301093834.19524-1-Perry_Yuan@Dell.com>
 <20210308172409.GF4656@sirena.org.uk>
 <SJ0PR19MB4528847687FEEE4A4DED8E3F84659@SJ0PR19MB4528.namprd19.prod.outlook.com>
 <604693cc-08c7-2b5f-632a-58ed537c54a0@perex.cz>
 <5cad3045-7948-3282-c999-926095818d5f@redhat.com>
 <SJ0PR19MB452851406C9B48DE688F1C1384629@SJ0PR19MB4528.namprd19.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <11d7916c-5e8a-f3a2-5906-ed007ed146a3@redhat.com>
Date:   Thu, 25 Mar 2021 16:07:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <SJ0PR19MB452851406C9B48DE688F1C1384629@SJ0PR19MB4528.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/25/21 3:11 PM, Yuan, Perry wrote:
> Hi Hans
> 
>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: Monday, March 22, 2021 11:02 PM
>> To: Jaroslav Kysela; Yuan, Perry; Mark Brown; pierre-
>> louis.bossart@linux.intel.com; Limonciello, Mario
>> Cc: pobrn@protonmail.com; oder_chiou@realtek.com; tiwai@suse.com;
>> mgross@linux.intel.com; lgirdwood@gmail.com; alsa-devel@alsa-project.org;
>> linux-kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org
>> Subject: Re: [PATCH v4 2/2] ASoC: rt715:add micmute led state control
>> supports
>>
>>
>> [EXTERNAL EMAIL]
>>
>> Hi,
>>
>> On 3/22/21 3:37 PM, Jaroslav Kysela wrote:
>>> Dne 22. 03. 21 v 10:25 Yuan, Perry napsal(a):
>>>> Hi Mark:
>>>>
>>>>> -----Original Message-----
>>>>> From: Mark Brown <broonie@kernel.org>
>>>>> Sent: Tuesday, March 9, 2021 1:24 AM
>>>>> To: Yuan, Perry
>>>>> Cc: pobrn@protonmail.com; pierre-louis.bossart@linux.intel.com;
>>>>> oder_chiou@realtek.com; perex@perex.cz; tiwai@suse.com;
>>>>> hdegoede@redhat.com; mgross@linux.intel.com; Limonciello, Mario;
>>>>> lgirdwood@gmail.com; alsa-devel@alsa-project.org; linux-
>>>>> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org
>>>>> Subject: Re: [PATCH v4 2/2] ASoC: rt715:add micmute led state
>>>>> control supports
>>>>>
>>>>> On Mon, Mar 01, 2021 at 05:38:34PM +0800, Perry Yuan wrote:
>>>>>
>>>>>> +	/* Micmute LED state changed by muted/unmute switch */
>>>>>> +	if (mc->invert) {
>>>>>> +		if (ucontrol->value.integer.value[0] || ucontrol-
>>>>>> value.integer.value[1]) {
>>>>>> +			micmute_led = LED_OFF;
>>>>>> +		} else {
>>>>>> +			micmute_led = LED_ON;
>>>>>> +		}
>>>>>> +		ledtrig_audio_set(LED_AUDIO_MICMUTE, micmute_led);
>>>>>> +	}
>>>>>
>>>>> These conditionals on inversion seem weird and counterintuitive.  If
>>>>> we're going with this approach it would probably be clearer to
>>>>> define a custom operation for the affected controls that wraps the
>>>>> standard one and adds the LED setting rather than keying off invert like
>> this.
>>>>
>>>> Currently the sof soundwire driver has no generic led control yet.
>>>> This patch can handle the led control needs for MIC mute LED, definitely
>> the patch is a short term solution.
>>>> There is a feature request discussion when we started to implement this
>> solution.
>>>> https://github.com/thesofproject/linux/issues/2496#issuecomment-
>> 71389
>>>> 2620
>>>>
>>>> The workable way for now is that we put the LED mute control to the
>> codec driver.
>>>> When there is new and full sound LED solution implemented, this part will
>> be also optimized.
>>>> The Hardware privacy feature needs this patch to handle the Mic mute led
>> state change.
>>>> Before that full solution ready in kernel, could we take this as short term
>> solution?
>>>
>>> Perry, it's about the machine detection. Your code is too much generic
>>> even for the top-level LED trigger implementation. We need an extra
>>> check, if the proper LED's are really controlled on the specific
>>> hardware. Other hardware may use RT715 for a different purpose. Use
>>> DMI / ACPI checks to detect this hardware and don't misuse the inversion
>> flag to enable this code.
>>
>> I think this would be a goo candidate for the new generic LED handling:
>>
>> https://lore.kernel.org/alsa-devel/20210317172945.842280-1-
>> perex@perex.cz/
>>
>> And then use a udev-rule + hwdb and/or UCM profiles to configure the LED
>> trigger for specific models from userspace ?
>>
>> Regards,
>>
>> Hans
>>
>>
>>
> Because the SOF SDW design has no mic mute led control yet.
> So I add one short term solution to make Dell privacy working for now 
> Definitely , that is new solution I can add my patch on that to test as one user case .
> We really need to take the short term solution work for some system which support new SOF soundwire hardware which have  dependence on the MIC mute feature
> Meanwhile we can continue working on the new  "udev-rule + hwdb and/or UCM profiles" solution as to replace this one.
> If we agree that, I will submit another V6 addressing new feedback. 

The triggering of the LED trigger and the code registering the led_classdev
are in 2 separate subsystems; and should be merged separately.

If you post a new version of patch 1/2 addressing my review remarks then
I can merge that.

For merging the sound side of this you need to talk to the sound folks
(Jaroslav Kysela, Takashi Iwai, Mark Brown for files under sound/soc).

Regards,

Hans

