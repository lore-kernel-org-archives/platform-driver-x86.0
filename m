Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37086C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 15 Oct 2021 19:48:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1AF8461151
	for <platform-driver-x86@archiver.kernel.org>; Fri, 15 Oct 2021 19:48:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242840AbhJOTus (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 15 Oct 2021 15:50:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49952 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242831AbhJOTuj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 15 Oct 2021 15:50:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634327311;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1hH4W57qRLgsm0O9+HdRUSpD7zjpM0ZP5d2Uict6qKQ=;
        b=beO4T5EJpWaIU+CVnP5DODv/6XRlQzYr7s1GSw2Fif2XI24JaBUsTabhCEb8W+nkWmUHN1
        4l+ftcRMvlP7lrF8dpkoIbNLyC6xfJ4JfloW7IsvEM15edB06dhLetTWphS2qZlHrR0A7d
        WgcEkVIZyOs/fDczbq//EI9SgVlUdUo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-Pjszk7izNamSyLnUVsy_hg-1; Fri, 15 Oct 2021 15:48:27 -0400
X-MC-Unique: Pjszk7izNamSyLnUVsy_hg-1
Received: by mail-ed1-f72.google.com with SMTP id t18-20020a056402021200b003db9e6b0e57so9190150edv.10
        for <platform-driver-x86@vger.kernel.org>; Fri, 15 Oct 2021 12:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1hH4W57qRLgsm0O9+HdRUSpD7zjpM0ZP5d2Uict6qKQ=;
        b=EPNgml2eslHTdzIAaflT1tLTZl0QXSGNihzFmPDYi/BLX6K/673o0T1rFo5E59j/yg
         bM90zYQdfPBSNR8l3CQKHobqvXbyPLAMkhlnAB6WxlTahO6kERfHU7VygDuxWXKb+Y3C
         TbZcvtmNIWxMpkZ0qSLVYa2yAc+IYG2WFs0tSEJ6SGDWBJ25/igpOCczI5eNqvWY03Li
         oIkHPikKUqSZIkOZBf95bIjTjxbJgyTAJfWTKqEkqBxdpuSwfI6qS47K92wirI861HrC
         Fmbd6DPPhj+6g0nevd/QzwMDMkPz1qEW92oCvhhyMWhSd6Dqbc72t6rXpXNBo+aA7k4h
         ItCQ==
X-Gm-Message-State: AOAM532d/2RmnXpCLEqZXJygc/LD2DmVcc8JrDeyoxo3XL67gotVgAiZ
        Tv/tAxvn7JWVO8nDIVqgZCEk180qsOnQ84aRG8v6u2Mg2X5HhBhI/0ZmMaddlrC3YbPCmwcUM3l
        Iu/PcL44cBYKFdqtT9WbxUtojBqtV6+1Elw==
X-Received: by 2002:a50:9d48:: with SMTP id j8mr20595773edk.165.1634327306299;
        Fri, 15 Oct 2021 12:48:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBOCFkCR2vdRzxrwAi1cJBTtzNkY4QmZY6+q1a1h0qqrN3XXenbeNF2Zkd++CQueWa9xXBvQ==
X-Received: by 2002:a50:9d48:: with SMTP id j8mr20595754edk.165.1634327306125;
        Fri, 15 Oct 2021 12:48:26 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id v13sm6036701edl.69.2021.10.15.12.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 12:48:25 -0700 (PDT)
Subject: Re: [PATCH 05/12] regulator: Introduce tps68470-regulator driver
To:     Mark Brown <broonie@kernel.org>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20211008162121.6628-1-hdegoede@redhat.com>
 <20211008162121.6628-6-hdegoede@redhat.com> <YWQU/SYTT5Vk24XH@sirena.org.uk>
 <f6f2d7e8-fdb8-ed64-0cdd-65aded9fc42c@redhat.com>
 <YWmwZJvDYjPWJdb4@sirena.org.uk>
 <d0d1dc05-4cc6-2f47-88a9-700cfc356d86@redhat.com>
 <YWnPaI/ZECdfYre9@sirena.org.uk>
 <843f939a-7e43-bc12-e9fc-582e01129b63@redhat.com>
 <YWnZIZTPiuAIazV+@sirena.org.uk>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c595b143-d7ed-e76b-7734-e03d14e0f76e@redhat.com>
Date:   Fri, 15 Oct 2021 21:48:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YWnZIZTPiuAIazV+@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/15/21 9:40 PM, Mark Brown wrote:
> On Fri, Oct 15, 2021 at 09:27:50PM +0200, Hans de Goede wrote:
>> On 10/15/21 8:58 PM, Mark Brown wrote:
> 
>>> I am very confused about why it's in the driver without a DMI quirk
>>> and/or clear comments about why and saying that this is a terrible
>>> example to copy.
> 
>> The DMI quirks live in the ACPI glue code under drivers/platform/x86,
>> that code instantiates the MFD cell and sets the platform-data
>> as part of the cell.
> 
> I can't see how the quirking gets propagated through into the driver and
> I'd really expect that in a situation like this the platform data would
> be passed through as platform data from the code doing the quirks,

That is exactly what is happening here. The platform_data in this
case is just an array of regulator_init_data pointers (one per
regulator in the PMIC):

struct tps68470_regulator_platform_data {
        const struct regulator_init_data *reg_init_data[TPS68470_NUM_REGULATORS];
};

This struct gets filled by platform specific code under drivers/platform/x86
(in later patches in the series).

And the regulator code in this patch consumes this like this:

                if (pdata && pdata->reg_init_data[i])
                        config.init_data = pdata->reg_init_data[i];
                else
                        config.init_data = &tps68470_init[i];

                rdev = devm_regulator_register(&pdev->dev, &regulators[i], &config);

So we have the code doing the quirks determining the regulator_init_data
and passing this through platform_data, which AFAICT is exactly what
you want?

Regards,

Hans

