Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED8BC48BCF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 15:25:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 883F0613B9
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 15:25:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234750AbhFIP1f (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Jun 2021 11:27:35 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.5]:61453 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236224AbhFIP1W (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Jun 2021 11:27:22 -0400
Received: from [100.112.0.142] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-b.us-east-1.aws.symcld.net id 0C/0E-20778-76DD0C06; Wed, 09 Jun 2021 15:25:27 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMKsWRWlGSWpSXmKPExsWSLveKXTft7oE
  Eg0/rrC0mzfjPbHFowwEmizfHpzNZfO6YzGLRvvIpm8XqPS+YHdg8Js2cweyxeYWWx6ZVnWwe
  804Gerzfd5XN4/MmuQC2KNbMvKT8igTWjM7vS5gKNgpUPHoxk7GBsZWvi5GTQ0jgP6PE5TMCX
  YxcQPYjRonfe9YxgiSEBbIk/m+9xw5iiwgUS6z9c5G5i5GDg1mgQGL5UmGIXkuJaY+fg5WzCW
  hLbNnyiw3E5hWwlfjW+JEFxGYRUJGY0bCPCcQWFQiX2N3xkgmiRlDi5MwnLCAjOQWsJFadF4K
  Yrimxfpc+SAWzgLjErSfzmSBseYntb+cwg9gSAooSp97ch7ITJHr+PWKbwCg4C8nQWQiTZiGZ
  NAvJpAWMLKsYTZOKMtMzSnITM3N0DQ0MdA0NjXQNdS0s9RKrdJP0Sot1UxOLS3QN9RLLi/WKK
  3OTc1L08lJLNjEC4yelgDFyB+O+1x/0DjFKcjApifI61B9IEOJLyk+pzEgszogvKs1JLT7EqM
  HBIXDl4JHZjFIsefl5qUoSvJV3gOoEi1LTUyvSMnOAMQ5TKsHBoyTCG3wMKM1bXJCYW5yZDpE
  6xagoJc6bAdInAJLIKM2Da4OllUuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHnzQabwZOaV
  wE1/BbSYCWixo/E+kMUliQgpqQamszyX189+et3k+Al93qcVei90C5LmPKpe6Prt98FdpqVRq
  gGRTZ8Vfold++kobDfR3llc6sC759J3JhjPj4tps9M68nVZXapLWM095nfOs5etWHDj8T5Z7s
  CMkMaHS7Zu17YsyT5yaf0t3kfy6/Kmi/+Yvyv10tWQoHds6hvW7BA1XHLq3IovPrsdYz08Iy7
  aSfY8tFyZ+2qpZZlSb5nRv9se59Z5ZPH6vvXyDTqfVtj+bsvtE83v1joIKU2e8cl/6aO2JJX4
  f05s/jP6i5K+VE84ZPLLb73Jmeki6rujhEof3WYIl2TKVJ4kNcmP1f3dYZmVnq8a1sXv0Pl6e
  lXW92LJrT4Pt4UZVfwq2sbtqcRSnJFoqMVcVJwIAOvZrHemAwAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-6.tower-386.messagelabs.com!1623252325!47362!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5798 invoked from network); 9 Jun 2021 15:25:26 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-6.tower-386.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Jun 2021 15:25:26 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 749342C1C436180708C3;
        Wed,  9 Jun 2021 23:25:23 +0800 (CST)
Received: from [10.46.192.169] (10.46.192.169) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Wed, 9 Jun 2021
 11:25:21 -0400
Subject: Re: [External] [PATCH] platform/x86: dell-wmi-sysman/think-lmi: Make
 fw_attr_class global static
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        <Dell.Client.Kernel@dell.com>,
        Nathan Chancellor <nathan@kernel.org>
References: <20210609145952.113393-1-hdegoede@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <1e143288-3a10-9075-9dde-3303bd1d213f@lenovo.com>
Date:   Wed, 9 Jun 2021 11:25:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210609145952.113393-1-hdegoede@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.192.169]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks Hans - I should have caught that.

Looks good

On 2021-06-09 10:59 a.m., Hans de Goede wrote:
> The dell-wmi-sysman and think-lmi kernel modules both have a global
> struct class *fw_attr_class variable, leading to the following compile
> errors when both are builtin:
> 
> ld: drivers/platform/x86/think-lmi.o:(.bss+0x0): multiple definition of `fw_attr_class'; drivers/platform/x86/dell/dell-wmi-sysman/sysman.o:(.bss+0x0): first defined here
> 
> In both cases the variable is only used in the file where it is declared.
> Make both declarations static to avoid the linker error.
> 
> Cc: Mark Pearson <markpearson@lenovo.com>
> Cc: Dell.Client.Kernel@dell.com
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/dell/dell-wmi-sysman/sysman.c | 2 +-
>  drivers/platform/x86/think-lmi.c                   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> index 1378c1878658..636bdfa83284 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> @@ -25,7 +25,7 @@ struct wmi_sysman_priv wmi_priv = {
>  /* reset bios to defaults */
>  static const char * const reset_types[] = {"builtinsafe", "lastknowngood", "factory", "custom"};
>  static int reset_option = -1;
> -struct class *fw_attr_class;
> +static struct class *fw_attr_class;
>  
>  
>  /**
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 782d8e3fe7a1..c6413b906e4a 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -134,7 +134,7 @@ static const char * const encoding_options[] = {
>  	[TLMI_ENCODING_SCANCODE] = "scancode",
>  };
>  static struct think_lmi tlmi_priv;
> -struct class *fw_attr_class;
> +static struct class *fw_attr_class;
>  
>  /* ------ Utility functions ------------*/
>  /* Convert BIOS WMI error string to suitable error code */
> 
