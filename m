Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1329C2B9F8
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 May 2021 16:52:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B285061417
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 May 2021 16:52:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232824AbhEYQyU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 May 2021 12:54:20 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.3]:29311 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232550AbhEYQyT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 May 2021 12:54:19 -0400
Received: from [100.112.3.43] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-b.us-east-1.aws.symcld.net id 15/8E-53037-16B2DA06; Tue, 25 May 2021 16:52:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnleJIrShJLcpLzFFi42JJl3vFrpuovTb
  BoG0hk8XLCYcZLbq75zJZvDk+ncnic8dkFovVe14wWyz6+ITNgc1j0swZzB47Z91l95h3MtDj
  /b6rbB6fN8kFsEaxZuYl5VcksGac//afueCxQMXlz0kNjF95uhi5OIQE/jNKfLp9gBHCecwoM
  XXVKrYuRk4OYYEiiY83zrKC2CICoRL3JtwFK2IW2MAo0fC+gwmiYwuTxJOLvxlBqtgEtCW2bP
  kF1s0rYCvRO/s5E4jNIqAqMf1DAzOILSoQLrG74yUTRI2gxMmZT1hAbE4BO4nDGxYD2RxAGzQ
  l1u/SBwkzC4hL3HoynwnClpfY/nYOM0iJhICixMRvuiBhCYEEiZ5/j9gmMArOQjJ0FsKgWUgG
  zUIyaAEjyypGs6SizPSMktzEzBxdQwMDXUNDI11DXUMjE73EKt0kvdJi3dTE4hJdQ73E8mK94
  src5JwUvbzUkk2MwPhJKWCs2cG44M0HvUOMkhxMSqK8Uv6rE4T4kvJTKjMSizPii0pzUosPMc
  pwcChJ8IprrU0QEixKTU+tSMvMAcYyTFqCg0dJhPemJlCat7ggMbc4Mx0idYpRUUqc114BKCE
  AksgozYNrg6WPS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeZeBjOfJzCuBm/4KaDET0OKk
  nFUgi0sSEVJSDUyKsuuS1bUu17Aabsu4PXfvhD0+jKciKrsnKYgV21s+NFvfMem4q/Np9h+yE
  cVxKQvrLHJ/8M0qv7bv8tcCsf0rrA01J+irthhvTKpbG5xUO/lE36epJwUr6y6f47OI0Jx7RM
  q3ufvjoodTX7UIhqxfYTN7ymnfwzOdm6ItKu4/KTcQfz1bftnr4gt3Nwd/sOJfV/5aZVvSqdX
  P3drCFnGvj3HSi17xJTq8+0+wivmBp4c+Ki9W3Vrhuc5ty5S3z9VCL00ITC2v/cZe/Ze1b8LF
  e46Vp/mK3jNzNcq+qtqiFSzT9C8p8Eun1NWytac9MhpN7Gyfbnc8IPb8jsDhx2I7TCpC+7RNT
  1qp8k+c+F6JpTgj0VCLuag4EQAxPJEGmgMAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-3.tower-395.messagelabs.com!1621961567!6057!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18340 invoked from network); 25 May 2021 16:52:48 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-3.tower-395.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 25 May 2021 16:52:48 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id ECC2ADB55EE6B966132D;
        Wed, 26 May 2021 00:52:44 +0800 (CST)
Received: from [10.46.192.114] (10.46.192.114) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Tue, 25 May
 2021 12:52:43 -0400
Subject: Re: [External] Re: [PATCH v2 3/3] platform/x86: think-lmi: Add WMI
 interface support on Lenovo platforms
To:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Divya Bharathi <divya.bharathi@dell.com>,
        Prasanth KSR <prasanth.ksr@dell.com>
References: <markpearson@lenovo.com>
 <20210509015708.112766-1-markpearson@lenovo.com>
 <20210509015708.112766-3-markpearson@lenovo.com>
 <CAHp75VfM=Vv2pe=KNYQO_hf_8Ya-m8QH481xnu+OPoZL-p8TSA@mail.gmail.com>
 <f13956b5-511e-1793-c089-6f72628ea7a8@lenovo.com>
 <d17962ca-3839-fbeb-9090-e09960678b82@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <fc6eaf95-39af-a381-50a1-b9a6967b12b8@lenovo.com>
Date:   Tue, 25 May 2021 12:52:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d17962ca-3839-fbeb-9090-e09960678b82@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.192.114]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 2021-05-25 12:29 p.m., Hans de Goede wrote:
> Hi,
> 
> On 5/25/21 5:14 PM, Mark Pearson wrote:
>> Hi Andy,
>>
>>>> +static ssize_t current_password_store(struct kobject *kobj,
>>>> +                                     struct kobj_attribute *attr,
>>>> +                                     const char *buf, size_t count)
>>>> +{
>>>> +       struct tlmi_pwd_setting *setting = container_of(kobj, struct tlmi_pwd_setting, kobj);
>>>> +       int length;
>>>
>>>> +       length = strlen(buf);
>>>> +       if (buf[length-1] == '\n')
>>>> +               length--;
>>>
>>> This will prevent you from using \n in the password. Why?
>> The BIOS doesn't like it - so we strip it out :)
> 
> Erm, I don't believe that that is the whole story, there are 2
> separate things at play here:
> 
> 1. When entering the BIOS password at system power-on pressing
> enter means you're done and the BIOS should check what you've
> just entered as password before pressing the enter key, so the
> password can never contain '\n' since the enter key is the
> terminator for entering the password at boot
> 
> 2. People often use sysfs files by doing things like this:
> 
> echo mysecretpassword > /sys/.../current_password
> 
> And the "echo" shell command will then add an extra '\n' this
> is why you will see code like this to strip the '\n' in functions
> which use the input string as is (instead of doing strtol,
> sysfs_match_string or something else which does not care about a
> terminating '\n' already, note that functions like sysfs_str_equals
> and sysfs_match_string are special helpers for not caring about
> the '\n' without needing to strip it (because stripping it
> requires a strdup).
> 
> So what is happening here is simply stripping the '\n' which may
> have been added by echo (if it was added).
> 
> Regards,
> 
> Hans
> 
Agreed on all, I guess I was giving the story summary :)
I've been using this method in testing and if the \n gets passed on then
you'll get an error returned - the BIOS doesn't like it.

I've no idea if this is Lenovo specific or not. I'll document it as a
Lenovo specific case unless there are objections.

Mark
