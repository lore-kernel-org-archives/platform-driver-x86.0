Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF33C678D4
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Mar 2023 14:06:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjCBOG1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Mar 2023 09:06:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjCBOG1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Mar 2023 09:06:27 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B9BC498A3
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Mar 2023 06:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677765938;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lDeJaM3OXvdvRbi0amjcP00BuSBj+eIeZi+fVmCzkd0=;
        b=QC6spwAKLLqZE2ZbFyl5/mjwp5pu8KlSuDJXzHVy5rtVTAeIP5OvtFq7IxVWX1dE/+G2sl
        IAZDUNXYxAnt1qFKAvquuJj0/NKFw8m1ixMXVvdre/7q/cYsHlqTK+cAmWhlt0W9E8b3fb
        9hL75OzSfBV7Kbnhv1ioqy0QXbkq1b8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-393-x3ej2wttPXWTUrjpBY3YQQ-1; Thu, 02 Mar 2023 09:05:37 -0500
X-MC-Unique: x3ej2wttPXWTUrjpBY3YQQ-1
Received: by mail-ed1-f72.google.com with SMTP id fi8-20020a056402550800b004a26cc7f6cbso24409966edb.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Mar 2023 06:05:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lDeJaM3OXvdvRbi0amjcP00BuSBj+eIeZi+fVmCzkd0=;
        b=4Mr+50HpBpYUYoaAnD8diIhYn/xfLiSxUDhfZPz03vMLTJjoQWfrxBJ9Ue1OWJCmLr
         KRqyo9FgbSbj12TPmQNj/Iy11uupxn1liNd4xCM9DM3mXy3ILKiq5IXpYTMIDAYCUIX8
         WGcYMmJCSRyzx8qT0D+g5qmj4T/hBu1PWycx812oW/UqzIMe09zotSH7zxFi+9oYmp9V
         5TTlfJK2TesP11E5zHf1HPZoH1blbknWmToVc69JmFtR7AhXHjpg3Xpt+j682GnidF6/
         kQYi5Mt9WkEaxwCB+BOiXG9ctmNfiz4WqitVns1hUMzA2pbTc7Wuf9LkzdxuMPAmUw5Y
         C6Mg==
X-Gm-Message-State: AO0yUKUoNCvFwshSV9G1Jv/hLJVdyKXuDF8KCfgtqOgEC8KJNtfL0VLp
        pDMMWpDKbAFNHmTlxw86hbgiorGQRubGysf8FWuxRCs0najVxzKbeFYXp5zd0yqgqZW8PUUOlzM
        cRq+DCEu9ZnfBUCq6n7roYgGej+R0M+GpKA==
X-Received: by 2002:a17:906:9b89:b0:88e:e498:109b with SMTP id dd9-20020a1709069b8900b0088ee498109bmr13101894ejc.5.1677765936031;
        Thu, 02 Mar 2023 06:05:36 -0800 (PST)
X-Google-Smtp-Source: AK7set9bZbcdC/wqORcyal6tMr8vdK45UqdOQf0mpSKcSmQstpaZCR/kUJqqifbtoHRP15py9lN3Qg==
X-Received: by 2002:a17:906:9b89:b0:88e:e498:109b with SMTP id dd9-20020a1709069b8900b0088ee498109bmr13101863ejc.5.1677765935745;
        Thu, 02 Mar 2023 06:05:35 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id us8-20020a170906bfc800b008cafeec917dsm7177746ejb.101.2023.03.02.06.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 06:05:34 -0800 (PST)
Message-ID: <64cbd302-b469-9f39-9ec7-a04ce9f3ed1c@redhat.com>
Date:   Thu, 2 Mar 2023 15:05:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: Add new msi-ec driver
To:     Nikita Kravets <teackot@gmail.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
References: <20230214132522.32631-1-teackot@gmail.com>
 <222e94e6-2ddb-a612-31b1-4537141ef478@redhat.com>
 <CAPXvF04_sPUtwB1Rk+XKPMigoxTfoo0RzbHvn9cozTq5vnMa_g@mail.gmail.com>
 <c147567a-40cc-813c-aa48-c24a1e92ff00@redhat.com>
 <CAPXvF05BWuP87KRZ92rZux2pqHxxJ7ux+ieK15HdoXpsG4Updg@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAPXvF05BWuP87KRZ92rZux2pqHxxJ7ux+ieK15HdoXpsG4Updg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/2/23 13:45, Nikita Kravets wrote:
> Here is my `modinfo msi-ec`:
> 
> name:           msi_ec
> filename:       (builtin)
> description:    MSI Embedded Controller
> author:         Nikita Kravets <teackot@gmail.com>
> author:         Aakash Singh <mail@singhaakash.dev>
> author:         Jose Angel Pastrana <japp0005@red.ujaen.es>
> license:        GPL
> file:           drivers/platform/x86/msi-ec

Ah you have set it to builtin rather then building it as
a module.

Yes then it will work without any module-aliases since then it
is always part of the kernel.

Regards,

Hans

