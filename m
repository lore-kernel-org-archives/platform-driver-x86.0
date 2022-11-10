Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C349AC4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Nov 2022 19:11:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbiKJTLe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Nov 2022 14:11:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbiKJTLc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Nov 2022 14:11:32 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA914D45
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 11:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668107425;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sHtkcoRY/xr9LgV9TTAoUG65nMFgiBxHfvZEfNC2mYI=;
        b=gccDCLsbwdABR9EKd7zHuZrXOb8ja4l0knZo/DVcpue+2Xm9uQsF0BdDQwGt6y1udgxOEv
        MnAD+vJWS6zuBUZ2uQBznlhkqgr8nh60BHF9YyFUAIZVGl9yZ0dPwtElszUP8pXm1aG+Of
        5AO6QPfIdgOi3LOnxtJkhQuhWHeoD1k=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-274-CeKxlUeZNrqUV-wq4Zxgdw-1; Thu, 10 Nov 2022 14:10:24 -0500
X-MC-Unique: CeKxlUeZNrqUV-wq4Zxgdw-1
Received: by mail-ej1-f72.google.com with SMTP id nb1-20020a1709071c8100b007ae4083d6f5so1748084ejc.15
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 11:10:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sHtkcoRY/xr9LgV9TTAoUG65nMFgiBxHfvZEfNC2mYI=;
        b=XAMsJeOQqvuiOMhCwWAxv6AZ23TkfpeRtnEI+9pg+93iVJQCg/Eremp+KAMp62/X4J
         qbPGCOiaRt76I9I8rLoV9M1yuPJhkVrNV7o47OVJmCkS/VVuCCvrvqMEvcB4nklo/bzP
         ZpdXDxPi43nYCwV0RTv1LYaRk2V+lIgNfgfswPc0neeNEezGalIT8dIXPObkLb0R9gaz
         KtbmausDJ6xiKDbgpbwv6jHpsY+Z5ATyQQ1R59TnqctOgdBhxQ3sXET8bZoCyA9PDaP5
         rf8vGEvLoX3J+NrT5y7GPJUajYlduM+g1bt9tYHYXVZusP0WAJNyGu8GsRRCRnjY91lK
         ZSOA==
X-Gm-Message-State: ACrzQf0NF2fRVtVo7X3mCeGwJSS/d0B1cBrH1uyGX6jdskV09V1P7OvQ
        Iu7+sKkyqINHg9CNR9kBY7jjhAI0Qea6r3iBV0GqKG8v/4MhRT8R2VruGu0b9Az4pnhcvtyZ9t5
        8aIuM+EQkt8dih+Wx6kTla136crEwA4dFsg==
X-Received: by 2002:a17:906:4a45:b0:7ad:d0e3:1f59 with SMTP id a5-20020a1709064a4500b007add0e31f59mr3517613ejv.714.1668107423556;
        Thu, 10 Nov 2022 11:10:23 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7dpq09nTDE9TCwsBszrmNKGT4F9++qqb/gUgaXABO66AHM3d4kmlF+ODIw8ldgSUTrFPtC5g==
X-Received: by 2002:a17:906:4a45:b0:7ad:d0e3:1f59 with SMTP id a5-20020a1709064a4500b007add0e31f59mr3517602ejv.714.1668107423402;
        Thu, 10 Nov 2022 11:10:23 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id p9-20020a17090653c900b0078d957e65b6sm51834ejo.23.2022.11.10.11.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 11:10:22 -0800 (PST)
Message-ID: <d9ab9fa6-7794-3f82-e481-10604e1debda@redhat.com>
Date:   Thu, 10 Nov 2022 20:10:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: ideapad-laptop touchpad handling problems, request for help
Content-Language: en-US, nl
To:     Maxim Mikityanskiy <maxtram95@gmail.com>,
        =?UTF-8?Q?Eray_Or=c3=a7unus?= <erayorcunus@gmail.com>
Cc:     cleverline1mc@gmail.com, g_goessel@outlook.com,
        ike.pan@canonical.com, jiaxun.yang@flygoat.com,
        limanyi@uniontech.com, mjg59@srcf.ucam.org,
        platform-driver-x86@vger.kernel.org
References: <bc1202d1-d85d-4173-5979-237bb1ee9254@redhat.com>
 <CAKErNvqfH-C7xJU3F7ga68o3AK-_ae-K2ggKcUOp1iqtmdSYdw@mail.gmail.com>
 <20221110120022.35041-1-erayorcunus@gmail.com>
 <4bcf4e6b-ae2f-0e22-a291-7faa6731e6c7@redhat.com>
 <20221110164220.46640-1-erayorcunus@gmail.com>
 <CAKErNvo+fh6sXUOPj9sCucuzUOKybOUgBo5riCfLpCF_8t9_uA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAKErNvo+fh6sXUOPj9sCucuzUOKybOUgBo5riCfLpCF_8t9_uA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/10/22 18:54, Maxim Mikityanskiy wrote:
> On Thu, 10 Nov 2022 at 18:42, Eray Orçunus <erayorcunus@gmail.com> wrote:
>>

<snip>

>>> I'm guessing that this part:
>>>
>>>                 unsigned char param;
>>>                 /*
>>>                  * Some IdeaPads don't really turn off touchpad - they only
>>>                  * switch the LED state. We (de)activate KBC AUX port to turn
>>>                  * touchpad off and on. We send KEY_TOUCHPAD_OFF and
>>>                  * KEY_TOUCHPAD_ON to not to get out of sync with LED
>>>                  */
>>>                 i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
>>>
>>> May cause issues on some models. It definitely feels fishy and
>>> I would like to disable this except on models where:
>>>
>>> 1. There is a LED controlled by some touchpad on/off hotkey; and
>>> 2. The EC fails to disable the touchpad itself
>>>
>>> Which would currently mean only enable this bit on Maxim's Z570
>>> using a DMI based allow list.
> 
> A small note on the DMI allow-list: I don't think Z570 is the only
> laptop where EC fails to disable the touchpad. While I would like this
> hack to affect as few laptops as possible, I would expect that other
> similar models produced in the same time period suffer from the same
> issue, and I don't think we have the full list of them.

I realize that we may need to grow the list over time, but I would
rather do that, then keep doing the i8042 poking on almost all
the models even where it is not necessary and whee it is potentially
causing issues.

Regards,

Hans


