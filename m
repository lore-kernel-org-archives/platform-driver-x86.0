Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887D5C433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 16:45:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5994C610E9
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 16:45:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355366AbhESQrQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 May 2021 12:47:16 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.113]:17589 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231124AbhESQrQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 May 2021 12:47:16 -0400
Received: from [100.112.4.164] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-c.us-east-1.aws.symcld.net id E0/55-55213-3C045A06; Wed, 19 May 2021 16:45:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLIsWRWlGSWpSXmKPExsWSLveKTfeww9I
  Eg9+HeCy6u+cyWbw5Pp3J4nPHZBaL1XteMFss+viEzYHVY9LMGcwe804Gerzfd5XN4/MmuQCW
  KNbMvKT8igTWjBVLn7IU/FGquHH2A1MD40zZLkYuDiGB/4wSP8//ZoZwHjNK3Jk0iw3EERZYz
  Cjx4+dVxi5GTg4RAXWJqR09bCA2s0CFxKVpU5kgOjoZJXpblzGDJNgEtCW2bPkFVsQrYCvR1f
  IbLM4ioCrx73ofK4gtKhAusbvjJRNEjaDEyZlPWEBsTgE7iet7HgAt4wBaoCmxfpc+xC5xiVt
  P5jNB2PIS29/OARspIaAo8b53LjuEnSDR8+8R2wRGwVlIps5CmDQLyaRZSCYtYGRZxWiSVJSZ
  nlGSm5iZo2toYKBraGika6proZdYpZusV1qsm5pYXKJrqJdYXqxXXJmbnJOil5dasokRGCspB
  awcOxi/v/6gd4hRkoNJSZTX7P6iBCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvHfsliYICRalpq
  dWpGXmAOMWJi3BwaMkwitlAZTmLS5IzC3OTIdInWJUlBLnPWcPlBAASWSU5sG1wVLFJUZZKWF
  eRgYGBiGegtSi3MwSVPlXjOIcjErCvDYgU3gy80rgpr8CWswEtPh/4yKQxSWJCCmpBiaZ3O87
  ZN5+F8uQjVWbfqLHWnSRUuSspBXL+68X6pxPejJX8ULeSZZFeR9e3WG7rXnQ78ejD9P9/mhvc
  f7hUybx757aNnllbgVmpUTpv/rOJRGbnJ9nmNuvq5DsVDojvinQnTPOzqbx5x8pjxUR2T/vRI
  bwis7immGivv/5pAVXdR2PrE1b9IzNeXH8C9u3HqEMe7aEXbxWerekSOUxd9e+qZd3vXM/ZGr
  V6/Oo5aiYpOIqTg3ZuQmaUfwb11raWshP6k09zB9qZP/y0HKB2bO/fZnidSji2Yq5Z5u/X57O
  9W7Zond/np5uvherOFOgPe3McsY/yucmbKq39T89YzJ7vc32bvFob99NX9hf63IpsRRnJBpqM
  RcVJwIAKxFq3ZADAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-14.tower-406.messagelabs.com!1621442753!19604!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6594 invoked from network); 19 May 2021 16:45:54 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
  by server-14.tower-406.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 May 2021 16:45:54 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id AB49FEC6EC136721F523;
        Thu, 20 May 2021 00:45:51 +0800 (CST)
Received: from [10.46.192.100] (10.46.192.100) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Wed, 19 May
 2021 12:45:49 -0400
Subject: Re: [External] Re: [PATCH v2 1/3] platform/x86:
 firmware_attributes_class: Create helper file for handling
 firmware-attributes class registration events
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <mgross@linux.intel.com>, <platform-driver-x86@vger.kernel.org>,
        <divya.bharathi@dell.com>, <prasanth.ksr@dell.com>
References: <markpearson@lenovo.com>
 <20210509015708.112766-1-markpearson@lenovo.com>
 <5eafa0be-e44c-e8fd-a9ea-db5e30c47788@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <c7b439e6-63f9-a061-c489-6edd7f9e15c6@lenovo.com>
Date:   Wed, 19 May 2021 12:45:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <5eafa0be-e44c-e8fd-a9ea-db5e30c47788@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.192.100]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks Hans

On 2021-05-19 12:15 p.m., Hans de Goede wrote:
> Hi Mark,
> 
> On 5/9/21 3:57 AM, Mark Pearson wrote:
>> This will be used by the Dell and Lenovo WMI management drivers to
>> prevent both drivers being active.
>>
>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>> ---
>> Changes in v2:
>>  This is a new file requested as part of the review of the proposed
>> think_lmi.c driver. Labeling as V2 to keep series consistent (hope
>> that's correct).
> 
> Yes that is correct; and thank you for taking care of making
> the code for registering the firmware_attribute class shared.
> 
>>
>>  drivers/platform/x86/Kconfig                  |  6 +++
>>  drivers/platform/x86/Makefile                 |  1 +
>>  .../platform/x86/firmware_attributes_class.c  | 51 +++++++++++++++++++
>>  .../platform/x86/firmware_attributes_class.h  | 13 +++++
>>  4 files changed, 71 insertions(+)
>>  create mode 100644 drivers/platform/x86/firmware_attributes_class.c
>>  create mode 100644 drivers/platform/x86/firmware_attributes_class.h
>>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index 2714f7c38..b0e1e5f65 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -1076,6 +1076,12 @@ config TOUCHSCREEN_DMI
>>  	  the OS-image for the device. This option supplies the missing info.
>>  	  Enable this for x86 tablets with Silead or Chipone touchscreens.
>>  
>> +config FW_ATTR_CLASS
>> +	tristate "Firmware attributes class helper module"> +	help
>> +	  This option should be enabled by any modules using the firmware
>> +	  attributes class.
> 
> My idea here was to have this be a kernel-library which drivers which need it
> select. In this case it should not be visible to end-users and does not need a
> help text, so this should look like this:
> 
> config FW_ATTR_CLASS
> 	tristate
> 	default n
> 
Got it - I'll update

>>  config INTEL_IMR
>>  	bool "Intel Isolated Memory Region support"
>>  	depends on X86_INTEL_QUARK && IOSF_MBI
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
>> index dcc8cdb95..147573f69 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -115,6 +115,7 @@ obj-$(CONFIG_TOPSTAR_LAPTOP)	+= topstar-laptop.o
>>  obj-$(CONFIG_I2C_MULTI_INSTANTIATE)	+= i2c-multi-instantiate.o
>>  obj-$(CONFIG_MLX_PLATFORM)		+= mlx-platform.o
>>  obj-$(CONFIG_TOUCHSCREEN_DMI)		+= touchscreen_dmi.o
>> +obj-$(CONFIG_FW_ATTR_CLASS)             += firmware_attributes_class.o
>>  
>>  # Intel uncore drivers
>>  obj-$(CONFIG_INTEL_IPS)				+= intel_ips.o
>> diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/platform/x86/firmware_attributes_class.c
>> new file mode 100644
>> index 000000000..4ed959d6c
>> --- /dev/null
>> +++ b/drivers/platform/x86/firmware_attributes_class.c
>> @@ -0,0 +1,51 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +/* Firmware attributes class helper module */
>> +
>> +#include <linux/mutex.h>
>> +#include <linux/device/class.h>
>> +#include <linux/module.h>
>> +
>> +static DEFINE_MUTEX(fw_attr_lock);
>> +bool fw_attr_inuse;
>> +
>> +static struct class firmware_attributes_class = {
>> +	.name = "firmware-attributes",
>> +};
>> +
>> +int fw_attributes_class_register(struct class **fw_attr_class)
>> +{
>> +	int err;
>> +
>> +	mutex_lock(&fw_attr_lock);
>> +	/* We can only have one active FW attribute class */
>> +	if (fw_attr_inuse) {
>> +		mutex_unlock(&fw_attr_lock);
>> +		return -EEXIST;
>> +	}
> 
> I think it should be allowed to have multiple drivers
> using the firmware_attributes class, e.g. besides the main system
> BIOS an Ethermet or FiberChannel; card with an option ROM which supports
> booting from iSCSI/FCoE or FiberChannel SCSI disks / LUNs could expose
> settings to configure which disk/LUN to boot from this way.
> 
> And there is nothing wrong with multiple drivers calling device_create
> with the same class.
> 
> So I suggest renaming fw_attributes_class_register to
> fw_attributes_class_get (and unregister to put) and to make
> fw_attr_inuse a counter and create the class when the counter
> goes from 0 -> 1 and free it when it goes from 1 to 0 again.
> 
> Otherwise this looks good. I like that you already thought about
> races and have protected fw_attr_inuse with a mutex.
> 
Ah - I hadn't considered it as being used with devices other than the
BIOS. That all makes sense and I'll update.

Thanks for the review!
Mark
