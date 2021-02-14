Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC97C433DB
	for <platform-driver-x86@archiver.kernel.org>; Sun, 14 Feb 2021 19:00:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A4F564E12
	for <platform-driver-x86@archiver.kernel.org>; Sun, 14 Feb 2021 19:00:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbhBNTA2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 14 Feb 2021 14:00:28 -0500
Received: from mail1.perex.cz ([77.48.224.245]:52362 "EHLO mail1.perex.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229642AbhBNTA2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 14 Feb 2021 14:00:28 -0500
X-Greylist: delayed 473 seconds by postgrey-1.27 at vger.kernel.org; Sun, 14 Feb 2021 14:00:27 EST
Received: from mail1.perex.cz (localhost [127.0.0.1])
        by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5E495A0042;
        Sun, 14 Feb 2021 19:51:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5E495A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
        t=1613328711; bh=cvdjkRHWFkzG1lLfAFQoWXRELwhjh9aZAgl/H1YhF18=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=shMZT7rji9g0Qza6xyS5aIMcHpz4YS2/4/dcUoAH3CcWxdJkioPpRZ7uUADD1y7XZ
         Pq1Zbh3YLDrArISiKbUvm5hyoUXCPA4h5NbzKv+U3a9wMFODe5bhs/B5Wn23KaPxY1
         qDn4xzoaUGOjpF3t6tQ8njru35ulewub33j2YS8w=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: perex)
        by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
        Sun, 14 Feb 2021 19:51:39 +0100 (CET)
Subject: Re: [PATCH v3 3/3] ASoC: rt715:add micmute led state control supports
To:     Perry Yuan <perry979106@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Perry Yuan <Perry.Yuan@dell.com>
Cc:     oder_chiou@realtek.com, tiwai@suse.com, hdegoede@redhat.com,
        mgross@linux.intel.com, lgirdwood@gmail.com,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, Mario.Limonciello@dell.com
References: <20210112171814.5404-1-Perry_Yuan@Dell.com>
 <20210112175406.GF4646@sirena.org.uk>
 <43507ba7-74b8-2d18-57ca-271f89a752de@gmail.com>
From:   Jaroslav Kysela <perex@perex.cz>
Message-ID: <4a79cb14-4c71-8bd8-9c8c-ab2421e97e0b@perex.cz>
Date:   Sun, 14 Feb 2021 19:51:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <43507ba7-74b8-2d18-57ca-271f89a752de@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Dne 14. 02. 21 v 7:43 Perry Yuan napsal(a):

>>> @@ -287,6 +291,18 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol *kcontrol,
>>>   			return err;
>>>   	}
>>>   
>>> +#if IS_ENABLED(CONFIG_DELL_PRIVACY)
>>> +	/* dell privacy LED trigger state changed by muted/unmute switch */
>>> +	if (mc->invert) {
>>> +		if (ucontrol->value.integer.value[0] || ucontrol->value.integer.value[1]) {
>>> +			rt715->micmute_led = LED_OFF;
>>> +		} else {
>>> +			rt715->micmute_led = LED_ON;
>>> +		}
>>> +		ledtrig_audio_set(LED_AUDIO_MICMUTE, rt715->micmute_led);
>>> +	}
>>> +#endif
>>> +

My question is, how do we know that the rt715 codec has connected internal
microphone to this input? I believe that this should be covered in the machine
specific code (runtime check), not in the codec code. #if CONFIG is not
sufficient here.

> I have moved this part code to the local definition of 
> rt715_set_amp_gain_put and removed from rt715_priv.
> new code will be like this in V4.
> 
> @@ -88,6 +89,7 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol 
> *kcontrol,
>                  RT715_SET_GAIN_MIX_ADC2_L};
>          unsigned int addr_h, addr_l, val_h, val_ll, val_lr;
>          unsigned int read_ll, read_rl, i, j, loop_cnt;
> +       bool micmute_led;
> 

The whole LED trigger mechanism for the sound is covered in my LED generic
code : https://lore.kernel.org/alsa-devel/20210211111400.1131020-1-perex@perex.cz/

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
