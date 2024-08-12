Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC64183CD4
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 15:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723477138; cv=none; b=pzlcgyDqbR9eOJLhDducmT1lnOZiwt9JEZiG/Zy/fhLx1RkNavDXEgoQknp2isbJNo/I4j1Z3MUKv2W4ki4BFFfdcqBEUxnPtXQiG9WT1RF9dHy0vTNmyAKjmKSrgzn7ybCwwk9H/KRysMbe5Gg8UQTiaXuueHm7gg1RdukcdJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723477138; c=relaxed/simple;
	bh=dEzFRSi5Ch741+35DJL8Eme/1DKg97v9Xv0G8Drxlo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2cvE+XJJl32/SD3t3CDv/QVPCI8AF3hnDUrXdlTPx/2Ayk9fIu5TnuRK3t41Wu2o/UZnaqRYp4GgKY6AuvjQwhNa9TwASGcbeu/ZkeOqLFvyJgLGZ1YK9kyDn5n/haO1p0NY9yEZtnBTgrD+DjBkovFfnK/rFGr5dd49E9phpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MfD2Xb3s; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MfD2Xb3s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723477135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m+NcVfxfLueCtd1XwBH1GMwF5gZvC1aWJOmQ0/8l0is=;
	b=MfD2Xb3sNSa0eIdKYbZbb0gTbYleC4q3Lrz2aJPX9EuqTaq00QM4arM4km15h6fJyQclpm
	sLq3HAGbcyepH+f0t28gaa0KwLxmT419CoZ8UnVSx7RTv8z5uprSVXKxGdqgF0btZdhT5m
	LZb2e9+mWs4Jsj1ZhYS2X1hdE0AIhis=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-NxDsB1bGNnixBQHqCDrHlg-1; Mon, 12 Aug 2024 11:38:54 -0400
X-MC-Unique: NxDsB1bGNnixBQHqCDrHlg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a7a8281dba5so380061066b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 08:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723477133; x=1724081933;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m+NcVfxfLueCtd1XwBH1GMwF5gZvC1aWJOmQ0/8l0is=;
        b=LivWwnuIzqStUIsmwPKgrX3KPyW5xB62b30JQy4fdx1EjIYSDYe9w64vvf5j87OX71
         cZd10GwvlDTwCMZ0lLnXP3AbiaYSbIBsaPnmNSpaMjQBEFmoegdgCPXSD3BUfWq056JG
         SbJGGf1oI9elV3hthGmYQms4uq9ehd/g7uBeKphJcDPuklPyHXgrYer3tqupx3lbv2UW
         +6o1AOXnsDHcCW7ZED3Nb09ZIg8KOzXpTawoNjfPhDElB3AKs33CBJQE7jBehEyKNw4q
         gCcai/aYHeEoPuV3MtGUxBK6qnESmgW21k8tiW4XksMCdn418mXJble4BVopxl657Kic
         Z2xA==
X-Gm-Message-State: AOJu0Yy7DWbIkj1aTdBoLZ1ht2TIUvHBnftM4pm+mKhhhzxCrK85SEp1
	LztKDqZv8he9iD3pcREGkyfliKhwiYyxD4bri3sjhP8HJam91OJ5YsrZywhricu4tnWfR8H7GyC
	V3uMTh/LffuvkKgCLTScf0gaH22Lgt2dyVeAcn+ihVuDvkI8bu+B+aBtZMqs1+/espzO5XLs=
X-Received: by 2002:a17:906:fe43:b0:a7a:a4be:2f98 with SMTP id a640c23a62f3a-a80ed1b5a68mr66106466b.10.1723477133142;
        Mon, 12 Aug 2024 08:38:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUmaU61kRaK/PVW9jmUWX5NjMFSJ9CHhk/oP9zxRL3ZnCNjIwaW0Y1Ket9C14ZoR3nubr1JQ==
X-Received: by 2002:a17:906:fe43:b0:a7a:a4be:2f98 with SMTP id a640c23a62f3a-a80ed1b5a68mr66103366b.10.1723477132509;
        Mon, 12 Aug 2024 08:38:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb240debsm239058566b.192.2024.08.12.08.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 08:38:52 -0700 (PDT)
Message-ID: <5aa66a74-96f1-4fcd-904d-6b5f1ecd2bd9@redhat.com>
Date: Mon, 12 Aug 2024 17:38:51 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] platform/x86: ideapad-laptop: move ACPI helpers
 from header to source file
To: Gergo Koteles <soyer@irl.hu>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Ike Panhc <ike.pan@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1721898747.git.soyer@irl.hu>
 <57a48d2582b567f6c6fbcd3b379e17aee0fb5a94.1721898747.git.soyer@irl.hu>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <57a48d2582b567f6c6fbcd3b379e17aee0fb5a94.1721898747.git.soyer@irl.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 7/25/24 11:21 AM, Gergo Koteles wrote:
> Since moving ymc_trigger_ec from lenovo-ymc to ideapad-laptop, only the
> latter uses these definitions and functions.
> 
> Move them back to source file.
> 
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

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
>  drivers/platform/x86/ideapad-laptop.c | 136 +++++++++++++++++++++++++
>  drivers/platform/x86/ideapad-laptop.h | 139 --------------------------
>  2 files changed, 136 insertions(+), 139 deletions(-)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 9fc1bb990e47..8398774cdfe2 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -22,6 +22,7 @@
>  #include <linux/init.h>
>  #include <linux/input.h>
>  #include <linux/input/sparse-keymap.h>
> +#include <linux/jiffies.h>
>  #include <linux/kernel.h>
>  #include <linux/leds.h>
>  #include <linux/module.h>
> @@ -87,6 +88,34 @@ enum {
>  	SALS_FNLOCK_OFF       = 0xf,
>  };
>  
> +enum {
> +	VPCCMD_R_VPC1 = 0x10,
> +	VPCCMD_R_BL_MAX,
> +	VPCCMD_R_BL,
> +	VPCCMD_W_BL,
> +	VPCCMD_R_WIFI,
> +	VPCCMD_W_WIFI,
> +	VPCCMD_R_BT,
> +	VPCCMD_W_BT,
> +	VPCCMD_R_BL_POWER,
> +	VPCCMD_R_NOVO,
> +	VPCCMD_R_VPC2,
> +	VPCCMD_R_TOUCHPAD,
> +	VPCCMD_W_TOUCHPAD,
> +	VPCCMD_R_CAMERA,
> +	VPCCMD_W_CAMERA,
> +	VPCCMD_R_3G,
> +	VPCCMD_W_3G,
> +	VPCCMD_R_ODD, /* 0x21 */
> +	VPCCMD_W_FAN,
> +	VPCCMD_R_RF,
> +	VPCCMD_W_RF,
> +	VPCCMD_W_YMC = 0x2A,
> +	VPCCMD_R_FAN = 0x2B,
> +	VPCCMD_R_SPECIAL_BUTTONS = 0x31,
> +	VPCCMD_W_BL_POWER = 0x33,
> +};
> +
>  /*
>   * These correspond to the number of supported states - 1
>   * Future keyboard types may need a new system, if there's a collision
> @@ -236,6 +265,7 @@ static void ideapad_shared_exit(struct ideapad_private *priv)
>  /*
>   * ACPI Helpers
>   */
> +#define IDEAPAD_EC_TIMEOUT 200 /* in ms */
>  
>  static int eval_int(acpi_handle handle, const char *name, unsigned long *res)
>  {
> @@ -251,6 +281,29 @@ static int eval_int(acpi_handle handle, const char *name, unsigned long *res)
>  	return 0;
>  }
>  
> +static int eval_int_with_arg(acpi_handle handle, const char *name, unsigned long arg,
> +			     unsigned long *res)
> +{
> +	struct acpi_object_list params;
> +	unsigned long long result;
> +	union acpi_object in_obj;
> +	acpi_status status;
> +
> +	params.count = 1;
> +	params.pointer = &in_obj;
> +	in_obj.type = ACPI_TYPE_INTEGER;
> +	in_obj.integer.value = arg;
> +
> +	status = acpi_evaluate_integer(handle, (char *)name, &params, &result);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	if (res)
> +		*res = result;
> +
> +	return 0;
> +}
> +
>  static int exec_simple_method(acpi_handle handle, const char *name, unsigned long arg)
>  {
>  	acpi_status status = acpi_execute_simple_method(handle, (char *)name, arg);
> @@ -293,6 +346,89 @@ static int eval_dytc(acpi_handle handle, unsigned long cmd, unsigned long *res)
>  	return eval_int_with_arg(handle, "DYTC", cmd, res);
>  }
>  
> +static int eval_vpcr(acpi_handle handle, unsigned long cmd, unsigned long *res)
> +{
> +	return eval_int_with_arg(handle, "VPCR", cmd, res);
> +}
> +
> +static int eval_vpcw(acpi_handle handle, unsigned long cmd, unsigned long data)
> +{
> +	struct acpi_object_list params;
> +	union acpi_object in_obj[2];
> +	acpi_status status;
> +
> +	params.count = 2;
> +	params.pointer = in_obj;
> +	in_obj[0].type = ACPI_TYPE_INTEGER;
> +	in_obj[0].integer.value = cmd;
> +	in_obj[1].type = ACPI_TYPE_INTEGER;
> +	in_obj[1].integer.value = data;
> +
> +	status = acpi_evaluate_object(handle, "VPCW", &params, NULL);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int read_ec_data(acpi_handle handle, unsigned long cmd, unsigned long *data)
> +{
> +	unsigned long end_jiffies, val;
> +	int err;
> +
> +	err = eval_vpcw(handle, 1, cmd);
> +	if (err)
> +		return err;
> +
> +	end_jiffies = jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1;
> +
> +	while (time_before(jiffies, end_jiffies)) {
> +		schedule();
> +
> +		err = eval_vpcr(handle, 1, &val);
> +		if (err)
> +			return err;
> +
> +		if (val == 0)
> +			return eval_vpcr(handle, 0, data);
> +	}
> +
> +	acpi_handle_err(handle, "timeout in %s\n", __func__);
> +
> +	return -ETIMEDOUT;
> +}
> +
> +static int write_ec_cmd(acpi_handle handle, unsigned long cmd, unsigned long data)
> +{
> +	unsigned long end_jiffies, val;
> +	int err;
> +
> +	err = eval_vpcw(handle, 0, data);
> +	if (err)
> +		return err;
> +
> +	err = eval_vpcw(handle, 1, cmd);
> +	if (err)
> +		return err;
> +
> +	end_jiffies = jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1;
> +
> +	while (time_before(jiffies, end_jiffies)) {
> +		schedule();
> +
> +		err = eval_vpcr(handle, 1, &val);
> +		if (err)
> +			return err;
> +
> +		if (val == 0)
> +			return 0;
> +	}
> +
> +	acpi_handle_err(handle, "timeout in %s\n", __func__);
> +
> +	return -ETIMEDOUT;
> +}
> +
>  /*
>   * debugfs
>   */
> diff --git a/drivers/platform/x86/ideapad-laptop.h b/drivers/platform/x86/ideapad-laptop.h
> index 948cc61800a9..1e52f2aa0aac 100644
> --- a/drivers/platform/x86/ideapad-laptop.h
> +++ b/drivers/platform/x86/ideapad-laptop.h
> @@ -9,9 +9,6 @@
>  #ifndef _IDEAPAD_LAPTOP_H_
>  #define _IDEAPAD_LAPTOP_H_
>  
> -#include <linux/acpi.h>
> -#include <linux/jiffies.h>
> -#include <linux/errno.h>
>  #include <linux/notifier.h>
>  
>  enum ideapad_laptop_notifier_actions {
> @@ -22,140 +19,4 @@ int ideapad_laptop_register_notifier(struct notifier_block *nb);
>  int ideapad_laptop_unregister_notifier(struct notifier_block *nb);
>  void ideapad_laptop_call_notifier(unsigned long action, void *data);
>  
> -enum {
> -	VPCCMD_R_VPC1 = 0x10,
> -	VPCCMD_R_BL_MAX,
> -	VPCCMD_R_BL,
> -	VPCCMD_W_BL,
> -	VPCCMD_R_WIFI,
> -	VPCCMD_W_WIFI,
> -	VPCCMD_R_BT,
> -	VPCCMD_W_BT,
> -	VPCCMD_R_BL_POWER,
> -	VPCCMD_R_NOVO,
> -	VPCCMD_R_VPC2,
> -	VPCCMD_R_TOUCHPAD,
> -	VPCCMD_W_TOUCHPAD,
> -	VPCCMD_R_CAMERA,
> -	VPCCMD_W_CAMERA,
> -	VPCCMD_R_3G,
> -	VPCCMD_W_3G,
> -	VPCCMD_R_ODD, /* 0x21 */
> -	VPCCMD_W_FAN,
> -	VPCCMD_R_RF,
> -	VPCCMD_W_RF,
> -	VPCCMD_W_YMC = 0x2A,
> -	VPCCMD_R_FAN = 0x2B,
> -	VPCCMD_R_SPECIAL_BUTTONS = 0x31,
> -	VPCCMD_W_BL_POWER = 0x33,
> -};
> -
> -static inline int eval_int_with_arg(acpi_handle handle, const char *name, unsigned long arg, unsigned long *res)
> -{
> -	struct acpi_object_list params;
> -	unsigned long long result;
> -	union acpi_object in_obj;
> -	acpi_status status;
> -
> -	params.count = 1;
> -	params.pointer = &in_obj;
> -	in_obj.type = ACPI_TYPE_INTEGER;
> -	in_obj.integer.value = arg;
> -
> -	status = acpi_evaluate_integer(handle, (char *)name, &params, &result);
> -	if (ACPI_FAILURE(status))
> -		return -EIO;
> -
> -	if (res)
> -		*res = result;
> -
> -	return 0;
> -}
> -
> -static inline int eval_vpcr(acpi_handle handle, unsigned long cmd, unsigned long *res)
> -{
> -	return eval_int_with_arg(handle, "VPCR", cmd, res);
> -}
> -
> -static inline int eval_vpcw(acpi_handle handle, unsigned long cmd, unsigned long data)
> -{
> -	struct acpi_object_list params;
> -	union acpi_object in_obj[2];
> -	acpi_status status;
> -
> -	params.count = 2;
> -	params.pointer = in_obj;
> -	in_obj[0].type = ACPI_TYPE_INTEGER;
> -	in_obj[0].integer.value = cmd;
> -	in_obj[1].type = ACPI_TYPE_INTEGER;
> -	in_obj[1].integer.value = data;
> -
> -	status = acpi_evaluate_object(handle, "VPCW", &params, NULL);
> -	if (ACPI_FAILURE(status))
> -		return -EIO;
> -
> -	return 0;
> -}
> -
> -#define IDEAPAD_EC_TIMEOUT 200 /* in ms */
> -
> -static inline int read_ec_data(acpi_handle handle, unsigned long cmd, unsigned long *data)
> -{
> -	unsigned long end_jiffies, val;
> -	int err;
> -
> -	err = eval_vpcw(handle, 1, cmd);
> -	if (err)
> -		return err;
> -
> -	end_jiffies = jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1;
> -
> -	while (time_before(jiffies, end_jiffies)) {
> -		schedule();
> -
> -		err = eval_vpcr(handle, 1, &val);
> -		if (err)
> -			return err;
> -
> -		if (val == 0)
> -			return eval_vpcr(handle, 0, data);
> -	}
> -
> -	acpi_handle_err(handle, "timeout in %s\n", __func__);
> -
> -	return -ETIMEDOUT;
> -}
> -
> -static inline int write_ec_cmd(acpi_handle handle, unsigned long cmd, unsigned long data)
> -{
> -	unsigned long end_jiffies, val;
> -	int err;
> -
> -	err = eval_vpcw(handle, 0, data);
> -	if (err)
> -		return err;
> -
> -	err = eval_vpcw(handle, 1, cmd);
> -	if (err)
> -		return err;
> -
> -	end_jiffies = jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1;
> -
> -	while (time_before(jiffies, end_jiffies)) {
> -		schedule();
> -
> -		err = eval_vpcr(handle, 1, &val);
> -		if (err)
> -			return err;
> -
> -		if (val == 0)
> -			return 0;
> -	}
> -
> -	acpi_handle_err(handle, "timeout in %s\n", __func__);
> -
> -	return -ETIMEDOUT;
> -}
> -
> -#undef IDEAPAD_EC_TIMEOUT
>  #endif /* !_IDEAPAD_LAPTOP_H_ */

