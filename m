Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9FAC433ED
	for <platform-driver-x86@archiver.kernel.org>; Sat,  8 May 2021 15:40:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99D5F61090
	for <platform-driver-x86@archiver.kernel.org>; Sat,  8 May 2021 15:40:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbhEHPlS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 8 May 2021 11:41:18 -0400
Received: from smtp2-g21.free.fr ([212.27.42.2]:35529 "EHLO smtp2-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229500AbhEHPlR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 8 May 2021 11:41:17 -0400
Received: from [192.168.1.128] (unknown [31.21.111.237])
        (Authenticated sender: pieleric@free.fr)
        by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0344A2003DC;
        Sat,  8 May 2021 17:39:59 +0200 (CEST)
Subject: Re: [PATCH] platform/x86: hp_accel: Avoid invoking _INI to speed up
 resume
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>, hdegoede@redhat.com,
        mgross@linux.intel.com
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
References: <20210430060736.590321-1-kai.heng.feng@canonical.com>
From:   =?UTF-8?Q?=c3=89ric_Piel?= <eric.piel@tremplin-utc.net>
Message-ID: <288b9b09-b7c7-4265-5eea-8fe7679fe4d1@tremplin-utc.net>
Date:   Sat, 8 May 2021 17:39:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210430060736.590321-1-kai.heng.feng@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 30/04/2021 08:07, Kai-Heng Feng wrote:
> hp_accel can take almost two seconds to resume on some HP laptops.
> 
> The bottleneck is on evaluating _INI, which is only needed to run once.
> 
> Resolve the issue by only invoking _INI when it's necessary. Namely, on
> probe and on hibernation restore.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Although I'm listed as the maintainer, I don't have the hardware anymore 
to test. However, the changes seem fine to me.

Acked-by: Éric Piel <eric.piel@trempplin-utc.net>

Best,
Éric

> ---
>   drivers/misc/lis3lv02d/lis3lv02d.h |  1 +
>   drivers/platform/x86/hp_accel.c    | 22 +++++++++++++++++++++-
>   2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/lis3lv02d/lis3lv02d.h b/drivers/misc/lis3lv02d/lis3lv02d.h
> index c394c0b08519a..7ac788fae1b86 100644
> --- a/drivers/misc/lis3lv02d/lis3lv02d.h
> +++ b/drivers/misc/lis3lv02d/lis3lv02d.h
> @@ -271,6 +271,7 @@ struct lis3lv02d {
>   	int			regs_size;
>   	u8                      *reg_cache;
>   	bool			regs_stored;
> +	bool			init_required;
>   	u8                      odr_mask;  /* ODR bit mask */
>   	u8			whoami;    /* indicates measurement precision */
>   	s16 (*read_data) (struct lis3lv02d *lis3, int reg);
> diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/hp_accel.c
> index 799cbe2ffcf36..8c0867bda8280 100644
> --- a/drivers/platform/x86/hp_accel.c
> +++ b/drivers/platform/x86/hp_accel.c
> @@ -88,6 +88,9 @@ MODULE_DEVICE_TABLE(acpi, lis3lv02d_device_ids);
>   static int lis3lv02d_acpi_init(struct lis3lv02d *lis3)
>   {
>   	struct acpi_device *dev = lis3->bus_priv;
> +	if (!lis3->init_required)
> +		return 0;
> +
>   	if (acpi_evaluate_object(dev->handle, METHOD_NAME__INI,
>   				 NULL, NULL) != AE_OK)
>   		return -EINVAL;
> @@ -356,6 +359,7 @@ static int lis3lv02d_add(struct acpi_device *device)
>   	}
>   
>   	/* call the core layer do its init */
> +	lis3_dev.init_required = true;
>   	ret = lis3lv02d_init_device(&lis3_dev);
>   	if (ret)
>   		return ret;
> @@ -403,11 +407,27 @@ static int lis3lv02d_suspend(struct device *dev)
>   
>   static int lis3lv02d_resume(struct device *dev)
>   {
> +	lis3_dev.init_required = false;
> +	lis3lv02d_poweron(&lis3_dev);
> +	return 0;
> +}
> +
> +static int lis3lv02d_restore(struct device *dev)
> +{
> +	lis3_dev.init_required = true;
>   	lis3lv02d_poweron(&lis3_dev);
>   	return 0;
>   }
>   
> -static SIMPLE_DEV_PM_OPS(hp_accel_pm, lis3lv02d_suspend, lis3lv02d_resume);
> +static const struct dev_pm_ops hp_accel_pm = {
> +	.suspend = lis3lv02d_suspend,
> +	.resume = lis3lv02d_resume,
> +	.freeze = lis3lv02d_suspend,
> +	.thaw = lis3lv02d_resume,
> +	.poweroff = lis3lv02d_suspend,
> +	.restore = lis3lv02d_restore,
> +};
> +
>   #define HP_ACCEL_PM (&hp_accel_pm)
>   #else
>   #define HP_ACCEL_PM NULL
> 

