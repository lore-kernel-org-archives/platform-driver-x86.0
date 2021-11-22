Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCEDC433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Nov 2021 03:56:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238759AbhKVD7l (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Nov 2021 22:59:41 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:57008
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238673AbhKVD7l (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Nov 2021 22:59:41 -0500
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3AFB33F1B9
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Nov 2021 03:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637553393;
        bh=ILsB31O7flWufEo1vhLV8nPFnBJsH7DrAM0D2fTLvUQ=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=GbJLBonGr6pEAExpc+Pgd5Oye07eozEhZhusfel5d8nBdj0A+eCLkrRPzroC5KbnN
         fr+ltig+fjWUnUACVc2EMzWLrMNDYc4dB/27K7qYo9Ij6m84ucztcaAMXLXIvkvaT4
         P+jR/xcCTbxzv1NV/FGolOR+se3OsDtTT8F0sHN7BCa/JfpZ0pmUCgbekQxSHZ90b3
         4v3tDkfx2vvg/Ij6AMwR/u6vtLGu6a2mGQrswJ1+p+wVXcHDtSDrtDSMYie6z6+TL8
         Z/pfeyOFm1yuVKkJl0BkzIcm1EfL4vhpbhuy5IUvpe4InEZGmMCTEATgdF3n9EHwJp
         1Zk0gEGKFvb9g==
Received: by mail-pl1-f200.google.com with SMTP id m15-20020a170902bb8f00b0014382b67873so6717351pls.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Nov 2021 19:56:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ILsB31O7flWufEo1vhLV8nPFnBJsH7DrAM0D2fTLvUQ=;
        b=mlb+ur0ZqGEM4M3m/OYk5k+VSdw5Ynx+CaUUpH4BTIuHoS6B4nakOrxGNsO2HfLfKL
         5DmUNGLLK4jmGty5H5r9hhj08TGzNN0CT6bmHLzNSrmH04pG1crpUxCdtWjoiXmeUme1
         PyioMRG3JzvJWF/i/Ai6kzqf1bOtljCzoPYOoSvS+BY1fHzUal+B5nIWGvek4ArtaNYD
         5sO+0injRcFim4qJWSAqdTtf5MdBlm2SBMM6MqdH39/tryY59sAwDmXduJxrMs1mm92R
         vmcEdxBYtpudoJPqpmaX1g/TQgSY9irUG/t+DYuW7c32AEFjxx1JSNr6kpqq5M1w/OFu
         QuiQ==
X-Gm-Message-State: AOAM5331HAswdieQ0avIUWqEQkcceBjT8DRzYTdnMEsqAohznXswjKFu
        1yq8916B3q6BK5WbTddqO/INM28r1FtF6deqepttxeYnrs4MrhdhVQVa54rUiVLjXaKKtsGPl6e
        yNRk0qUG978erzL5YBhKLxvKmmxK4K5zSXwteQctFH11QVXhdi3E=
X-Received: by 2002:a17:902:c204:b0:142:2441:aa26 with SMTP id 4-20020a170902c20400b001422441aa26mr103117469pll.84.1637553391190;
        Sun, 21 Nov 2021 19:56:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHZhFlTlss4PP57f+ta8GMOvUWikOEuOMrOfP19DeiNUaTLEf+lq5uk5C+v7cJgYCH/mFDaA==
X-Received: by 2002:a17:902:c204:b0:142:2441:aa26 with SMTP id 4-20020a170902c20400b001422441aa26mr103117421pll.84.1637553390821;
        Sun, 21 Nov 2021 19:56:30 -0800 (PST)
Received: from ?IPv6:2001:56a:78ed:fb00::db0? (node-1w7jr9yebujeq5th4a1ypmgfk.ipv6.telus.net. [2001:56a:78ed:fb00::db0])
        by smtp.gmail.com with ESMTPSA id l28sm4986362pgu.45.2021.11.21.19.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Nov 2021 19:56:30 -0800 (PST)
Subject: Re: Surface Go 3 Driver Issues
To:     Drew Hayes <drew@voting.works>
Cc:     platform-driver-x86@vger.kernel.org, luzmaximilian@gmail.com
References: <CAAuYzEQjRhYpLpMhZP6CjoqZ01EPd2G6G2juFDO39=6F_PtMTw@mail.gmail.com>
From:   Alex Hung <alex.hung@canonical.com>
Message-ID: <c420a389-cebf-152d-4a69-888645c27878@canonical.com>
Date:   Sun, 21 Nov 2021 20:56:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAAuYzEQjRhYpLpMhZP6CjoqZ01EPd2G6G2juFDO39=6F_PtMTw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2021-11-17 11:54 p.m., Drew Hayes wrote:
> Hi Alex,
> 
> I'm reaching out to you about some potential driver issues on
> Microsoft's new Surface Go 3. The device was introduced by Microsoft a
> little over a month ago. We have found that the device's power and
> volume buttons do not work, even though they worked in previous versions
> of the hardware (Surface Go 1 and 2). We've replicated the issue on two
> different devices (Pentium + m3) with various kernel versions (4.15,
> 5.8, 5.14.18). 
> 
> Maximilian Luz (copied on this thread) describes what he's found here
> <https://github.com/linux-surface/linux-surface/issues/595#issuecomment-939537267>.
> Would you be able to read his findings and suggest what we should try
> next to get the buttons working?
> 

BIOS needs to report 5 button array explicitly otherwise
button_array_present() will report false. When BIOS fails to report it
intel-hid also provides a DMI quirk to workaround it, ex.
https://elixir.bootlin.com/linux/v5.14.11/source/drivers/platform/x86/intel-hid.c#L73
(or see commit 56678a5f44ef5f0)

I didn't find dmidecode log file in the bug report but you can run "sudo
dmidecode -t 1" to get system vendor and product name. If you can
provide DMI data I can write a patch for testing.

Please note intel-hid was changed to intel/hid.c in 5.15 so two patches
may need testing for 5.14 (your version) and for 5.16rc2.

> Thank you,
> 
> -- 
> Drew Hayes
> 415-842-2111
> https://voting.works <https://voting.works>


-- 
Cheers,
Alex Hung
