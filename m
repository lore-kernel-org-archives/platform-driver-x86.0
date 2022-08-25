Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C24C28D13
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 Aug 2022 08:13:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237833AbiHYIN5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 Aug 2022 04:13:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231364AbiHYIN4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Aug 2022 04:13:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB51B5A157
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Aug 2022 01:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661415232;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0OAvi4g9IUniVLfjcM2VZtFCmVJ+wiXvyhOCxHuPbYM=;
        b=Dzcy1VefUtYrQ03zbO00Nwfz/uVEZhBbnZcgtQpis7H/0WPV3+mN5B65xg3da84Rmf3KX/
        QxtiE6G9IOfcC2HqZpcybVSSnLyoGiYpKMhGdo+Zg5WXycOTxLtARifGbsaCEJUvt7gTxm
        K5bZ71Rs3H7TAd24u7D98JBjkKwYsN8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-394-qiswL5lEPBeGMmYk6TqHPw-1; Thu, 25 Aug 2022 04:13:50 -0400
X-MC-Unique: qiswL5lEPBeGMmYk6TqHPw-1
Received: by mail-ej1-f72.google.com with SMTP id ne1-20020a1709077b8100b0073d957e2869so3122910ejc.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Aug 2022 01:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=0OAvi4g9IUniVLfjcM2VZtFCmVJ+wiXvyhOCxHuPbYM=;
        b=7VSGR7LOIb6PoIlNnrGeOH/wk1yrmOP6hE/IN3gyXtt4JX6u01eSPkPKge1dwC4qOu
         Rbrt9bHUoTet4Dutxz2HRliXyHNM0tHwcf4czl5Rv/3YSp8tvy2DrbAVh7aR330l3xHT
         HdarDJpSsO8dUD6hL6KNJba5ctfDZy9ZTIYxh6Cx+N5QL6byace4tw6U+pTn7uJqwMy/
         VohMteEvdTcrnmqcPP3ZFqg1vktT8k7mAjKZ2VTi9mA+BVRfF9lB/Q1Pxr/Xvz8ofaJ3
         qMZYY9BbDL2n5gh/E01/L3lVeVaWGllh1taOc045tzMWdgQ6ElekpQ0BFaF/vlUwpca5
         Vi5Q==
X-Gm-Message-State: ACgBeo1nKp6+AW0woHJ5WzKzCwYl3hjrVcgQqom3nRoOLsOLjwMwriz3
        W6sL0sHRlkqxNhp0GGqgjjL++b4h6WO0tPfK7qS35oYs+iWV76yrfN3IVYHEj2VdNrSC+KjNASi
        9t8Bki8UCH4FkhalIDRqsMa1Iz3kAFWpxtA==
X-Received: by 2002:aa7:dc0a:0:b0:447:a7c0:54de with SMTP id b10-20020aa7dc0a000000b00447a7c054demr2249695edu.261.1661415229609;
        Thu, 25 Aug 2022 01:13:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4bnLV4TMJCebHeCZycFZc+6Gj0EHaxIaXe+1xWyqk2KfeYVy01bKoWJDgk9godBVb+MT3rGg==
X-Received: by 2002:aa7:dc0a:0:b0:447:a7c0:54de with SMTP id b10-20020aa7dc0a000000b00447a7c054demr2249675edu.261.1661415229418;
        Thu, 25 Aug 2022 01:13:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id b3-20020a170906728300b00730b3bdd8d7sm2128773ejl.179.2022.08.25.01.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 01:13:48 -0700 (PDT)
Message-ID: <c692c9e7-4938-12c2-3bd0-1d9811ad2b58@redhat.com>
Date:   Thu, 25 Aug 2022 10:13:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/1] platform/x86: asus-wmi: Add mic-mute LED classdev
 support
Content-Language: en-US
To:     PaddyKP Yao <ispaddy@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, PaddyKP_Yao@asus.com,
        andy.shevchenko@gmail.com, acpi4asus-user@lists.sourceforge.net,
        corentin.chary@gmail.com, linux-kernel@vger.kernel.org,
        luke@ljones.dev, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org
References: <HK0PR04MB33636680A6DC47211560BB43FA879@HK0PR04MB3363.apcprd04.prod.outlook.com>
 <20220711024718.1700067-1-PaddyKP_Yao@asus.com> <20220824100615.GA1049@bug>
 <20220824110908.GB111@AA2000783-NB2.corpnet.asus>
 <ca13b742-7bb9-da20-4e50-2d04233aaf93@redhat.com>
 <20220824111734.GA8434@AA2000783-NB2.corpnet.asus>
 <YwbQYlqZ3H0NgaUu@paddy-ASUS-EXPERTBOOK-B1400CBA>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YwbQYlqZ3H0NgaUu@paddy-ASUS-EXPERTBOOK-B1400CBA>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/25/22 03:29, PaddyKP Yao wrote:
> Hi Hans,
> 
> On Wed, Aug 24, 2022 at 07:17:34PM +0800, PaddyKP Yao wrote:
>> Hi Hans,
>>
>> On Wed, Aug 24, 2022 at 01:11:32PM +0200, Hans de Goede wrote:
>>> Yes. Since I have already merged your original patch can you please make
>>> this a new patch on top of your original patch ?  In other words just
>>> make this 1 small change in the new patch:
> 
> Thanks for your help. I already submited new patch by below mail.
> And may I use author PaddyKP_Yao@asus.com instead of my gmail account for
> this new patch?

Yes I will fix-up the author to match the Signed-off-by when applying
the patch.

Regards,

Hans

