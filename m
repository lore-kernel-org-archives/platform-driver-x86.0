Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C09428F4
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jan 2024 12:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hsj1VqAz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705322301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dr/8JgFmTBfE32B6mIfn3zI7m2veG/h6YX6miLSEnA4=;
	b=hsj1VqAzTf6z8DKLwp6Xd3+pVSqqnkT/xgE8s2jmz7lCx8P2k5hVl8pgE4e+EzFPG1WMjE
	0+g/5RMNTSSJnu4tR9eMHtfabeovxx/tFNsBrimJbulL8Jf3Xtjd8hQsAk1c342zOrI/TR
	vU4mb3DKUlHsCjRsCERjiN/qrdXBHjc=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-zHvJkMJgMhCBfbZx6dRYbQ-1; Mon, 15 Jan 2024 07:38:19 -0500
X-MC-Unique: zHvJkMJgMhCBfbZx6dRYbQ-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-50e7f357b04so8735893e87.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jan 2024 04:38:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705322298; x=1705927098;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dr/8JgFmTBfE32B6mIfn3zI7m2veG/h6YX6miLSEnA4=;
        b=L9uBItEt2+H6I5kBwLf233HCBRLdHr38TmffwD6oBCDxsVZjbG3S8yn+eFjRMpF1F3
         BhfD2ekmatQcqaS1ge5zBvD60Hzo+PAJakuP3fHl92vWab5JYbDZbn8D+5JJ/oCN4+I9
         5gnmT4D5/WzI7evU5GtehnuVgoeCcozJYj2Y+E7LDXebqMMR+io4S1+3WPcdAOzlu4bt
         u2FNMXayYjbqFFLZnM6+OZYNepG7Kr97rJxQ+2wPV9uCGmzTb3DDtArniOEE7Ha7OnV7
         VjIDNfoZpUN8ouMkCzY/x2GZOr4mUuxggwZ772XTC+2XmgCRfF6Hy8pxPLllPfOHnUqj
         vX0A==
X-Gm-Message-State: AOJu0Yz2VUL7GlyX0vmo3ILf4LOjWMSVZVi5uyy8sJ2z+B4ybBVDyZlW
	37z0ILz4oICU2JDzWVxkJxlfkgmTEHBGxSBj725aQO12K3r7Kjd/6Xb9xq3FDyUUbU+AP99y43k
	UQbKKZxJny8OOThIwwbYbqpUrdSOi08jP5Nakzka7iQ==
X-Received: by 2002:a05:6512:48c3:b0:50e:5049:a179 with SMTP id er3-20020a05651248c300b0050e5049a179mr1947809lfb.105.1705322297943;
        Mon, 15 Jan 2024 04:38:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEid8F0+Z+azt9DHERkU4iXM1IC9qS+5wiphoZcVWWiGGNKVpcy+TqeHGegNN/+7EtN/nPH0g==
X-Received: by 2002:a05:6512:48c3:b0:50e:5049:a179 with SMTP id er3-20020a05651248c300b0050e5049a179mr1947804lfb.105.1705322297567;
        Mon, 15 Jan 2024 04:38:17 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id z6-20020a170906668600b00a2327e826ccsm5216185ejo.201.2024.01.15.04.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jan 2024 04:38:17 -0800 (PST)
Message-ID: <e776db0e-2376-415b-8688-f166118d4007@redhat.com>
Date: Mon, 15 Jan 2024 13:38:16 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-wmi: Re-enable custom fan curves after
 setting throttle_thermal_policy
Content-Language: en-US
To: Andrei Sabalenka <mechakotik@gmail.com>, corentin.chary@gmail.com,
 ilpo.jarvinen@linux.intel.com, acpi4asus-user@lists.sourceforge.net,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Luke D. Jones" <luke@ljones.dev>
References: <20240115122315.10250-1-mechakotik@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240115122315.10250-1-mechakotik@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/15/24 13:22, Andrei Sabalenka wrote:
> When changing throttle_thermal_policy, all the custom fan curves are getting disabled. This patch re-enables all the custom fan curves that were enabled before changing throttle_thermal_policy.
> 
> I believe it makes asus-wmi sysfs interface more convenient, as it allows userspace to manage fan curves independently from platform_profile and throttle_thermal_policy. At the kernel level, custom fan curves should not be tied to "power profiles" scheme in any way, as it gives the user less freedom of controlling them.

Setting a high performance power-profile typically also involves ramping up
the fans harder. So I don't think this patch is a good idea.

If you really want this behavior then you can always re-enable the custom
curve after changing the profile.

Luke, do you have any opinion on this?

Regards,

Hans




> 
> Signed-off-by: Andrei Sabalenka <mechakotik@gmail.com>
> ---
>  drivers/platform/x86/asus-wmi.c | 29 ++++++++++++++++++++++-------
>  1 file changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 18be35fdb..c2e38f6d8 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -3441,13 +3441,28 @@ static int throttle_thermal_policy_write(struct asus_wmi *asus)
>  		return -EIO;
>  	}
>  
> -	/* Must set to disabled if mode is toggled */
> -	if (asus->cpu_fan_curve_available)
> -		asus->custom_fan_curves[FAN_CURVE_DEV_CPU].enabled = false;
> -	if (asus->gpu_fan_curve_available)
> -		asus->custom_fan_curves[FAN_CURVE_DEV_GPU].enabled = false;
> -	if (asus->mid_fan_curve_available)
> -		asus->custom_fan_curves[FAN_CURVE_DEV_MID].enabled = false;
> +	/* Re-enable fan curves after profile change */
> +	if (asus->cpu_fan_curve_available && asus->custom_fan_curves[FAN_CURVE_DEV_CPU].enabled) {
> +		err = fan_curve_write(asus, &asus->custom_fan_curves[FAN_CURVE_DEV_CPU]);
> +		if (err) {
> +			pr_warn("Failed to re-enable CPU fan curve: %d\n", err);
> +			return err;
> +		}
> +	}
> +	if (asus->gpu_fan_curve_available && asus->custom_fan_curves[FAN_CURVE_DEV_GPU].enabled) {
> +		err = fan_curve_write(asus, &asus->custom_fan_curves[FAN_CURVE_DEV_GPU]);
> +		if (err) {
> +			pr_warn("Failed to re-enable GPU fan curve: %d\n", err);
> +			return err;
> +		}
> +	}
> +	if (asus->mid_fan_curve_available && asus->custom_fan_curves[FAN_CURVE_DEV_MID].enabled) {
> +		err = fan_curve_write(asus, &asus->custom_fan_curves[FAN_CURVE_DEV_MID]);
> +		if (err) {
> +			pr_warn("Failed to re-enable MID fan curve: %d\n", err);
> +			return err;
> +		}
> +	}
>  
>  	return 0;
>  }

