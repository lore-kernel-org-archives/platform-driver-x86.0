Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB2E6C433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Mar 2021 15:02:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64C9B619B1
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Mar 2021 15:02:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbhCVPB6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 22 Mar 2021 11:01:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49400 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230341AbhCVPBr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Mar 2021 11:01:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616425307;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TeRLT206rXHXoXA6r2Hs7f1XgjJsdt/tFB50GF52SxQ=;
        b=L4L5TL3iJ3tSMOQ0ODjM5uCOMVHARw1oWGQS7KAtkUCruIBjvA0xaL2TD5Wnq7FzP1UGzm
        9Hh8YP6cXSlS8ZZjG/CXIUt8FsowiU1RmWBA/x+lw9w5gvFB91mFZZ7KEbpnjVb3qTsNto
        1y5sml6shGXmmzxDyLvWPbjNOPGNjBQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-SK7lx7MxMRqUtnde_xZnRg-1; Mon, 22 Mar 2021 11:01:44 -0400
X-MC-Unique: SK7lx7MxMRqUtnde_xZnRg-1
Received: by mail-ed1-f72.google.com with SMTP id r19so27120755edv.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Mar 2021 08:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TeRLT206rXHXoXA6r2Hs7f1XgjJsdt/tFB50GF52SxQ=;
        b=rBxQAwRTQvU1i9ucm59omgGK22gZjo8pZDCfuH+3Mhg0AZM3dft8WnmhU1cE75BF1h
         xZjSVmtYsJDvQbdlPNzRts75A3U9NyMoYRnifZ7mTmI2rHwq1HTUfJR4NJWDAD7eJetn
         BTWnPmvKaOM+YXKBuC40xrYP24yk/K/Ffc3hh5S/c/DA6mL5F/iBzVyA8CiB/pIXK7JJ
         wu6f9cg4d8VqFrnGW9/+4sL9yLfnwNxFK03vCENbBqoc7owTHwkh/EWtx8YOYE2Ga+s8
         PpNlUw5F2g4iP5POR05j1EPJBZKqTUKxrDX0jmkctRhOv4zNvidNuuCj1ow5Ht6amHdn
         88Kw==
X-Gm-Message-State: AOAM5309qDHJiGTDzfcU+5DtwvJmHQ7Dkb8Leqc0P8CV1jrj1/AXOZnL
        ir1qWv4x1osCXWfeB6lp1F0nmztp9X/LpYf57VCJjvtqyiPHoyvw6DVBcPlQ8itI0IjG8rYVqHf
        8CbNh6kGJzq0DoObnE/cygVGLscmXPKSaSLz93YhIl8r5QV/4G3yhguxRS3hgUq3uSfb2zS5z0U
        1AZhiOQ11mUw==
X-Received: by 2002:a17:906:3395:: with SMTP id v21mr194813eja.322.1616425303058;
        Mon, 22 Mar 2021 08:01:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygJHx1ycHTtFDczgClQt4BcWFdt1OOvBVNQ2zk/+MtCfJ3F3mpKUaH3/gRSfpKT7IqYY77Ig==
X-Received: by 2002:a17:906:3395:: with SMTP id v21mr194782eja.322.1616425302868;
        Mon, 22 Mar 2021 08:01:42 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q16sm11812147edv.61.2021.03.22.08.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 08:01:42 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] ASoC: rt715:add micmute led state control supports
To:     Jaroslav Kysela <perex@perex.cz>,
        "Yuan, Perry" <Perry.Yuan@dell.com>,
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
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5cad3045-7948-3282-c999-926095818d5f@redhat.com>
Date:   Mon, 22 Mar 2021 16:01:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <604693cc-08c7-2b5f-632a-58ed537c54a0@perex.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/22/21 3:37 PM, Jaroslav Kysela wrote:
> Dne 22. 03. 21 v 10:25 Yuan, Perry napsal(a):
>> Hi Mark:
>>
>>> -----Original Message-----
>>> From: Mark Brown <broonie@kernel.org>
>>> Sent: Tuesday, March 9, 2021 1:24 AM
>>> To: Yuan, Perry
>>> Cc: pobrn@protonmail.com; pierre-louis.bossart@linux.intel.com;
>>> oder_chiou@realtek.com; perex@perex.cz; tiwai@suse.com;
>>> hdegoede@redhat.com; mgross@linux.intel.com; Limonciello, Mario;
>>> lgirdwood@gmail.com; alsa-devel@alsa-project.org; linux-
>>> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org
>>> Subject: Re: [PATCH v4 2/2] ASoC: rt715:add micmute led state control
>>> supports
>>>
>>> On Mon, Mar 01, 2021 at 05:38:34PM +0800, Perry Yuan wrote:
>>>
>>>> +	/* Micmute LED state changed by muted/unmute switch */
>>>> +	if (mc->invert) {
>>>> +		if (ucontrol->value.integer.value[0] || ucontrol-
>>>> value.integer.value[1]) {
>>>> +			micmute_led = LED_OFF;
>>>> +		} else {
>>>> +			micmute_led = LED_ON;
>>>> +		}
>>>> +		ledtrig_audio_set(LED_AUDIO_MICMUTE, micmute_led);
>>>> +	}
>>>
>>> These conditionals on inversion seem weird and counterintuitive.  If we're
>>> going with this approach it would probably be clearer to define a custom
>>> operation for the affected controls that wraps the standard one and adds the
>>> LED setting rather than keying off invert like this.
>>
>> Currently the sof soundwire driver has no generic led control yet.
>> This patch can handle the led control needs for MIC mute LED, definitely the patch is a short term solution.
>> There is a feature request discussion when we started to implement this solution.
>> https://github.com/thesofproject/linux/issues/2496#issuecomment-713892620
>>
>> The workable way for now is that we put the LED mute control to the codec driver.
>> When there is new and full sound LED solution implemented, this part will be also optimized.
>> The Hardware privacy feature needs this patch to handle the Mic mute led state change.
>> Before that full solution ready in kernel, could we take this as short term solution?
> 
> Perry, it's about the machine detection. Your code is too much generic even
> for the top-level LED trigger implementation. We need an extra check, if the
> proper LED's are really controlled on the specific hardware. Other hardware
> may use RT715 for a different purpose. Use DMI / ACPI checks to detect this
> hardware and don't misuse the inversion flag to enable this code.

I think this would be a goo candidate for the new generic LED handling:

https://lore.kernel.org/alsa-devel/20210317172945.842280-1-perex@perex.cz/

And then use a udev-rule + hwdb and/or UCM profiles to configure the LED trigger
for specific models from userspace ?

Regards,

Hans




