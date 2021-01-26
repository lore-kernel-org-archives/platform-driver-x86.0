Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07CB2C433E0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Jan 2021 05:53:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C08722223D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Jan 2021 05:53:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731543AbhAZFxg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Jan 2021 00:53:36 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:37990 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726355AbhAZEGU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Jan 2021 23:06:20 -0500
Received: from 1.general.ikepanhc.us.vpn ([10.172.69.54])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <ike.pan@canonical.com>)
        id 1l4Fbi-000626-T3; Tue, 26 Jan 2021 04:05:35 +0000
Subject: Re: [PATCH v2 19/24] platform/x86: ideapad-laptop: fix checkpatch
 warnings, more consistent style
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
References: <20210113182016.166049-20-pobrn@protonmail.com>
 <0ef8c308-a995-52c2-0762-f6aae1efb86c@canonical.com>
 <TXigp22dYRHpj9NGdW-AiIOXJ3Dw0nQekdM2-qPzg1-sWptIoclYx_7uLW1EXlmosD36C7Ozg7gtFs5qhcgpCbN1fpUPeJgCmUyRh5-173g=@protonmail.com>
From:   Ike Panhc <ike.pan@canonical.com>
Message-ID: <4ebbc211-c54e-324f-6e89-128175016a7b@canonical.com>
Date:   Tue, 26 Jan 2021 12:05:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <TXigp22dYRHpj9NGdW-AiIOXJ3Dw0nQekdM2-qPzg1-sWptIoclYx_7uLW1EXlmosD36C7Ozg7gtFs5qhcgpCbN1fpUPeJgCmUyRh5-173g=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 1/25/21 10:25 PM, Barnabás Pőcze wrote:
> Hi
> 
> 
> 2021. január 25., hétfő 9:55 keltezéssel, Ike Panhc írta:
> 
>> On 1/14/21 2:22 AM, Barnabás Pőcze wrote:
>>> Fix (almost all) checkpatch warnings. Reorder variable definitions from
>>> longest to shortest. Add more whitespaces for better readability. Rename
>>> variables named `ret` to `err` where appropriate.
>>>
>>> Signed-off-by: Barnabás Pőcze <pobrn@protonmail.com>
>>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>>
>>> @@ -265,30 +280,40 @@ static int debugfs_status_show(struct seq_file *s, void *data)
>>>
>>>  	if (!read_ec_data(priv->adev->handle, VPCCMD_R_BL_MAX, &value))
>>>  		seq_printf(s, "Backlight max:\t%lu\n", value);
>>> +
>>>  	if (!read_ec_data(priv->adev->handle, VPCCMD_R_BL, &value))
>>>  		seq_printf(s, "Backlight now:\t%lu\n", value);
>>> +
>>>  	if (!read_ec_data(priv->adev->handle, VPCCMD_R_BL_POWER, &value))
>>>  		seq_printf(s, "BL power value:\t%s (%lu)\n", value ? "on" : "off", value);
>>> +
>>>  	seq_puts(s, "=====================\n");
>>>
>>>  	if (!read_ec_data(priv->adev->handle, VPCCMD_R_RF, &value))
>>>  		seq_printf(s, "Radio status:\t%s (%lu)\n", value ? "on" : "off", value);
>>> +
>>>  	if (!read_ec_data(priv->adev->handle, VPCCMD_R_WIFI, &value))
>>>  		seq_printf(s, "Wifi status:\t%s (%lu)\n", value ? "on" : "off", value);
>>> +
>>>  	if (!read_ec_data(priv->adev->handle, VPCCMD_R_BT, &value))
>>>  		seq_printf(s, "BT status:\t%s (%lu)\n", value ? "on" : "off", value);
>>> +
>>>  	if (!read_ec_data(priv->adev->handle, VPCCMD_R_3G, &value))
>>>  		seq_printf(s, "3G status:\t%s (%lu)\n", value ? "on" : "off", value);
>>> +
>>>  	seq_puts(s, "=====================\n");
>>>
>>>  	if (!read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &value))
>>>  		seq_printf(s, "Touchpad status:\t%s (%lu)\n", value ? "on" : "off", value);
>>> +
>>>  	if (!read_ec_data(priv->adev->handle, VPCCMD_R_CAMERA, &value))
>>>  		seq_printf(s, "Camera status:\t%s (%lu)\n", value ? "on" : "off", value);
>>> +
>>>  	seq_puts(s, "=====================\n");
>>>
>>>  	if (!eval_gbmd(priv->adev->handle, &value))
>>>  		seq_printf(s, "GBMD: %#010lx\n", value);
>>> +
>>>  	if (!eval_hals(priv->adev->handle, &value))
>>>  		seq_printf(s, "HALS: %#010lx\n", value);
>>>
>>
>> checkpatch.pl suggests empty lines? I think they are doing the same thing. It's better
>> to put them tightly.
>>
>> --
>> Ike
> 
> I added them at my own discretion, and I don't recall checkpatch suggesting
> it, so if you want to, I can remove them, but I'd like to keep one empty
> line before and after
> 
>   seq_puts(s, "=====================\n");
> 
> .
> 
> What do you think?
> 
> 
> Regards,
> Barnabás Pőcze
> 

That looks great. Many thanks.

--
Ike
