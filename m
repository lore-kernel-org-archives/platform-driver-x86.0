Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A66D3C47089
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 May 2021 12:24:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7851E613C0
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 May 2021 12:24:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234410AbhE0MZu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 May 2021 08:25:50 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.115]:44492 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234333AbhE0MZt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 May 2021 08:25:49 -0400
Received: from [100.112.4.65] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-c.us-east-1.aws.symcld.net id 9A/05-39641-07F8FA06; Thu, 27 May 2021 12:24:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpileJIrShJLcpLzFFi42LJePGQRzevf32
  CwZFjyhYvJxxmtDi04QCTRXf3XCaLN8enM1ms3vOC2WLRxydsDmwek2bOYPbYOesuu8f7fVfZ
  PD5vkgtgiWLNzEvKr0hgzXh9SqzgmmzFwrdPmBoYT0p0MXJyCAn8Z5R4vcSyi5ELyH7MKLG+d
  RkbiCMssJhRYunU12wgVSIC6hJTO3rAEswCsxklzn0+zgzR0s4oMXF/HztIFZuAtsSWLb/AOn
  gFbCXWn9/GCmKzCKhKbJ7bwghiiwqES+zueMkEUSMocXLmE5YuRg4OTgE7iX/N2SAms4CmxPp
  d+iAVzALiEreezGeCsOUltr+dwwxSIiGgKHFwigVIWEIgQaLn3yO2CYyCs5DMnIUwaBaSQbOQ
  DFrAyLKK0SypKDM9oyQ3MTNH19DAQNfQ0EjXTNfQwlgvsUo3Wa+0WDc1sbhE11AvsbxYr7gyN
  zknRS8vtWQTIzBqUgrYtu9g3Pv6g94hRkkOJiVR3gk66xOE+JLyUyozEosz4otKc1KLDzHKcH
  AoSfCK9wLlBItS01Mr0jJzgBEMk5bg4FES4V3XDZTmLS5IzC3OTIdInWJUlBLnPQjSJwCSyCj
  Ng2uDJY1LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5O0Cm8GTmlcBNfwW0mAlosVDiOpDF
  JYkIKakGJhatEzOKnjIILLxwtUbpanbeh4uLW96cecbKnMbfoWocVPR86uWsCwsulHc2+ST4T
  XnTEcrzPLEgJrGx1npVZXNkrOWEkK3rpSevOMjyvHzR8pfnOkpmJh+tN5+bdjRNt/BqvXLnbR
  0Hw9muUb5b2zK6u3cKrxMQcO4XKDHb8vtbrpF0e/AS6YkL9+5Kn7JQOe3ujNSz1nrMLes9ONr
  TgzPUIz7qTtKoiDI+cHFpZVXBOy3H2vfxetMM++On7pg/aXPBf0MhBbt1BnmrLa9quLs8W7x9
  w3TThmOv7OdEv8y79zz3Qc/L57YHz+4P3dzp3zDDoLfnWZ9UpcHP+S+ZPStmSbxJsRUSjV0gM
  79ZiaU4I9FQi7moOBEA5IIl7JUDAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-6.tower-416.messagelabs.com!1622118253!29635!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27361 invoked from network); 27 May 2021 12:24:14 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.12)
  by server-6.tower-416.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 May 2021 12:24:14 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 6D1605BAB39178B90B72;
        Thu, 27 May 2021 08:24:13 -0400 (EDT)
Received: from [10.46.208.141] (10.46.208.141) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Thu, 27 May
 2021 08:24:12 -0400
Subject: Re: [External] Re: [PATCH v4 1/3] platform/x86:
 firmware_attributes_class: Create helper file for handling
 firmware-attributes class registration events
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <andy.shevchenko@gmail.com>, <prasanth.ksr@dell.com>,
        <divya.bharathi@dell.com>, <Dell.Client.Kernel@dell.com>,
        <platform-driver-x86@vger.kernel.org>
References: <markpearson@lenovo.com>
 <20210526201447.3686-1-markpearson@lenovo.com>
 <e5d5dc1e-98be-72a3-1264-7f647edc007f@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <e0ce8a91-4b00-e312-68dd-d4743f502eaa@lenovo.com>
Date:   Thu, 27 May 2021 08:24:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e5d5dc1e-98be-72a3-1264-7f647edc007f@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.208.141]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks Hans

On 2021-05-27 5:12 a.m., Hans de Goede wrote:
> Hi Mark, Andy,
> 
> Overall this looks pretty good. There are a few very small issues
> remaining, but they are so small that I've decided to fix them up
> and merge this into my review-hans branch with the issues fixed up.
> 
> I plan to let this sit in review-hans a bit longer then usual to
> give you (Mark) a chance to check out the changes and ack them
> and to give Andy the time to check if his review remarks were
> addressed to his liking.
> 
> I've put remarks inline / below about the few things which
> I've fixed up in this patch. I'll also reply to patch 3/3
> with the fixups which I've done there.
> 
> On 5/26/21 10:14 PM, Mark Pearson wrote:
>> This will be used by the Dell and Lenovo WMI management drivers to
>> prevent both drivers being active.
>>
>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>> ---
>> Changes in v2:
>>  - This is a new file requested as part of the review of the proposed
>> think_lmi.c driver. Labeling as V2 to keep series consistent
>>
>> Changes in v3:
>>  - Set default in Kconfig, and removed help text
>>  - Allow multiple modules to register with module. Change API names to
>>     better reflect this.
>>
>> Changes in v4:
>>  - version bump for consistency in series
>>
>>  drivers/platform/x86/Kconfig                  |  4 ++
>>  drivers/platform/x86/Makefile                 |  1 +
>>  .../platform/x86/firmware_attributes_class.c  | 53 +++++++++++++++++++
>>  .../platform/x86/firmware_attributes_class.h  | 13 +++++
>>  4 files changed, 71 insertions(+)
>>  create mode 100644 drivers/platform/x86/firmware_attributes_class.c
>>  create mode 100644 drivers/platform/x86/firmware_attributes_class.h
>>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index 2714f7c38..57da8352d 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -1076,6 +1076,10 @@ config TOUCHSCREEN_DMI
>>  	  the OS-image for the device. This option supplies the missing info.
>>  	  Enable this for x86 tablets with Silead or Chipone touchscreens.
>>  
>> +config FW_ATTR_CLASS
>> +	tristate "Firmware attributes class helper module"
> 
> This should be just "	tristate" adding a string after the "tristate"
> makes this user selectable, I've dropped the string.
Ah - my bad. Thanks for fixing.

> 
>> +	default n
>> +
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
> 
> This was using spaces instead of tabs for indent before the += and
> it did not apply because of the "platform/x86: Rename hp-wireless to wireless-hotkey"
> patch in review-hans.
Ack.

> 
> 
>>  # Intel uncore drivers
>>  obj-$(CONFIG_INTEL_IPS)				+= intel_ips.o
>> diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/platform/x86/firmware_attributes_class.c
>> new file mode 100644
>> index 000000000..31393ce4d
>> --- /dev/null
>> +++ b/drivers/platform/x86/firmware_attributes_class.c
> 
> This file had a couple of trailing empty lines which I've stripped.
Ack - sorry I missed those.
> 
>> --- /dev/null
>> +++ b/drivers/platform/x86/firmware_attributes_class.h
> 
> Idem, and also the same for think-lmi.c from patch 3/3>
> Regards,
> 
> Hans
> 

Mark
