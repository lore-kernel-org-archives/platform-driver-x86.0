Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F2AFC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Jan 2022 11:10:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238063AbiAKLKI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Jan 2022 06:10:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32892 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238050AbiAKLKH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jan 2022 06:10:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641899406;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GK0syOgD4cEhkoYpGBGfx9XA+GWyfSHbLSt1HeHK17Q=;
        b=Ff5YktyVzOaOgMMYLoT+bk+wd3FeKuNp3X3uJgsD7pUcK5eObjb8fgYKRmovCSYBH4Woke
        Op81HPbO3AWgxANu7t7UoLBXSF0n0nvkEJMbGQXpBDurX7E2RDXz44bjMW9MsFC5YN3k8c
        ia3ZtxIrj+m3RXPZOn39L+If2SChmXg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-IBVT1Uq2OyyyWqAAqszQ0w-1; Tue, 11 Jan 2022 06:09:46 -0500
X-MC-Unique: IBVT1Uq2OyyyWqAAqszQ0w-1
Received: by mail-ed1-f70.google.com with SMTP id y18-20020a056402271200b003fa16a5debcso12975850edd.14
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jan 2022 03:09:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GK0syOgD4cEhkoYpGBGfx9XA+GWyfSHbLSt1HeHK17Q=;
        b=23mReueGB5OLn6VbHJw81JjNMGxA1ewPn3Yk8F58cPtV13EDcGQujskSi7w4rTwPoS
         A7jeqjjW1Ez7wwKRetjgHNLUvmqUAhbmCmGfpORgEI28c4solrf5xS1VoggRT73+QGai
         mcZXtVkA+McMdkM/mLT/eduJwYjyonuhKHPcGxDrpFaHbItIcXheWLLBJI2arl0+Vej8
         d+tki/j1IpoB3PEXLGZw+bbgHK45oLDnfLtA6+eUs6ZUR9oJHErHG5gNRe45QZ+zMA3C
         lcOyh6AjQ9n9Dh/N2B4GdYg+qCxCGRTENImQ95FfGuAOBkdwZzohMH5Fi30lGYiJs1Hf
         qxkQ==
X-Gm-Message-State: AOAM5300vu/9fLKjScKJnxz6zokaRmMtCT3HlIQv8nF9mmX15KZA5WZG
        1F7GvVFQSNFLoFb55iL+VEr4dg6RVv2hb9nbaK33WcXVY+wU2EPN7JrBRLESaEgubS5fCei37cQ
        A5hqa+Z/I8URbFWMGe5Ow7HCJccnvsEpIzQ==
X-Received: by 2002:a05:6402:11cf:: with SMTP id j15mr3938128edw.220.1641899385409;
        Tue, 11 Jan 2022 03:09:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzF41CmUVGmRg3fQrUe/+R7/CvyVA0GZULagxPwJfNwQpdTC3khJv8ySRvPBhSpgu/rv5XUQA==
X-Received: by 2002:a05:6402:11cf:: with SMTP id j15mr3938115edw.220.1641899385188;
        Tue, 11 Jan 2022 03:09:45 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id 21sm3441507ejz.24.2022.01.11.03.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 03:09:44 -0800 (PST)
Message-ID: <aceddce7-6c43-967c-fadd-fa307068e916@redhat.com>
Date:   Tue, 11 Jan 2022 12:09:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] Update whitelisted ThinkPad models with dual fan support
 in thinkpad_acpi
Content-Language: en-US
To:     David Dreschner <david@dreschner.net>,
        ibm-acpi-devel@lists.sourceforge.net,
        Mark Pearson <markpearson@lenovo.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <ec04aa1e-1ac3-edbc-ac08-eec15ec5c952@dreschner.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ec04aa1e-1ac3-edbc-ac08-eec15ec5c952@dreschner.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi David,

On 1/4/22 04:41, David Dreschner wrote:
> Hey guys,
> 
> the attached patch updates the list of whitelisted ThinkPad models with dual fan support.
> 
> The changes were tested on my ThinkPad T15g Gen 2. According to Lenovo, the BIOS version is the same for the P15 Gen 2 and the P17 Gen 2 ( https://pcsupport.lenovo.com/us/en/downloads/ds551321-bios-update-utility-bootable-cd-for-windows-10-64-bit-thinkpad-p15-gen-2-p17-gen-2-t15g-gen-2 ).
> 
> I also added the P15v Gen 2 and T15p Gen 2 to the whitelist based on the BIOS version listed on the Lenovo homepage ( https://pcsupport.lenovo.com/us/en/downloads/ds551356-bios-update-utility-bootable-cd-for-windows-10-64-bit-thinkpad-p15v-gen-2-t15p-gen-2 ). The first generation had two fans and where covered by the whitelist entry for the P15 Gen 2. As the second generation has two fans, too, I made that change for completeness.
> 
> To apply the changes before it's merged in the mainline linux kernel, I made a little dkms patch: https://github.com/dreschner/thinkpad_acpi-dual-fan-patch

Thank you for your patch submission.

If I understand things correctly then you've only tested the addition of the:

TPACPI_Q_LNV3('N', '3', '7', TPACPI_FAN_2CTL),  /* P15 / P17 / T15g (2nd gen) */

quirk, correct? In that case we really only want to add that quirk, we don't
want to go and add untested quirks. But perhaps Mark from Lenovo can confirm
that this quirk:

TPACPI_Q_LNV3('N', '3', '8', TPACPI_FAN_2CTL),  /* P15v / T15p (2nd gen) */

also is correct and that those models really have 2 fans, Mark ?

Mark, more in general can you perhaps talk to the firmware team and ask
if there is a better way to detect if there are 2 fans in a thinkpad then
maintaining a quirk table for this ?

Besides the issue of the untested quirk, unfortunately your patch is not
submitted in the right format, so I cannot accept it as is, esp. the
missing of a Signed-off-by is a blocker.

Kernel patches should be in git format-patch output format and
your patch is missing a Signed-off-by line in the commit-message. I can only
accept patches with a Signed-off-by line in the commit-message like this:

Signed-off-by: Your Real Name <email@your.domain>

By adding this line you indicate that you are the author of the code and
are submitting it under the existing license for the file which you are
modifying (typically GPL-2.0) or that you have permission from the author
to submit it under this license. See:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

Given that this patch is trivial and mostly data, not code, I can turn
it into a proper patch with myself as author, crediting you like this:

Reported-and-tested-by: David Dreschner <david@dreschner.net>

And then merge it with me as the author, or you can resubmit
it in the proper format if you prefer.

Please let me know how you want to proceed with this.

Regards,

Hans

