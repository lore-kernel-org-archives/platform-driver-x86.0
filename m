Return-Path: <SRS0=a5Ee=EJ=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA89C2D0A3
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 09:35:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27F54223BD
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 09:35:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aUTwhd2H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727787AbgKCJfx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Nov 2020 04:35:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31410 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727328AbgKCJfx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Nov 2020 04:35:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604396151;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+Gl0ptbYswA0KSXaaDb5Y6vXfOjH6GyR9R+tI2Uu7Ko=;
        b=aUTwhd2HH9Lh9kdYw2zoawu90BaSDQkNi7Rw+dc9OQ+TgakCJzF1lmidAEqxK2dcx2dkyv
        IgtJqPgPDBP4eWSXwrBtKFYUkUin09JsNIyE6di1Rwxb7lS2Q+AC4dAYC5Y69nau90pZhE
        oRNYZ8LE4V3421MnpxWp+vdUT0JaCGY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-6_0xagnpPpOA0nEZwnu42g-1; Tue, 03 Nov 2020 04:35:50 -0500
X-MC-Unique: 6_0xagnpPpOA0nEZwnu42g-1
Received: by mail-ed1-f71.google.com with SMTP id o2so7337086edw.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Nov 2020 01:35:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+Gl0ptbYswA0KSXaaDb5Y6vXfOjH6GyR9R+tI2Uu7Ko=;
        b=KyF3Jyb4R4vewaP4VBomSef/RYg5bgDAOvErEi2LlFx7XRZ5Fwk2JrP/C9XpFZxVxo
         SbmQknWEYGrKAWhjvLY9SHoYgC+z9AIAhZgmtYCt0Cny8YIFWCuBzURO/NGqps27iS0b
         K102Nle6skvnB3CCQH8f6t/nShXkKyIpX31EG+MOo3ZiJ7MVRv5zndbGhVC4eK6CUCzR
         lNJDGhfsxCpHCnuCPiUeu7bekMZ9ViEbDaAqXQJt6Jlu9nkIg9NBlAd8gTt5b1ex9XDs
         kpmNkgetPCZuR3LK1yxBdF0IETaKon38Zpyb1ipdaxZFZ8ceVr48f+OKXMuqSZjaZxMd
         hDfw==
X-Gm-Message-State: AOAM5336c1vEeW+XXyMo99dWTeuGMSQuoicrZiiRi0I6G5o7QZ/Opqh5
        EDok6WKVMGhUi1SsAZsVApLmSAYhV/6S4rc8oNJsKebsLQP+MvMWnM5iVOL4yRXunokk+u2bhTj
        u6hPvxcNpbzHI7zd4+R/iOYe/H++68ieVkQ==
X-Received: by 2002:a17:907:2175:: with SMTP id rl21mr15999954ejb.59.1604396148698;
        Tue, 03 Nov 2020 01:35:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz95ahkUNfgANTktTf3GozyYFJzMvy5cBC0FAa9/69NOLjA1P73aSum6Ize4sgcIm/ViRIxzA==
X-Received: by 2002:a17:907:2175:: with SMTP id rl21mr15999938ejb.59.1604396148490;
        Tue, 03 Nov 2020 01:35:48 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id nd5sm10286179ejb.37.2020.11.03.01.35.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 01:35:47 -0800 (PST)
Subject: Re: [PATCH -next] platform/x86/dell-wmi-sysman: Make
 wmi_sysman_kobj_sysfs_ops static
To:     Zou Wei <zou_wei@huawei.com>, mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1603971581-64135-1-git-send-email-zou_wei@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ce524fef-d866-9f31-85e7-4ae22a51859a@redhat.com>
Date:   Tue, 3 Nov 2020 10:35:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <1603971581-64135-1-git-send-email-zou_wei@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/29/20 12:39 PM, Zou Wei wrote:
> Fix the following sparse warning:
> 
> drivers/platform/x86/dell-wmi-sysman/sysman.c:258:24: warning:
> symbol 'wmi_sysman_kobj_sysfs_ops' was not declared.
> Should it be static?
> 
> wmi_sysman_kobj_sysfs_ops has only call within sysman.c
> It should be static
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  drivers/platform/x86/dell-wmi-sysman/sysman.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell-wmi-sysman/sysman.c
> index 3842575..c6862c3 100644
> --- a/drivers/platform/x86/dell-wmi-sysman/sysman.c
> +++ b/drivers/platform/x86/dell-wmi-sysman/sysman.c
> @@ -255,7 +255,7 @@ static ssize_t wmi_sysman_attr_store(struct kobject *kobj, struct attribute *att
>  	return ret;
>  }
>  
> -const struct sysfs_ops wmi_sysman_kobj_sysfs_ops = {
> +static const struct sysfs_ops wmi_sysman_kobj_sysfs_ops = {
>  	.show	= wmi_sysman_attr_show,
>  	.store	= wmi_sysman_attr_store,
>  };
> 

