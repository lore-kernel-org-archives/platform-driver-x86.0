Return-Path: <SRS0=nDDs=C2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B4AC43461
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 11:22:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8D22208DB
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 11:22:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U760Isnt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgIQLW3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Sep 2020 07:22:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48284 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726746AbgIQLWG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 07:22:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600341725;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=T1dfcOPs1C/ozcLVtSNsYSdBeWYLr7fEvkjF+9bKUGI=;
        b=U760IsntT7HAaurn/fCkDVl5bbf64bcqMdEtD2Hw/LCN6p2aEV85ubAt39uQ1IdThVLYok
        gP5Zvj+MvL+zlXMVzO3y/BdAdjZLfZmUG1UPpZrJc44rk+3sKxr9V5Q/RUfxmmzuDhAK8T
        nWeyPGjEkPg4vNMHlPRL9K/Kqp3myXY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-44zFSU79P9KLVtJ0z7c7lg-1; Thu, 17 Sep 2020 07:22:04 -0400
X-MC-Unique: 44zFSU79P9KLVtJ0z7c7lg-1
Received: by mail-ej1-f72.google.com with SMTP id ml20so734190ejb.23
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2020 04:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=T1dfcOPs1C/ozcLVtSNsYSdBeWYLr7fEvkjF+9bKUGI=;
        b=FxIsVTbwhYTD9vXCvRVIiq7UFuqcG/71E3MglM2tVYcDsAm6yfb9y9fgykxQN8kLim
         Rg0ZpKItNcbinx+K49lyIMWvpwK7geQWXhT3Z9NpW3BLrleudN8cVNN3l8y8FuQ/zPRE
         1BlSylmgKRV78S51YfTm7YlA6q5flYhZZ1kHg2H9TYNQCSuiSEa0Kl5U7nWgFgPICn5m
         /adsJYtHIE31pH0K2vH8ck8ER0pSmPLr78qTeCIv/Kzss2/4JdMBjPl2NONQtSsGc+NT
         ILYJl2YxGrbigVT5Y6GvOw+OxEu550VhHD4eloE4dkaMy0ZQr3d34k6ajtttYDBG/zt/
         nlew==
X-Gm-Message-State: AOAM533FE6FBmKI3mx/hpZzrkzdY4Htrq977bHLcEzWxDfwYQLZFQ4Sw
        eRc4PFZG631aBM+VDaGr8mAFB+FiwyMbZG8B4dRKPOaLpt5UhNiDry+QdETfu2qWBhP4NYBBSnv
        3g5sZRDQXjgLpOXDR5mByFuj5AgQTpMX+4g==
X-Received: by 2002:a17:906:6a52:: with SMTP id n18mr29506833ejs.58.1600341723075;
        Thu, 17 Sep 2020 04:22:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqaT1qgX2FJMAklKbL/2lDIlMvp5mrgngIj43FB2hT2+sSKjBcsmLO3Oi/jejCZ6XFwn9NaA==
X-Received: by 2002:a17:906:6a52:: with SMTP id n18mr29506822ejs.58.1600341722877;
        Thu, 17 Sep 2020 04:22:02 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id cn21sm16112590edb.14.2020.09.17.04.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 04:22:02 -0700 (PDT)
To:     Elia Devito <eliadevito@gmail.com>,
        Mark Pearson <mpearson@lenovo.com>
Cc:     Benjamin Berg <bberg@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Jared Dominguez <jaredz@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Subject: RFC: offering a standardized (/sys/class) userspace API for selecting
 system/laptop performance-profiles
Message-ID: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
Date:   Thu, 17 Sep 2020 13:22:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Elia, Mark, et al.

Elia, Mark I'm mailing you both because both of you have pdx86 patches pending to add a vendor
specific sysfs-attribute for selecting performance-profiles for resp. HP and Lenovo Thinkpad laptops.

I think that this shows that we might need to start thinking
about a generic kernel API for this, otherwise we will
end up with slight different options per vendor ...

So it seems we may need something like:

/sys/class/system_performance_profile

Where we would then get e.g.:

/sys/class/system_performance_profile/thinkpad_acpi/performance_profile

And then we need to standardize on the names/values which
performance_profile can show / accept when written too.

The big question is what do we do if there are more then 3 profiles?

One option would be something like the following:

cat /sys/class/system_performance_profile/thinkpad_acpi/performance_profile

low-power [balanced] performance

cat /sys/class/system_performance_profile/thinkpad_acpi/extra_performance_profiles

extra-low-power balanced-performance-mix

So we add an optional extra_performance_profiles sysfs attribute and we ask all
drivers implemeting this class to implement at least the 3 standard profiles
(by mapping 3 of their options to these) and optional they can offer extra
profiles (with free form names) in the extra_performance_profiles
sysfs attribute under the class-device.

The idea behind putting the extra profiles in a separate sysfs-attribute
is that reading the main performance_profile attribute will always show
one selected, even if one of the extra profiles is actually in use,
then the driver should also show the closest standardized profile as
being active.

This will allow userspace code to always rely on the standard interface
both for getting a representation of the currently active profile as well
as for setting the active profile.

Elia, Mark, I assume that both of you want to get your patches for this
upstream sooner, rather then later. But I think we should put them on
hold until we have an agreement on a shared userspace API for this.

I would like to think that the above proposal is a good start,
if we can quickly (*) decide on an userspace API here

Regards,

Hans

p.s.

I guess we should also add an optional lap_mode sysfs attribute
to the class-device, to have all the info for the Thinkpads in
one place.


*) but not too quickly, it is important we get this right

