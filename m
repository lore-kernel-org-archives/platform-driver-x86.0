Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5E0C07E9B
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Jul 2021 12:49:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5511A60FF3
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Jul 2021 12:49:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236862AbhGSMIi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Jul 2021 08:08:38 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.115]:58849 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236742AbhGSMIi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Jul 2021 08:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1626698957; i=@lenovo.com;
        bh=96eHZ9b6OAWiZqwHMFU3POKM8/qyW03G8rGLBulYlKc=;
        h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=PsB2wbwJX/EUbnSp4VdjS9u1C32HbeW6q7TnYU+I6daT94dSTqWB1C5/rKSp8sE7z
         YXgmliU/dEACHCFKkSXQvCxd9f/8EaJoYj39PBWk8gNT0JojYP5N7xlzVpzAHyROkU
         GqDLYU7Rursmpfws20Ks2MiwBkdees2wpIHzi/qWbTwiOpkdga4VxlfDFAa/eJOHiZ
         Cpf4hQnpGFrRiRV4FjGJ69/eV8hhScuLFzwRc2OfvlcSlToidUajGGqSaoBP0jy2Tz
         xjDLPV3qW9tDfWSXCxSao5Eu5IUDtHFnYpYRuwLH2y8SqnEQxvpqJuKUo4XXWvZFib
         EC3CY4a8CaOvQ==
Received: from [100.112.6.161] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-c.us-east-1.aws.symcld.net id 65/FD-07005-DC475F06; Mon, 19 Jul 2021 12:49:17 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmleJIrShJLcpLzFFi42JJl3vFrnum5Gu
  Cwb93JhaTZvxntnhzfDqTxeeOySwWq/e8YHZg8di8Qstj3slAj/f7rrJ5fN4kF8ASxZqZl5Rf
  kcCacebAIpaC1yIVO9ffYG5gPC7YxcjFISTwn1Gi/e5HRgjnOaPExGcXWboYOTiEBUolvq8L6
  mLk5BARKJZY++ciM4jNLKAp8aytgxHEFhLIkth5tY0NxGYT0JbYsuUXmM0rYCtx/tEdVhCbRU
  BVYln/a3YQW1QgQuLhzi2MEDWCEidnPmEBsTkF7CSetj+Fmm8hMXP+eUYIW1zi1pP5TBC2vMT
  2t3PAaiSA7P9nvzNC2AkSPf8esU1gFJyFZOwsJKNmIRk1C8moBYwsqxhNk4oy0zNKchMzc3QN
  DQx0DQ2NdM10zcz0Eqt0k/VKi3VTE4tLdA31EsuL9Yorc5NzUvTyUks2MQLjI6WAzWkH4+3XH
  /QOMUpyMCmJ8jZIfE0Q4kvKT6nMSCzOiC8qzUktPsSowcEhcOXgkdmMUix5+XmpShK8boVAdY
  JFqempFWmZOcAYhimV4OBREuHtyQdK8xYXJOYWZ6ZDpE4xKkqJ80YAI19IACSRUZoH1wZLG5c
  YZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfNmFwNN4cnMK4Gb/gpoMRPQYtaFH0EWlyQipKQa
  mITPyzR7zWbzv/3g2sKpJmGTVOwmz4l4xfVRfp+B2SqJ/poP6edsd4gza8Ron47tbT3kc6ZY/
  /nr7sfnT3Ge+1HbuHd7xS6TExOty/nvq75N7NUz5l1jtlJSVXiNUchzBVmTtyEzzugxbCkqLB
  aZNa1upnkZ55WDlUtaVPME6+ac654kJ2RxQiQ+Ktp9n/wOzqWF5X8iUmKZTRgW20l7fOK5q+2
  m/jzMR7bhqLXj9h0HTjfsX/Xq/f9b6StC593pPfVr8cvIqmn9X5PY7i5M6meI/mT450AXi2PK
  +wLhaP9dLWV+mx8+VeW7HnjvTfOsL5+cawWeJp00fS7Prtyp+fDBpoLot42apt/7tGy+KrEUZ
  yQaajEXFScCAHUJLmCWAwAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-8.tower-406.messagelabs.com!1626698955!265318!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23323 invoked from network); 19 Jul 2021 12:49:16 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-8.tower-406.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Jul 2021 12:49:16 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id C044EE99B369719EBBFD;
        Mon, 19 Jul 2021 20:49:13 +0800 (CST)
Received: from localhost.localdomain (10.38.63.73) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Mon, 19 Jul
 2021 08:49:12 -0400
Subject: Re: [External]Re: [PATCH 1/3] platform/x86: think-lmi: Move
 pending_reboot_attr to the attributes sysfs dir
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
CC:     <platform-driver-x86@vger.kernel.org>
References: <20210717143607.3580-1-hdegoede@redhat.com>
 <a46014f5-39e9-62bc-eaac-bfb2874af275@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <8556523c-ec3a-0c2d-f996-55ba2d3da91e@lenovo.com>
Date:   Mon, 19 Jul 2021 08:49:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a46014f5-39e9-62bc-eaac-bfb2874af275@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.63.73]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2021-07-17 11:27 a.m., Hans de Goede wrote:
> Hi,
> 
> On 7/17/21 4:36 PM, Hans de Goede wrote:
>> From: Mark Pearson <markpearson@lenovo.com>
>>
>> Move the pending_reboot node under attributes dir where it should live, as
>> documented in: Documentation/ABI/testing/sysfs-class-firmware-attributes.
>>
>> Also move the create / remove code to be together with the other code
>> populating / cleaning the attributes sysfs dir. In the removal path this
>> is necessary so that the remove is done before the
>> kset_unregister(tlmi_priv.attribute_kset) call.
>>
>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>> Co-developed-by: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> I've added this series to my review-hans and the pdx86/fixes
> branches now.
> 
Thanks Hans - they all look good to me.
I'll do some testing on a couple of my systems to confirm no issues

Mark
> Regards,
> 
> Hans
> 
> 
>> ---
>>   drivers/platform/x86/think-lmi.c | 11 +++++------
>>   1 file changed, 5 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
>> index 64dcec53a7a0..989a8221dcd8 100644
>> --- a/drivers/platform/x86/think-lmi.c
>> +++ b/drivers/platform/x86/think-lmi.c
>> @@ -672,6 +672,7 @@ static void tlmi_release_attr(void)
>>   			kobject_put(&tlmi_priv.setting[i]->kobj);
>>   		}
>>   	}
>> +	sysfs_remove_file(&tlmi_priv.attribute_kset->kobj, &pending_reboot.attr);
>>   	kset_unregister(tlmi_priv.attribute_kset);
>>   
>>   	/* Authentication structures */
>> @@ -680,7 +681,6 @@ static void tlmi_release_attr(void)
>>   	sysfs_remove_group(&tlmi_priv.pwd_power->kobj, &auth_attr_group);
>>   	kobject_put(&tlmi_priv.pwd_power->kobj);
>>   	kset_unregister(tlmi_priv.authentication_kset);
>> -	sysfs_remove_file(&tlmi_priv.class_dev->kobj, &pending_reboot.attr);
>>   }
>>   
>>   static int tlmi_sysfs_init(void)
>> @@ -733,6 +733,10 @@ static int tlmi_sysfs_init(void)
>>   			goto fail_create_attr;
>>   	}
>>   
>> +	ret = sysfs_create_file(&tlmi_priv.attribute_kset->kobj, &pending_reboot.attr);
>> +	if (ret)
>> +		goto fail_create_attr;
>> +
>>   	/* Create authentication entries */
>>   	tlmi_priv.authentication_kset = kset_create_and_add("authentication", NULL,
>>   								&tlmi_priv.class_dev->kobj);
>> @@ -760,11 +764,6 @@ static int tlmi_sysfs_init(void)
>>   	if (ret)
>>   		goto fail_create_attr;
>>   
>> -	/* Create global sysfs files */
>> -	ret = sysfs_create_file(&tlmi_priv.class_dev->kobj, &pending_reboot.attr);
>> -	if (ret)
>> -		goto fail_create_attr;
>> -
>>   	return ret;
>>   
>>   fail_create_attr:
>>
> 
