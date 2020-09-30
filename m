Return-Path: <SRS0=fgui=DH=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78ACC4727F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 30 Sep 2020 13:21:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B15D2076B
	for <platform-driver-x86@archiver.kernel.org>; Wed, 30 Sep 2020 13:21:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZtvTudpk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730048AbgI3NVv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 30 Sep 2020 09:21:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42655 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728270AbgI3NVv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 30 Sep 2020 09:21:51 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601472109;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SIUeHCg4ObFBTzNeRmXqLyzNztGL/qF7cJVPSEqtDtU=;
        b=ZtvTudpkP8KoMHYWjncYIkmk/zqI20uxUNQAmSced+vbF6W1ZJbSuyS9qhev5+RcyD0gz4
        mOI2fZh7rhtRSrKu2qfelPz7e3Eygeb8pukaCnSJVf0LtZYV9j8Viu7OswI4JE/EU1adtn
        aKfuzmvQ+AuKRyftjxjbcCrWa9i7rKU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-v8WlI46IOj24n3KVsQJfSg-1; Wed, 30 Sep 2020 09:21:36 -0400
X-MC-Unique: v8WlI46IOj24n3KVsQJfSg-1
Received: by mail-ed1-f70.google.com with SMTP id c3so731228eds.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2020 06:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SIUeHCg4ObFBTzNeRmXqLyzNztGL/qF7cJVPSEqtDtU=;
        b=txfCa+thG3tg01gY7ybtkkyCmRme7yc/W4QMufadtLSTL5rslquyJqZh4ecuxfVcua
         ThpL6/OV7nDNpo7LXlcV0g2IJ6EJvOyymbvKGeqN6t0w0RwljR3ALkUne6ZuFn/bT0tH
         Z3k6Da2mP3pDMshP4GyBWGv21L8PptNpjq+qrtmYSWHQkck+MmaKmayxVYt8NusVuwWM
         xFeg7U1S8jjfxNojq8tjDr8ked1rNkUwmBY0oyURc2abw7yX6dWCh2AzIiDuwCFpxkeV
         6kO5RQ4dNOu6Sf33650lfWn/Q9zlUYeCBFefxAmoWQaPc+8xg1sVtotXXvkUUJsWJMhw
         XnBg==
X-Gm-Message-State: AOAM531J6MnS0L95jkjH2+gQ2wN1I3GOhPZH7aqbT003fyPYs8C/2hdx
        F9k0L/zbYbA7Gbj18F9i0d7xwcFNbDCj9guehLWMRST7LlDVmQS6y/NOYgl89i+mXeP56E1LnWV
        R/OhrWkjQMZ9tAL+h+6N622Ow65iVxU92RQ==
X-Received: by 2002:aa7:dd8b:: with SMTP id g11mr2815975edv.22.1601472095186;
        Wed, 30 Sep 2020 06:21:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjRXkc8KBbOEOGz8SxExRE6aSQo9uAeQL3oWdLMwX4Wo5s+uQYagR6+9+vpGbprIDRMHi11A==
X-Received: by 2002:aa7:dd8b:: with SMTP id g11mr2815953edv.22.1601472094956;
        Wed, 30 Sep 2020 06:21:34 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id u18sm1580441ejm.115.2020.09.30.06.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 06:21:34 -0700 (PDT)
Subject: Re: Keyboard regression by intel-vbtn
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <s5hft71klxl.wl-tiwai@suse.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <af0c9e79-c76a-8606-5811-702c791fa9ce@redhat.com>
Date:   Wed, 30 Sep 2020 15:21:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5hft71klxl.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/29/20 10:48 AM, Takashi Iwai wrote:
> Hi Hans,
> 
> it seems that the recent update of intel-vtn broke the keyboard input
> on some laptops with libinput:
>    https://bugzilla.opensuse.org/show_bug.cgi?id=1175599
> 
> Blacklisting intel-vtn fixes the issue, so it's likely the falsely
> reported tablet mode switch that leads libinput misbehaving.  The
> affected machines are Acer E5-511 and ASUS X756UX laptops, and they
> shouldn't have the tablet mode at all, AFAIK.
> 
> Could you take a look?  I guess it's the commit cfae58ed681c that
> broke.  The chassis type is Notebook on those, and this type should be
> excluded as well as Laptop.
> 
> The dmidecode outputs and other info are found in the bugzilla above:
>    https://bugzilla.opensuse.org/attachment.cgi?id=841999
>    https://bugzilla.opensuse.org/attachment.cgi?id=842039
> 
> The one for ASUS is embedded in hwinfo outpt:
>    https://bugzilla.opensuse.org/attachment.cgi?id=841157

Ok, you should have just received a patch fixing this, sorry
that creating it took a bit longer then I had hoped.

Andy, can you drop the:

"platform/x86: intel-vbtn: Fix SW_TABLET_MODE always reporting 1 on the HP Pavilion 11 x360"

Patch from your review-andy branch, plug in the new one and
then send it out to Linus for merging into 5.9 please ?

Regards,

Hans

