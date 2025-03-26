Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1594B15C15F
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Mar 2025 11:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742989139; cv=none; b=uENBCY0bXZsOUN8HvCurrgEdOtxFa6Uaqcy/rHCL+0zNRbAXo/oRZdW5bp3F9cXh/mYk8uNki6O7FhSv5Ze99t9AwMguJULxbjD1R5xNu2iLnxbDKniljnk9qfTwXWnWn2WlwkRY31XffT6yDea2LmWgJ+lMtO8Tvwtqjj1zpRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742989139; c=relaxed/simple;
	bh=XnplYuVML4RH+JsPqgWSH/ztbX4Jjen6uimGimavSLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mY/Yk10L4l00skP4Rf/distTvcwPLNKYwXQck9cSPeavP5KJBKg/Jr36H/9C/ccN1Xc7paQuXOLYYErj/PWJIU9lzG43qoxiKP5GsbCNUQdPNRBA5S++9WLpIRQwyQ23cfjNtksEY5M4IhAyja0o6uPLg5e0Cf3mLWxbsyfCgaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XLGK287Q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XLGK287Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742989135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L1TSW2IN1ookhorbSOR1YQnOJVtR5fBLnVFeapHcNk0=;
	b=XLGK287QwNGXYRIfRR25ApRTwWkNOnSbSmj7R/R8cDQPcELAFebTutGwzUpLGwhoF2pm9K
	+mpzeoHOBelWevLnP7FOpiV3yLlFxKMZQkBlLzNLeJ32EehOmO4GRlzk5p8hoS3xQ/FJxs
	w+2SL1SFiJiQH5jHXuPF2U+N7PMa44I=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-DBMGsuEUNNS0MCavoQFfyQ-1; Wed, 26 Mar 2025 07:38:54 -0400
X-MC-Unique: DBMGsuEUNNS0MCavoQFfyQ-1
X-Mimecast-MFC-AGG-ID: DBMGsuEUNNS0MCavoQFfyQ_1742989133
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5eb80d465b7so5595821a12.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Mar 2025 04:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742989133; x=1743593933;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L1TSW2IN1ookhorbSOR1YQnOJVtR5fBLnVFeapHcNk0=;
        b=NeafUFf12B67F+5IPGpzbmVDvcyZLHAOi9DWB17ik9R8e9N2lApel2Di2FpBARqwdm
         QGGGlUQbnzXekfOcFb/h9UIM1ENGH9QXDNWEjD5I7WHpoA9hYTvHx2SLcxzpooQbQk4F
         vKXqLMIWKb8zYBxeUsFe2BPJ1C1EBWxIxAr8zRczz0ftBmc51x3AQjAXStvTe7ZTGSVt
         qD/utAp7sXvb8FB4TzRNMX4q1aOftlsmM7LVEK6EYrDuxP41nPluDzdMgriGHHyi8WS0
         elc7US3HOrevEJkLfD+Aj7XqYcYGLXwinO9lBpC1DyZ7DpKabTnuJgIZ98hEVv0jf64R
         fqMw==
X-Forwarded-Encrypted: i=1; AJvYcCVpdL1NuGD6lh36/X4lWVA5Bhkn9kZVAFsSh9wBDCEEoiZChGq2vT7Oi10XvUQpCYvF+au+rawxx98fGEuUse4Ll7zk@vger.kernel.org
X-Gm-Message-State: AOJu0YzqLJ5KvQ8yXXJBrhsT9H4FB3so/uJnhyeJ0vI1P6J4bnkShHPu
	F6I94YIn4ZiUhd9xACij820Jo8kT6Lu+gt3zabAM2354XJ+vfLe+kRX7tJxIdZCfxiv7F1kN6uV
	6lHjHEjhQgLXBUOATBxEjNBX19KHqV1G3M+xKtQoivrNxA1i60CyBItkCuVy9mJWNFCFm6QZL2M
	QUK90=
X-Gm-Gg: ASbGncvo9c6RHwuEh2VG/V1XhfxM7QAEg6PQX91EtMAgZwO8CnWOkj6/TS/WFLBijd7
	vMt2n37o0ygqwkA3EK9Pq+RUtK3VC6NfJh8+YgmXrE+1rGfE/dqC3a+hb+8pkFrq3MIkv3UEtmK
	3CLRBPcuQTKC7u6H1zwqe6LaIGD4j4OWkEcXYo19v658K9xjrCpaq5CCyLMORlCUpIKUjTLmrqk
	QVRILMyB3mw79kJY7CJvUEBvP0o4qoWIuyOK8O0K/IrnbhM1xI9nNN3nLeDkhrzFXi05UrTe1DJ
	TXU0bQC5GhBMGV0/ZqryM74cTUFp3L3nL2VPGMvSQ1xGU0tdxcjUUGEqECw9LFsL1IPmitVDykB
	pwLbOHIb6ew13BnvGi9mt6roZz7InvkWFWIwP3aDi21paxmLJZnud4z+YJoU09CUIyA==
X-Received: by 2002:a05:6402:1d4a:b0:5e8:bced:9ee5 with SMTP id 4fb4d7f45d1cf-5ebcd4677eemr17580337a12.18.1742989132661;
        Wed, 26 Mar 2025 04:38:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4LIDH0+/cfzodfLAMwdwoMvesHVwPnzapymDBeoYaycgFvHYk1U8+6k//KJH9mqcFoMsF6w==
X-Received: by 2002:a05:6402:1d4a:b0:5e8:bced:9ee5 with SMTP id 4fb4d7f45d1cf-5ebcd4677eemr17580314a12.18.1742989132088;
        Wed, 26 Mar 2025 04:38:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebccfb049csm9457044a12.42.2025.03.26.04.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 04:38:51 -0700 (PDT)
Message-ID: <b7a9585e-d02d-4a73-b294-ee78eade3ffa@redhat.com>
Date: Wed, 26 Mar 2025 12:38:50 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv5] platform/x86: asus-wmi: Add quirk for ASUS Vivobook S14
To: Kevin Robert Stravers <kevin@stravers.net>, linux-kernel@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
 "open list:ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS"
 <platform-driver-x86@vger.kernel.org>
References: <20250326113157.2341184-1-kevin@stravers.net>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250326113157.2341184-1-kevin@stravers.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kevin,

On 26-Mar-25 12:31 PM, Kevin Robert Stravers wrote:
> The ASUS Vivobook S14 will have wifi disabled on boot as well as
> resumption from suspend if the asus-wmi driver invokes rfkill functions.
> 
> This patch disables asus-wmi's rfkill usage to prevent the wifi card
> from being software disabled.

Your patch is still missing a Signed-off-by line in the commit-message.
We can only accept patches with a Signed-off-by line in the commit-message
like this:

Signed-off-by: Your Real Name <email@your.domain>

By adding this line you indicate that you are the author of the code and
are submitting it under the existing license for the file which you are
modifying (typically GPL-2.0) or that you have permission from the author
to submit it under this license. See:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

Please resend your patch with a valid Signed-off-by added.

Unrelated to the S-o-b problem I wonder if you've tried setting
asus_nb_wmi.wapf=4 on the kernel commandline instead of adding
a new mechanism to disable rfkill support all together, see:

/*
 * WAPF defines the behavior of the Fn+Fx wlan key
 * The significance of values is yet to be found, but
 * most of the time:
 * Bit | Bluetooth | WLAN
 *  0  | Hardware  | Hardware
 *  1  | Hardware  | Software
 *  4  | Software  | Software
 */
static int wapf = -1;
module_param(wapf, uint, 0444);
MODULE_PARM_DESC(wapf, "WAPF value");

This would still require a quirk to do this automatically
on your model, but it would avoid the need to add a new
type of quirk.

Regards,

Hans

> ---
>  drivers/platform/x86/asus-nb-wmi.c | 13 +++++++++++++
>  drivers/platform/x86/asus-wmi.c    |  5 +++++
>  drivers/platform/x86/asus-wmi.h    |  1 +
>  3 files changed, 19 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index 3f8b2a324efd..1e6fb9308560 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -150,6 +150,10 @@ static struct quirk_entry quirk_asus_zenbook_duo_kbd = {
>  	.ignore_key_wlan = true,
>  };
>  
> +static struct quirk_entry quirk_asus_vivobook_s14 = {
> +	.skip_rfkill = true,
> +};
> +
>  static int dmi_matched(const struct dmi_system_id *dmi)
>  {
>  	pr_info("Identified laptop model '%s'\n", dmi->ident);
> @@ -530,6 +534,15 @@ static const struct dmi_system_id asus_quirks[] = {
>  		},
>  		.driver_data = &quirk_asus_zenbook_duo_kbd,
>  	},
> +	{
> +		.callback = dmi_matched,
> +		.ident = "ASUS VivoBook S14",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "S5406SA"),
> +		},
> +		.driver_data = &quirk_asus_vivobook_s14,
> +	},
>  	{},
>  };
>  
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 38ef778e8c19..42e58a28c3e2 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -2138,6 +2138,8 @@ static int asus_new_rfkill(struct asus_wmi *asus,
>  
>  static void asus_wmi_rfkill_exit(struct asus_wmi *asus)
>  {
> +	if (asus->driver->quirks->skip_rfkill)
> +		return;
>  	if (asus->driver->wlan_ctrl_by_user && ashs_present())
>  		return;
>  
> @@ -2188,6 +2190,9 @@ static void asus_wmi_rfkill_exit(struct asus_wmi *asus)
>  
>  static int asus_wmi_rfkill_init(struct asus_wmi *asus)
>  {
> +	if (asus->driver->quirks->skip_rfkill)
> +		return 0;
> +
>  	int result = 0;
>  
>  	mutex_init(&asus->hotplug_lock);
> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
> index 018dfde4025e..3692de24e326 100644
> --- a/drivers/platform/x86/asus-wmi.h
> +++ b/drivers/platform/x86/asus-wmi.h
> @@ -41,6 +41,7 @@ struct quirk_entry {
>  	bool wmi_ignore_fan;
>  	bool filter_i8042_e1_extended_codes;
>  	bool ignore_key_wlan;
> +	bool skip_rfkill;
>  	enum asus_wmi_tablet_switch_mode tablet_switch_mode;
>  	int wapf;
>  	/*

